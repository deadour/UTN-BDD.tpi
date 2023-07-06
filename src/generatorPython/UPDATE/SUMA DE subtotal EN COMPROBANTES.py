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
    # Consulta para obtener los totales
    cursor.execute("SELECT c.num, SUM(m.precio*i.cantidad) as total FROM (medicamentos m NATURAL JOIN incluye1 i) NATURAL JOIN comprobantes c GROUP BY c.num")

    # Obtener los resultados de la consulta
    total_results = cursor.fetchall()

    for result in total_results:
        num = result[0]
        total = result[1]

        cursor.execute("UPDATE comprobantes SET subtotal = %s WHERE num = %s", (total, num))


    if connection.is_connected():
        connection.commit()

        print("Valores de la columna subtotal actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()
