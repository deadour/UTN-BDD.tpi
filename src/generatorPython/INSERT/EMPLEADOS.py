

from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []



# --> para generar empleados
for i in range(1, 49):        
    num_empleados = random.randint(10, 15)  # Genera un número aleatorio entre 10 y 15
    for n in range(num_empleados):
        cuit = fake.random_int(min=20000000000, max=34999999999)
        f_ingreso = fake.date_between(start_date='-10y', end_date='today')
        data.append((cuit, i, fake.name(), f_ingreso))



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
        cursor.executemany("""INSERT INTO empleados (cuit, idFarm, nombre, f_ingreso) 
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


