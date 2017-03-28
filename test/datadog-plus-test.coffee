chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'datadog-plus', ->
  beforeEach ->
      @robot =
          respond: sinon.spy()
          hear: sinon.spy()

      process.env.HUBOT_DATADOG_APIKEY = sinon.spy()
      process.env.HUBOT_DATADOG_APPKEY = sinon.spy()
      
      require('../src/hubot-datadog-plus.coffee')(@robot)

  it 'registers a monitor me listener', ->
    expect(@robot.respond).to.have.been.calledWith(/asd$/)
