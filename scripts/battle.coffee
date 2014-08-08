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
    msg.send msg.match[1]
    name = msg.match[1].trim()
    msg.send name

    users = robot.brain.userForName(name)
    msg.send users
    if users.length is 1
      user = users[0]
      # Do something interesting here..

      msg.send "#{user} has been struck!"
    else
      msg.send "I can't find that user."