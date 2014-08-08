# Description:
#   None
#
# Dependencies:
#   
#   
#
# Configuration:
#   
#
# Commands:
#   
#
# Author:
#   dermill

module.exports = (robot) ->

  robot.respond /battle @?([\w .\-]+)\?*$/i, (msg) ->
    name = msg.match[1].trim()

    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      # Do something interesting here..

      msg.send "#{user} has been struck!"
    else
      msg.send "I can't find that user."