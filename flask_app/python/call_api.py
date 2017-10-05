from flask import Flask
import rapi
app = Flask(__name__)

@app.route("/")
def hello():
   return "<pre>RSTUDIO NEWS\n===\n" + "\n---\n".join([item["header"] for item in rapi.get_news()]) + "</pre>"

if __name__ == "__main__":
   app.run(host = "0.0.0.0", debug = True)

