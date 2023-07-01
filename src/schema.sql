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