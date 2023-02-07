import mysql.connector
from hashlib import sha256

mydb = mysql.connector.connect(
        host ='localhost',
        user = 'root',
        password = '',
        database = 'Cinema'
    )
mycursor = mydb.cursor(buffered=True)
    
def show_tables():
    mycursor.execute("SHOW TABLES")
    for i in mycursor:
        print(i) 

def check_email_valid(email):
    query = "SELECT customer_id,email FROM Customers WHERE email=%s"
    email = (email,)
    mycursor.execute(query,email)
    result = mycursor.fetchone()
    return not not result

def account(email,password):
    encoded = sha256(password.encode()).hexdigest()
    query = "SELECT * FROM Customers WHERE email = %s AND password =  %s"
    attr = (email,encoded)
    mycursor.execute(query,attr)
    result = mycursor.fetchall()
    return result

def check_valid_customer_id(rng):
    query = "SELECT customer_id FROM Customers WHERE customer_id = %s"
    customer_id = (rng,)
    mycursor.execute(query,customer_id)
    result = mycursor.fetchone()
    return not not result

def add_customer_data(values):
    query = "INSERT INTO Customers VALUES(%s,%s,%s,%s,%s,%s)"
    values[4] = sha256(values[4].encode()).hexdigest()
    values = tuple(values)
    mycursor.execute(query,values)
    mydb.commit()
#print(account("admin@admin.com", "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918"))
#add_customer_data([2334,"Ojash","Devkota","ojash25@gmail.com","Meronaam1","9874215547"])

def show_current_films():
    query = "SELECT * FROM Films WHERE STATE = 0"
    mycursor.execute(query,)
    result = mycursor.fetchall()
    #print(result)
    return result

def show_upcoming_films():
    query = "SELECT * FROM Films WHERE STATE = 1"
    mycursor.execute(query,)
    result = mycursor.fetchall()
    return result
#print(show_current_films())

def get_film_data(id):
    query  = "SELECT * FROM Films WHERE id = %s"
    mycursor.execute(query,(id,))
    result = mycursor.fetchone()
    return result

def add_seats():
    query = "INSERT INTO Seats()"
    for i in range(6):
        row = chr(ord('a')+i)
        for j in range(12):
            pass