-- Consultas UPDATE
-- 1.	Aplicar el descuento según el tipo de afiliado al precio total de todos los comprobantes
UPDATE comprobantes c
JOIN (
    SELECT c.num,
        CASE
            WHEN c.id_af IS NULL THEN (c.subtotal - (c.subtotal * (cr.descuento/100)))
            ELSE (c.subtotal - (c.subtotal * (af.descuento/100)))
        END AS total
    FROM comprobantes c NATURAL JOIN afiliado af NATURAL JOIN cronicos cr
    GROUP BY c.num, c.id_af
) t ON c.num = t.num
SET c.total = t.total;
 
 
-- 2.	A aquellos empleados que tienen una antigüedad mayor a 5 años aumentar un 20% eL salario
UPDATE Empleados
SET salario = salario * 1.20
WHERE f_ingreso <= DATE_SUB(CURDATE(), INTERVAL 5 YEAR) ;

-- 3.	 A los medicamentos comercializados por Biogen incrementar su precio en un 13%.
UPDATE Medicamentos
JOIN Laboratorios ON Medicamentos.CUIT = Laboratorios.CUIT
SET Medicamentos.precio = Medicamentos.precio * 1.13
WHERE Laboratorios.razonSocial = 'Biogen';

 
-- 4.	A aquellas farmacias que le corresponden el día de guardia “Lunes” cambiarlo por el día “Miércoles” o viceversa.
UPDATE farmacia f
JOIN (
    SELECT f.idFarm,
        CASE
            WHEN f.diasGuardia = 'Lunes' THEN f.diasGuardia = 'Miércoles'
            WHEN f.diasGuardia = 'Miércoles' THEN f.diasGuardia = 'Lunes'
        END AS diasGuardia
    FROM farmacia f
) t ON f.idFarm = t.idFarm
SET f.diasGuardia = t.diasGuardia
;
 
-- 5.	Realizar un descuento del 15% a los 10 medicamentos menos vendidos de todas las farmacias.
UPDATE medicamentos m
JOIN(
    SELECT m.cod, (m.precio*0.9) as precio
    FROM medicamentos m NATURAL JOIN incluye1 i1
    GROUP BY i1.cod
    HAVING SUM(i1.cantidad) =
    (SELECT MIN(aux.vendido) as vendido
    FROM (SELECT SUM(i.cantidad) as vendido
    FROM incluye1 i
    GROUP BY i.cod) aux)
    ) aux2 ON m.cod = aux2.cod
SET m.precio = aux2.precio;

 

-- 6.	A aquellos socios Crónicos que tengan más de 3 diagnósticos, bajarles el descuento a un 60%.
UPDATE cronicos c
JOIN (  SELECT a.id_af
        FROM asociado a 
        GROUP BY a.id_af
        HAVING COUNT(*)>=3) as aux ON aux.id_af=c.id_cr
SET c.descuento=60

;

-- Consultas INSERT
-- 1.	Insertar en transportaA una nueva relación que vincule a la ciudad de resistencia con uno de los transportista que menor cantidad de envíos haya realizado en el último trimestre.
INSERT INTO transportaa (codT, codpost) VALUES((SELECT i.codT
FROM ingresos i
WHERE (30*3) >= DATEDIFF(CURRENT_DATE, i.fecha) AND i.estado = 'finalizado'
GROUP BY i.codT
HAVING COUNT(*) = (
    SELECT MIN(envios)
    FROM (
        SELECT COUNT(*) as envios
        FROM ingresos
        WHERE 30 >= DATEDIFF(CURRENT_DATE, fecha) AND estado = 'finalizado'
        GROUP BY codT
    ) as aux
)
ORDER BY i.codT
LIMIT 1
),
(SELECT c.codpost FROM ciudad c WHERE c.nombre = 'Resistencia')
)

 ;

-- 2.	Si existe algún paciente crónico con 4 o más diagnósticos, crear un nuevo diagnóstico llamado Por morir y asociar a todos los que estén en esa condición
-- Obtener el siguiente número de diagnóstico
SELECT MAX(codDiag) + 1 INTO @siguienteCodDiag FROM Diagnostico;

-- Insertar el nuevo diagnóstico "Por morir" si no existe
INSERT INTO Diagnostico (codDiag, nombre)
SELECT @siguienteCodDiag, 'Por morir'
FROM dual
WHERE NOT EXISTS (
  SELECT *
  FROM Diagnostico
  WHERE nombre = 'Por morir'
);

-- Asociar el nuevo diagnóstico a los pacientes crónicos si existe
INSERT INTO asociado (codDiag, id_af, fechaDiag)
SELECT @siguienteCodDiag, id_af, CURDATE()
FROM asociado a
GROUP BY a.id_af
HAVING COUNT(*) >= 4
;

-- 3.	Crear un nuevo comprobante para Bernardino Chamorro que realizo una compra en la farmacia con idFarm = 1
INSERT INTO comprobantes (num, id_af, id_cr, fecha, total, idFarm, subtotal) VALUES (
    (SELECT MAX(c1.num) + 1 FROM comprobantes c1),
    (SELECT a.id_af FROM afiliado a WHERE a.NyA LIKE 'Bernardino%Chamorro'),
    NULL, CURRENT_DATE, 0, 1, 0
    );

 
-- 4.	Insertar nuevo laboratorio
INSERT INTO Laboratorios (CUIT, razonSocial, domicilio) VALUES ('1234567890', 'LabUrquiza', '420 pasaje Bosch, Corrientes, Argentina');
 
-- 5.	Insertar nueva Farmacia
INSERT INTO farmacia (idFarm, codpost, diasGuardia, direccion) VALUES (49, 1500, 'martes', 'San martin 324 Chaco');
;

-- 6.	Crear un nuevo ingreso de 10 unidades del medicamento IBUPROFENO ILAB 600 comercializado por el laboratorio BioGen y que será transportado por Rivas PLC.
SELECT MAX(codI) INTO @ultimoCodI FROM ingresos;


INSERT INTO ingresos (codI, CUIT, codT, fecha, estado) VALUES (
    (SELECT MAX(i.codI) + 1  FROM ingresos i),
    (SELECT l.CUIT
    FROM laboratorios l
    WHERE l.razonSocial = 'BioGen'),
    (SELECT t.codT
    FROM transportista t
    WHERE t.razonSocial = 'Rivas PLC'),
    CURRENT_DATE,
    'pendiente'
);

INSERT INTO ingresan (codI, cod, cantidad)
SELECT @ultimoCodI,
 (SELECT m.cod
  FROM medicamentos m
  WHERE m.nombreComer = 'IBUPROFENO ILAB 600')
 ,10
;
-- -----------Consultas DELETE

-- 1.	Borrar comprobantes que tengan una antigüedad mayor a 5 años y estén asociados a un afiliado eventual.

DELETE FROM `comprobantes` WHERE datediff(CURRENT_DATE, comprobantes.fecha) >= (365*5) AND comprobantes.id_af IS NOT NULL;

 

-- 2.	Eliminar las monodrogas que no compongan ningún medicamento.
DELETE FROM Monodroga
WHERE nombreCientifico NOT IN (
  SELECT nombreCientifico FROM compuesto
);
 

-- 3.	La sucursal de Resistencia ha sido dada de baja. Eliminar empleados vinculados a la farmacia de la ciudad de Resistencia que hayan trabajado por menos de dos años:

DELETE FROM Empleados
WHERE idFarm IN (SELECT idFarm FROM Farmacia WHERE codpost IN (SELECT codpost FROM Ciudad WHERE nombre = 'Resistencia')) 
AND DATEDIFF(CURDATE(), f_ingreso) < 730;

 


-- 4.	Borrar todos los afiliados que no tienen ninguna enfermedad crónica y que se afiliaron hace más de 5 años:

DELETE FROM Afiliado
WHERE id_af NOT IN (SELECT id_af FROM Asociado)
AND f_ing < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

 
-- 5.	Eliminar ingresos que tengan el estado finalizado y sean de hace más de 365 días:

DELETE FROM ingresos
WHERE datediff(CURRENT_DATE, ingresos.fecha)>=365 AND ingresos.estado = 'pendiente';


 

-- 6.	 Borrar todos los afiliados que no tienen ninguna enfermedad crónica y que viven en una localidad específica:

DELETE FROM Afiliado WHERE id_af NOT IN (SELECT id_af FROM Asociado) AND localidad = 'Sevilla';

 
-- ------------Consultas SELECT
-- 1.	Mostrar el ranking de los diez medicamentos con mayor cantidad de ventas en todas las farmacias de la cadena. 
SELECT m.cod, m.nombreComer, SUM(i.cantidad) as Vendido
FROM medicamentos m NATURAL JOIN incluye1 i NATURAL JOIN comprobantes c
GROUP BY m.cod
ORDER BY Vendido DESC
LIMIT 10;
 
-- 2.	 Listar los códigos y nombres de los medicamentos que fueron vendidos en todas las farmacias. 
SELECT m.cod
FROM medicamentos m
WHERE NOT EXISTS(
    (SELECT f.idFarm
    FROM farmacia f)
    EXCEPT
    (SELECT c.idFarm
    FROM comprobantes c NATURAL JOIN incluye1 i
    WHERE i.cod = m.cod)
)
ORDER BY m.cod ASC;
 
-- 3.	Mostrar la cantidad de afiliados crónicos y eventuales que compraron medicamentos en la farmacia de Resistencia en la última semana.
SELECT c1.nombre ,COUNT(c.id_af) as 'Ventas a eventuales', COUNT(c.id_cr) as 'Ventas a Cronicos'
FROM comprobantes c NATURAL JOIN farmacia f NATURAL JOIN ciudad c1
WHERE c1.nombre = 'resistencia' AND 7 >= DATEDIFF(CURRENT_DATE, c.fecha);

-- 4.	 Informar el top de las 5 farmacias que solicitaron mayores cantidades de amoxidal duo en los últimos 15 días. 	
SELECT f.idFarm, t.cantidad
FROM farmacia f NATURAL JOIN solicita s NATURAL JOIN (SELECT t1.num ,DATEDIFF(CURRENT_DATE, t1.fecha) AS dias FROM transferencia t1)t1 NATURAL JOIN transfiere t NATURAL JOIN medicamentos m
WHERE m.nombreComer = 'AMOXIDAL DUO' AND 15 >= t1.dias
ORDER BY t.cantidad DESC
LIMIT 5;

 
-- 5.	Listado de farmacias con la menor cantidad de transferencias pendientes.
SELECT s.idFarm, count(*) as 'cantidad pendiente'
FROM transferencia t NATURAL JOIN solicita s
WHERE t.estado = 'pendiente'
GROUP BY s.idFarm
HAVING COUNT(*) = (select MIN(a.cant)
from (SELECT s.idFarm,count(*) AS cant
FROM transferencia t NATURAL JOIN solicita s
WHERE t.estado = 'pendiente'
GROUP BY s.idFarm) a);

-- 6.	 Identificar para una farmacia determinada cuales son los medicamentos sin stock en la misma pero con stock en deposito central 
SELECT p1.idFarm,  m.nombreComer, p1.cantidad, m.stockEnDep
FROM medicamentos m NATURAL JOIN posee1 p1
WHERE p1.Cantidad = 0 AND m.stockEnDep > 0;



-- 7.	¿Cuál es la empresa de transporte con mayor actividad en el último mes? 
SELECT i.codT, COUNT(*) as envios
FROM ingresos i
WHERE 30 >= DATEDIFF(CURRENT_DATE, i.fecha) AND i.estado = 'finalizado'
GROUP BY i.codT
HAVING COUNT(*) = (
    SELECT MAX(envios)
    FROM (
        SELECT COUNT(*) as envios
        FROM ingresos
        WHERE 30 >= DATEDIFF(CURRENT_DATE, fecha) AND estado = 'finalizado'
        GROUP BY codT
    ) as aux
);
 
-- 8.	Informar el monto total de ventas por farmacia en el último trimestre ordenado en forma descendente.
SELECT c.idFarm, ROUND(SUM(c.total), 0) AS ganancias
FROM comprobantes c
WHERE 90 >= DATEDIFF(CURRENT_DATE,c.fecha)
GROUP BY c.idFarm
ORDER by ganancias DESC;