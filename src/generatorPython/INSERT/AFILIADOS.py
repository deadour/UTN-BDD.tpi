
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []


# --> para generar afiliados
tipos_dni=['DNI', 'DNI', 'DNI', 'LE','DNI', 'DNI', 'DNI' 'LC', 'DNI', 'DNI', 'DNI', 'DE', 'DNI', 'DNI', 'DNI']
ciudades = [
    "Almería",
    "Lugo",
    "Albacete",
    "Murcia",
    "Guadalajara",
    "Guipúzcoa",
    "Ourense",
    "Sevilla",
    "Barcelona",
    "Guadalajara",
    "Melilla",
    "Cantabria",
    "Badajoz",
    "Vizcaya",
    "La Coruña"
]

for i in range(12000, 16577): #EL INDICE HAY QUE ADAPTARLO SEGUN LOS ID QUE NECESITEMOS 
    # id_af = random.randint(1, 1000)  # Genera un ID aleatorio
    # descuento = random.randint(0, 100)  # Genera un descuento aleatorio
    # f_nac = fake.date_of_birth(minimum_age=18, maximum_age=80)  # Genera una fecha de nacimiento aleatoria
    # NyA = fake.name()  # Genera un nombre y apellido aleatorio
    # nro_doc = random.randint(10000000, 99999999)  # Genera un número de documento aleatorio
    # f_ing = fake.date_between(start_date='-5y', end_date='today')  # Genera una fecha de ingreso aleatoria
    # tipo_doc = random.choice(tipos_dni)  # Genera un tipo de documento aleatorio
    # direccion = fake.street_address()  # Genera una dirección aleatoria
    # localidad = fake.city()  # Genera una localidad aleatoria
    # Agrega los datos a la lista

    #PARA GENERAR DE FORMA MAS RAPIDA LA CARGA DE EN LA LISTA NO SE UTLIZARON LAS VARIABLES, ES DECIR, LA COMPLEJIDAD ES MENOR Y POR ENDE EL TIEMPO DE EJECUCIÓN TAMBIEN.
    
    data.append((i, random.choice(ciudades), fake.address(), random.choice(tipos_dni), fake.date_between(start_date='-5y', end_date='today'), random.randint(10000000, 99999999), 70, fake.name(), fake.date_of_birth(minimum_age=18, maximum_age=80)))

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


    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO afiliado (id_af, descuento, f_nac, NyA, nro_doc, f_ing, tipo_doc, direccion, localidad) 
                                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""", data)

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


