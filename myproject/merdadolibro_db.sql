-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mercadolibro
-- ------------------------------------------------------
-- Server version	8.0.34

CREATE DATABASE  IF NOT EXISTS `mercadolibro` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mercadolibro`;

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoría',7,'add_categoria'),(26,'Can change Categoría',7,'change_categoria'),(27,'Can delete Categoría',7,'delete_categoria'),(28,'Can view Categoría',7,'view_categoria'),(29,'Can add libro',8,'add_libro'),(30,'Can change libro',8,'change_libro'),(31,'Can delete libro',8,'delete_libro'),(32,'Can view libro',8,'view_libro'),(33,'Can add pedido',9,'add_pedido'),(34,'Can change pedido',9,'change_pedido'),(35,'Can delete pedido',9,'delete_pedido'),(36,'Can view pedido',9,'view_pedido'),(37,'Can add autor',10,'add_autor'),(38,'Can change autor',10,'change_autor'),(39,'Can delete autor',10,'delete_autor'),(40,'Can view autor',10,'view_autor'),(41,'Can add detalle pedido',11,'add_detallepedido'),(42,'Can change detalle pedido',11,'change_detallepedido'),(43,'Can delete detalle pedido',11,'delete_detallepedido'),(44,'Can view detalle pedido',11,'view_detallepedido'),(45,'Can add direccion',12,'add_direccion'),(46,'Can change direccion',12,'change_direccion'),(47,'Can delete direccion',12,'delete_direccion'),(48,'Can view direccion',12,'view_direccion'),(49,'Can add historial pedido',13,'add_historialpedido'),(50,'Can change historial pedido',13,'change_historialpedido'),(51,'Can delete historial pedido',13,'delete_historialpedido'),(52,'Can view historial pedido',13,'view_historialpedido'),(53,'Can add libro autor',14,'add_libroautor'),(54,'Can change libro autor',14,'change_libroautor'),(55,'Can delete libro autor',14,'delete_libroautor'),(56,'Can view libro autor',14,'view_libroautor'),(57,'Can add usuario administrador',15,'add_usuarioadministrador'),(58,'Can change usuario administrador',15,'change_usuarioadministrador'),(59,'Can delete usuario administrador',15,'delete_usuarioadministrador'),(60,'Can view usuario administrador',15,'view_usuarioadministrador'),(61,'Can add usuario cliente',16,'add_usuariocliente'),(62,'Can change usuario cliente',16,'change_usuariocliente'),(63,'Can delete usuario cliente',16,'delete_usuariocliente'),(64,'Can view usuario cliente',16,'view_usuariocliente'),(65,'Can add forma envio',17,'add_formaenvio'),(66,'Can change forma envio',17,'change_formaenvio'),(67,'Can delete forma envio',17,'delete_formaenvio'),(68,'Can view forma envio',17,'view_formaenvio'),(69,'Can add forma pago',18,'add_formapago'),(70,'Can change forma pago',18,'change_formapago'),(71,'Can delete forma pago',18,'delete_formapago'),(72,'Can view forma pago',18,'view_formapago'),(73,'Can add reseña',19,'add_reseña'),(74,'Can change reseña',19,'change_reseña'),(75,'Can delete reseña',19,'delete_reseña'),(76,'Can view reseña',19,'view_reseña');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$2SpQKHYs4DI6iOp7HA1gxD$l6knia9eklb8GBA4n2HVfDwOvZGsSInlzL+e18je4ro=','2024-05-21 15:03:30.555086',1,'codesquad','','','',1,1,'2024-05-21 14:51:15.678085'),(2,'pbkdf2_sha256$600000$95e4Xehz7Nmj5eaP5LJHBl$DKpT8RhBP+3h2fFEJfkeqm49BOGsejon1BDfoJAd5VI=','2024-05-22 15:19:28.488582',1,'ivette','','','',1,1,'2024-05-22 15:18:16.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'ecommerce','autor'),(7,'ecommerce','categoria'),(11,'ecommerce','detallepedido'),(12,'ecommerce','direccion'),(17,'ecommerce','formaenvio'),(18,'ecommerce','formapago'),(13,'ecommerce','historialpedido'),(8,'ecommerce','libro'),(14,'ecommerce','libroautor'),(9,'ecommerce','pedido'),(19,'ecommerce','reseña'),(15,'ecommerce','usuarioadministrador'),(16,'ecommerce','usuariocliente'),(6,'sessions','session');
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
INSERT INTO `django_session` VALUES ('a0hzik9l4nfjqrve06cbefhbr3deyibt','.eJxVjEsOwjAMBe-SNYpMGhuHJXvOUNlOQguolfpZIe4OlbqA7ZuZ93KtrEvXrnOZ2j67swvu8Lup2KMMG8h3GW6jt3FYpl79pvidzv465vK87O7fQSdz960hKFNCqNhoPpEhGGNNSkyQqxEUiRLrkdmUAZA41UrRkLWBgMG9P9UQN1I:1s9nkW:wL5omN-aaV5FhRw9Q9t6gydHPRzVp_A6slTf4jHOD80','2024-06-05 15:19:28.509005'),('oe7cjrckw510jcidw4cekdlr51p4raru','.eJxVjMsOwiAQRf-FtSED1A64dN9vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yguQonT78YUHqnuIN6p3poMra7LzHJX5EG7nFpMz-vh_h0U6uVbg1MhnzENyiAaykEN0dpsR0SXLbLmGMdMFhNochrYoLIJYMgakAOJ9wfXbDet:1s9Qr8:XGLETXBtIeuNsMM89hiX-LKYphViYeXfY6vHHR6N7tU','2024-06-04 14:52:46.181752');
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
  `descripcion` varchar(100) NOT NULL,
  `portada` varchar(100) NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` (`categoria_id`),
  CONSTRAINT `libro_categoria_id_f3d2070e_fk_categoria_id_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Things Fall Apart',38599.00,4,1,'La novela narra la historia de Okonkwo, un líder tribal en Nigeria, y cómo su vida se ve afectada po',''),(2,'Fairy tales',8342.00,15,2,'Hans Christian Andersen 1805-1875 nació en Odense, hijo de un zapatero. Sus primeros años fueron des',''),(3,'La divina comedia',9270.00,13,3,'Dante, alter ego del poeta, se encuentra perdido en medio de una selva oscura. Al amanecer, llega a ',''),(4,'The Epic Of Gilgamesh',21319.00,7,1,'La histórica traducción de N. K. Sandars de una de las primeras y más grandes obras de la literatura',''),(5,'El libro de Job',500.00,9,4,'Es un libro que se encuentra en la sección Ketuvim (\\\"Escritos\\\") de la Biblia hebrea (Tanakh) y el ',''),(6,'Las mil y una noches',59250.00,14,3,'Es una colección de cuentos populares de Oriente Medio compilados en lengua árabe durante la Edad de',''),(7,'Saga de Njál',12250.00,6,5,'La saga trata sobre un proceso de enemistades sangrientas en la Commonwealth de Islandia , mostrando',''),(8,'Orgullo y prejuicio',8320.00,7,6,'A principios del siglo XIX, la familia Bennet vivía en su finca de Longbourn, situada cerca del pueb',''),(9,'Le Père Goriot',41699.00,5,1,'La novela comienza con una descripción ampliada de la Maison Vauquer, una pensión en la rue Neuve-Sa',''),(10,'Molloy, Malone Dies, The Unnamable, the trilogy',26265.00,8,1,'En su primera aparición, el libro trata de dos personajes diferentes, ambos con monólogos interiores',''),(11,'The Decameron',7125.00,3,7,'La obra se compone en total de 100 relatos que transcurren en un lapso de diez días y que son narrad',''),(12,'Ficciones',9629.00,12,8,'Este cuento narra la historia de la cicatriz de un hombre y se contextualiza en dos momentos históri',''),(13,'Cumbres borrascosas',7839.00,10,1,'El argumento de la novela gira en torno a las pasiones, el desprecio y la venganza. Adoptado por la ',''),(14,'El extranjero',13114.00,9,1,'La novela nos presenta a Meursault, un hombre franco-argelino que se muestra pasivo y ajeno al mundo',''),(15,'Los poemas póstumos',26363.00,6,9,'Sin descripción',''),(16,'Viaje al fin de la noche',12150.00,11,1,'Ferdinand Bardamu es un joven estudiante de medicina parisino que, en un arranque de entusiasmo, se ',''),(17,'Don Quijote De La Mancha',21690.00,13,1,'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobr',''),(18,'Los cuentos de Canterbury',6000.00,18,5,'Los Cuentos de Canterbury es una colección de historias, contadas por diferentes peregrinos en su ca',''),(19,'Cuentos',22344.00,9,1,'Esta antología no sigue un orden cronológico, sino que propone un recorrido por cierto tipo de cuent',''),(20,'Nostromo',16889.00,8,1,'Muchos consideran Nostromo la más grande de las novelas de Conrad; y es, la que ofrece la más variad',''),(21,'Grandes esperanzas',13062.00,5,1,'Grandes esperanzas es uno de los títulos más célebres del gran autor inglés. Publicado originalmente',''),(22,'Jacques the Fatalist',7830.00,10,1,'Jacques el fatalista pone en juego varias historias dentro de la historia, algunas paralelas, otras ',''),(23,'Berlin Alexanderplatz',18311.00,3,1,'Berlín Alexanderplatz aparece en 1929. Su éxito es extraordinario y, en pocos años, alcanza cuarenta',''),(24,'Crimen y castigo',12900.00,6,1,'El joven Rodión Raskólnikov, antiguo estudiante, arrastra una existencia precaria en San Petersburgo',''),(25,'El idiota',7600.00,7,1,'Proveniente de un establecimiento de salud en Suiza donde un doctor le ha tratado una enfermedad no ',''),(26,'Los poseídos',3570.00,16,1,'El horrible crimen perpetrado en Moscú a finales de 1869 siguiendo órdenes del nihilista Nechayev, s',''),(27,'Los hermanos Karamazov',7624.00,8,1,'En Los hermanos Karamázov, última obra y síntesis monumental de su pensamiento y de su arte, desarro',''),(28,'Middlemarch',17622.00,6,6,'Dorothea Brooke, a los diecinueve años, ha recibido \'una educación para jovencitas comparable a las ',''),(29,'El hombre invisible',18604.00,7,1,'El hombre invisible, acogida ya en sus orígenes como una novela excepcional, ha rebasado el marco es',''),(30,'Medea',4500.00,20,10,'Medea, que se representó en 431 a.C., es seguramente la obra maestra de Eurípides. Jasón, esposo de ','');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `autor_id` int NOT NULL,
  `libro_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libro_autor_libro_id_autor_id_26e91813_uniq` (`libro_id`,`autor_id`),
  KEY `libro_autor_autor_id_c1bb0e75_fk_autor_id_autor` (`autor_id`),
  CONSTRAINT `libro_autor_autor_id_c1bb0e75_fk_autor_id_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_autor_libro_id_efbd80c6_fk_libro_id_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,4,5),(6,4,6),(7,4,7),(8,5,8),(9,6,9),(10,7,10),(11,8,11),(12,9,12),(13,10,13),(14,11,14),(15,12,15),(16,13,16),(17,14,17),(18,15,18),(19,16,19),(20,17,20),(21,18,21),(22,19,22),(23,20,23),(24,21,24),(25,21,25),(26,21,26),(27,21,27),(28,22,28),(29,23,29),(30,24,30);
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
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

-- Dump completed on 2024-05-23 15:26:40
