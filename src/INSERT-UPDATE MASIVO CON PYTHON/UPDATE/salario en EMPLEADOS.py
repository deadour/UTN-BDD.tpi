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
    cursor.execute("SELECT e.cuit FROM empleados e WHERE e.cuit<34996437997")

    # Obtener los resultados de la consulta
    total_results = cursor.fetchall()

    for result in total_results:
        cuit = result[0]
        aleatorio=random.randrange(150000,220000,5000)
        cursor.execute("UPDATE empleados SET salario = %s WHERE cuit = %s", (aleatorio, cuit))


    if connection.is_connected():
        connection.commit()

        print("Valores de la columna salario actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()