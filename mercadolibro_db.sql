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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoría',7,'add_categoria'),(26,'Can change Categoría',7,'change_categoria'),(27,'Can delete Categoría',7,'delete_categoria'),(28,'Can view Categoría',7,'view_categoria'),(29,'Can add libro',8,'add_libro'),(30,'Can change libro',8,'change_libro'),(31,'Can delete libro',8,'delete_libro'),(32,'Can view libro',8,'view_libro'),(33,'Can add pedido',9,'add_pedido'),(34,'Can change pedido',9,'change_pedido'),(35,'Can delete pedido',9,'delete_pedido'),(36,'Can view pedido',9,'view_pedido'),(37,'Can add autor',10,'add_autor'),(38,'Can change autor',10,'change_autor'),(39,'Can delete autor',10,'delete_autor'),(40,'Can view autor',10,'view_autor'),(41,'Can add detalle pedido',11,'add_detallepedido'),(42,'Can change detalle pedido',11,'change_detallepedido'),(43,'Can delete detalle pedido',11,'delete_detallepedido'),(44,'Can view detalle pedido',11,'view_detallepedido'),(45,'Can add direccion',12,'add_direccion'),(46,'Can change direccion',12,'change_direccion'),(47,'Can delete direccion',12,'delete_direccion'),(48,'Can view direccion',12,'view_direccion'),(49,'Can add historial pedido',13,'add_historialpedido'),(50,'Can change historial pedido',13,'change_historialpedido'),(51,'Can delete historial pedido',13,'delete_historialpedido'),(52,'Can view historial pedido',13,'view_historialpedido'),(53,'Can add libro autor',14,'add_libroautor'),(54,'Can change libro autor',14,'change_libroautor'),(55,'Can delete libro autor',14,'delete_libroautor'),(56,'Can view libro autor',14,'view_libroautor'),(57,'Can add usuario administrador',15,'add_usuarioadministrador'),(58,'Can change usuario administrador',15,'change_usuarioadministrador'),(59,'Can delete usuario administrador',15,'delete_usuarioadministrador'),(60,'Can view usuario administrador',15,'view_usuarioadministrador'),(61,'Can add usuario cliente',16,'add_usuariocliente'),(62,'Can change usuario cliente',16,'change_usuariocliente'),(63,'Can delete usuario cliente',16,'delete_usuariocliente'),(64,'Can view usuario cliente',16,'view_usuariocliente'),(65,'Can add forma envio',17,'add_formaenvio'),(66,'Can change forma envio',17,'change_formaenvio'),(67,'Can delete forma envio',17,'delete_formaenvio'),(68,'Can view forma envio',17,'view_formaenvio'),(69,'Can add forma pago',18,'add_formapago'),(70,'Can change forma pago',18,'change_formapago'),(71,'Can delete forma pago',18,'delete_formapago'),(72,'Can view forma pago',18,'view_formapago'),(73,'Can add reseña',19,'add_reseña'),(74,'Can change reseña',19,'change_reseña'),(75,'Can delete reseña',19,'delete_reseña'),(76,'Can view reseña',19,'view_reseña'),(77,'Can add rol',20,'add_rol'),(78,'Can change rol',20,'change_rol'),(79,'Can delete rol',20,'delete_rol'),(80,'Can view rol',20,'view_rol'),(81,'Can add user',21,'add_customuser'),(82,'Can change user',21,'change_customuser'),(83,'Can delete user',21,'delete_customuser'),(84,'Can view user',21,'view_customuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$2SpQKHYs4DI6iOp7HA1gxD$l6knia9eklb8GBA4n2HVfDwOvZGsSInlzL+e18je4ro=','2024-06-01 16:26:54.556799',1,'codesquad','','','',1,1,'2024-05-21 14:51:15.678085'),(2,'pbkdf2_sha256$600000$95e4Xehz7Nmj5eaP5LJHBl$DKpT8RhBP+3h2fFEJfkeqm49BOGsejon1BDfoJAd5VI=','2024-05-22 15:19:28.488582',1,'ivette','','','',1,1,'2024-05-22 15:18:16.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Chinua Achebe'),(2,'Hans Christian Andersen'),(3,'Dante Alighieri'),(4,'Unknown'),(5,'Jane Austen'),(6,'Honor de Balzac'),(7,'Samuel Beckett'),(8,'Giovanni Boccaccio'),(9,'Jorge Luis Borges'),(10,'Emily Bronte'),(11,'Albert Camus'),(12,'Paul Celan'),(13,'Louis-Ferdinand Celine'),(14,'Miguel de Cervantes'),(15,'Geoffrey Chaucer'),(16,'Anton Chekhov'),(17,'Joseph Conrad'),(18,'Charles Dickens'),(19,'Denis Diderot'),(20,'Alfred Doblin'),(21,'Fyodor Dostoievsky'),(22,'George Eliot'),(23,'Ralph Ellison'),(24,'Euripides'),(25,'William Faulkner'),(26,'Gustave Flaubert'),(27,'Federico Garcia Lorca'),(28,'Gabriel Garcia Marquez'),(29,'Johann Wolfgang von Goethe'),(30,'Nikolai Gogol'),(31,'Gunter Grass'),(32,'Joao Guimaraes Rosa'),(33,'Knut Hamsun'),(34,'Ernest Hemingway'),(35,'Homer'),(36,'Henrik Ibsen'),(37,'James Joyce'),(38,'Franz Kafka'),(39,'Kalidasa'),(40,'Yasunari Kawabata'),(41,'Nikos Kazantzakis'),(42,'D. H. Lawrence'),(43,'Halldor Laxness'),(44,'Giacomo Leopardi'),(45,'Doris Lessing'),(46,'Astrid Lindgren'),(47,'Lu Xun'),(48,'Naguib Mahfouz'),(49,'Thomas Mann'),(50,'Herman Melville'),(51,'Michel de Montaigne'),(52,'Elsa Morante'),(53,'Toni Morrison'),(54,'Murasaki Shikibu'),(55,'Robert Musil'),(56,'Vladimir Nabokov'),(57,'George Orwell'),(58,'Ovid'),(59,'Fernando Pessoa'),(60,'Edgar Allan Poe'),(61,'Marcel Proust'),(62,'Francois Rabelais'),(63,'Juan Rulfo'),(64,'Rumi'),(65,'Salman Rushdie'),(66,'Saadi'),(67,'Tayeb Salih'),(68,'Jose Saramago'),(69,'William Shakespeare'),(70,'Sophocles'),(71,'Stendhal'),(72,'Laurence Sterne'),(73,'Italo Svevo'),(74,'Jonathan Swift'),(75,'Leo Tolstoy'),(76,'Mark Twain'),(77,'Valmiki'),(78,'Virgil'),(79,'Vyasa'),(80,'Walt Whitman'),(81,'Virginia Woolf'),(82,'Marguerite Yourcenar');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (7,'Clásicos'),(11,'Drama'),(8,'Fantasía'),(5,'Ficción'),(2,'Infantil'),(3,'Literatura'),(1,'Novela'),(9,'Poesía'),(4,'Religión'),(6,'Romance'),(10,'Tragedia');
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
  `provincia` varchar(100) NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'San Martin 123','Córdoba','5000','Córdoba'),(2,'Belgrano 456','Córdona','5000','Córdoba'),(3,'la playa 52','carmen','5100','Córdoba'),(4,'la playa 52','carmen','5100','Córdoba'),(5,'Bahía Blanca 292','Huerta Grande','5174','Córdoba');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-22 15:18:18.021107','2','ivette',1,'[{\"added\": {}}]',4,1),(2,'2024-05-22 15:18:42.702384','2','ivette',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(3,'2024-05-22 15:19:40.860255','1','Novela',1,'[{\"added\": {}}]',7,2),(4,'2024-05-22 15:19:48.109441','2','Infantil',1,'[{\"added\": {}}]',7,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'ecommerce','autor'),(7,'ecommerce','categoria'),(21,'ecommerce','customuser'),(11,'ecommerce','detallepedido'),(12,'ecommerce','direccion'),(17,'ecommerce','formaenvio'),(18,'ecommerce','formapago'),(13,'ecommerce','historialpedido'),(8,'ecommerce','libro'),(14,'ecommerce','libroautor'),(9,'ecommerce','pedido'),(19,'ecommerce','reseña'),(20,'ecommerce','rol'),(15,'ecommerce','usuarioadministrador'),(16,'ecommerce','usuariocliente'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-21 14:43:33.000933'),(2,'auth','0001_initial','2024-05-21 14:43:34.342177'),(3,'admin','0001_initial','2024-05-21 14:43:34.657093'),(4,'admin','0002_logentry_remove_auto_add','2024-05-21 14:43:34.735222'),(5,'admin','0003_logentry_add_action_flag_choices','2024-05-21 14:43:34.821196'),(6,'contenttypes','0002_remove_content_type_name','2024-05-21 14:43:35.079829'),(7,'auth','0002_alter_permission_name_max_length','2024-05-21 14:43:35.233226'),(8,'auth','0003_alter_user_email_max_length','2024-05-21 14:43:35.342330'),(9,'auth','0004_alter_user_username_opts','2024-05-21 14:43:35.363307'),(10,'auth','0005_alter_user_last_login_null','2024-05-21 14:43:35.536129'),(11,'auth','0006_require_contenttypes_0002','2024-05-21 14:43:35.536129'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-21 14:43:35.574420'),(13,'auth','0008_alter_user_username_max_length','2024-05-21 14:43:35.783334'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-21 14:43:35.948865'),(15,'auth','0010_alter_group_name_max_length','2024-05-21 14:43:36.010709'),(16,'auth','0011_update_proxy_permissions','2024-05-21 14:43:36.046084'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-21 14:43:36.234142'),(18,'ecommerce','0001_initial','2024-05-21 14:43:36.836173'),(19,'ecommerce','0002_autor_detallepedido_direccion_historialpedido_and_more','2024-05-21 14:43:39.486249'),(20,'ecommerce','0003_formaenvio_formapago_rename_resena_reseña_and_more','2024-05-21 14:43:43.080507'),(21,'ecommerce','0004_alter_pedido_usuario_cliente','2024-05-21 14:43:43.517931'),(22,'ecommerce','0005_alter_pedido_usuario_cliente','2024-05-21 14:43:43.886072'),(23,'ecommerce','0006_alter_direccion_usuario_cliente','2024-05-21 14:43:44.207453'),(24,'sessions','0001_initial','2024-05-21 14:43:44.318952'),(25,'ecommerce','0007_usuarioadministrador_roles','2024-05-22 14:23:33.299886'),(26,'ecommerce','0008_alter_usuarioadministrador_roles','2024-05-22 14:23:33.315511'),(27,'ecommerce','0009_remove_usuarioadministrador_roles_and_more','2024-05-22 14:48:31.429240');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('95c2k2ikuq1c69zswbybxr5x6k3gdjd1','.eJxVjDEOAiEQRe9CbQgMoGBp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZOeQgmJKWVUwlyYGszKK-xeDQ6ZMdkXDgWYiAHpHRI7MvJeQK0lsT7A721N28:1sDRZG:bjHzomwfOr-JsHCDAZiZSwlxAHz1eoKAoL5VKKY_Yk4','2024-06-15 16:26:54.556799'),('a0hzik9l4nfjqrve06cbefhbr3deyibt','.eJxVjEsOwjAMBe-SNYpMGhuHJXvOUNlOQguolfpZIe4OlbqA7ZuZ93KtrEvXrnOZ2j67swvu8Lup2KMMG8h3GW6jt3FYpl79pvidzv465vK87O7fQSdz960hKFNCqNhoPpEhGGNNSkyQqxEUiRLrkdmUAZA41UrRkLWBgMG9P9UQN1I:1s9nkW:wL5omN-aaV5FhRw9Q9t6gydHPRzVp_A6slTf4jHOD80','2024-06-05 15:19:28.509005'),('m261h8ptu2y89fpg58fsiut7syut0xps','.eJxVjDEOAiEQRe9CbQgMoGBp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZOeQgmJKWVUwlyYGszKK-xeDQ6ZMdkXDgWYiAHpHRI7MvJeQK0lsT7A721N28:1sD7aR:hPR3T1BTSo_rQcM-XXpWdnYZ5RDgBIsUfZN7txEhHDY','2024-06-14 19:06:47.957199'),('vofa8e4ql2clysogr1tyhmh1uhxmtn0d','.eJxVjDEOAiEQRe9CbQgMoGBp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZOeQgmJKWVUwlyYGszKK-xeDQ6ZMdkXDgWYiAHpHRI7MvJeQK0lsT7A721N28:1sDO7c:5j046sA0Uoh5qOz4zmjOe12D8a1Tpo_3-89nP3wDUcM','2024-06-15 12:46:08.438541');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  `descripcion` longtext NOT NULL,
  `portada` varchar(100) NOT NULL,
  `autor_id` int DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` (`categoria_id`),
  KEY `fk_autor` (`autor_id`),
  CONSTRAINT `fk_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (32,'Absalom, Absalom!',19905.00,15,1,'Cuenta la historia trágica de la familia Sutpen, desde su génesis hasta su destrucción. Cuatro narradores tratan de reconstruir el rompecabezas de la saga de los Sutpen, cada uno manejando diferentes piezas del puzzle, desbrozando los enigmas y los acontecimientos que llevaron a su hecatombe.','libros/Absalom, Absalom!/absalom-absalom.jpg',25),(33,'El ruido y la furia',13480.00,15,1,'Relata la degeneración progresiva de la familia Compson, sus secretos y relaciones de amor y odio que la sostienen y la destruyen. Por primera vez, el autor introduce el monólogo interior y revela los diferentes puntos de vista de sus personajes.','libros/El ruido y la furia/the-sound-and-the-fury.jpg',25),(34,'Madame Bovary',10485.00,15,1,'Considerada unánimemente una de las mejores novelas de todos los tiempos, Madame Bovary narra la oscura tragedia de Emma Bovary, mujer infelizmente casada, cuyos sueños choca cruelmente con la realidad. Al hechizo que ejerce la figura de la protagonista hay que añadir la sabia combinación argumental de rebeldía, violencia, melodrama y sexo, «los cuatro grandes ríos», como afirmó en su día Mario Vargas Llosa, que alimentan esta historia inigualable. La publicación de esta obra en 1857 fue recibida con gran polémica y se procesó a Flaubert por atentar contra la moral. A través del personaje de Madame Bovary, el autor rompe con todas las convenciones morales y literarias de la Burguesía del siglo XIX, tal vez porque nadie antes se había atrevido a presentar un prototipo de heroína de ficción rebelde y tan poco resignada al destino. Hoy existe el término «bovarismo» para aludir aquel cambio del prototipo de la mujer idealizada que difundió el romanticismo, negándole sus derechos a la pasión. Ella actúa de acuerdo a la pasión y necesidad que siente su corazón de avanzar en la búsqueda de su felicidad, pasando por los ideales establecidos para la mujer en esa época. Rompe con el denominado encasillamiento en que la mayoría de las mujeres estaban sometidas.','libros/Madame Bovary/madame-bovary.jpg',26),(35,'La educacion sentimental',13868.00,10,1,'La novela describe la vida de un joven muchacho llamado Frédéric Moreau que vive la revolución de 1848 y la fundación del Segundo Imperio francés, y su amor por una mujer mayor, Madame Arnoux. Flaubert basó buena parte de las experiencias de su protagonista (incluida la pasión romántica) en su propia vida.','libros/La educacion sentimental/l-education-sentimentale.jpg',26),(36,'Things Fall Apart',38599.00,15,1,'La novela narra la historia de Okonkwo, un líder tribal en Nigeria, y cómo su vida se ve afectada por la llegada de misioneros europeos y el colapso de las tradiciones africanas.','libros/Things Fall Apart/things-fall-apart_581SkgD.jpg',1),(37,'Fairy tales',8342.00,12,2,'Hans Christian Andersen 1805-1875 nació en Odense, hijo de un zapatero. Sus primeros años fueron desgraciados, pero fue adoptado por un mecenas y se convirtió en cuentista, novelista y dramaturgo, aunque sigue siendo más conocido por sus mágicos cuentos de hadas, publicados entre 1835 y 1872. Durante 150 años, sus historias han hecho las delicias de adultos y niños. Repletos de una desenfadada fantasía combinada con una madura sabiduría, siguen siendo tan fascinantes como siempre. Aquí están todos los 154 cuentos de Andersen, y entre los favoritos están Los zapatos rojos, La sirena, La princesa real, El traje nuevo del emperador, La caja de yesca y, por supuesto, El patito feo.','libros/Fairy tales/fairy-tales.jpg',2),(38,'La divina comedia',9270.00,12,3,'Dante, alter ego del poeta, se encuentra perdido en medio de una selva oscura. Al amanecer, llega a una montaña iluminada, donde es asediado por tres animales simbólicos: un leopardo, un león y una loba. El alma de Virgilio, el poeta latino, acude en su auxilio y le hace saber que su amada Beatriz le ha encomendado llevarlo hasta las puertas del paraíso. Para eso, deberán pasar primero por el infierno y el purgatorio. En la primera parte de la travesía, Virgilio acompaña al peregrino a través de nueve círculos infernales, en los cuales Dante vislumbra los escarmientos que sufren los pecadores impíos. En la segunda parte, el poeta peregrino conoce el Purgatorio, lugar en que las almas pecadoras, pero contritas, purifican sus pecados para ascender al cielo. En la tercera parte, Dante es recibido por Beatriz en las puertas del paraíso, ya que Virgilio tiene la entrada prohibida por haber sido pagano. Dante conoce el firmamento y atestigua la victoria de los santos y la gloria del Altísimo. Iluminado y convertido por la revelación, el poeta peregrino regresa a la Tierra y decide dar testimonio de su viaje en un poema para advertencia y consejo de la humanidad.','libros/La divina comedia/the-divine-comedy.jpg',3),(39,'The Epic Of Gilgamesh',21319.00,12,1,'La histórica traducción de N. K. Sandars de una de las primeras y más grandes obras de la literatura occidentalUn clásico de PenguinGilgamesh, rey de Uruk, y su compañero Enkidu son los únicos héroes que han sobrevivido de la antigua literatura de Babilonia, inmortalizados en este poema épico que se remonta al tercer milenio antes de Cristo. Juntos viajan al Manantial de la Juventud, derrotan al Toro del Cielo y matan al monstruo Humbaba. Cuando Enkidu muere, el dolor y el miedo de Gilgamesh a la muerte son tales que le llevan a emprender la búsqueda de la vida eterna. La epopeya de Gilgamesh, un relato intemporal de moralidad, tragedia y pura aventura, constituye un hito literario en la búsqueda de la inmortalidad por parte del hombre. La lúcida y accesible traducción de N. K. Sandars va precedida de una detallada introducción en la que se examina el contexto narrativo e histórico de la obra. Además, incluye un glosario de nombres y un mapa del Antiguo Oriente.Durante más de setenta años, Penguin ha sido la editorial líder de literatura clásica en el mundo anglosajón. Con más de 1.700 títulos, Penguin Classics representa una estantería global de las mejores obras a lo largo de la historia y a través de géneros y disciplinas. Los lectores confían en que la serie les proporcione textos fidedignos, enriquecidos con introducciones y notas de distinguidos eruditos y autores contemporáneos, así como traducciones actualizadas de traductores galardonados.','libros/The Epic Of Gilgamesh/the-epic-of-gilgamesh.jpg',4),(40,'El libro de Job',500.00,5,4,'Es un libro que se encuentra en la sección Ketuvim (\\\"Escritos\\\") de la Biblia hebrea (Tanakh) y el primero de los Libros poéticos en el Antiguo Testamento de la Biblia cristiana . Los estudiosos generalmente coinciden en que fue escrito entre los siglos VII y IV a.C. Aborda la teodicea (por qué Dios permite el malen el mundo) a través de las experiencias del protagonista del mismo nombre . Job es un hombre rico y temeroso de Dios con una vida cómoda y una familia numerosa. Dios le pregunta a Satanás su opinión sobre la piedad de Job. Cuando Satanás afirma que Job se alejaría de Dios si se quedara sin un centavo, sin su familia y materialmente incómodo, Dios le permite hacerlo para demostrar que Satanás está equivocado.','libros/El libro de Job/the-book-of-job.jpg',4),(41,'Las mil y una noches',59250.00,7,3,'Ees una colección de cuentos populares de Oriente Medio compilados en lengua árabe durante la Edad de Oro islámica . A menudo se la conoce en inglés como Las mil y una noches, debido a la primera edición en inglés, que tradujo el título como The Arabian Nights\' Entertainment. El libro no debe confundirse con La historia de Minnie Maylow de John Masefield. La obra fue recopilada a lo largo de muchos siglos por varios autores, traductores y eruditos de Asia occidental , Asia central , Asia meridional y África del norte . Algunos cuentos tienen sus raíces en la literatura árabe, sánscrita, persa y mesopotámica antigua y medieval. La mayoría de los cuentos, sin embargo, eran originalmente historias populares de las eras abasí y mameluca , mientras que otros, especialmente la historia marco, probablemente se extrajeron de la obra persa pahlavi Hezār Afsān, que a su vez pueden ser traducciones de textos indios más antiguos.','libros/Las mil y una noches/one-thousand-and-one-nights.jpg',4),(42,'Saga de Njál',12250.00,7,5,'La saga trata sobre un proceso de enemistades sangrientas en la Commonwealth de Islandia , mostrando cómo las exigencias del honor podrían llevar a desaires menores que derivan en un derramamiento de sangre destructivo y prolongado. Los insultos en los que se cuestiona la virilidad de un personaje son especialmente destacados y pueden reflejar la crítica de un autor hacia un ideal de masculinidad demasiado restrictivo. [2] Otra característica de la narrativa es la presencia de presagios y sueños proféticos. Se discute si esto refleja una perspectiva fatalista por parte del autor.','libros/Saga de Njál/njals-saga.jpg',4),(43,'Orgullo y prejuicio',8320.00,3,6,'A principios del siglo XIX, la familia Bennet vivía en su finca de Longbourn, situada cerca del pueblo de Meryton en Hertfordshire , Inglaterra. El mayor deseo de la señora Bennet es casar a sus cinco hijas para asegurar su futuro. La llegada del señor Bingley, un soltero rico que alquila la finca vecina de Netherfield, le da la esperanza de que una de sus hijas pueda contraer un matrimonio ventajoso, porque \"es una verdad universalmente reconocida que un hombre soltero en posesión de una buena fortuna, debe estar necesitado de una esposa\"','libros/Orgullo y prejuicio/pride-and-prejudice.jpg',5),(44,'Le Père Goriot',41699.00,5,1,'La novela comienza con una descripción ampliada de la Maison Vauquer, una pensión en la rue Neuve-Sainte-Geneviève de París cubierta de vides, propiedad de la viuda Madame Vauquer. Entre los residentes se encuentran el estudiante de derecho Eugène de Rastignac, un misterioso agitador llamado Vautrin y un anciano fabricante de fideos jubilado llamado Jean-Joachim Goriot. El anciano es ridiculizado con frecuencia por los otros huéspedes, quienes pronto descubren que se ha arruinado para mantener a sus dos hijas bien casadas.','libros/Le Père Goriot/le-pere-goriot.jpg',6),(45,'Molloy, Malone Dies, The Unnamable, the trilogy',26265.00,5,1,'En su primera aparición, el libro trata de dos personajes diferentes, ambos con monólogos interiores en el libro. A medida que avanza la historia, los dos personajes se distinguen sólo por su nombre ya que sus experiencias y pensamientos son similares. La novela está ambientada en un lugar indeterminado, identificado con mayor frecuencia con la Irlanda del nacimiento de Beckett.','libros/Molloy, Malone Dies, The Unnamable, the trilogy/molloy-malone-dies-the-unnamable.jpg',7),(46,'The Decameron',7125.00,8,7,'La obra se compone en total de 100 relatos que transcurren en un lapso de diez días y que son narrados por diez personas con el fin de ofrecerse consuelo mutuo, entretenimiento y educación. De allí también el título de la obra: El Decamerón, que significa el libro de los diez días','libros/The Decameron/the-decameron.jpg',8),(47,'Ficciones',9916.00,7,8,'Este cuento narra la historia de la cicatriz de un hombre y se contextualiza en dos momentos históricos: el casi contemporáneo o posterior a la publicación de la obra y el de la Guerra de Independencia de Irlanda en 1922.','libros/Ficciones/ficciones.jpg',9),(48,'Cumbres borrascosas',7839.00,7,1,'El argumento de la novela gira en torno a las pasiones, el desprecio y la venganza. Adoptado por la familia Earnshaw, el niño Heathcliff sufre el desprecio de familiares, criados y vecinos. Además, padece el rechazo de Catherine, quien a pesar de corresponderle, opta por un matrimonio a conveniencia.','libros/Cumbres borrascosas/wuthering-heights.jpg',10),(49,'El extranjero',13114.00,3,1,'La novela nos presenta a Meursault, un hombre franco-argelino que se muestra pasivo y ajeno al mundo que le rodea. Tras cometer un crimen, no experimenta el arrepentimiento, tampoco se inmuta ante la muerte de su madre.','libros/El extranjero/l-etranger.jpg',11),(50,'Los poemas póstumos',26363.00,4,1,'No tenemos sinopsis de este ejemplar aún.','libros/Los poemas póstumos/poems-paul-celan.jpg',12),(51,'Viaje al fin de la noche',12150.00,4,1,'Ferdinand Bardamu es un joven estudiante de medicina parisino que, en un arranque de entusiasmo, se alista voluntariamente en el ejército francés al estallar la Primera Guerra Mundial. Durante su primer enfrentamiento con el enemigo, decide que la guerra no tiene ningún sentido y que no quiere participar en ella. Estando solo en una misión de reconocimiento nocturna, conoce a un reservista francés llamado Léon Robinson, que quiere ser capturado por los alemanes para poder pasar la guerra en la relativa seguridad de un campo de prisioneros. Bardamu y Robinson se dirigen a un pueblo francés, pero no hay alemanes a los que puedan rendirse. Decepcionados, se van por caminos separados.','libros/Viaje al fin de la noche/voyage-au-bout-de-la-nuit.jpg',13),(52,'Don Quijote De La Mancha',21690.00,7,1,'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobre que de tanto leer novelas de caballería acaba enloqueciendo y creyendo ser un caballero andante, nombrándose a sí mismo como don Quijote de la Mancha.','libros/Don Quijote De La Mancha/don-quijote-de-la-mancha.jpg',14),(53,'Los cuentos de Canterbury',6000.00,7,5,'Los Cuentos de Canterbury es una colección de historias, contadas por diferentes peregrinos en su camino a la tumba de Thomas Becket durante la Edad Media. Las historias van desde piezas románticas de alto estilo hasta piezas crudas y obscenas destinadas a insultar y entretener.','libros/Los cuentos de Canterbury/the-canterbury-tales.jpg',15),(55,'Cuentos',22344.00,7,1,'Esta antología no sigue un orden cronológico, sino que propone un recorrido por cierto tipo de cuento muy característico de Chéjov. Siguiendo a Borges, Ricardo Piglia afirma que los cuentos, en general, dejan entrever otra historia detrás de la historia manifiesta. Del mismo modo, en las narraciones de este volumen los protagonistas creen advertir indicios de un cambio que los va a liberar de una vida gris y sin alicientes. Indicios que terminan por revelarse engañosos, con lo que las falsas ilusiones los hacen sentirse todavía más frustrados. La secuencia ilustra aspectos que aproximan los cuentos de Chéjov a sus propias obras dramáticas: la importancia de los detalles y la atmósfera, el carácter fragmentario (debido a los tiempos muertos y a la sujeción del desarrollo narrativo a la melancolía de los lugares), la introspección o la ironía que brota del desengaño. Hacia el final, LA NOVIA, el último relato de Chéjov, abre un inesperado horizonte de salvación. Y, por último, un cuento sobrecogedor, EL ESTUDIANTE, extiende a la naturaleza y a la historia el precario equilibrio humano entre el sufrimiento y la esperanza.','libros/Cuentos/stories-of-anton-chekhov.jpg',16),(56,'Nostromo',18899.00,3,1,'Muchos consideran Nostromo la más grande de las novelas de Conrad; y es, la que ofrece la más variada riqueza de personajes y situaciones memorables, tramados en una nítida acción de conjunto. La república de Costaguana, en la tenaza entre las sombras de su Sierra y las profundidaes de su Golfo Plácido, es el teatro de un mundio que hierve de realidad en sus torbellinos de revolución y contrarrevolución, de intereses materiales y emocionales, de tensiones entre las aspiraciones y los logros. Es novela política y de aventuras, y más que eso. El timonel y las tinieblas son dos presencias constantes en la obra de Conrad; y, en Nostromo, alrededor del tesoro oculto se estructura un compromiso entre el orden y caos, internos en la acción aventurera que vertebra la narración, la vigorosa humanidad de Nostromo, que poseedor de \'la propia fuerza del pueblo\', \'gobierna desde dentro\': del pueblo, y desde dentro del hombre mismo.','libros/Nostromo/nostromo.jpg',17),(57,'Grandes esperanzas',13062.00,3,1,'Grandes esperanzas es uno de los títulos más célebres del gran autor inglés. Publicado originalmente en 1860, narra la historia de Pip, un joven huérfano y miedoso, cuyo humilde destino se ve agraciado por un benefactor inesperado que cambiará el sino de su vida y hará de él un caballero. Una maravillosa novela de aprendizaje y una magistral galería de protagonistas que trazan un acabado retrato de época, al mismo tiempo que una honda reflexión sobre las constantes de la condición humana. La realidad de la vida cotidiana en Inglaterra y la fantasía se dan la mano, mostrándonos un mundo extraordinariamente humano y detallista y una peculiar psicología de los personajes','libros/Grandes esperanzas/great-expectations.jpg',18),(58,'Jacques the Fatalist',7830.00,5,1,'acques el fatalista pone en juego varias historias dentro de la historia, algunas paralelas, otras convergentes, pero todas magistralmente articuladas. Todas ellas se insertan en un universo donde existen las paradojas, el humor, la ironía, la crítica, la filosofía de la vida cotidiana y la filosofía universal.\"','libros/Jacques the Fatalist/jacques-the-fatalist.jpg',19),(60,'Berlin Alexanderplatz',18311.00,13,1,'Berlín Alexanderplatz aparece en 1929. Su éxito es extraordinario y, en pocos años, alcanza cuarenta y cinco ediciones y se traduce a varios idiomas. La novela se consideró una exaltación de Berlín, ciudad que el autor, por su profesión de médico, conocía muy bien. Los ojos de Döblin (y sus cuadernos) registran todos los detalles de la geografía berlinesa, pero como narrador omnisciente, Döblin interviene en la acción y comenta lo que ocurre. Fondo y forma se funde en un libro desconcertante y abierto a la interpretación.','libros/Berlin Alexanderplatz/berlin-alexanderplatz.jpg',20),(61,'Crimen y castigo',12900.00,12,1,'l joven Rodión Raskólnikov, antiguo estudiante, arrastra una existencia precaria en San Petersburgo. Cuando recibe una carta anunciándole la visita de su madre y su hermana en relación con los súbitos planes de boda de esta última, las fantasías de acabar con sus problemas a través del asesinato de la vieja prestamista a la cual suele recurrir van tomando cuerpo en su voluntad. Crimen y castigo (1866) es posiblemente la obra más lograda del autor. En ella, sirviéndose de una trama y de unos personajes que reúnen los mejores ingredientes de la novela del siglo XIX, se plantea el problema de la justificación o no de los actos, de la conciencia y de la culpa. Fiódor Dostoyevski (1821-1881) es, junto con Lev Tolstói, el gran novelista ruso del siglo XIX. Su vida y su creación literaria sufrieron un cambio radical después de que en 1849 fuera detenido y condenado a muerte, pena que se le conmutó en el último instante, por sus actividades contra el zar.','libros/Crimen y castigo/crime-and-punishment.jpg',21),(62,'El idiota',12700.00,1,1,'Proveniente de un establecimiento de salud en Suiza donde un doctor le ha tratado una enfermedad no concretada, el joven príncipe Myshkin (persona esencialmente buena y sin ninguna malicia) regresa a Rusia sin un rublo con el fin de hallar cobijo o ayuda en algunos parientes lejanos.','libros/El idiota/the-idiot.jpg',21),(63,'Los poseídos',3570.00,3,1,'El horrible crimen perpetrado en Moscú a finales de 1869 siguiendo órdenes del nihilista Nechayev, seguidor de Bakunin, fue utilizado por F.M. Dostoyevski (1821-1881) para construir la trama argumental y perfilar los caracteres de los principales personajes de Los demonios. Entre ellos destaca con fuerza Nikolai Stavrogin, figura atormentada que casi un siglo después habría de fascinar a Albert Camus y que introduce en la novela una dimensión teológica y metafísica que la lleva mucho más allá de la mera reconstrucción de la historia o de la diatriba política, propiciando el salto cualitativo que hace de esta obra sin duda una las más destacadas del gran autor ruso.','libros/Los poseídos/the-possessed.jpg',21),(64,'Los hermanos Karamazov',7624.00,5,1,'En Los hermanos Karamázov, última obra y síntesis monumental de su pensamiento y de su arte, desarrolla su íntimo convencimiento de la necesidad de un cambio radical en los destinos sociales y morales de la humanidad. El autor plasma un trágico cuadro de la sociedad de su tiempo y denuncia la corrupción engendrada por el poder del dinero, las pasiones incontroladas, el egoísmo y la ignominia espiritual. Esta novela -la última obra del gran escritor- expone un cuadro acabado de la sociedad rusa de mediados del siglo XIX. Dostoievski es el maestro por excelencia en pintar con palabras cómo las personas establecen relaciones perversas, se manipulan y corrompen por dinero, y manifiestan pasiones bestiales. La muerte de Karamazov -un terrateniente cruel y cínico- hace recaer la sospecha sobre dos de sus hijos, que tienen más de un motivo para odiar a su padre. El tercer hijo, Aliosha, bondadoso y puro, está libre de todo cargo y se proyecta hacia el futuro. En esta novela se resume la preocupación filosófica y religiosa de Dostoievski: la hermandad universal, la salida de una Rusia \'bárbara\' y la recuperación de un verdadero sentimiento religioso.','libros/Los hermanos Karamazov/the-brothers-karamazov.jpg',21),(65,'Middlemarch',17622.00,5,6,'Dorothea Brooke, a los diecinueve años, ha recibido \'una educación para jovencitas comparable a las cavilaciones y opiniones de un ratón pensante\', pero, activa e idealista, enamorada de un sesudo erudito en temas mitológicos, desea, \'pobre criatura, ser sabia también ella\'. Con esa altitud de miras contrae matrimonio… y el matrimonio es un fracaso.Tertius Lydgate, por su parte, joven médico emprendedor, anhela convertir la provinciana ciudad de Middlemarch a la \'cultura científica\' desafiando prejuicios e implantando reformas: a la bella Rosamond Vincy el talento del joven le suena a \'una condecoración en la solapa o un ilustrísimo delante del nombre\' y está convencida de que casándose con él accederá a una gloriosa vida social. También su matrimonio es un fracaso. Y, en tercer término, Fred Vincy, el muchacho superfluo y sin vocación, y Mary Garth, la muchacha hacendosa y prudente, se gustan, se separan, se ponen a prueba y se vuelven a encontrar antes de consagrar ese vínculo al que solo la experiencia y la resistencia parecen garantizar la fortuna y la felicidad.  Middlemarch (1871-1872) es la historia de tres parejas sujetas a los frágiles hilos del saber y del error, entretejida con la crónica minuciosa de los destinos de toda una comunidad en una época de cambios y reacción.','libros/Middlemarch/middlemarch.jpg',22),(66,'El hombre invisible',18604.00,7,1,'El hombre invisible, acogida ya en sus orígenes como una novela excepcional, ha rebasado el marco específico de la narrativa destinada a subrayar la trágica situación de los negros en la sociedad americana, para pasar a figurar entre los clásicos de la literatura en lengua inglesa y las obras maestras de nuestro tiempo.','libros/El hombre invisible/invisible-man.jpg',23),(67,'Medea',4500.00,3,10,'Medea, que se representó en 431 a.C., es seguramente la obra maestra de Eurípides. Jasón, esposo de Medea y padre de sus hijos, se dispone a repudiarla y a casarse con la hija de Creonte, rey de Corinto. Medea, despechada y colérica, se vengará: simula haber sido convencida por Jasón y envía a sus hijos con ricos regalos para la novia al palacio de Creonte; pero esos regalos contienen un conjuro mortal que acaba con Creonte y su hija primero y luego, para agravar la desgracia de Jasón, con los hijos de éste, que son los suyos propios. Medea muestra hasta qué extremos aberrantes pueden llegar las pasiones desatadas: según Lesky, en ninguna otra creación del teatro griego se han presentado con tanta nitidez las fuerzas oscuras e irracionales que pueden brotar del corazón humano.','libros/Medea/medea.jpg',24),(68,'Romancero gitano',4500.00,7,9,'El Romancero gitano es una obra poética de Federico García Lorca, publicada en 1928. Está compuesta por dieciocho romances con temas como la noche, la muerte, el cielo, la luna. Todos los poemas tienen algo en común, tratan de la cultura gitana. Presenta una gran síntesis entre la poesía popular y la alta, transcurre entre dos motivos centrales, Andalucía y los gitanos, tratados de manera metafórica y mítica. La obra refleja las penas de un pueblo que vive al margen de la sociedad y que se siente perseguido por los representantes de la autoridad, y por su lucha contra esa autoridad. Sin embargo, el propio García Lorca señala que su interés se centra no en describir una situación concreta, sino en el choque que se da una y otra vez entre fuerzas encontradas: en un poema que describe la pugna entre la Guardia Civil y los gitanos, llamando a estos bandos respectivamente \'romanos\' y \'cartagineses\', para dar a entender esa permanencia del conflicto.','libros/Romancero gitano/gypsy-ballads.jpg',27),(69,'Cien años de soledad',8700.00,10,1,'100 años de soledad cuenta la historia de la familia Buendía, ubicada en el pueblo de Macondo en algún lugar de América del centro-sur. Por siete generaciones está marcada una continua soledad en diversos matices; con argumentos mágicos, reales y fantásticos.','libros/Cien años de soledad/one-hundred-years-of-solitude.jpg',28),(70,'Amor en los tiempos del cólera',13744.00,11,1,'El amor en los tiempos del cólera relata la historia de amor entre Fermina Daza y Florentino Ariza. Un amor que tendrá que enfrentarse al tiempo pero que no morirá. Gabriel García Márquez cuenta, con la misma maestría que en otras obras, como se conocen Fermina y Florentino, como se separan y como se vuelven a unir. La forma en la que escribe hace que los diálogos sean innecesarios y, poco a poco, nos introduce en las vidas de los dos personaje, sin importarle, en ocasiones, dar saltos en el tiempo. La historia comienza en un pequeño pueblo caribeño donde se nos relata la muerte de Jeremiah de Saint-Amour y como se enfrenta a ella su amigo, el doctor Juvenal Urbino. Tras esto se nos presenta al matrimonio que componen el doctor y Fermina Daza, una pareja anciana y distinguida que se ve bruscamente separada cuando el doctor fallece tras caerse desde una escalera. Al final del funeral del esposo Fermina Daza recibe la visita inesperada de Florentino Ariza que le confiesa que lleva esperando ese momento durante más de medio siglo y que siempre la ha amado y la amará.  La mujer lo despide bruscamente pero cuando este se marcha no puede evitar dejar de pensar en él.','libros/Amor en los tiempos del cólera/love-in-the-time-of-cholera.jpg',28),(71,'Fausto',3800.00,7,10,'Fausto es un hombre sabio insatisfecho por la limitación de su conocimiento e incapaz de ser feliz. Entonces, se le aparece Mefistófeles para ofrecerle los placeres de la vida y realiza con él un pacto en el que accede a venderle al Diablo su alma a cambio de juventud hasta que muera.','libros/Fausto/faust.jpg',29),(72,'Almas muertas',8050.00,8,1,'Un pequeño terrateniente, Pável Ivánovich Chíchikov, se dedica a comprar campesinos muertos para registrarlos como vivos y conseguir así las tierras que se concedían a aquellos que poseyeran un cierto número de siervos.','libros/Almas muertas/dead-souls.jpg',30),(73,'El tambor de hojalata',23559.00,6,11,'La novela es contada desde la perspectiva de su protagonista,Oscar Matzerath, un enano deforme que voluntariamente decidió dejar de crecer al cumplir los tres años. Nos cuenta su historia desde la habitación de un sanatorio y nos lleva de la mano para descubrir una Alemania asolada por el nazismo y la intolerancia.','libros/El tambor de hojalata/the-tin-drum.jpg',31),(74,'Hambre',5990.00,4,1,'El protagonista de Hambre no tiene nombre, no tiene edad, no sabemos nada de su origen o de su familia. Es un hombre sin pasado, arrancado, comouna planta, de su contexto y lanzado al anonimato y la hostilidad de la gran ciudad. Una ciudad, una sociedad, éstas en las que nos movemos, donde el individuo siente con más fuerza su soledad en medio de la multitud, y donde, si queremos comprender a la persona, habremos de prestar atención, como el propio Hamsun decía, a los \'secretos movimientos que se realizan inadvertidos en lugares apartados de la mente, de la anarquía imprevisible de las percepciones, de la sutil vida de la fantasía que se esconde bajo la lupa, de esos devaneos sin rumbo que emprenden el pensamiento y el sentimiento, viajes aún no hollados, que se realizan con la mente y el corazón, extrañas actividades nerviosas, murmullos de la sangre, plegarias de huesos, toda la vida interior del inconsciente\'.','libros/Hambre/hunger.jpg',33),(75,'El viejo y el mar',4799.00,9,1,'El viejo y el mar es uno de los relatos más bellos que jamás se han escrito. En la cúspide de su maestría, Hemingway alumbró una historia en cuya sencillez vibra una inagotable emoción: en Cuba, un viejo pescador, ya en el crepúsculo de su vida, pobre y sin suerte, cansado de regresar cada día sin pesca, emprende una última y arriesgada travesía. Cuando al fin logre dar con una gran pieza, tendrá que luchar contra ella denodadamente.  Y el regreso a puerto, con el acoso de los elementos y los tiburones, se convierte en una última prueba. Como un rey mendigo, aureolado por su imbatible dignidad, el viejo pescador culmina finalmente su destino.','libros/El viejo y el mar/the-old-man-and-the-sea.jpg',34);
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
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
INSERT INTO `usuario_cliente` VALUES (1,'usuario1','usuario1@example.com','pbkdf2_sha256$600000$64HZPfCwgS3Jeo637SS5Ll$MqEO/23L5SelsSKTQimTgLTY8b4KQ32HX+C0d9NTXrU='),(2,'Juan Paco Pedro DeLaMar','juan.DeLaMar@example.com','pbkdf2_sha256$600000$epQ30g5iivG080FbNxxPkr$rGLGO8jC24TyQ6GQ7fhQoRrNYB0TiBoCG29PtXYsZJI='),(3,'Ivette','ivette@example.com','ispc2024');
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

-- Dump completed on 2024-06-03 16:56:27
