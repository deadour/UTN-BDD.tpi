from mysql.connector import Error
import mysql.connector


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
    cursor.execute("""
        UPDATE comprobantes c
        JOIN (
            SELECT c.num,
                CASE
                    WHEN c.id_af IS NULL THEN SUM(m.precio * i.cantidad) * 0.3
                    ELSE SUM(m.precio * i.cantidad) * 0.8
                END AS total
            FROM medicamentos m
            JOIN incluye1 i ON m.cod = i.cod
            JOIN comprobantes c ON c.num = i.num
            GROUP BY c.num, c.id_af
        ) t ON c.num = t.num
        SET c.total = t.total
    """)

    if connection.is_connected():
        connection.commit()

        print("Valores de la columna total actualizados correctamente.")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close()
