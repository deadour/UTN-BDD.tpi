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
    cursor.execute("SELECT m.cod FROM medicamentos m WHERE m.cod<222")

    # Obtener los resultados de la consulta
    total_results = cursor.fetchall()

    for result in total_results:
        num = result[0]
        aleatorio=random.randint(30,1000)
        cursor.execute("UPDATE medicamentos SET stockEnDep = %s WHERE cod = %s", (aleatorio, num))


    if connection.is_connected():
        connection.commit()

        print("Valores de la columna stock actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()