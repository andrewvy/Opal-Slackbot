# Description:
#   Give the developers some handy tools to get presentations turned on faster
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Listens for messages that both contain the word "presentations" and has emails in it.
#
# Author:
#   mcpants

module.exports = (robot) ->
	robot.hear /.*presentations.*/, (msg) ->
		text = msg.match[0]
		emails = text.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi)
		emails = emails.map (email) =>
			'"' + email + '"'
		emails = emails.join(", ")
		response = "emails = [" + emails + "]"
		
		msg.send "Here are the emails that need presentations turned on:"
		msg.send response