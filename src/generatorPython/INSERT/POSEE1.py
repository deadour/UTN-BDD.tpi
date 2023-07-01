

from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []



#-->para generar posee 1
for i in range(1,49):
    for j in range(1,222):
        cant = random.randint(0, 500)
        data.append((j,i,cant))


# Establecer la conexión a la base de datos
connection = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='',
    db='tpi'
)

# Crear un cursor para ejecutar consultas
cursor = connection.cursor()

try:


    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO posee1 (cod, idFarm, Cantidad) 
                                VALUES (%s, %s, %s)""", data)

        if (len(data)  == cursor.rowcount):
            connection.commit()
            print("{} rows inserted.".format(len(data)))
        else:
            connection.rollback()

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()



