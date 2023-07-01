from mysql.connector import Error
import mysql.connector
import random


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
    # Consulta para obtener posee1
    cursor.execute("SELECT p.cod FROM posee1 p WHERE p.cod<222 ORDER BY p.cod ASC")

    # Obtener los resultados de la consulta
    total_results = cursor.fetchall()

    for result in total_results:
        num = result[0]
        aleatorio=random.randint(0,500)
        cursor.execute("UPDATE posee1 SET cantidad = %s WHERE cod = %s", (aleatorio, num))


    if connection.is_connected():
        connection.commit()

        print("Valores de la columna stock actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()