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
      for event in ['send', 'reply']
        adapter.on event, (envelope, strings) ->
          resolve(strings[0])
    )
    adapter.receive(new TextMessage(user, message))
    promise

  message: (msg) ->
    promise = new Promise((resolve, reject) ->
      for event in ['send', 'reply']
        adapter.on event, (envelope, strings) ->
          resolve([envelope, strings])
    )
    adapter.receive(msg)
    promise
