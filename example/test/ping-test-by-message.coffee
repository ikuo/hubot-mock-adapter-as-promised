expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')
TextMessage = require('hubot/src/message').TextMessage

describe 'ping', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'scripts'), 'ping.coffee')

  it 'responds PONT, checked with message()', ->
    expect(
      hubot.
        message(new TextMessage(user, 'hubot ping')).
        spread((envelope, strings, event) -> [strings[0], event])
    ).to.eventually.deep.equal(['PONG', 'send'])
