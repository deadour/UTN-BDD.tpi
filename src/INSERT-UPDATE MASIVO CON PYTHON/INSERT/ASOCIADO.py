#-->generador de asociado

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
    # Consulta para obtener los id_af 
    cursor.execute("SELECT id_af FROM cronicos")

    # Obtener los resultados de la consulta
    id_af_results = cursor.fetchall()

    # Guardar los id_af en una lista
    id_af_list = [result[0] for result in id_af_results]

    fecha_actual = date.today()

    # Definir el rango de fechas para generar una fecha aleatoria anterior a la actual
    fecha_inicial = fecha_actual - timedelta(days=10000)  # Retrocede 10 mil dias desde la fecha actual
    
    # for id_af in id_af_list:
    #     codDiag=random.randint(1,60)
    #     fecha_aleatoria = fake.date_between(start_date=fecha_inicial, end_date=fecha_actual)
    #     data.append((codDiag, id_af, fecha_aleatoria))

    for i in range(1, 21):
        ind=random.randint(0,4575)
        id_af= id_af_list[ind]
        codDiag=random.randint(1,60)
        fecha_aleatoria = fake.date_between(start_date=fecha_inicial, end_date=fecha_actual)
        data.append((codDiag, id_af, fecha_aleatoria))

    

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO asociado (codDiag, id_af, fechaDiag)
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

