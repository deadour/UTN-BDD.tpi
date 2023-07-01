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
    fecha_actual = date.today()

    # Definir el rango de fechas para generar una fecha aleatoria anterior a la actual
    fecha_inicial = fecha_actual - timedelta(days=1000)  # Retrocede 1000 dias desde la fecha actual

    
    for i in range(1,10000):
        fecha_aleatoria = fake.date_between(start_date=fecha_inicial, end_date=fecha_actual)
        estado = random.choice(["terminado", "confección", "terminado", "procesado", "terminado"])
        data.append((i, fecha_aleatoria, estado))


    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO transferencia (num, fecha, estado) 
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

