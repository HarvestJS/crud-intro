require('./user');

var express = require('express'),
  User = require('mongoose').models.User,
  app = express();

app.use(express.bodyParser());

// list
app.get('/users', function(req, res) {
  User.find({}, function(err, users){
    res.send({users: users});
  });
});

// show
app.get('/users/:id', function(req, res) {
  id = req.params.id;
  User.findById(id, function(err, user){
    res.send({user: user});
  });
});

// create
app.post('/users', function(req, res) {
  User.create(req.body, function(err, user) {
    res.send(201, {user: user});
  });
});

// update
app.put('/users/:id', function(req, res) {
  id = req.params.id;
  User.findOneAndUpdate({_id: id}, req.body, function(err, user) {
    res.send(200, {user: user});
  });
});

// destroy
app.delete('/users/:id', function(req, res) {
  id = req.params.id;
  User.remove({_id: id}, function() {
    res.send({});
  });
});

app.listen(3333);
console.log('Server running at: http://localhost:' + 3333);
