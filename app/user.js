var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/crud-intro');

mongoose.model('User', new mongoose.Schema({
  email: String,
  first_name: String,
  last_name: String,
  role: String
}));

return mongoose.model('User');
