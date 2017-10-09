var renderTemplate = function(src) {
  src =  src || "https://blog.rstudio.com";
  return `<!DOCTYPE html>
  <html>
    <head>
      <title>shiny data science</title>
      <style>
        html, body {
          height: 100%;
          overflow: hidden;
          margin: 0;
          padding: 0;
        }
        iframe {
          height: 100%;
          width: 100%;
          border: none;
          overflow: hidden;
        }
      </style>
    </head>
    <body>
      <iframe src='${src}'></iframe>
    </body>
  </html>`;
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

