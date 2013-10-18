should = require 'should'
mongoose = require 'mongoose'
request = require 'request'
logger = require 'torch'

require '../app/server'

Factory = require './helpers/factory'
{User} = mongoose.models

verify = (method, route, status, data, checkResult) ->
  if data?
    form = {form: data}

  request[method] "http://localhost:3333/#{route}", form, (err, res, body) ->
    logger.yellow body
    should.not.exist err
    should.exist res
    should.exist body

    res.statusCode.should.eql status

    try
      result = JSON.parse body
    catch err
      throw new Error "Expected body to contain JSON.  Instead got:\n#{body}"

    checkResult result

describe 'model', ->
  it 'should save data', ->
    User.create Factory.userData, (err, user) ->
      should.not.exist err
      should.exist user
      user.should.include Factory.userData

describe 'api', ->

  beforeEach (done) ->
    if Factory.connected
      Factory.create 'user', (err, @user) =>
        done()
    else
      done()

  afterEach (done) ->
    if Factory.connected
      User.remove(done)
    else
      done()

  it 'should respond to GET /users', (done) ->
    verify 'get', 'users', 200, null, (result) ->
      firstUser = result?.users?[0]
      should.exist firstUser, 'expected {users: []}'
      firstUser.should.include Factory.userData
      done()

  it 'should respond to GET /users/:id', (done) ->
    verify 'get', "users/#{@user._id}", 200, null, (result) ->
      should.exist result?.user, 'expected {user: {}}'
      result.user.should.include Factory.userData
      done()

  it 'should respond to POST /users', (done) ->
    data = {
      email: 'kif@kroker.com'
      first_name: 'Kif'
      last_name: 'Kroker'
      role: 'Lieutenant'
    }
    verify 'post', 'users', 201, data, (result) ->
      should.exist result?.user
      result.user.should.include data
      done()

  it 'should respond to PUT /users/:id', (done) ->
    data = {
      role: 'Bilge Cleaner'
    }
    verify 'put', "users/#{@user._id}", 200, data, (result) ->
      should.exist result?.user
      result.user.should.include data
      done()

  it 'should respond to DELETE /users/:id', (done) ->
    verify 'del', "users/#{@user._id}", 200, null, (result) ->

      if Factory.connected
        User.count (err, count) ->
          unless count is 0
            throw new Error "expected no users to remain"
          done()
      else
        done()
