import re

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
	def dump_discord(self, link):
		msg = "**{}** made some changes:\n\n{}\nLink to PR: {}"
		change_data = ""

		for line in self.lines:
			change_data += "\t\t{}\t\t\t\t{}\n".format(change_type_map[line["type"]], line["log"])

		return msg.format(self.author, change_data, link)

# CL regexps
cl_start = re.compile("(:cl:)\s*([\w\s1-9]+)?")
cl_entry = re.compile("\s*(\w+):\s*(.+)")
cl_end = re.compile("\/:cl:")

def generate_changelog(data):
	cl = Changelog()
	in_cl = False

	for line in iter(data.splitlines()):
		if not in_cl:
			# look for start of CL
			match = cl_start.search(line)
			if not match or not match.group(0):
				continue

			in_cl = True
			if(match.group(2)):
				cl.set_author(match.group(2))
		else:
			match = cl_entry.search(line)
			if not match or not match.group(0):
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