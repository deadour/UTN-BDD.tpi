#--> paa generar comprobantes

from pickle import NONE
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
    # Consulta para obtener los id_cr 
    cursor.execute("SELECT id_cr FROM cronicos")

    # Obtener los resultados de la consulta
    id_cr_results = cursor.fetchall()

    # Guardar los id_cr en una lista
    id_cr_list = [result[0] for result in id_cr_results]

    fecha_actual = date.today()

    # Definir el rango de fechas para generar una fecha aleatoria anterior a la actual
    fecha_inicial = fecha_actual - timedelta(days=800)  # Retrocede 800 dias desde la fecha actual


    for i in range(30000, 40000):
        fecha_aleatoria = fake.date_between(start_date=fecha_inicial, end_date=fecha_actual)
	idFarmacia=random.randint(1,48)
        opc=random.randint(1,2)
        if opc==1:
            id_af=random.randint(1, 11999) "PORQUE SE CUANTOS AFILIADOS HAY EN TOTAL
            id_cr=None
        else:
            id_af=None
            id_cr=random.choice(id_cr_list)

        data.append((i, id_af, id_cr, fecha_aleatoria, 0, idFarmacia))


    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO comprobantes (num, id_af, id_cr, fecha, total, idFarm)
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