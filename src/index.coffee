Promise = require('bluebird')
helper = require('hubot-mock-adapter-helper')
TextMessage = require('hubot/src/message').TextMessage

module.exports =
  includeContext: (loadScripts) ->
    this.robot   = null
    this.user    = null
    this.adapter = null

    beforeEach (done) ->
      helper.setupRobot (ret) ->
        this.robot   = ret.robot
        this.user    = ret.user
        this.adapter = ret.adapter
        loadScripts?()
        done()

    afterEach ->
      robot.shutdown()

  text: (message) ->
    promise = new Promise((resolve, reject) ->
      adapter.on 'send', (envelope, strings) ->
        resolve(strings[0])
    )
    adapter.receive(new TextMessage(user, message))
    promise
