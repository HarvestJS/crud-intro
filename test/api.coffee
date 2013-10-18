should = require 'should'
mongoose = require 'mongoose'
request = require 'request'

verify = (route, status, checkResult) ->
  request.get "http://localhost:3333/#{route}", (err, res, body) ->
    should.not.exist err
    should.exist res
    should.exist body

    res.statusCode.should.eql status

    try
      result = JSON.parse body
    catch err
      throw new Error "Expected body to contain JSON.  Instead got:\n#{body}"

    checkResult result

describe 'api', ->
  it 'should respond to list', (done) ->
    verify 'users', 200, (result) ->
      done()
