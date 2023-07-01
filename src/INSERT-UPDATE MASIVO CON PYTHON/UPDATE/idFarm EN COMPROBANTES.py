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
    # Consulta para obtener los totales
    cursor.execute("SELECT c.num FROM comprobantes c WHERE c.num>9999")

    # Obtener los resultados de la consulta
    total_results = cursor.fetchall()

    for result in total_results:
        num = result[0]
        aleatorio=random.randint(1,48)
        cursor.execute("UPDATE comprobantes SET idFarm = %s WHERE num = %s", (aleatorio, num))


    if connection.is_connected():
        connection.commit()

        print("Valores de la columna idFarm actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()

