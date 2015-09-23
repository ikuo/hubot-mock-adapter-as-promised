#
#

expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')

describe 'ping', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'scripts'), 'ping.coffee')

  it 'responds PONG', ->
    expect(hubot.text('hubot ping')).to.eventually.
      equal('PONG')
