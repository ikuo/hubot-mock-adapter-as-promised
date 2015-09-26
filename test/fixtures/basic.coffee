# Description:
#   Reply with pong.
module.exports = (robot) ->
  robot.respond /send something$/i, (msg) ->
    msg.send "PONG"

  robot.respond /reply something$/i, (msg) ->
    msg.reply "PONG"
