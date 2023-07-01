#-->generador de medicamentos
#--> Genera medicamentos 
# from mysql.connector import Error
# import mysql.connector
# from faker import Faker
# import random
# from listas_con_datos import  medicamentos, presentaciones, monodrogas

# fake = Faker('es_ES')

# data = []

# # Establecer la conexión a la base de datos
# connection = mysql.connector.connect(
#     host='localhost',
#     port=3306,
#     user='root',
#     password='',
#     db='tpi'
# )

# # Crear un cursor para ejecutar consultas
# cursor = connection.cursor()

# try:
#     # Consulta para obtener los CUIT de laboratorios
#     cursor.execute("SELECT cuit FROM laboratorios")

#     # Obtener los resultados de la consulta
#     cuit_results = cursor.fetchall()

#     # Guardar los CUIT en una lista
#     cuit_list = [result[0] for result in cuit_results]

#     cod=1
#     num_cuit=0
#     for n in range(0, len(medicamentos)): 
	  stockEnDep=random.randint(30,1000)
#         data.append((cod, cuit_list[num_cuit], fake.pyfloat(min_value=0, max_value=1000, right_digits=2), presentaciones[n], medicamentos[n], fake.text(max_nb_chars=100),stockEnDep))
#         cod+=1
#         num_cuit+=1

#         if num_cuit==30:
#             num_cuit=0


#     if connection.is_connected():
#         cursor = connection.cursor()
#         cursor.executemany("""INSERT INTO medicamentos (cod, CUIT, precio, presentación, nombreComer, descripcion, stockEnDep) 
#                                 VALUES (%s, %s, %s, %s, %s, %s, %s)""", data)

#         if (len(data)  == cursor.rowcount):
#             connection.commit()
#             print("{} rows inserted.".format(len(data)))
#         else:
#             connection.rollback()

# except mysql.connector.Error as ex:
#     print("Error during database operations: {}".format(ex))

# finally:
#     # Cerrar el cursor y la conexión a la base de datos
#     cursor.close()
#     connection.close()

