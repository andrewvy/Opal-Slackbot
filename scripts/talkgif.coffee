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
#   <gif tag>.gif - Returns a random gif with the tag of <gif tag>
#
# Notes:
#   Is punctuation-case-mostotherthings sensitive
#
# Author:
#   dermill (based most solely on replygif.coffee by altschuler)

apiKey = process.env.HUBOT_REPLYGIF_API_KEY or "39YAprx5Yi"

apiUrl = "http://replygif.net/api/gifs?api-key=#{apiKey}"

module.exports = (robot) ->
    apiCall = (msg, failMsg, query) ->
        robot.http(apiUrl + query).get() (err, res, body) ->
            try
                gifs = JSON.parse body
            if not gifs? or not gifs.length
                msg.send failMsg
            else
                msg.send (msg.random gifs).file

    robot.hear /(.*)(.gif)/i, (msg) ->
        tag = msg.match[1]
        if /^http|^www/i.test(tag)
            return
        else
            apiCall msg, "I don't know that GIF. See a list of tags I know at http://replygif.net/t", "&tag=#{tag}"