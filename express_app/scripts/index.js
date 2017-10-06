var passport = require("passport");
var BasicStrategy = require('passport-http').BasicStrategy;

passport.use(new BasicStrategy(
  function(username, password, done) {
    if (username === "bird" && password === "dog") {
      return done(null, true);
    }
    return done(null, false);
  }
));

var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.get("/secret", passport.authenticate("basic", { session: false }), function(req, res) {
  var html = "<html><head><title>shiny data science</title></head><body><iframe style='height:100%; width:100%; border: none;' src='https://blog.rstudio.com'>Doing Science</iframe></body></html>"
  res.send(html);
});

app.listen(3000, function () {
  console.log('Here we go on port 3000!');
});

