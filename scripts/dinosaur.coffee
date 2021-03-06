# Description:
#   Get the latest Dinosaur Comics
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect": "0.2.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot dinosaur comics - The latest dinosaur comic
#   hubot dinosaur comics random - A random dinosaur comic
#
# Author:
#   gkoo

htmlparser = require "htmlparser"
Select     = require("soupselect").select

module.exports = (robot) ->
  getComic = (msg, url) ->
    msg.http(url)
        .get() (err, res, body) ->
          handler = new htmlparser.DefaultHandler()
          parser = new htmlparser.Parser(handler)
          parser.parseComplete(body)

          img = Select handler.dom, ".comic"
          comic = img[0].attribs

          msg.send comic.src
          msg.send comic.title if comic.title

  robot.respond /dino(saur)? comics?$/i, (msg) ->
    getComic(msg, "http://www.qwantz.com/index.php")

  robot.respond /dino(saur)? comics? random$/i, (msg) ->
    msg.http("http://www.qwantz.com/index.php")
        .get() (err, res, body) ->
          handler = new htmlparser.DefaultHandler()
          parser = new htmlparser.Parser(handler)
          parser.parseComplete(body)

          randlink = Select handler.dom, ".randomquote a"
          href = randlink[1].attribs.href
          getComic(msg, href)