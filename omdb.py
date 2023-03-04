import requests
import json

def poster_data(url):
    response = requests.get(f"http://www.omdbapi.com/?apikey=b53722f3&i=tt{url}")
    return response.json()["Poster"]

def movie_db(url):
    response = requests.get(f"http://www.omdbapi.com/?apikey=b53722f3&i=tt{url}")
    response = response.json()
    jsonString = {
        "Title":response["Title"],
        "Director":response["Director"],
        "Genre":response["Genre"],
        "Plot":response["Plot"],
        "Poster":response["Poster"]
    }
    response = json.dumps(jsonString)
    return response

movie_db(1856101)