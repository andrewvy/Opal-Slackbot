# Description:
#   Show ReplyGifs based on tags. See http://replygif.net.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_REPLYGIF_API_KEY: the api key for replygif.net, defaults to public key "39YAprx5Yi"
#
# Commands:
#   
#
# Notes:
#   Use 'rg' as shorthand for the 'replygif' command
#
# Author:
#   altschuler (previous non-api version by sumeetjain, meatballhat)

apiKey = process.env.HUBOT_REPLYGIF_API_KEY or "39YAprx5Yi"

apiUrl = "http://replygif.net/api/gifs?api-key=#{apiKey}"

module.exports = (robot) ->
    apiCall = (msg, failMsg, query) ->
        robot.http(apiUrl + query).get() (err, res, body) ->
#           msg.send apiUrl + query
#           msg.send body
            try
                gifs = JSON.parse body
            if not gifs? or not gifs.length
                msg.send failMsg
            else
                msg.send (msg.random gifs).file

    robot.hear /(.*)(.gif)/i, (msg) ->
        tag = msg.match[1] #.replace /\s/g, "-"
        apiCall msg, "I don't know that GIF. See a list at http://replygif.net/t", "&tag=#{tag}"