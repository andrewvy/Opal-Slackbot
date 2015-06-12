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

pots = [
	"http://37.media.tumblr.com/tumblr_louv5wqO3y1qzwlp8o1_500.gif",
	"http://25.media.tumblr.com/tumblr_m5bndgzQsI1qic1zfo1_500.gif",
	"http://31.media.tumblr.com/621c0e23e67932ac4bfdf7e6e887ccb0/tumblr_n0fm8dAN4e1rp72cbo1_500.gif",
	"http://38.media.tumblr.com/3f661f9a24e94db54e657310aea5fd4e/tumblr_mpstapKvzw1rpymzho1_500.gif",
	"http://insurancebyjack.co.uk/blog-images/june-roundup/fresh_pots.gif",
	"http://38.media.tumblr.com/tumblr_m3typb1loj1qgi59so1_500.gif"
]

module.exports = (robot) ->
  robot.hear /fresh pot/i, (msg) ->
    msg.send msg.random pots
  robot.hear /fresh scott/i, (msg) ->
    msg.send msg.random pots