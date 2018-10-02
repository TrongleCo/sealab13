from flask import Flask, request
from hashlib import sha1
import os, requests, hmac

import changelog

environ_vals = (
	os.environ["ROBOTRONGLE_GITHUB_SECRET"],
	os.environ["ROBOTRONGLE_DISCORD_ID"],
	os.environ["ROBOTRONGLE_DISCORD_TOKEN"]
)
# this tracks progress on changelog generation
# note that this is the index in the JSON returned by the github api, not the PR number
last_pr_number = 0
# fetch where to start 
try:
	file = open("lastprnum.txt", "r")
	content = file.read()
	if content:
		last_pr_number = int(content)
	file.close()
except FileNotFoundError:
	pass

discord_webhook = "https://discordapp.com/api/webhooks/{}/{}".format(environ_vals[1], environ_vals[2])

# api urls
# change to fit your needs
list_prs_url = "http://api.github.com/repos/robotrongle/hooktest/pulls?state=closed&sort=created&direction=asc"
is_merged_url = "http://api.github.com/repos/robotrongle/hooktest/pulls/{}/merge"

# verify that the request we received is legitimate
def check_digest(digest, body):
	secret = environ_vals[0]
	secret = secret.encode("utf-8")

	hashed = hmac.new(secret, body, sha1)
	correct_digest = "sha1={}".format(hashed.hexdigest())
	return (correct_digest == digest)

def check_request(request):
	# pr, hotfix?
	req_type = "invalid"

	# check for request validity
	body = request.get_data()
	digest = request.headers.get("X-Hub-Signature")
	if not digest or not body:
		return req_type
	if not check_digest(digest, body):
		return req_type

	# check if this is a PR merge
	data = request.get_json()
	if data.get("pull_request"):
		if not data.get("action"):
			return req_type
		if not data.get("action") == "closed":
			return req_type
		if not data.get("pull_request").get("merged"):
			return req_type
		req_type = "pr"
	elif data.get("commits"):
		if not data.get("ref"):
			return req_type
		if data.get("ref") != "refs/heads/hotfix":
			return req_type
		req_type = "hotfix"

	return req_type

def save_pr_num(num):
	with open("lastprnum.txt", "w") as file:
		file.write(str(num))


# Flask application for listening to webhook requests
#####################################################################

app = Flask("robotrongle")

@app.route("/webhook", methods=["POST"])
def github_listen():
	global last_pr_number

	if request.method == "POST":
		req_type = check_request(request)
		if req_type == "invalid":
			return "Invalid request"

		if req_type == "pr":
			# get all closed prs
			resp = requests.post(list_prs_url)
			prs = resp.json()

			# go through all the prs we haven't processed and make changelogs if they're merged
			for i in range(last_pr_number, len(prs)):
				pr = prs[i]

				# make sure the PR is merged
				resp = requests.post(is_merged_url.format(pr.get("number")))
				# 204: merged. 404: not merged
				# check for not 204 in case the api fucks up
				if resp.status_code != 204:
					continue

				user = pr.get("user")
				if not user:
					user = "somebody"
				else:
					user = user.get("login")

				# make the changelog
				cl = changelog.generate_changelog(pr.get("body"))
				# no changelog :(
				if not cl:
					continue
				if not cl.author:
					cl.set_author(user)

				# send the changelog to discord
				cl_json = {"content": cl.dump_discord(pr.get("html_url"))}
				requests.post(discord_webhook, json=cl_json)

				# make a yaml file for the changelog
				cl.dump_yaml("{}-pr-{}".format(user, pr.get("id")))

			# save our progress on changelog generation
			last_pr_number = len(prs)
			save_pr_num(last_pr_number)

		elif req_type == "hotfix":
			#todo
			pass

		return "OK"
	else:
		return displayHTML(request)

app.run(debug=True, use_reloader=True)