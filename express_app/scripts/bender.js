var get_html = function(src) {
  src =  src || "https://blog.rstudio.com";
  return "<html><head><title>shiny data science</title></head><body><iframe style='height:100%; width:100%; border: none;' src='" + src + "'></iframe></body></html>";
};

var users = {
  bird: {
    pwd: "dog",
    src: "https://www.rstudio.com"
  },
  bender: {
    pwd: "fry",
    src: "https://blog.rstudio.com"
  }
};

var passport = require("passport");
var BasicStrategy = require('passport-http').BasicStrategy;

passport.use(new BasicStrategy(
  function(username, password, done) {
    //if (username === "bird" && password === "dog") {
    if (users[username] !== undefined && password === users[username]["pwd"]) {
      return done(null, username);
    }
    return done(null, false);
  }
));

var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send(get_html());
});

app.get("/secret", passport.authenticate("basic", { session: false }), function(req, res) {
  console.log(req.user);
  //var html = "<html><head><title>shiny data science</title></head><body><iframe style='height:100%; width:100%; border: none;' src='https://blog.rstudio.com'>Doing Science</iframe></body></html>"
  //res.send(get_html("https://www.rstudio.com"));
  var src = users[req.user]["src"];
  console.log(src);
  var tpl = `
    <body>${src}</body>
  `
  console.log(tpl);
  res.send(get_html(src));
});

app.listen(3000, function () {
  console.log('Here we go on port 3000!');
});

