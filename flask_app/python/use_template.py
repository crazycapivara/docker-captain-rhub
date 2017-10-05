from flask import Flask, render_template
import rapi

app = Flask(__name__)

@app.route("/")
def hello():
    return render_template("rstudio_news.html", news = rapi.get_news())

if __name__ == "__main__":
    app.run(host = "0.0.0.0", debug = True)

