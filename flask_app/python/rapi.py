import requests

api = "http://plumber:8000/rstudio_news"

def get_news():
   response = requests.get(api)
   data = response.json()
   response.close()
   return data

