# Description:
#   Returns a random catfact!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   catfact - Return a random catfact from the catfacts-api!
#
# Author:
#   Andrew Vy


apiUrl = "http://catfacts-api.appspot.com/api/facts?number=1"

module.exports = (robot) ->
  robot.hear /\b(catfact)\b/i, (msg) ->
    robot.http(apiUrl).header('Accept', 'application/json')
    .get() (err, res, body) ->
      fact = JSON.parse(body)?.facts[0]
      message = fact || "Cat Facts API is down!"
      msg.send message
