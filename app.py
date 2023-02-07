from flask import url_for, Flask,request,render_template,redirect,session,jsonify
from markupsafe import escape
from random import randint
from config import Config
import connectors
import logging
from omdb import poster_data
import Colourer

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)
app.config.from_object(Config)



@app.route('/current_movie_data')
def current_movie_data():
    database = {
    "current": [list(i) for i in connectors.show_current_films()],
    "upcoming": [list(i) for i in connectors.show_upcoming_films()]
    }
    
    for i in database.keys():
        temp = []
        for j,val in enumerate(database[i]):
            val.append(poster_data(val[0]))
            temp.append(val)
            database[i] = temp
    database = jsonify(database)
    print(database)
    return database
    

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/login', methods=['GET','POST'])
def login():
    error = False
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form.get('email')
        password =  request.form.get('password')
        account = connectors.account(email, password)
        print(account)
        if not account:
            error  = "E-mail/Password Error"
        else:
            session['loggedin']= True
            session['id'] = account[0][0]
            print(session)
    return render_template("login.html",error = error)


@app.route('/signup',methods = ['GET','POST'])
def signup():
    error = None
    customer_id = randint(1000, 10000)
    while (connectors.check_valid_customer_id(customer_id)):
        customer_id = randint(1000, 10000)
    
    if request.method == 'POST':
        if not connectors.check_email_valid(request.form.get("email")):
            val = [customer_id, request.form.get("fname"),request.form.get("lname"),request.form.get("email"),request.form.get("password"),request.form.get("contact")]
            connectors.add_customer_data(val)
        else:
            error = True
    return render_template("signup.html",error = error)

@app.route('/films/<film_id>')
def films_page(film_id):
    film_data = str(connectors.get_film_data(film_id))
    return film_data