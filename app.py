from flask import url_for, Flask,request,render_template,redirect,session,jsonify,make_response
from markupsafe import escape
from random import randint
import sys
from config import Config
import connectors
import logging
from flask_cors import CORS
from omdb import poster_data, movie_db
#import Colourer

app = Flask(__name__)
app.debug = True
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'
watchdog_logger = logging.getLogger('watchdog')
watchdog_logger.addHandler(logging.NullHandler())
app.config.from_object(Config)

@app.route('/movie_data')
#@cross_origin()
def movie_data():
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
    database.headers.add('Access-Control-Allow-Origin','*')
    return database
    
@app.route('/this_movie_data/<id>')
def this_movie_data(id):
    return movie_db(id)
    

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/login', methods=['GET','POST'])
def login():
    error = False
    if not session.get("loggedin"):
        if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
            email = request.form.get('email')
            password =  request.form.get('password')
            account = connectors.account(email, password)
            if not account:
                error  = True
            else:
                session['loggedin']= True
                session['id'] = account[0][0]
                session['username'] = account[0][1]
                return redirect(url_for('index'))
    else:
        return redirect(url_for('index'))
    return render_template("login.html",error = error)


@app.route('/signup',methods = ['GET','POST'])
def signup():
    error = None
    if not session.get("loggedin"):
        customer_id = randint(1000, 10000)
        while (connectors.check_valid_customer_id(customer_id)):
            customer_id = randint(1000, 10000)

        if request.method == 'POST':
            if not connectors.check_email_valid(request.form.get("email")):
                val = [customer_id, request.form.get("fname"),request.form.get("lname"),request.form.get("email"),request.form.get("password"),request.form.get("contact")]
                connectors.add_customer_data(val)
                return redirect(url_for('index'))
            else:
                error = True
    else:
        return redirect(url_for('index'))

    return render_template("signup.html",error = error)

@app.route('/films/<film_id>')
def films_page(film_id):
    film_data = str(connectors.get_film_data(film_id))
    return render_template("film_page.html")

@app.route('/films/<film_id>/<screening_id>',methods = ['GET','POST'])
def screening_page(film_id,screening_id):
    return render_template("screening_page.html")    

@app.post('/request')
def screening():
    if not session.get('loggedin'):
        return redirect(url_for('login'))
    if request.method == 'POST':
        lists = request.form.getlist("seats")
        reserve_type =request.form['type']
        screening_id = request.form.get('screening_id')
        customer_id = session['id']
        theatre_id = request.form.get('theatre_id')
        connectors.make_reservation(screening_id,customer_id,reserve_type,lists,theatre_id)
    return redirect(url_for('index'))

@app.route('/api/seats/<screening_id>')
def display_seats(screening_id):
    result = connectors.seats_info(screening_id)
    jsonify(result)
    return result

@app.route('/logout')
def logout():
    session.pop('username',None)
    session.pop('id', None)
    session['loggedin']= False
    return redirect('/')

@app.route('/base')
def base():
    return render_template('base.html')

if __name__ == "__main__":
    app.run(debug=True)
