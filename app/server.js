var express = require('express'),
  mongoose = require('mongoose'),
  app = express();

app.get('/', function(req, res) {
  return res.send('Hello World');
});

app.listen(3333);
