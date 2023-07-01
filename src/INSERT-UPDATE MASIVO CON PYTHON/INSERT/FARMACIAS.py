
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []


    #--> para generar farmacias
dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
idFarm=1
for i in range(1000, 8500, 500): 
    num_farmacias = random.randint(1, 5)  # Genera un número aleatorio entre 1 y 4
    for n in range(num_farmacias):
        dia_turno= random.choice(dias) 
        data.append((idFarm, i, dia_turno, fake.address()))
        idFarm+=1

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
        cursor.executemany("""INSERT INTO farmacia (idFarm, codpost, diasGuardia, direccion) 
                                VALUES (%s, %s, %s, %s)""", data)

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





