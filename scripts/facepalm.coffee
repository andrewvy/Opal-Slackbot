# Description:
#   When facepalm is mentioned, picard knows what to do
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   facepalm - Display an image of Picard facepalming
#
# Author:
#   Scott Elwood

module.exports = (robot) ->
  robot.hear /\b(facepalm)\b/i, (msg) ->
    msg.send "http://waitingforison.files.wordpress.com/2013/09/facepalm_picard2.jpg"