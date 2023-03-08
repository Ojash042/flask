import mysql.connector
from hashlib import sha256
from random import randint
import json

mydb = mysql.connector.connect(
        host ='localhost',
        user = 'root',
        password = '',
        database = 'Cinema'
    )
mycursor = mydb.cursor(buffered=True)
    

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


def show_current_films():
    query = "SELECT Films.id,Films.FILM_NAME,Films.Director,Films.Release_Date,Screening.screening_id,Screening.start_time,Theatre.theatre_id FROM Films INNER JOIN Screening ON Films.id=Screening.id INNER JOIN Theatre ON Screening.theatre_id=Theatre.theatre_id ORDER BY Films.id, Screening.start_time"
    mycursor.execute(query,)
    dict = {}
    result = mycursor.fetchall()
    for i,val in enumerate(result):
        film_id = val[0]
        if not film_id in dict:
            temp_screen = []
            temp_time = []
            temp_theatre = []
            temp_screen.append(val[4])
            temp_time.append(val[5])
            temp_theatre.append(val[6])
            dict[film_id] = list(val[1:4])
            dict[film_id].append(temp_screen)
            dict[film_id].append(temp_time)
            dict[film_id].append(temp_theatre)
        else:
            dict[film_id][3].append(val[4])
            dict[film_id][4].append(val[5])
            dict[film_id][5].append(val[6])

    result_list = [[] for i in range(len(dict))]
    for i,val in enumerate(dict):
        dict[val].insert(0,val)
        result_list[i] = dict[val]
    return result_list

def show_upcoming_films():
    query = "SELECT * FROM Films WHERE STATE = 1"
    mycursor.execute(query,)
    result = mycursor.fetchall()
    return result

def get_film_data(id):
    query  = "SELECT * FROM Films WHERE id = %s"
    mycursor.execute(query,(id,))
    result = mycursor.fetchone()
    return result

def seats_info(screening_id):
    query = "SELECT Screening.screening_id,id,start_time,Screening.theatre_id,Seats.seat_id,Seats.row,Seats.col FROM Screening INNER JOIN Theatre ON Screening.theatre_id=Theatre.theatre_id INNER JOIN Seats ON Screening.theatre_id =Seats.theatre_id  WHERE Screening.screening_id = %s"
    mycursor.execute(query,(screening_id,))
    result= mycursor.fetchall()
    dict = {}
    for i in result:
        key = i[5]
        if key not in dict:
            dict[key]=0
        dict[key]+=1
    res = [result[0][0], result[0][2],result[0][3],dict]
    return res

def get_seat_id(row,col,theatre_id):
    query = "SELECT seat_id FROM Seats WHERE Seats.row = %s AND Seats.col=%s AND Seats.theatre_id =%s"
    val = (row,col,theatre_id)
    mycursor.execute(query,val)
    result = mycursor.fetchone()
    return result[0]


def make_reservation(screening_id,customer_id,reserve_type,seats,theatre_id):
    reservation_id = randint(0, 100000)
    reservation_type_id = randint(0, 100000)
    
    query = "INSERT INTO Reservation_Type VALUES(%s,%s)"
    vals = (reservation_type_id,1)
    mycursor.execute(query,vals)
    mydb.commit()

    query = "INSERT INTO Reservation VALUES(%s,%s,%s,%s,%s,%s,%s)"
    reserved = 1 if reserve_type == "Booked" else 0
    bought = 1-reserved
    vals = (reservation_id,screening_id,customer_id,reservation_type_id,reserved,bought,1)
    mycursor.execute(query,vals)
    mydb.commit()

    query = "INSERT INTO Seat_Reserved VALUES(%s,%s,%s,%s)"
    for i in seats:
        seat_reserved_id = randint(0, 1000)
        row = i[0]
        col = i[1]
        seat_id = get_seat_id(row, str(col), theatre_id)
        vals = (seat_reserved_id,seat_id,reservation_id,screening_id)
        mycursor.execute(query,vals)
        mydb.commit()