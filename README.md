
# TPI - Base de Datos


Trabajo Práctico Integrador de la materia Base de Datos, del tercer nivel de la carrera Ingeniería en Sistemas de Información.
Dicho trabajo consiste en crear una base de datos con sus respectivas tablas, crear consultas SQL basicas y complejas sobre un escenario aplicable a la vida real. En este caso, una farmacia.






### Autores

- Córdoba, Rodrigo;
- Ramírez. Eduardo;
- Stegmayer, Tobías;
- Saucedo, Gonzalo;
- Vallejos Enzo Nahuel.


- Fecha: julio de 2023
## Escenario propuesto

Se desea mantener una base de datos para la gestión de una cadena de
farmacias distribuida en diferentes ciudades. De la ciudad se sabe su
nombre y su código postal. De cada farmacia, su ID, su dirección (calle y
número) y los días que le corresponde guardia.
Una farmacia está ubicada en una sola ciudad, pero en una ciudad hay más
de una farmacia. A su vez, sabemos que por cada ciudad existe un único
farmacéutico; es decir, en las ciudades en las que hubiere más de una
farmacia, el mismo farmacéutico estará afectado a todas las farmacias de
esa ciudad. En cada farmacia trabajan varios empleados.
De cada empleado queremos saber su CUIT, su nombre, la fecha de ingreso
laboral. Tenga en cuenta que cada empleado trabaja en una sola farmacia.
Esta cadena de farmacias vende medicamentos solo a sus afiliados. Los
datos que se deben guardar son: Id de afiliado, apellido y nombre, tipo y
número de documento, dirección, localidad, fecha de ingreso, fecha de
nacimiento
Existen dos tipos de afiliados: eventuales, que reciben un 20% de
descuento sobre las compras realizadas, y crónicos, cuyo descuento es del
70%. Para el caso de los crónicos se debe guardar información sobre
código de diagnóstico y fecha de diagnóstico. Un afiliado crónico puede
tener varios diagnósticos.
De cada venta se debe generar un comprobante que contenga: número,
fecha, id de afiliado. A su vez cada comprobante contiene un conjunto de
medicamentos que se deben cargar teniendo en cuenta los siguientes
datos: código de medicamento, precio, descuento (directamente
relacionado al tipo de afiliado) y total.
Para poder efectivizar una venta, cada farmacia, posee su stock de cada
medicamento. Cada medicamento se identifica por código, descripción,
presentación (ej: ampollas de 5 unidades, jarabe de 100ml, inyecciones por
10 unidades) y precio, que es el mismo para todas las farmacias. También
se conoce la o las monodrogas que componen cada medicamento, el
laboratorio que lo comercializa y las acciones terapéuticas que tiene.
De cada monodroga sabemos el nombre científico y el nombre comercial.
De cada laboratorio sabemos CUIT, razón social, domicilio. Un laboratorio
provee varios medicamentos a esta cadena de farmacias.
De las acciones terapéuticas conocemos el nombre y el tiempo que tarda en
hacer efecto. Tenga en cuenta que una acción terapéutica puede repetirse
para distintos medicamentos. Por ejemplo, el medicamento Dorixina Forte
es un medicamento que cuesta $1360 y su presentación es en caja de 20
comprimidos. Tiene como monodrogas Clonixinato de lisina (nombre
científico) en 125,00 mg y Dextropropoxifeno napsilato 2 (nombre científico)
en 98,00 mg. Sus acciones terapéuticas son analgésicas y antiinflamatorias
y tardan 4 horas en hacer efecto en la persona que toma el medicamento.
El sistema deberá permitir consultar la base de datos de diferentes
alternativas para medicamentos compuestos por una monodroga,
medicamentos de un laboratorio, medicamentos con el mismo nombre y
distinta presentación, entre otras.
La cadena de farmacias cuenta con un depósito central, que realiza todas
las compras y recibe todos los medicamentos solicitados por cada farmacia
a los proveedores (laboratorios). Este deposito posee su propio stock de
medicamentos que luego redistribuye a cada farmacia que lo solicite.
La forma de ingresar medicamentos al stock del depósito central es a través
de los INGRESOS. De cada ingreso se registra: código de Ingreso, fecha de
ingreso, código de transporte (es la denominación de la empresa que
efectuó el traslado de los medicamentos), CUIT del proveedor.
Cada ingreso contiene un conjunto de medicamentos que se deben cargar
teniendo en cuenta los siguientes datos: código de medicamento, cantidad.
Se debe tener en cuenta que es necesario poder determinar en qué estado
se encuentra cada Ingreso (en confección, terminado, procesado), ya que
sólo se puede impactar en el stock del depósito un ingreso terminado.
Existe una lista de empresas de trasportes a quienes se le puede designar la
tarea de trasladar medicamentos de un depósito a otro. Los datos con que
se cuentan son: código de transporte, razón social, CUIT/CUIL, e-mail,
teléfono y domicilio. Además, se debe conocer de cada transportista a qué
localidades (sucursales) alcanza su servicio.
Cada farmacia que necesite medicamentos, lo debe requerir al depósito
central por medio de TRANFERENCIAS, las cuales deben contener: número
de solicitud, Id de farmacia, fecha de confección (es la fecha actual y no
puede modificarse).
Cada transferencia contiene un conjunto de medicamentos que se deben
cargar teniendo en cuenta los siguientes datos: código de medicamento y
cantidad. Se debe tener en cuenta que es necesario poder determinar en
qué estado se encuentra cada solicitud (En confección, terminado,
procesado), ya que sólo se puede impactar en el stock de la farmacia una
transferencia terminada.


## Diagrama Entidad-Relacion

Modelamos el siguiente modelo entidad relación para el escenario:

![DER TPI](https://raw.githubusercontent.com/deadour/BDD-TPI/master/src/Diagrama%20Entidad%20Relación.png)

Puede verse más a detalle en 🔗[draw.io](https://drive.google.com/file/d/1C_JBskfHOxcKy5gQI_Ss0E70aFCfRe8M/view?usp=sharing)


## Esquema Relacional

```sql
Ciudad(codpost: integer, nombre: string, provincia: string, farmaceutico: string):
cp: codpost

Afiliado(id_af: integer, descuento: integer, f_nac: date, NyA: string, nro_doc: integer, f_ing: date, tipo_doc: integer, direccion: integer, localidad: integer):
cp: id_af

Cronicos(id_af: integer, localidad: string, direccion: string, tipo_doc: string, f_ing: date, nro_doc: integer, descuento: integer, NyA: string, f_nac: date):
cp: id_af

Diagnostico (nombre: string, codDiag: integer):
cp: codDiag

Transportista(codT: integer, razonSocial: string, CUIT: integer, email: string, telefono: integer, domicilio: string):
cp: codT

Laboratorios (CUIT: integr, razonSocial: string, domicilio: string):
cp: CUIT

Acc_Teraperauticas (nombre: string, tiempoEfec: integer):
cp: nombre

Monodroga (nombreCientifico: string):
cp: nombreCientifico

Transferencia (num: integer, fecha: date, estado: string):
cp: num

Farmacia(diasGuardia: date, direccion: string, idFarm: int, codpost:integer):
cp: idFarm
cf: codpost→Ciudad(codpost)
cnn: codpost

Empleados(cuit: integer, f_ingreso: date, nombre: string, idFarm:int, salario: float ):
cp: cuit
cf: idFarm→Farmacia(idFarm)
cnn: idFarm

Comprobantes(num: integer, fecha: date, total: float, id_af:integer, id_cronico:integer, idFarm: int, subtotal: float ):
cp: num, idFarm
cf: id_af→ Afiliado(id_af), id_cronico→ Cronicos(id_af), idFarm → Farmacia(idFarm)

Ingresos (codl: integer, fecha: date, estado: string, cantidad: integer, CUIT: integer, codT: integer):
cp: codl
cf: CUIT → Laboratorios(CUIT), codT → Transportistas(codT)
cnn: CUIT

Medicamentos (cod: integer, CUIT: string, nombreComer: string, descripcion: string, precio: float, presentación: string, stockEnDep:integer):
cp: cod
cf: CUIT→ Laboratorios(CUIT)

Transfiere(num: integer, cod:integer, cantidad:integer):
cp:num, cod
cf:num→Transferencia(num), cod → Medicamentos (Cod) 
cnn: cantidad

Incluye1(cod:integer, num: integer, cantidad: integer):
cp:num, cod
cf: num→ Comprobante(num), cod → Medicamentos(cod)  

posee1 (cod: integer, idFarm: integer, Cantidad: integer):
cp: (cod, idFarm)
cf: cod → Medicamentos(cod), idFarm→ Farmacia(idFarm)

posee2 (cod: integer, nombre: string):
cp: (cod, nombre)
cf: cod → Medicamentos(cod), nombre → Acc_Teraperauticas(nombre)

compuesto(cod: integer, nombreCientifico):
cp: (cod, nombreCientifico)
cf: cod → Medicamentos(cod), nombreCientifico → Monodroga(nombreCientifico)

ingresan(codI: integer, cod: integer, cantidad: integer):
cp:(codI, cod)
cf: codI → Ingresos(codI), cod → Medicamentos(cod)

asociado(codDiag: integer, id_af: integer, fechaDiag: date):
cp: (codDiag, id_af)
cf: codDiag → Diagnostico(codDiag), id_af → Cronicos(id_af)

TransportaA(codT: integer, codpost: integer):
cp: (codT, codpost)
cf: codpost → Ciudad(codpost), codT → Transportista(codT)


Solicita(num: integer, idFarm: integer):
cp: (num, idFarm)
cf: num →Transferencia(num), idFarm → Farmacia(idFarm)

```
## Esquema Fisico

```sql
CREATE TABLE Ciudad (
  codpost INTEGER,
  nombre VARCHAR(50),
  provincia VARCHAR(50),
  farmaceutico VARCHAR(50),
  PRIMARY KEY (codpost)
);

CREATE TABLE Afiliado (
  id_af INTEGER,
  descuento INTEGER,
  f_nac DATE,
  NyA VARCHAR(50),
  nro_doc INTEGER,
  f_ing DATE,
  tipo_doc VARCHAR(3),
  direccion VARCHAR(80),
  localidad VARCHAR(50),
  PRIMARY KEY (id_af)
);




CREATE TABLE Cronicos (
  id_cr INTEGER,
  descuento INTEGER,
  PRIMARY KEY (id_cr)
);

CREATE TABLE Diagnostico (
  codDiag INTEGER,
  nombre VARCHAR(80),
  PRIMARY KEY(codDiag)
);

CREATE TABLE Transportista (
  codT INTEGER,
  razonSocial VARCHAR(80),
  CUIT VARCHAR(11),
  email VARCHAR(60),
  telefono INTEGER,
  domicilio VARCHAR(80),
  PRIMARY KEY(codT)
);

CREATE TABLE Laboratorios (
  CUIT VARCHAR(11),
  razonSocial VARCHAR(80),
  domicilio VARCHAR(80),
  PRIMARY KEY(CUIT)
);

CREATE TABLE acc_terapeuticas (
  nombre VARCHAR(50),
  tiempoEfec INTEGER,
  PRIMARY KEY(nombre)
);

CREATE TABLE Monodroga (
  nombreCientifico VARCHAR(50),
  PRIMARY KEY(nombreCientifico)
);

CREATE TABLE Transferencia (
  num INTEGER,
  fecha DATE,
  estado VARCHAR(10),
  PRIMARY KEY (num)
);

CREATE TABLE Farmacia (
  idFarm INTEGER,
  codpost INTEGER NOT NULL,
  diasGuardia VARCHAR(10),
  direccion VARCHAR(80),
  PRIMARY KEY(idFarm),
  FOREIGN KEY (codpost) REFERENCES Ciudad(codpost)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION  
);

CREATE TABLE Empleados (
  cuit VARCHAR(11),
  idFarm INTEGER NOT NULL,
  nombre VARCHAR(50),
  f_ingreso DATE,
  salario: FLOAT,
  PRIMARY KEY(cuit),
  FOREIGN KEY (idFarm) REFERENCES Farmacia(idFarm)
  ON DELETE NO ACTION  
  ON UPDATE NO ACTION
);

CREATE TABLE Comprobantes (
  num INTEGER,
  id_af INTEGER,
  id_cr INTEGER,
  fecha DATE,
  total FLOAT,
  idFarm INTEGER NOT NULL,
  subtotal FLOAT,
  PRIMARY KEY (num),
  FOREIGN KEY (id_af) REFERENCES Afiliado(id_af)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  FOREIGN KEY (id_cr) REFERENCES Cronicos(id_cr)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  FOREIGN KEY (idFarm) REFERENCES Farmacia(idFarm)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
);

CREATE TABLE Ingresos (
  codI INTEGER,
  CUIT VARCHAR(11) NOT NULL,
  codT INTEGER,
  fecha DATE,
  estado VARCHAR(10),
  PRIMARY KEY (codI),
  FOREIGN KEY (CUIT) REFERENCES Laboratorios(CUIT)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (codT) REFERENCES Transportista(codT)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE Medicamentos (
  cod INTEGER,
  CUIT VARCHAR(11),
  nombreComer VARCHAR(80),
  descripcion VARCHAR(100),
  precio FLOAT,
  presentación VARCHAR(100),
  stockEnDep INTEGER,
  PRIMARY KEY (cod),
  FOREIGN KEY (CUIT) REFERENCES Laboratorios(CUIT)
  ON DELETE NO ACTION  
  ON UPDATE CASCADE
);

CREATE TABLE Transfiere (
  num INTEGER,
  cod INTEGER,
  cantidad INTEGER,
  PRIMARY KEY (num, cod),
  FOREIGN KEY (num) REFERENCES Transferencia(num)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION  
);

CREATE TABLE Incluye1 (
  cod INTEGER,
  num INTEGER,
  cantidad INTEGER,
  PRIMARY KEY (num, cod),
  FOREIGN KEY (num) REFERENCES Comprobantes(num)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE posee1 (
  cod INTEGER,
  idFarm INTEGER,
  cantidad INTEGER,
  PRIMARY KEY (cod, idFarm),
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (idFarm) REFERENCES Farmacia(idFarm)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE posee2 (
  cod INTEGER,
  nombre VARCHAR(50),
  PRIMARY KEY (cod, nombre),
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (nombre) REFERENCES acc_terapeuticas(nombre)
  ON DELETE NO ACTION
  ON UPDATE CASCADE
);

CREATE TABLE compuesto (
  cod INTEGER,
  nombreCientifico VARCHAR(50),
  PRIMARY KEY (cod, nombreCientifico),
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (nombreCientifico) REFERENCES Monodroga(nombreCientifico)
  ON DELETE NO ACTION
  ON UPDATE CASCADE
);

CREATE TABLE ingresan (
  codI INTEGER,
  cod INTEGER,
  cantidad INTEGER,
  PRIMARY KEY (codI, cod),
  FOREIGN KEY (codI) REFERENCES Ingresos(codI)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  FOREIGN KEY (cod) REFERENCES Medicamentos(cod)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE asociado (
  codDiag INTEGER,
  id_af INTEGER,
  fechaDiag DATE,
  PRIMARY KEY (codDiag, id_af),
  FOREIGN KEY (codDiag) REFERENCES Diagnostico(codDiag)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (id_af) REFERENCES Cronicos(id_cr)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE TransportaA (
  codT INTEGER,
  codpost INTEGER,
  PRIMARY KEY (codT, codpost),
  FOREIGN KEY (codpost) REFERENCES Ciudad(codpost)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (codT) REFERENCES Transportista(codT)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE Solicita (
  num INTEGER,
  idFarm INTEGER,
  PRIMARY KEY (num, idFarm),
  FOREIGN KEY (num) REFERENCES Transferencia(num)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (idFarm) REFERENCES Farmacia(idFarm)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);
```
## Consignas 

### Base de Datos

- Cargar datos en las tablas para que todas tengan al menos una fila. Al menos dos tablas deben tener más de 10 filas.

- Utilizando alguna herramienta para generación de datos, importar masivamente filas a las tablas indicadas. Tener en cuenta que se intenta trabajar con volúmenes importantes similares a un sistema real, por lo que deberá asegurarse que al menos una tabla cuente con más de 100.000 registros.



### Consultas SQL 

#### INSERCIÓN, MODIFICACIÓN, BORRADO DE DATOS 
Una vez cargadas las tablas con datos, se realizan las siguientes consultas:
- seis consultas distintas para inserción de datos (distintos a los ya cargados en forma masiva), 
- seis consultas distintas para modificación de datos, 
- seis consultas sql distintas para borrado de filas. 
 Las consultas pueden ser ejecutadas sobre una misma tabla o distintas, pero todas deben cumplir condiciones medianamente complejas para ejecutarse (por ej. buscar valores en una tabla relacionada mediante una subconsulta). 


#### CONSULTAS SELECT 
- Mostrar el ranking de los diez medicamentos con mayor cantidad de ventas en todas las farmacias de la cadena. 
- Listar los códigos y nombres de los medicamentos que fueron vendidos en todas las farmacias 
- Mostrar cantidad de afiliados crónicos y eventuales que compraron medicamentos en la farmacia de Resistencia en la última semana 
- Informar el top de las 5 farmacias que solicitaron mayores cantidades de amoxidal duo en los últimos 15 días. 
- Listado de farmacias con la menor cantidad de transferencias pendientes.
- Identificar para una farmacia determinada cuales son los medicamentos sin stock en la misma pero con stock en deposito central 
- ¿Cuál es la empresa de transporte con mayor actividad en el último mes? 
- Informar el monto total de ventas por farmacia en el último trimestre ordenado en forma descendente.



## Desarrollo

- **🔗[Diagrama Entidad-Relación](https://github.com/deadour/BDD-TPI/blob/main/src/Diagrama%20Entidad%20Relaci%C3%B3n.png)**
- **🔗[Documentación](https://github.com/deadour/BDD-TPI/blob/main/docs/%5BG1%5D%20TPI%20-%20Escenario%20Farmacia.pdf)**
- **🔗[Scripts SQL](https://github.com/deadour/BDD-TPI/blob/main/src/scripts.sql)**

