import os, re, requests

valid_cl_types = ("bugfix", "wip", "tweak", "soundadd", "sounddel", "rscadd", "rscdel", "imageadd", "imagedel", "maptweak", "spellcheck", "experiment")
# what the different cl entry types should be changed to when dumping the changelog to a discord-friendly format
change_type_map = {
	"bugfix": "<:bugfix:495732451549773844>",
	"wip": "<:wip:495732555719507969>",
	"tweak": "<:tweak:495732546353627157>",
	"soundadd": "<:soundadd:495732517002018817>",
	"sounddel": "<:sounddel:495732701022781440>",
	"rscadd": "<:rscadd:495732498308005889>",
	"rscdel": "<:rscdel:495732507690401792>",
	"imageadd": "<:imgadd:495732469929082890>",
	"imagedel": "<:imgdel:495732478594777089>",
	"maptweak": "<:maptweak:495732488115585052>",
	"spellcheck": "<:spelling:495732536727830539>",
	"experiment": "<:experimental:495732459376345089>"
}

environ_vals = (
	os.environ["AUTOCL_DISCORD_ID"],
	os.environ["AUTOCL_DISCORD_TOKEN"],
	os.environ["AUTOCL_GITHUB_PAT"]
)

# name of the branches you want changelogs generated for
watched_branches = (
	"master",
	"dev",
	"hotfix",
	"fix"
)

pr_number_pattern = re.compile("(\w+):(\d+)")
# this tracks progress on changelog generation
# note that this is the index in the JSON returned by the github api, not the PR number
last_pr_numbers = {}
# fetch where to start for the different branches
try:
	file = open("lastprnums.txt", "r")

	for line in file.readlines():
		match = pr_number_pattern.search(line)
		if not match:
			continue

		last_pr_numbers[match.group(1)] = int(match.group(2))

	file.close()
except FileNotFoundError:
	pass

# save the last processed pr numbers
def save_pr_nums():
	content = ""
	for branch in last_pr_numbers:
		last_pr_num = last_pr_numbers.get(branch)
		content += "{}:{}\n".format(branch, str(last_pr_num))

	with open("lastprnums.txt", "w") as file:
		file.write(content)

discord_webhook = "https://discordapp.com/api/webhooks/{}/{}".format(environ_vals[0], environ_vals[1])

# api urls
# change to fit your needs
list_prs_url = "http://api.github.com/repos/TrongleCo/sealab13/pulls?state=closed&sort=created&direction=asc&base={}"
is_merged_url = "http://api.github.com/repos/TrongleCo/sealab13/pulls/{}/merge"

###################################################################################

class Changelog:
	def __init__(self):
		self.author = None
		self.lines = []

	# set the author of the changelog
	def set_author(self, author):
		self.author = author

	# add a line (change) to the changelog
	def add_line(self, change_type, log):
		if(self.is_valid_type(change_type)):
			# escape quotes
			safe_log = re.sub("\"", "\\\"", log)
			self.lines.append({"type": change_type, "log": safe_log})

	# returns the amount of entries in the changelog
	def entries(self):
		return len(self.lines)

	# check if a given change type is valid
	def is_valid_type(self, change_type):
		return (change_type in valid_cl_types)

	# write the changelog to a yaml file in html/changelogs
	def dump_yaml(self, file_name):
		with open("../../html/changelogs/{}.yml".format(file_name), "w") as file:
			data = "author: \"{}\"\ndelete-after: true\nchanges:\n{}"
			change_data = ""

			for line in self.lines:
				change_data += "  - {}: \"{}\"\n".format(line["type"], line["log"])

			file.write(data.format(self.author, change_data))

	# make a discord-friendly version of the CL
	def dump_discord(self, link, branch):
		msg = "**{}** made some changes on **{}**:\n\n{}\nLink to PR: {}"
		change_data = ""

		for line in self.lines:
			change_data += "\t\t{}\t\t\t\t{}\n".format(change_type_map[line["type"]], line["log"])

		return msg.format(self.author, branch, change_data, link)

# CL regexps
cl_start = re.compile(":cl:\s*([\w\ 1-9]+)?")
cl_entry = re.compile("\s*(\w+):\s*(.+)")
cl_end = re.compile("\/:cl:")

comment_start = re.compile("<!--")
comment_end = re.compile("-->")

def generate_changelog(data):
	cl = Changelog()
	in_cl = False
	in_comment = False

	for line in iter(data.splitlines()):
		# don't parse comments
		if in_comment:
			match = comment_end.search(line)
			if not match:
				continue
			in_comment = False

		match = comment_start.search(line)
		if match:
			in_comment = True
			continue

		if not in_cl:
			# look for start of CL
			match = cl_start.search(line)
			if not match:
				continue

			in_cl = True
			if(match.group(1)):
				cl.set_author(match.group(1))
		else:
			match = cl_entry.search(line)
			if not match:
				continue

			groups = (match.group(1), match.group(2))
			if(groups[0] and groups[1]):
				cl.add_line(groups[0], groups[1])
			else:
				# end of CL
				match = cl_end.search(line)
				if not match:
					continue

				if(match.group(0)):
					break

	# couldn't find a CL
	if not in_cl:
		return None
	return cl

###################################################################################

# this fetches all the pull requests merged into each individual branch
# it goes through those PRs and generates a changelog file for each one on the first run
# on subsequent runs it will only go through PRs starting from where it last left off
def generate_changelogs():
	for branch in watched_branches:
		# get all closed prs on the branch
		resp = requests.post(list_prs_url.format(branch), auth=("halworsen", environ_vals[2]))
		prs = resp.json()

		if not len(prs):
			continue

		# where did we stop processing PRs last time
		start = last_pr_numbers.get(branch)
		if not start:
			start = 0

		# go through all the prs we haven't processed and make changelogs if they're merged
		for i in range(start, len(prs)):
			pr = prs[i]

			# make sure the PR is merged
			resp = requests.post(is_merged_url.format(pr.get("number")), auth=("halworsen", environ_vals[2]))
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
			cl = generate_changelog(pr.get("body"))
			# no changelog :(
			if not cl:
				continue
			if not cl.author:
				cl.set_author(user)

			# send the changelog to discord
			cl_json = {"content": cl.dump_discord(pr.get("html_url"), branch)}
			requests.post(discord_webhook, json=cl_json)

			# make a yaml file for the changelog
			cl.dump_yaml("{}-pr-{}".format(user, pr.get("id")))

		# save our progress on changelog generation
		last_pr_numbers[branch] = len(prs)

	save_pr_nums()