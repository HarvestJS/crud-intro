Factory = require 'factory-worker'

require '../../app/user'
mongoose = require 'mongoose'

Factory.userData = {
  email: 'zap@brannigan.com'
  first_name: 'Zapp'
  last_name: 'Brannigan'
  role: 'Captain'
}

if Factory.connected = mongoose?.connections?[0]?.collections?.users

  {User} = mongoose.models

  Factory.define 'user', User, Factory.userData

module.exports = Factory
