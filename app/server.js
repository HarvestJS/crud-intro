port = process.env.PORT || 3333;

var express = require('express'),
  mongoose = require('mongoose'),
  app = express();

app.get('/', function(req, res) {
  return res.send('Hello World');
});

app.listen(port);
