#-->para generar ingresan
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

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
    # Consulta para obtener los cuit de medicamentos
    cursor.execute("SELECT CUIT FROM ingresos ORDER BY codI")

    # Obtener los resultados de la consulta
    cuit_results = cursor.fetchall()

    # Guardar los cuit en una lista
    cuit_list = [result[0] for result in cuit_results]

    cont=1
    for cuit in cuit_list:
        # Consulta para obtener los cuit de medicamentos
        cursor.execute("SELECT DISTINCT cod FROM medicamentos WHERE CUIT = %s", (cuit,))

        # Obtener los resultados de la consulta
        cod_results = cursor.fetchall()

        # Guardar los cuit en una lista
        cod_list = [result[0] for result in cod_results]

        for cod in cod_list:
            cant=random.randint(100,1000)
            data.append((cont, cod, cant))

        cont+=1

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO ingresan (codI, cod, cantidad) 
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