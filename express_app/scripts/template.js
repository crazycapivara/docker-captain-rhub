module.exports = {
  renderTemplate: function(src) {
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
  }
};

