# Description:
#   When coffee is made, Dave Grohl calls out FRESH POTS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   fresh pot - Display an GIF of Dave Grohl  
#
# Author:
#   dermill

module.exports = (robot) ->
  robot.hear /fresh pot/i, (msg) ->
  robot.respond /freshpots/i, (msg) ->
    msg.send "http://37.media.tumblr.com/tumblr_louv5wqO3y1qzwlp8o1_500.gif"

