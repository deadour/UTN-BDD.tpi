from mysql.connector import Error
import mysql.connector
from faker import Faker
import random

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
    # Consulta para obtener los codpost de ciudades
    cursor.execute("SELECT codpost FROM ciudad")

    # Obtener los resultados de la consulta
    codpost_results = cursor.fetchall()

    # Guardar los codpost en una lista
    codpost_list = [result[0] for result in codpost_results]

    
    # Recorrer la lista de codpost
    for codpost in codpost_list:
        # Generar una lista de codT únicos
        codT_list = random.sample(range(1, 31), 30)
        # operaciones con cada codpost
        num_viaje = random.randint(1, 7)  # Genera un número aleatorio entre 1 y 5, de los transportes que llegan 
        for n in range(num_viaje):
            codT= codT_list.pop()
            data.append((codT, codpost))
    

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO transportaa (codT, codpost) 
                                VALUES (%s, %s)""", data)

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




