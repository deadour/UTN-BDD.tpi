#--> para generar ingresos

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
    cursor.execute("SELECT CUIT FROM laboratorios")

    # Obtener los resultados de la consulta
    cuit_results = cursor.fetchall()

    # Guardar los cuit en una lista
    cuit_list = [result[0] for result in cuit_results]

    fecha_actual = date.today()

    # Definir el rango de fechas para generar una fecha aleatoria anterior a la actual
    fecha_inicial = fecha_actual - timedelta(days=500)  # Retrocede 1 año desde la fecha actual

    
    for i in range(1,300):
        ind = random.randint(0,29)
        codT = random.randint(1,30)
        CUIT = cuit_list[ind]
        fecha_aleatoria = fake.date_between(start_date=fecha_inicial, end_date=fecha_actual)
        estado = random.choice(["terminado", "confección", "terminado", "procesado", "terminado"])
        data.append((i, CUIT, codT, fecha_aleatoria, estado))

    
    

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO ingresos (codI, CUIT, codT, fecha, estado) 
                                VALUES (%s, %s, %s, %s,%s)""", data)

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
