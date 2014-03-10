# Description:
#   Gotta love that coffee
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   coffee - Gotta love that coffee.
#
# Author:
#   McPants

image = "http://cdn.makeagif.com/media/3-10-2014/g81xya.gif"

module.exports = (robot) ->
  robot.hear /\b(coffee)\b/i, (msg) ->
    if Math.random() > .9
      msg.send image