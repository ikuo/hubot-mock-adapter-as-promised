# hubot-mock-adapter-as-promised [![npm version](https://badge.fury.io/js/hubot-mock-adapter-as-promised.svg)](http://badge.fury.io/js/hubot-mock-adapter-as-promised)

A helper for [hubot-mock-adapter](https://github.com/blalor/hubot-mock-adapter) with promise ([bluebird](https://github.com/petkaantonov/bluebird)).

## Installation

Install with [npm](https://www.npmjs.com/):

```shell
npm install -g coffee-script
npm install hubot-mock-adapter-as-promised --save-dev
```

## Example

./scripts/ping.coffee

```coffeescript
module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"
```

./test/ping_test.coffee

```coffeescript
expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')

describe 'ping', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'scripts'), 'ping.coffee')

  it 'responds PONG', ->
    expect(hubot.text('hubot ping')).to.eventually.
      equal('PONG')
```
