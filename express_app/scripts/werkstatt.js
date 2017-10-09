var renderTemplate = require("./template").renderTemplate;
var users = require("./config").users;

var passport = require("passport");
var BasicStrategy = require('passport-http').BasicStrategy;

passport.use(new BasicStrategy(
  function(username, password, done) {
    if (users[username] !== undefined && password === users[username]["pwd"]) {
      return done(null, username);
    }
    return done(null, false);
  }
));

var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send(renderTemplate());
});

app.get("/secret", passport.authenticate("basic", { session: false }), function(req, res) {
  console.log(req.user);
  var src = users[req.user]["src"];
  console.log(src);
  res.send(renderTemplate(src));
});

app.listen(3000, function () {
  console.log('Here we go on port 3000!');
});

