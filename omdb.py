import requests

def poster_data(url):
    response = requests.get(f"http://www.omdbapi.com/?apikey=b53722f3&i=tt{url}")
    return response.json()["Poster"]

