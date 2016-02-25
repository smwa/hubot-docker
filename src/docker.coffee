# Description:
#   Control Docker from hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot docker ps
#   hubot docker restart <container name>
#
# Author:
#   Michael Smith <michael.smith.ok@gmail.com>
#

run_cmd = (cmd, args, cb ) ->
    spawn = require("child_process").spawn
    opts = 
        env: {}
    child = spawn(cmd, args, opts)
    child.stdout.on "data", (buffer) -> cb buffer.toString()
    child.stderr.on "data", (buffer) -> cb buffer.toString()

module.exports = (robot) ->
  robot.respond /docker restart (.*)/i, (msg) ->
    msg.send "Restarting "+msg.match[1].replace(/[\W]+/g, "")+"..."
    run_cmd "docker", ["restart", msg.match[1].replace(/[\W]+/g, "")], (text) -> msg.send text

  robot.respond /docker ps$/i, (msg) ->
    run_cmd 'docker', ['ps','-a','--format="{{.Names}}:\t{{.Status}}"'], (text) -> msg.send text

