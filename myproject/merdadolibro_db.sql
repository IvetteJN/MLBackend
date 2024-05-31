-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mercado_libro
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Chinua Achebe'),(2,'Hans Christian Andersen'),(3,'Dante Alighieri'),(4,'Unknown'),(5,'Jane Austen'),(6,'Honor de Balzac'),(7,'Samuel Beckett'),(8,'Giovanni Boccaccio'),(9,'Jorge Luis Borges'),(10,'Emily Bronte'),(11,'Albert Camus'),(12,'Paul Celan'),(13,'Louis-Ferdinand Celine'),(14,'Miguel de Cervantes'),(15,'Geoffrey Chaucer'),(16,'Anton Chekhov'),(17,'Joseph Conrad'),(18,'Charles Dickens'),(19,'Denis Diderot'),(20,'Alfred Doblin'),(21,'Fyodor Dostoievsky'),(22,'George Eliot'),(23,'Ralph Ellison'),(24,'Euripides');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `categoria` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (7,'Clásicos'),(8,'Fantasía'),(5,'Ficción'),(2,'Infantil'),(3,'Literatura'),(1,'Novela'),(9,'Poesía'),(4,'Religión'),(6,'Romance'),(10,'Tragedia');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `libro_id` int NOT NULL,
  `pedido_id` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `detalle_pedido_libro_id_478253b7_fk_libro_id_libro` (`libro_id`),
  KEY `detalle_pedido_pedido_id_75d4855e_fk_pedido_id_pedido` (`pedido_id`),
  CONSTRAINT `detalle_pedido_libro_id_478253b7_fk_libro_id_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id_libro`),
  CONSTRAINT `detalle_pedido_pedido_id_75d4855e_fk_pedido_id_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,2,59250.00,118500.00,6,1);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `usuario_cliente_id` int DEFAULT NULL,
  `provincia` varchar(100) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `direccion_usuario_cliente_id_d66c6e8a_fk_usuario_c` (`usuario_cliente_id`),
  CONSTRAINT `direccion_usuario_cliente_id_d66c6e8a_fk_usuario_c` FOREIGN KEY (`usuario_cliente_id`) REFERENCES `usuario_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'San Martin 123','Córdoba','5000','Argentina',1,'Córdoba'),(2,'Belgrano 456','Córdona','5000','Argentina',2,'Córdoba');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_envio`
--

DROP TABLE IF EXISTS `forma_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_envio` (
  `id_forma_envio` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_forma_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_envio`
--

LOCK TABLES `forma_envio` WRITE;
/*!40000 ALTER TABLE `forma_envio` DISABLE KEYS */;
INSERT INTO `forma_envio` VALUES (1,'Correo - domicilio'),(2,'Correo - punto de entrega'),(3,'Envio por cadetería'),(4,'Retiro en sucursal');
/*!40000 ALTER TABLE `forma_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo'),(2,'Trasferencia'),(3,'Tarjeta de crédito'),(4,'Debito'),(5,'Go coutas'),(6,'MercadoPago');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_pedido`
--

DROP TABLE IF EXISTS `historial_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_pedido` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(50) NOT NULL,
  `fecha_cambio` datetime(6) NOT NULL,
  `pedido_id` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `ecommerce_historialpedido_pedido_id_43328d84_fk_pedido_id_pedido` (`pedido_id`),
  CONSTRAINT `ecommerce_historialpedido_pedido_id_43328d84_fk_pedido_id_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_pedido`
--

LOCK TABLES `historial_pedido` WRITE;
/*!40000 ALTER TABLE `historial_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `categoria_id` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `portada` varchar(100) NOT NULL,
  `autor_id` int DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` (`categoria_id`),
  KEY `fk_autor` (`autor_id`),
  CONSTRAINT `fk_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Things Fall Apart',38599.00,4,1,'La novela narra la historia de Okonkwo, un líder tribal en Nigeria, y cómo su vida se ve afectada po','',NULL),(2,'Fairy tales',8342.00,15,2,'Hans Christian Andersen 1805-1875 nació en Odense, hijo de un zapatero. Sus primeros años fueron des','',NULL),(3,'La divina comedia',9270.00,13,3,'Dante, alter ego del poeta, se encuentra perdido en medio de una selva oscura. Al amanecer, llega a ','',NULL),(4,'The Epic Of Gilgamesh',21319.00,7,1,'La histórica traducción de N. K. Sandars de una de las primeras y más grandes obras de la literatura','',NULL),(5,'El libro de Job',500.00,9,4,'Es un libro que se encuentra en la sección Ketuvim (\\\"Escritos\\\") de la Biblia hebrea (Tanakh) y el ','',NULL),(6,'Las mil y una noches',59250.00,14,3,'Es una colección de cuentos populares de Oriente Medio compilados en lengua árabe durante la Edad de','',NULL),(7,'Saga de Njál',12250.00,6,5,'La saga trata sobre un proceso de enemistades sangrientas en la Commonwealth de Islandia , mostrando','',NULL),(8,'Orgullo y prejuicio',8320.00,7,6,'A principios del siglo XIX, la familia Bennet vivía en su finca de Longbourn, situada cerca del pueb','',NULL),(9,'Le Père Goriot',41699.00,5,1,'La novela comienza con una descripción ampliada de la Maison Vauquer, una pensión en la rue Neuve-Sa','',NULL),(10,'Molloy, Malone Dies, The Unnamable, the trilogy',26265.00,8,1,'En su primera aparición, el libro trata de dos personajes diferentes, ambos con monólogos interiores','',NULL),(11,'The Decameron',7125.00,3,7,'La obra se compone en total de 100 relatos que transcurren en un lapso de diez días y que son narrad','',NULL),(12,'Ficciones',9629.00,12,8,'Este cuento narra la historia de la cicatriz de un hombre y se contextualiza en dos momentos históri','',NULL),(13,'Cumbres borrascosas',7839.00,10,1,'El argumento de la novela gira en torno a las pasiones, el desprecio y la venganza. Adoptado por la ','',NULL),(14,'El extranjero',13114.00,9,1,'La novela nos presenta a Meursault, un hombre franco-argelino que se muestra pasivo y ajeno al mundo','',NULL),(15,'Los poemas póstumos',26363.00,6,9,'Sin descripción','',NULL),(16,'Viaje al fin de la noche',12150.00,11,1,'Ferdinand Bardamu es un joven estudiante de medicina parisino que, en un arranque de entusiasmo, se ','',NULL),(17,'Don Quijote De La Mancha',21690.00,13,1,'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobr','',NULL),(18,'Los cuentos de Canterbury',6000.00,18,5,'Los Cuentos de Canterbury es una colección de historias, contadas por diferentes peregrinos en su ca','',NULL),(19,'Cuentos',22344.00,9,1,'Esta antología no sigue un orden cronológico, sino que propone un recorrido por cierto tipo de cuent','',NULL),(20,'Nostromo',16889.00,8,1,'Muchos consideran Nostromo la más grande de las novelas de Conrad; y es, la que ofrece la más variad','',NULL),(21,'Grandes esperanzas',13062.00,5,1,'Grandes esperanzas es uno de los títulos más célebres del gran autor inglés. Publicado originalmente','',NULL),(22,'Jacques the Fatalist',7830.00,10,1,'Jacques el fatalista pone en juego varias historias dentro de la historia, algunas paralelas, otras ','',NULL),(23,'Berlin Alexanderplatz',18311.00,3,1,'Berlín Alexanderplatz aparece en 1929. Su éxito es extraordinario y, en pocos años, alcanza cuarenta','',NULL),(24,'Crimen y castigo',12900.00,6,1,'El joven Rodión Raskólnikov, antiguo estudiante, arrastra una existencia precaria en San Petersburgo','',NULL),(25,'El idiota',7600.00,7,1,'Proveniente de un establecimiento de salud en Suiza donde un doctor le ha tratado una enfermedad no ','',NULL),(26,'Los poseídos',3570.00,16,1,'El horrible crimen perpetrado en Moscú a finales de 1869 siguiendo órdenes del nihilista Nechayev, s','',NULL),(27,'Los hermanos Karamazov',7624.00,8,1,'En Los hermanos Karamázov, última obra y síntesis monumental de su pensamiento y de su arte, desarro','',NULL),(28,'Middlemarch',17622.00,6,6,'Dorothea Brooke, a los diecinueve años, ha recibido \'una educación para jovencitas comparable a las ','',NULL),(29,'El hombre invisible',18604.00,7,1,'El hombre invisible, acogida ya en sus orígenes como una novela excepcional, ha rebasado el marco es','',NULL),(30,'Medea',4500.00,20,10,'Medea, que se representó en 431 a.C., es seguramente la obra maestra de Eurípides. Jasón, esposo de ','',NULL);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(50) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `direccion_envio_id` int DEFAULT NULL,
  `usuario_cliente_id` int DEFAULT NULL,
  `forma_envio_id` int DEFAULT NULL,
  `forma_pago_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `pedido_direccion_envio_id_8f544795_fk_ecommerce` (`direccion_envio_id`),
  KEY `pedido_forma_envio_id_48e933a1_fk_forma_envio_id_forma_envio` (`forma_envio_id`),
  KEY `pedido_forma_pago_id_ec029cee_fk_forma_pago_id_forma_pago` (`forma_pago_id`),
  KEY `pedido_usuario_cliente_id_a7acef2d_fk_usuario_cliente_id_cliente` (`usuario_cliente_id`),
  CONSTRAINT `pedido_direccion_envio_id_8f544795_fk_ecommerce` FOREIGN KEY (`direccion_envio_id`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `pedido_forma_envio_id_48e933a1_fk_forma_envio_id_forma_envio` FOREIGN KEY (`forma_envio_id`) REFERENCES `forma_envio` (`id_forma_envio`),
  CONSTRAINT `pedido_forma_pago_id_ec029cee_fk_forma_pago_id_forma_pago` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id_forma_pago`),
  CONSTRAINT `pedido_usuario_cliente_id_a7acef2d_fk_usuario_cliente_id_cliente` FOREIGN KEY (`usuario_cliente_id`) REFERENCES `usuario_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'En preparación','2024-05-23 00:00:00.000000',1,1,2,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `id_resena` int NOT NULL AUTO_INCREMENT,
  `comentario` longtext NOT NULL,
  `calificacion` int NOT NULL,
  `fecha_resena` datetime(6) NOT NULL,
  `libro_id` int NOT NULL,
  `usuario_cliente_id` int NOT NULL,
  PRIMARY KEY (`id_resena`),
  KEY `ecommerce_resena_libro_id_dada1bf5_fk_libro_id_libro` (`libro_id`),
  KEY `ecommerce_reseña_usuario_cliente_id_0ab05e54_fk_ecommerce` (`usuario_cliente_id`),
  CONSTRAINT `ecommerce_resena_libro_id_dada1bf5_fk_libro_id_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id_libro`),
  CONSTRAINT `ecommerce_reseña_usuario_cliente_id_0ab05e54_fk_ecommerce` FOREIGN KEY (`usuario_cliente_id`) REFERENCES `usuario_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
INSERT INTO `resena` VALUES (1,'Este libro cambio mi vida, es perfecto para leer un dia de lluvia con cafe y un libro',5,'2024-05-23 00:00:00.000000',6,1);
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_administrador`
--

DROP TABLE IF EXISTS `usuario_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_administrador` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_administrador`
--

LOCK TABLES `usuario_administrador` WRITE;
/*!40000 ALTER TABLE `usuario_administrador` DISABLE KEYS */;
INSERT INTO `usuario_administrador` VALUES (1,'admin','admin','Administrador');
/*!40000 ALTER TABLE `usuario_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `correo_electronico` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
INSERT INTO `usuario_cliente` VALUES (1,'usuario1','usuario1@example.com','pbkdf2_sha256$600000$64HZPfCwgS3Jeo637SS5Ll$MqEO/23L5SelsSKTQimTgLTY8b4KQ32HX+C0d9NTXrU='),(2,'Juan Paco Pedro DeLaMar','juan.DeLaMar@example.com','pbkdf2_sha256$600000$epQ30g5iivG080FbNxxPkr$rGLGO8jC24TyQ6GQ7fhQoRrNYB0TiBoCG29PtXYsZJI=');
/*!40000 ALTER TABLE `usuario_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31 13:03:41
