from connectors import show_current_films
from connectors import show_upcoming_films
from flask import Flask,jsonify
from omdb import poster_data

app = Flask(__name__)

database = {
    "current": [list(i) for i in show_current_films()],
    "upcoming": [list(i) for i in show_upcoming_films()]
}

for i in database.keys():
    temp = []
    for j,val in enumerate(database[i]):
        val.append(poster_data(val[0]))
        temp.append(val)
    database[i] = temp

database = jsonify(database)

app.run()