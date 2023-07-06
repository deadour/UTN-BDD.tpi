
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random


fake = Faker('es_ES')

data = []


    
# --> para generar transportista 
for i in range(1, 31):        
        cuit = fake.random_int(min=40000000000, max=54999999999)
        data.append((i, fake.company(), cuit, fake.email(), fake.random_number(digits=9), fake.address()))


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
        cursor.executemany("""INSERT INTO transportista (codT, razonSocial, CUIT, email, telefono, direccion) 
                                VALUES (%s, %s, %s, %s, %s, %s)""", data)

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


