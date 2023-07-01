#-->generador de incluye1

from mysql.connector import Error
import mysql.connector
from pickle import NONE
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

for i in range(15000, 20000): #se se acomoda acorte a rango que se desea generar
    cant_med=random.randint(1,10)
    cod_med=random.sample(range(1,222), cant_med)
    for j in range(cant_med):
        unidades=random.randint(1,10)
        data.append((cod_med[j],i, unidades))


try:
    connection = mysql.connector.connect(
        host='localhost',
        port=3306,
        user='root',
        password='',
        db='tpi',
        connect_timeout=30
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO incluye1 (cod, num, cantidad) 
                                VALUES (%s, %s, %s)""", data)

        if (len(data)  == cursor.rowcount):
            connection.commit()
            print("{} rows inserted.".format(len(data)))
        else:
            connection.rollback()
except Error as ex:
    print("Error during connection: {}".format(ex))
finally:
    if connection.is_connected():
        connection.close()
        print("Connection closed.")

