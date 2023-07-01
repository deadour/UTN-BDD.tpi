-- Estructura de tabla para la tabla `acc_terapeuticas`
--

CREATE TABLE `acc_terapeuticas` (
  `nombre` varchar(50) NOT NULL,
  `tiempoEfec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acc_terapeuticas`
--

INSERT INTO `acc_terapeuticas` (`nombre`, `tiempoEfec`) VALUES
('Analgésico', 15),
('Antiácido', 10),
('Antialérgico', 10),
('Antibacteriano', 60),
('Antibiótico', 60),
('Anticoagulante', 60),
('Antidiabético', 45),
('Antidiarreico', 30),
('Antiemético', 15),
('Antiepiléptico', 30),
('Antiespasmódico', 20),
('Antihelmíntico', 120),
('Antihipertensivo', 60),
('Antihistamínico', 30),
('Antiinflamatorio', 30),
('Antipirético', 20),
('Antipsicótico', 45),
('Antirretroviral', 120),
('Antirreumático', 60),
('Antitrombótico', 60),
('Antiulceroso', 30),
('Antiviral', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `id_af` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `f_nac` date DEFAULT NULL,
  `NyA` varchar(50) DEFAULT NULL,
  `nro_doc` int(11) DEFAULT NULL,
  `f_ing` date DEFAULT NULL,
  `tipo_doc` varchar(3) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `afiliado`
--

INSERT INTO `afiliado` (`id_af`, `descuento`, `f_nac`, `NyA`, `nro_doc`, `f_ing`, `tipo_doc`, `direccion`, `localidad`) VALUES
(1, 20, '1973-01-29', 'Gala Piña Bárcena', 29884055, '2022-06-06', 'DNI', 'Callejón Amador Ferrando 13\nZaragoza, 11330', 'Guadalajara'),
(2, 20, '1979-08-10', 'Elodia Zapata Gilabert', 62639612, '2021-12-04', 'DNI', 'Paseo de Benito Soria 89 Apt. 76 \nCastellón, 05671', 'Guadalajara'),
(3, 20, '1994-12-25', 'Eliana Aramburu-Company', 83387070, '2019-06-07', 'LE', 'Pasadizo Leocadio Somoza 74 Apt. 55 \nBadajoz, 01331', 'Guipúzcoa'),
(4, 20, '1945-08-31', 'Eusebio Prieto Clavero', 37991942, '2021-05-16', 'DNI', 'Paseo de Gustavo Carnero 871 Apt. 18 \nMurcia, 05387', 'Murcia'),
(5, 20, '1955-03-09', 'Belen Prado Solís', 12391636, '2022-01-05', 'DNI', 'Urbanización de Fabricio Lillo 7\nBarcelona, 27820', 'Vizcaya'),
(6, 20, '2004-05-08', 'Isabela Cámara-Vilar', 29934984, '2022-11-26', 'DNI', 'Pasadizo Enrique Muñoz 8\nAlbacete, 39258', 'Ourense'),
(7, 20, '1966-12-27', 'Bernardita Fonseca Raya', 82050478, '2021-08-28', 'DNI', 'Glorieta de Nico Puga 64\nValladolid, 33967', 'Murcia'),
(8, 20, '1943-12-29', 'Graciano Lopez', 13291772, '2019-10-03', 'DNI', 'Vial Armando Coloma 8\nMálaga, 43082', 'Resistencia'),
(9, 20, '1980-08-08', 'Juan José de Salmerón', 75563370, '2020-10-16', 'DNI', 'Cuesta Tamara Cueto 95 Piso 2 \nZaragoza, 08553', 'Badajoz'),
(10, 20, '1982-10-14', 'Paola Comas Sanmiguel', 64213270, '2021-11-01', 'DNI', 'Callejón de Leticia Martí 72 Puerta 6 \nLeón, 11261', 'Barcelona'),
(11, 20, '1968-06-08', 'Alejandra Cuadrado Salamanca', 33845641, '2019-11-24', 'DNI', 'Paseo de Lisandro Porras 64 Apt. 34 \nMurcia, 14892', 'Albacete'),
(12, 20, '1991-10-17', 'Azahara Portillo Casal', 39784172, '2022-09-26', 'DNI', 'Cañada Julieta Briones 36 Apt. 20 \nJaén, 49545', 'Ourense'),
(13, 20, '1987-07-03', 'Flavio Sotelo Prada', 70134406, '2019-07-28', 'DNI', 'Plaza Eugenio Barrio 31\nZamora, 10866', 'Badajoz'),
(14, 20, '1959-01-08', 'Laura Puga Arnal', 67575419, '2021-03-22', 'DNI', 'Avenida de Adán Donoso 71 Piso 1 \nLleida, 15535', 'Lugo'),
(15, 20, '2002-07-23', 'Severino Santamaría Marí', 43046092, '2018-10-13', 'DNI', 'Cañada Matilde Plaza 1\nMurcia, 36321', 'Albacete'),
(16, 20, '1992-02-17', 'Candela Berrocal Ariño', 83364874, '2022-10-12', 'DNI', 'Rambla de Marcos Vidal 18\nLas Palmas, 11158', 'Resistencia'),
(17, 20, '1961-01-30', 'Mireia del Nogués', 51740399, '2021-11-21', 'DNI', 'Acceso de Edmundo Gallo 506\nLa Coruña, 25266', 'Murcia'),
(18, 20, '1959-03-13', 'David del Chamorro', 92560141, '2020-08-18', 'DNI', 'Via de José Manuel Albero 781 Puerta 1 \nHuesca, 47830', 'La Coruña'),
(19, 20, '1974-10-18', 'Purificación Soler Rebollo', 12295128, '2021-06-02', 'DNI', 'Camino Horacio Guerra 8\nCastellón, 15902', 'Badajoz'),
(20, 20, '1944-02-25', 'Leoncio Valero Falcón', 82681254, '2020-12-30', 'DNI', 'Vial Íñigo Riba 8 Piso 9 \nSoria, 39297', 'Badajoz'),
(21, 20, '2000-04-03', 'Pilar Saavedra Rueda', 80460818, '2021-09-21', 'DNI', 'Rambla de Anna Bayo 914\nMelilla, 08782', 'Guadalajara'),
(22, 20, '1973-10-30', 'Oriana Vilaplana Sans', 30294195, '2018-10-10', 'DNI', 'Alameda Lorena Cabañas 88 Puerta 2 \nTarragona, 12923', 'Ourense'),
(23, 20, '1978-03-28', 'Paco Pedrero Villalobos', 70480209, '2020-09-28', 'LE', 'Rambla de Tania Soto 93\nZamora, 03550', 'Barcelona'),
(24, 20, '1942-07-03', 'René Pereira-Lucena', 79197046, '2018-11-28', 'DNI', 'Avenida Melchor Padilla 383 Piso 1 \nLugo, 48688', 'Barcelona'),
(25, 20, '1947-04-23', 'Griselda Taboada Seguí', 79046336, '2018-12-16', 'DNI', 'Plaza de Sol Carrillo 5 Puerta 5 \nValencia, 30716', 'Murcia'),
(26, 20, '1970-01-23', 'Isaura Rivas Ropero', 23180440, '2022-09-04', 'DNI', 'Calle Haroldo Ledesma 58\nÁvila, 05899', 'Sevilla'),
(27, 20, '1944-12-25', 'Nélida Ballesteros Báez', 75487721, '2022-05-29', 'LE', 'Glorieta de Mireia Bayona 3 Puerta 8 \nAsturias, 19702', 'Resistencia'),
(28, 20, '1962-02-22', 'Abel Arsenio Giner Fuente', 80861169, '2023-06-23', 'DNI', 'Alameda de Cándida Calderón 21\nTeruel, 49545', 'Guadalajara'),
(29, 20, '1987-04-27', 'Macarena Santana Ledesma', 17387711, '2021-04-08', 'LE', 'Calle Eleuterio Martínez 58 Puerta 7 \nLas Palmas, 16565', 'Sevilla'),
(30, 20, '1985-03-01', 'Máximo Alvarado Duque', 91194148, '2023-04-11', 'DNI', 'Avenida de Benita Bello 19\nTeruel, 12681', 'Sevilla'),
(31, 20, '1970-05-29', 'Maxi del Manso', 19936459, '2022-12-20', 'DNI', 'C. Juan Luis Jiménez 989\nJaén, 25986', 'Lugo'),
(32, 20, '1950-06-10', 'Angelino del Rosell', 85447976, '2021-01-04', 'DNI', 'Rambla de Mohamed Gomis 43 Piso 7 \nToledo, 51821', 'Albacete'),
(33, 20, '1957-05-01', 'Isa Castelló Fabra', 92786931, '2022-10-27', 'DNI', 'Camino María Pilar Alarcón 20\nCantabria, 23448', 'Sevilla'),
(34, 20, '2002-09-12', 'Alba de Arribas', 73915428, '2018-10-07', 'DNI', 'Avenida de Verónica Molina 40\nValencia, 06121', 'Ourense'),
(35, 20, '1990-03-26', 'Irma Pozo Barceló', 97387895, '2022-03-07', 'DNI', 'C. de Hermenegildo Benitez 843\nCórdoba, 33351', 'Lugo'),
(36, 20, '1999-09-03', 'Edu Galán Ojeda', 36751673, '2020-06-18', 'DNI', 'Avenida Yésica Ugarte 94\nHuesca, 32034', 'Resistencia'),
(37, 20, '1961-08-31', 'Ramón Daza-Hervás', 97939874, '2019-06-05', 'DNI', 'Calle de María Ángeles Asensio 84\nMadrid, 12263', 'Sevilla'),
(38, 20, '1978-10-27', 'Prudencio Grande-Sevillano', 29790188, '2022-12-18', 'DNI', 'Pasadizo de Rocío Martín 68 Puerta 4 \nAsturias, 33513', 'Sevilla'),
(39, 20, '1952-06-03', 'Telmo Almagro', 18394556, '2018-09-22', 'DNI', 'C. Epifanio Arias 61 Apt. 28 \nBarcelona, 20727', 'Melilla'),
(40, 20, '1985-06-04', 'Amor Bermejo-Ferrán', 29769613, '2022-04-21', 'DNI', 'Pasaje de Celestino Arenas 95 Apt. 61 \nGuadalajara, 15004', 'Melilla'),
(41, 20, '2002-03-08', 'Noé de Cáceres', 43154233, '2021-03-01', 'DNI', 'Glorieta de Gervasio Esteve 168 Apt. 33 \nMurcia, 36004', 'Albacete'),
(42, 20, '1984-11-29', 'Ariadna Pons Olivé', 46344669, '2019-12-16', 'DNI', 'Pasadizo de Desiderio Cañellas 20\nCantabria, 35542', 'Resistencia'),
(43, 20, '1965-04-19', 'Paola Bru Valdés', 45633563, '2021-02-14', 'DNI', 'Alameda de Ariel Rosado 4\nCáceres, 11696', 'La Coruña'),
(44, 20, '1945-08-26', 'Mónica Ledesma Fabregat', 10444998, '2022-02-15', 'DE', 'C. Anunciación Bernat 254\nGuipúzcoa, 32439', 'Lugo'),
(45, 20, '1971-12-13', 'Juliana Luís', 49496339, '2020-07-03', 'DNI', 'Ronda Samu Prado 40\nNavarra, 50096', 'Ourense'),
(46, 20, '1976-10-05', 'Vito Arias Patiño', 99047327, '2021-07-04', 'DNI', 'Ronda Reyes Benavent 30\nValladolid, 29322', 'Albacete'),
(47, 20, '1974-03-17', 'Hernando Ortega-Teruel', 92367504, '2021-12-29', 'DNI', 'Via Aurora Madrigal 7 Puerta 2 \nSalamanca, 33399', 'Murcia'),
(48, 20, '1955-09-08', 'Rafa Gisbert', 27020515, '2020-04-10', 'DNI', 'Acceso de Agustina Feijoo 43\nLleida, 27135', 'Lugo'),
(49, 20, '1989-06-04', 'Camila Vizcaíno Armengol', 34455973, '2022-11-03', 'DNI', 'Pasaje de Evangelina Garmendia 701\nCeuta, 21437', 'Albacete'),
(50, 20, '2003-09-01', 'Timoteo del Mateos', 78961425, '2022-02-07', 'DNI', 'Rambla Rocío Maldonado 90\nAlbacete, 06550', 'Guadalajara'),

-- Estructura de tabla para la tabla `asociado`
--

CREATE TABLE `asociado` (
  `codDiag` int(11) NOT NULL,
  `id_af` int(11) NOT NULL,
  `fechaDiag` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asociado`
--

INSERT INTO `asociado` (`codDiag`, `id_af`, `fechaDiag`) VALUES
(1, 18, '2012-11-26'),
(1, 74, '2008-05-16'),
(1, 107, '2006-11-24'),
(1, 122, '2007-06-28'),
(1, 141, '2001-01-26'),
(1, 229, '2019-02-20'),
(1, 285, '2007-11-09'),
(1, 295, '2013-04-08'),
(1, 436, '2021-03-11'),
(1, 579, '2013-03-30'),
(1, 645, '2020-05-18'),
(1, 648, '2006-08-14'),
(1, 690, '1997-01-02'),
(1, 828, '2017-05-12'),
(1, 1050, '2010-11-15'),
(1, 1126, '2015-01-09'),
(1, 1430, '2002-09-29'),
(1, 1497, '2000-10-05'),
(1, 1511, '2004-12-12'),
(1, 1599, '2018-07-29'),
(1, 1644, '2012-08-13'),
(1, 1751, '2015-10-04'),
(1, 2101, '2018-02-02'),
(1, 2291, '2011-07-20'),
(1, 2816, '1997-08-30'),
(1, 3021, '2014-11-19'),
(1, 3136, '2022-05-20'),
(1, 3412, '2018-02-19'),
(1, 3686, '2010-03-27'),
(1, 3871, '2015-08-15'),
(1, 3953, '2005-12-11'),
(1, 4108, '2010-08-17'),
(1, 4164, '2000-01-04'),
(1, 4202, '2018-08-02'),
(1, 4305, '2002-10-08'),
(1, 4512, '2018-05-10'),
(1, 4775, '2019-04-23'),
(1, 4948, '2008-05-30'),
(1, 4987, '2018-05-11'),
(1, 4997, '2017-12-22'),
(1, 5101, '2006-02-25'),
(1, 5104, '2018-05-20'),
(1, 5226, '2011-06-24'),
(1, 5239, '2020-09-05'),
(1, 5519, '2008-10-02'),
(1, 5580, '1998-03-15'),
(1, 5729, '2000-03-13'),
(1, 5742, '2022-04-05'),
(1, 6229, '2002-09-20'),
(1, 6399, '2015-06-10'),
(1, 6473, '2016-08-31'),
(1, 7408, '2008-03-28'),
(1, 7475, '2003-12-08'),
(1, 7548, '2005-01-21'),
(1, 7561, '2020-03-30'),
(1, 7588, '2016-11-29'),
(1, 7601, '2014-01-25'),
(1, 7695, '2018-02-19'),
(1, 7784, '2010-10-06'),
(1, 7844, '2014-07-06'),
(1, 7952, '1999-06-26'),
(1, 8061, '2015-07-24'),
(1, 8105, '1996-06-03'),
(1, 8444, '2001-04-02'),
(1, 8460, '2009-09-06'),
(1, 8622, '2005-12-22'),
(1, 8747, '2021-10-19'),
(1, 8880, '2001-09-15'),

-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `num` int(11) NOT NULL,
  `id_af` int(11) DEFAULT NULL,
  `id_cr` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `idFarm` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`num`, `id_af`, `id_cr`, `fecha`, `total`, `idFarm`, `subtotal`) VALUES
(1, 11590, NULL, '2015-03-05', 5039.15, 8, 6298.94),
(2, NULL, 10389, '2022-09-17', 5898.04, 25, 19660.2),
(3, NULL, 1686, '2022-09-29', 769.053, 44, 2563.51),
(4, NULL, 4505, '2021-10-06', 6307.29, 6, 21024.3),
(5, 5461, NULL, '2023-01-01', 6700.46, 35, 8375.58),
(6, 10433, NULL, '2023-06-07', 1640.08, 46, 2050.1),
(7, 2713, NULL, '2022-05-31', 8397.17, 28, 10496.5),
(8, NULL, 1937, '2022-03-05', 4637.13, 26, 15457.1),
(9, NULL, 193, '2022-10-28', 432.696, 2, 1442.32),
(10, 5078, NULL, '2023-05-05', 22.56, 15, 28.2),
(11, 7126, NULL, '2023-01-04', 7948.72, 9, 9935.9),
(12, NULL, 1213, '2021-07-26', 4842.89, 23, 16143),
(13, 5489, NULL, '2022-11-19', 14626.8, 10, 18283.5),
(14, NULL, 2558, '2021-05-30', 5202.62, 1, 17342.1),
(15, NULL, 3576, '2021-05-16', 1354.69, 48, 4515.64),
(16, 5956, NULL, '2022-04-19', 14153.2, 24, 17691.5),
(17, NULL, 8569, '2022-09-23', 7439.07, 37, 24796.9),
(18, 8631, NULL, '2022-05-13', 31144.9, 29, 38931.1),
(19, 10184, NULL, '2022-06-01', 10676.6, 6, 13345.8),
(20, NULL, 1565, '2023-03-05', 4220.87, 41, 14069.6),
(21, 8222, NULL, '2022-09-10', 2597.15, 39, 3246.44),
(22, 10375, NULL, '2021-11-30', 4510.44, 44, 5638.05),
(23, 10243, NULL, '2023-04-10', 10818.7, 47, 13523.4),
(24, NULL, 105, '2022-07-10', 11314.8, 24, 37715.9),
(25, NULL, 8832, '2023-04-19', 9039.62, 32, 30132.1),
(26, NULL, 954, '2022-04-04', 4307.32, 2, 14357.7),
(27, 11384, NULL, '2023-04-22', 7240.75, 38, 9050.94),
(28, NULL, 7505, '2022-01-25', 2825.64, 9, 9418.81),
(29, 10629, NULL, '2021-05-22', 2257.58, 24, 2821.98),
(30, NULL, 4423, '2022-10-14', 7887.08, 11, 26290.2),
(31, 8245, NULL, '2023-02-13', 1615.16, 23, 2018.95),
(32, 148, NULL, '2021-10-30', 6518.38, 25, 8147.97),
(33, 5940, NULL, '2023-02-01', 3863.04, 13, 4828.8),
(34, 3055, NULL, '2021-06-30', 15046.7, 35, 18808.4),
(35, 781, NULL, '2023-05-02', 5236.38, 15, 6545.47),
(36, NULL, 7300, '2022-05-10', 4903.17, 48, 16343.9),
(37, NULL, 300, '2021-08-12', 5750.57, 4, 19168.6),
(38, NULL, 8279, '2021-09-21', 2391.86, 14, 7972.86),
(39, 613, NULL, '2022-05-20', 25171.1, 24, 31463.9),
(40, NULL, 9657, '2021-11-04', 3690.51, 7, 12301.7),
(41, 7629, NULL, '2021-09-18', 11807.9, 2, 14759.9),
(42, 11063, NULL, '2022-03-28', 16312, 9, 20390),
(43, 8513, NULL, '2021-12-24', 5340.96, 21, 6676.2),
(44, 4866, NULL, '2022-07-06', 17019.3, 20, 21274.1),
(45, 1398, NULL, '2021-07-06', 9101.46, 28, 11376.8),
(46, NULL, 6588, '2022-08-11', 1709.56, 12, 5698.55),
(47, 4454, NULL, '2021-12-09', 10562.7, 27, 13203.3),
(48, NULL, 7678, '2022-06-28', 5965.05, 28, 19883.5),
(49, 10135, NULL, '2022-06-13', 6550.02, 35, 8187.52),
(50, 5414, NULL, '2023-04-03', 13334, 43, 16667.4),
(51, NULL, 11231, '2022-09-26', 1915.82, 11, 6386.07),
(52, 7988, NULL, '2022-10-02', 11435.8, 3, 14294.8),
(53, 9325, NULL, '2023-04-17', 24178.1, 41, 30222.6),
(54, NULL, 8271, '2021-07-11', 8682.61, 8, 28942),
(55, 5580, NULL, '2021-11-01', 15368.5, 30, 19210.6),
(56, 7283, NULL, '2023-02-25', 8817.25, 44, 11021.6),

-- Estructura de tabla para la tabla `compuesto`
--

CREATE TABLE `compuesto` (
  `cod` int(11) NOT NULL,
  `nombreCientifico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compuesto`
--

INSERT INTO `compuesto` (`cod`, `nombreCientifico`) VALUES
(1, 'Naproxeno'),
(2, 'Ketoprofeno'),
(3, 'Insulina'),
(4, 'Ibuprofeno'),
(5, 'Liothyronine'),
(6, 'Escitalopram'),
(7, 'Aspirina'),
(8, 'Clonazepam'),
(9, 'Levothyroxine'),
(10, 'Alprazolam'),
(11, 'Lisinopril'),
(12, 'Naproxeno'),
(13, 'Atenolol'),
(14, 'Levothyroxine'),
(15, 'Lisinopril'),
(16, 'Estradiol'),
(17, 'Venlafaxina'),
(18, 'Ibuprofeno'),
(19, 'Testosterona'),
(20, 'Vildagliptina'),
(21, 'Alprazolam'),
(22, 'Escitalopram'),
(22, 'Tramadol'),
(23, 'Morfina'),
(24, 'Dipirona'),
(25, 'Sitagliptina'),
(26, 'Risperidona'),
(27, 'Glimepirida'),
(28, 'Fluoxetina'),
(29, 'Ibuprofeno'),
(30, 'Gabapentina'),
(31, 'Diclofenaco'),
(32, 'Dipirona'),
(33, 'Paracetamol'),
(34, 'Celecoxib'),
(34, 'Escitalopram'),
(34, 'Fluoxetina'),
(34, 'Indometacina'),
(35, 'Clonazepam'),
(35, 'Morfina'),
(36, 'Ketoprofeno'),
(37, 'Alprazolam'),
(37, 'Celecoxib'),
(38, 'Ibuprofeno'),
(38, 'Olanzapina'),
(39, 'Paracetamol'),
(40, 'Ketoprofeno'),
(41, 'Naproxeno'),
(42, 'Celecoxib'),
(43, 'Ketoprofeno'),
(44, 'Glibenclamida'),
(45, 'Clonazepam'),
(46, 'Metoprolol'),
(46, 'Pregabalina'),
(46, 'Rosiglitazona'),
(47, 'Ibuprofeno'),
(48, 'Fluoxetina'),
(49, 'Fluoxetina'),
(49, 'Indometacina'),
(50, 'Glimepirida'),
(51, 'Aspirina'),
(51, 'Pioglitazona'),
(52, 'Atenolol'),
(53, 'Clonazepam'),
(54, 'Tramadol'),
(55, 'Sitagliptina'),
(56, 'Metoprolol'),
(57, 'Meloxicam'),
(58, 'Dipirona'),
(59, 'Tramadol'),
(60, 'Ibuprofeno'),
(60, 'Lisinopril'),
(61, 'Clonazepam'),
(61, 'Indometacina'),
(62, 'Risperidona'),
(63, 'Progesterona'),
(64, 'Ibuprofeno'),
(65, 'Fluoxetina'),
(66, 'Vildagliptina'),
(67, 'Metformina'),
(68, 'Meloxicam'),
(69, 'Morfina'),
(69, 'Venlafaxina'),
(70, 'Sitagliptina'),
(71, 'Paracetamol'),
(72, 'Insulina'),
(72, 'Liothyronine'),
(73, 'Glibenclamida'),
(73, 'Lisinopril'),
(74, 'Ketoprofeno'),
(74, 'Oxicodona'),
(75, 'Pregabalina'),
(76, 'Lisinopril'),
(77, 'Rosiglitazona'),
(78, 'Clonazepam'),
(79, 'Pioglitazona'),
(80, 'Oxicodona'),
(81, 'Naproxeno'),
(82, 'Levothyroxine'),
(83, 'Risperidona'),
(84, 'Metoprolol'),
(85, 'Metoprolol'),
(86, 'Risperidona'),
(87, 'Morfina'),
(88, 'Losartan'),
(89, 'Indometacina'),
(90, 'Clonazepam'),
(91, 'Glibenclamida'),
(92, 'Oxicodona'),
(93, 'Ketoprofeno'),
(94, 'Insulina'),
(95, 'Morfina'),
(96, 'Diclofenaco'),
(96, 'Liothyronine'),
(96, 'Testosterona'),
(97, 'Oxicodona'),
(98, 'Escitalopram'),
(98, 'Meloxicam'),
(99, 'Fluoxetina'),
(100, 'Ketoprofeno'),
(100, 'Losartan'),
(101, 'Atenolol'),
(101, 'Testosterona'),
(102, 'Meloxicam'),
(103, 'Celecoxib'),
(103, 'Ketoprofeno'),
(103, 'Paracetamol'),
(104, 'Vildagliptina'),
(105, 'Codeína'),
(106, 'Glimepirida'),
(107, 'Metoprolol'),
(108, 'Clonazepam'),
(109, 'Dipirona'),
(110, 'Metoprolol'),
(110, 'Testosterona'),
(111, 'Risperidona'),
(112, 'Diclofenaco'),
(113, 'Tramadol'),
(114, 'Risperidona'),
(115, 'Atenolol'),
(116, 'Rosiglitazona'),
(117, 'Aspirina'),
(117, 'Olanzapina'),
(118, 'Ibuprofeno'),
(118, 'Rosiglitazona'),
(119, 'Metformina'),
(120, 'Aspirina'),
(120, 'Rosiglitazona'),
(121, 'Lorazepam'),
(122, 'Fluoxetina'),

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `codpost` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `farmaceutico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`codpost`, `nombre`, `provincia`, `farmaceutico`) VALUES
(1000, 'Resistencia', 'Chaco', 'Abigaíl Barranco Jaén'),
(1500, 'Lugo', 'Cáceres', 'Armando Porras Salazar'),
(2000, 'Albacete', 'Pontevedra', 'Alfredo Montoya Zorrilla'),
(2500, 'Murcia', 'Ceuta', 'Carlota Mamen Ríos Expósito'),
(3000, 'Guadalajara', 'Málaga', 'Nydia Elorza Cabezas'),
(3500, 'Guipúzcoa', 'Vizcaya', 'Piedad Acero Serna'),
(4000, 'Ourense', 'Soria', 'Agapito Cazorla Hernando'),
(4500, 'Sevilla', 'Baleares', 'Benigna de Camacho'),
(5000, 'Barcelona', 'La Rioja', 'Cornelio Gabaldón Barragán'),
(5500, 'Guadalajara', 'Toledo', 'Lilia del Serra'),
(6000, 'Melilla', 'Soria', 'Edgardo Rovira Casanovas'),
(6500, 'Cantabria', 'Salamanca', 'Jennifer Acedo Múñiz'),
(7000, 'Badajoz', 'Barcelona', 'Hortensia Chacón Milla'),
(7500, 'Vizcaya', 'Cáceres', 'Ángela Rebollo Garzón'),
(8000, 'La Coruña', 'Cuenca', 'Lázaro del Mayo');



-- Estructura de tabla para la tabla `cronicos`
--

CREATE TABLE `cronicos` (
  `id_cr` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cronicos`
--

INSERT INTO `cronicos` (`id_cr`, `descuento`) VALUES
(3, 70),
(10, 70),
(11, 70),
(12, 70),
(16, 70),
(17, 70),
(18, 70),
(19, 70),
(20, 70),
(21, 70),
(22, 70),
(25, 70),
(26, 70),
(33, 70),
(38, 70),
(40, 70),
(42, 70),
(43, 70),
(47, 70),
(49, 70),
(52, 70),
(54, 70),
(56, 70),
(60, 70),
(66, 70),
(71, 70),
(74, 70),
(77, 70),
(78, 70),
(80, 70),
(81, 70),
(86, 70),
(87, 70),
(89, 70),
(90, 70),
(92, 70),
(94, 70),
(96, 70),
(97, 70),
(99, 70),
(102, 70),
(104, 70),
(105, 70),
(107, 70),
(111, 70),
(112, 70),
(113, 70),
(115, 70),
(117, 70),
(119, 70),
(120, 70),
(122, 70),
(123, 70),
(127, 70),
(132, 70),
(139, 70),
(140, 70),
(141, 70),
(146, 70),
(148, 70),
(152, 70),
(154, 70),
(157, 70),
(159, 70),
(161, 70),
(163, 70),
(165, 70),
(170, 70),
(172, 70),
(173, 70),
(176, 70),
(179, 70),
(180, 70),
(181, 70),
(187, 70),
(192, 70),
(193, 70),
(194, 70),
(196, 70),
(199, 70),
(203, 70),
(204, 70),
(205, 70),
(208, 70),
(209, 70),
(211, 70),
(212, 70),
(213, 70),
(216, 70),
(217, 70),
(218, 70),
(219, 70),
(222, 70),
(223, 70),
(227, 70),
(229, 70),
(234, 70),
(235, 70),
(240, 70),
(244, 70),
(249, 70),
(251, 70),
(254, 70),
(258, 70),
(259, 70),
(260, 70),
(262, 70),
(267, 70),
(272, 70),
(275, 70),
(277, 70),
(283, 70),
(284, 70),
(285, 70),
(286, 70),
(290, 70),
(295, 70),
(296, 70),
(297, 70),
(299, 70),
(300, 70),
(303, 70),
(304, 70),
(305, 70),
(307, 70),
(308, 70),
(310, 70),
(315, 70),
(318, 70),
(319, 70),
(320, 70),
(323, 70),
(331, 70),
(332, 70),
(333, 70),
(334, 70),
(343, 70),
(344, 70),
(347, 70),
(348, 70),
(352, 70),
(353, 70),
(360, 70),
(361, 70),
(364, 70),
(365, 70),
(366, 70),
(367, 70),
(370, 70),
(371, 70),
(377, 70),
(381, 70),
(382, 70),
(383, 70),
(387, 70),
(388, 70),
(389, 70),
(393, 70),


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `cuit` varchar(11) NOT NULL,
  `idFarm` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `f_ingreso` date DEFAULT NULL,
  `salario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`cuit`, `idFarm`, `nombre`, `f_ingreso`, `salario`) VALUES
('20013459959', 11, 'Mireia Echevarría Leiva', '2022-01-11', 210000),
('20018480730', 29, 'Cesar Puga Águila', '2014-01-27', 155000),
('20021567629', 46, 'Isidoro Prada Zurita', '2016-09-17', 210000),
('20058443895', 12, 'Teodora Arévalo Samper', '2021-02-02', 170000),
('20120362874', 14, 'Tomás Escrivá Valls', '2022-03-19', 150000),
('20141058327', 10, 'Duilio Miralles Silva', '2019-02-18', 175000),
('20231836627', 19, 'Isaías José Manuel Galiano Fuster', '2014-10-07', 215000),
('20252633411', 1, 'Salud Marin', '2015-05-10', 200000),
('20305105450', 6, 'Vito de Uriarte', '2014-03-07', 200000),
('20316844273', 38, 'Valerio Valero Juan', '2020-08-22', 150000),
('20324494745', 21, 'Gracia Gomila Seco', '2017-10-06', 170000),
('20387424222', 3, 'Eliseo Pla', '2016-12-15', 160000),
('20398611512', 17, 'Lorenzo Somoza Montoya', '2019-06-25', 195000),
('20402083655', 30, 'Marcos Nicanor Carrillo Seguí', '2015-06-15', 175000),
('20411938423', 27, 'Mariano Flores Canals', '2020-09-30', 175000),
('20434595565', 45, 'Edelmiro Zaragoza Moraleda', '2015-12-21', 185000),
('20438416572', 43, 'Rosalva Vidal Marco', '2013-11-01', 165000),
('20455696907', 30, 'Ascensión Castañeda Andres', '2016-02-12', 170000),
('20470952236', 28, 'Adelardo Salas Palmer', '2020-11-16', 165000),
('20518662277', 35, 'Adolfo Lobato Haro', '2020-09-11', 215000),
('20524436653', 41, 'Consuela Gras', '2021-09-01', 190000),
('20539930413', 24, 'Rosa Alfaro Calvet', '2019-10-29', 160000),
('20560948364', 18, 'Magdalena del Riquelme', '2013-09-18', 180000),
('20587591248', 11, 'Maristela de Ribera', '2013-07-08', 185000),
('20664342652', 7, 'Adán Leopoldo Gaya Rey', '2022-03-09', 155000),
('20710418224', 32, 'Juan Pablo Martí Acedo', '2020-07-29', 160000),
('20721822719', 43, 'Sofía Villaverde-Escalona', '2020-07-22', 165000),
('20731214991', 47, 'Juan Antonio Valero Aliaga', '2014-05-14', 155000),
('20738851631', 20, 'Gabriela Mena Valbuena', '2018-10-24', 210000),
('20742300102', 31, 'Nerea Oller Piñeiro', '2022-08-09', 175000),
('20754861626', 23, 'Marcos Alonso Amigó', '2018-05-20', 185000),
('20772176388', 36, 'Gabriela Otero Cabo', '2017-12-19', 205000),
('20774156770', 5, 'Leonel Orozco Adadia', '2019-12-18', 190000),
('20776733848', 10, 'Adalberto de Barros', '2014-09-26', 190000),
('20784030244', 9, 'Loreto Galan Mayo', '2018-11-23', 185000),
('20811506277', 31, 'Estefanía Molins Ariza', '2019-02-02', 215000),
('20816822204', 32, 'África Fátima Vidal Barros', '2017-08-14', 195000),


-- --------------------------------------------------------


-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `num` int(11) NOT NULL,
  `id_af` int(11) DEFAULT NULL,
  `id_cr` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `idFarm` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`num`, `id_af`, `id_cr`, `fecha`, `total`, `idFarm`, `subtotal`) VALUES
(1, 11590, NULL, '2015-03-05', 5039.15, 8, 6298.94),
(2, NULL, 10389, '2022-09-17', 5898.04, 25, 19660.2),
(3, NULL, 1686, '2022-09-29', 769.053, 44, 2563.51),
(4, NULL, 4505, '2021-10-06', 6307.29, 6, 21024.3),
(5, 5461, NULL, '2023-01-01', 6700.46, 35, 8375.58),
(6, 10433, NULL, '2023-06-07', 1640.08, 46, 2050.1),
(7, 2713, NULL, '2022-05-31', 8397.17, 28, 10496.5),
(8, NULL, 1937, '2022-03-05', 4637.13, 26, 15457.1),
(9, NULL, 193, '2022-10-28', 432.696, 2, 1442.32),
(10, 5078, NULL, '2023-05-05', 22.56, 15, 28.2),
(11, 7126, NULL, '2023-01-04', 7948.72, 9, 9935.9),
(12, NULL, 1213, '2021-07-26', 4842.89, 23, 16143),
(13, 5489, NULL, '2022-11-19', 14626.8, 10, 18283.5),
(14, NULL, 2558, '2021-05-30', 5202.62, 1, 17342.1),
(15, NULL, 3576, '2021-05-16', 1354.69, 48, 4515.64),
(16, 5956, NULL, '2022-04-19', 14153.2, 24, 17691.5),
(17, NULL, 8569, '2022-09-23', 7439.07, 37, 24796.9),
(18, 8631, NULL, '2022-05-13', 31144.9, 29, 38931.1),
(19, 10184, NULL, '2022-06-01', 10676.6, 6, 13345.8),
(20, NULL, 1565, '2023-03-05', 4220.87, 41, 14069.6),
(21, 8222, NULL, '2022-09-10', 2597.15, 39, 3246.44),
(22, 10375, NULL, '2021-11-30', 4510.44, 44, 5638.05),
(23, 10243, NULL, '2023-04-10', 10818.7, 47, 13523.4),
(24, NULL, 105, '2022-07-10', 11314.8, 24, 37715.9),
(25, NULL, 8832, '2023-04-19', 9039.62, 32, 30132.1),
(26, NULL, 954, '2022-04-04', 4307.32, 2, 14357.7),
(27, 11384, NULL, '2023-04-22', 7240.75, 38, 9050.94),
(28, NULL, 7505, '2022-01-25', 2825.64, 9, 9418.81),
(29, 10629, NULL, '2021-05-22', 2257.58, 24, 2821.98),
(30, NULL, 4423, '2022-10-14', 7887.08, 11, 26290.2),
(31, 8245, NULL, '2023-02-13', 1615.16, 23, 2018.95),
(32, 148, NULL, '2021-10-30', 6518.38, 25, 8147.97),
(33, 5940, NULL, '2023-02-01', 3863.04, 13, 4828.8),
(34, 3055, NULL, '2021-06-30', 15046.7, 35, 18808.4),
(35, 781, NULL, '2023-05-02', 5236.38, 15, 6545.47),
(36, NULL, 7300, '2022-05-10', 4903.17, 48, 16343.9),
(37, NULL, 300, '2021-08-12', 5750.57, 4, 19168.6),

--
-- Estructura de tabla para la tabla `solicita`
--

CREATE TABLE `solicita` (
  `num` int(11) NOT NULL,
  `idFarm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicita`
--

INSERT INTO `solicita` (`num`, `idFarm`) VALUES
(1, 13),
(2, 5),
(3, 39),
(4, 4),
(5, 27),
(6, 44),
(7, 5),
(8, 11),
(9, 22),
(10, 30),
(11, 37),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `num` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transferencia`
--

INSERT INTO `transferencia` (`num`, `fecha`, `estado`) VALUES
(1, '2023-03-30', 'procesado'),
(2, '2022-01-29', 'finalizado'),
(3, '2022-08-01', 'finalizado'),
(4, '2023-03-15', 'finalizado'),
(5, '2021-09-20', 'pendiente'),
(6, '2020-10-20', 'finalizado'),
(7, '2020-10-07', 'finalizado'),
(8, '2020-12-30', 'pendiente'),
(9, '2023-05-07', 'finalizado'),
(10, '2021-05-21', 'pendiente'),
(11, '2023-06-12', 'procesado'),
(12, '2023-04-01', 'pendiente'),
(13, '2021-09-22', 'finalizado'),
(14, '2021-06-04', 'finalizado'),
(15, '2021-05-24', 'pendiente'),
(16, '2021-08-08', 'finalizado'),
(17, '2021-01-04', 'finalizado'),
(18, '2020-10-04', 'procesado'),
(19, '2022-06-28', 'procesado'),
(20, '2022-04-20', 'finalizado'),
(21, '2021-07-08', 'finalizado'),
(22, '2022-04-05', 'finalizado'),
(23, '2021-05-30', 'finalizado'),
(24, '2021-04-13', 'procesado'),
(25, '2022-05-21', 'finalizado'),
(26, '2022-05-31', 'pendiente'),
(27, '2021-05-07', 'pendiente'),
(28, '2021-04-25', 'finalizado'),
(29, '2022-03-24', 'procesado'),
(30, '2021-06-21', 'pendiente'),
(31, '2022-04-11', 'procesado'),
(32, '2021-01-11', 'pendiente'),
(33, '2023-03-19', 'finalizado'),
(34, '2022-06-19', 'finalizado'),
(35, '2021-10-05', 'procesado'),
(36, '2021-07-02', 'procesado'),
(37, '2022-10-07', 'finalizado'),
(38, '2021-01-13', 'finalizado'),
(39, '2023-01-25', 'finalizado'),
(40, '2022-06-09', 'finalizado'),
(41, '2021-10-18', 'pendiente'),
(42, '2022-05-01', 'pendiente'),
(43, '2022-06-30', 'finalizado'),
(44, '2020-12-27', 'pendiente'),
(45, '2022-01-17', 'pendiente'),
(46, '2020-12-28', 'procesado'),
(47, '2021-12-18', 'procesado'),
(48, '2021-07-08', 'pendiente'),
(49, '2023-01-26', 'finalizado'),
(50, '2021-12-31', 'finalizado'),
(51, '2022-07-30', 'finalizado'),
(52, '2021-04-21', 'procesado'),
(53, '2021-01-31', 'procesado'),
(54, '2021-07-23', 'pendiente'),
(55, '2022-04-05', 'finalizado'),


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfiere`
--

CREATE TABLE `transfiere` (
  `num` int(11) NOT NULL,
  `cod` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transfiere`
--

INSERT INTO `transfiere` (`num`, `cod`, `cantidad`) VALUES
(1, 26, 58),
(1, 32, 481),
(1, 50, 903),
(1, 74, 646),
(1, 100, 132),
(1, 125, 743),
(1, 133, 148),