expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('../src')
TextMessage = require('hubot/src/message').TextMessage

describe 'hubot-mock-adapter-as-promised', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'test', 'fixtures'), 'basic.coffee')

  context '#text', ->
    it 'captures "send" result', ->
      expect(hubot.text('hubot send something')).to.eventually.
        equal('PONG')

    it 'captures "reply" result', ->
      expect(hubot.text('hubot reply something')).to.eventually.
        equal('PONG')

  context '#message', ->
    it 'captures "send" result', ->
      expect(
        hubot.message(new TextMessage(user, 'hubot send something')).
        spread((envelope, strings) -> strings[0])
      ).to.eventually.equal('PONG')

    it 'captures "reply" result', ->
      expect(
        hubot.message(new TextMessage(user, 'hubot reply something')).
        spread((envelope, strings) -> strings[0])
      ).to.eventually.equal('PONG')
