-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: socorritomixcoacst.mysql.pythonanywhere-services.com    Database: socorritomixcoac$SOCORRITO_MIXCOAC_ST
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cliente',7,'add_cliente'),(26,'Can change cliente',7,'change_cliente'),(27,'Can delete cliente',7,'delete_cliente'),(28,'Can view cliente',7,'view_cliente'),(29,'Can add orden',8,'add_orden'),(30,'Can change orden',8,'change_orden'),(31,'Can delete orden',8,'delete_orden'),(32,'Can view orden',8,'view_orden'),(33,'Can add platillo',9,'add_platillo'),(34,'Can change platillo',9,'change_platillo'),(35,'Can delete platillo',9,'delete_platillo'),(36,'Can view platillo',9,'view_platillo'),(37,'Can add orden platillo',10,'add_ordenplatillo'),(38,'Can change orden platillo',10,'change_ordenplatillo'),(39,'Can delete orden platillo',10,'delete_ordenplatillo'),(40,'Can view orden platillo',10,'view_ordenplatillo'),(41,'Can add promocion',11,'add_promocion'),(42,'Can change promocion',11,'change_promocion'),(43,'Can delete promocion',11,'delete_promocion'),(44,'Can view promocion',11,'view_promocion'),(45,'Can add cliente promocion',12,'add_clientepromocion'),(46,'Can change cliente promocion',12,'change_clientepromocion'),(47,'Can delete cliente promocion',12,'delete_clientepromocion'),(48,'Can view cliente promocion',12,'view_clientepromocion'),(49,'Can add menu',13,'add_menu'),(50,'Can change menu',13,'change_menu'),(51,'Can delete menu',13,'delete_menu'),(52,'Can view menu',13,'view_menu'),(53,'Can add platillo menu',14,'add_platillomenu'),(54,'Can change platillo menu',14,'change_platillomenu'),(55,'Can delete platillo menu',14,'delete_platillomenu'),(56,'Can view platillo menu',14,'view_platillomenu'),(57,'Can add usuario',15,'add_usuario'),(58,'Can change usuario',15,'change_usuario'),(59,'Can delete usuario',15,'delete_usuario'),(60,'Can view usuario',15,'view_usuario'),(61,'Can add historial precio',16,'add_historialprecio'),(62,'Can change historial precio',16,'change_historialprecio'),(63,'Can delete historial precio',16,'delete_historialprecio'),(64,'Can view historial precio',16,'view_historialprecio'),(65,'Can add desayuno',17,'add_desayuno'),(66,'Can change desayuno',17,'change_desayuno'),(67,'Can delete desayuno',17,'delete_desayuno'),(68,'Can view desayuno',17,'view_desayuno'),(69,'Can add orden desayuno',18,'add_ordendesayuno'),(70,'Can change orden desayuno',18,'change_ordendesayuno'),(71,'Can delete orden desayuno',18,'delete_ordendesayuno'),(72,'Can view orden desayuno',18,'view_ordendesayuno');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$m7NYrD35N7Kg$AEcCUaUEs0jrtUf1fEiQVJaMvTGFIMgUE3MY3K0RICU=','2021-05-17 23:13:45.405790',1,'socorritomixcoacst','','','desarrollo.socorrito@gmail.com',1,1,'2021-04-10 03:50:27.483117');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-24 18:17:40.271872','2','Día: 2021-04-23, Tipo: CO',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(2,'2021-04-24 18:18:48.228511','3','Día: 2021-04-23, Tipo: CE',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(3,'2021-04-24 18:18:55.703757','1','Día: 2021-04-23, Tipo: DE',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(4,'2021-04-25 14:47:24.735360','130','ID:130 Nombre: Jugo y fruta Tipo: EX Es complemento: False Es constante: False tipo_desayuno: D1',1,'[{\"added\": {}}]',9,1),(5,'2021-05-01 19:44:36.723508','329','Menú: (Día: 2021-05-01, Tipo: CO), Platillo: (ID:141 Nombre: Caldo de pollo con pieza Tipo: EX Es complemento: False Es constante: False), Disponible: False',1,'[{\"added\": {}}]',14,1),(6,'2021-05-01 19:45:57.834895','329','Menú: (Día: 2021-05-01, Tipo: CO), Platillo: (ID:140 Nombre: Caldo de pollo  Tipo: GU Es complemento: False Es constante: False), Disponible: False',2,'[{\"changed\": {\"fields\": [\"platillo\"]}}]',14,1),(7,'2021-05-17 23:14:30.100428','12','Día: 2021-05-16, Tipo: CO',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'socorritomixcoacst','cliente'),(12,'socorritomixcoacst','clientepromocion'),(17,'socorritomixcoacst','desayuno'),(16,'socorritomixcoacst','historialprecio'),(13,'socorritomixcoacst','menu'),(8,'socorritomixcoacst','orden'),(18,'socorritomixcoacst','ordendesayuno'),(10,'socorritomixcoacst','ordenplatillo'),(9,'socorritomixcoacst','platillo'),(14,'socorritomixcoacst','platillomenu'),(11,'socorritomixcoacst','promocion'),(15,'socorritomixcoacst','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-10 03:43:09.418323'),(2,'auth','0001_initial','2021-04-10 03:43:28.163107'),(3,'admin','0001_initial','2021-04-10 03:43:34.329896'),(4,'admin','0002_logentry_remove_auto_add','2021-04-10 03:43:34.424889'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-10 03:43:34.438267'),(6,'contenttypes','0002_remove_content_type_name','2021-04-10 03:43:34.547247'),(7,'auth','0002_alter_permission_name_max_length','2021-04-10 03:43:34.603061'),(8,'auth','0003_alter_user_email_max_length','2021-04-10 03:43:34.657513'),(9,'auth','0004_alter_user_username_opts','2021-04-10 03:43:34.671171'),(10,'auth','0005_alter_user_last_login_null','2021-04-10 03:43:34.717531'),(11,'auth','0006_require_contenttypes_0002','2021-04-10 03:43:34.723536'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-10 03:43:34.737740'),(13,'auth','0008_alter_user_username_max_length','2021-04-10 03:43:34.793204'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-10 03:43:34.851319'),(15,'auth','0010_alter_group_name_max_length','2021-04-10 03:43:34.905739'),(16,'auth','0011_update_proxy_permissions','2021-04-10 03:43:34.931901'),(17,'sessions','0001_initial','2021-04-10 03:43:37.103085'),(18,'socorritomixcoacst','0001_initial','2021-04-10 03:46:59.227557'),(19,'socorritomixcoacst','0002_auto_20210423_2356','2021-04-24 04:56:51.811455'),(20,'socorritomixcoacst','0003_auto_20210517_1620','2021-05-17 21:21:10.068065');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1c12pcziqphlsr709h9tz8mpykq7dwpo','MDExNGY4NmY2YTkzYTY3OTE2MDFjOTM4NGM4N2NkMTU0OGJkMWZjNDp7InRlbGVmb25vIjoiMTM0MjM1MjYyNCIsImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiU2Fsc2EgYXBhcnRlIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQXJyb3oiXSxbIm1lbnUtMS0xIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMiIsIkNhbGRvIGRlIHJlcyJdLFsibWVudS0yLTAiLCJBcnJveiJdLFsibWVudS0yLTEiLCJBcnJveiJdLFsibWVudS0yLTIiLCJDZWNpbmEiXV0sInRvZG9zX29ic2VydmFjaW9uZXNfaW5kaXZpZHVhbGVzIjpbWyJvYnNlcnZhY2lvbmVzLWluZGl2aWR1YWxlcy0xIiwiUmVmcml0b3MiXSxbIm9ic2VydmFjaW9uZXMtaW5kaXZpZHVhbGVzLTIiLCJEZSBsYSBvbGxhIl1dLCJ0b2Rvc19vcmRlbmVzIjpbWyJDb25zb21cdTAwZTkiLCIyIl1dLCJ0b2Rvc19iZWJpZGFzIjpbWyJFeHByZXNzbyIsIjEiXV0sInRvZG9zX2V4dHJhcyI6W1siQXZvY2FkbyBSb2xsIiwiMSJdXSwidG9kb3Nfc3VzaGlzIjpbXSwidG9kb3NfZGVzYXl1bm9zIjpbXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjE1fQ==','2021-05-31 21:25:37.450429'),('24m3ve701z1hzxanikql5mz255rh0fkl','YTU5YzBmOWU0ZjkzZmFiN2RiNjY1YTllYTZmNzMzMzg1YmU2ZDM2Nzp7ImNsaWVudGVfYWN0dWFsIjoxfQ==','2021-05-02 06:40:36.209478'),('6umdz3vavxnhdbjp3rh0d69iiyak7g2q','Y2Q2YzE3MTQzZDZjZDRmYTJlMjQyYmQ3N2JhZjI4YWE4YmQ1ZTQyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwN2Y3NzVhODM3ZDU3NjM3MzY0OTU0YzkxZTRkZTM2OGI0ZjNiIiwiY2xpZW50ZV9hY3R1YWwiOjF9','2021-05-09 05:38:24.362978'),('6wcc3topl5biq1pq3p6s3zdppnzo804p','ZGM1MjgxYjY4MzE2ZmEzOTk0NmIxZDUxNmY2NDIzZWIxMGIxNWE1OTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ2FsZG8gZGUgaGFiYSJdLFsibWVudS0xLTEiLCJFbnNhbGFkYSJdLFsibWVudS0xLTIiLCJTYWxtXHUwMGYzbiBhIGxhIHBsYW5jaGEiXSxbIm1lbnUtMi0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTItMSIsIkVzcGFndWV0dGkiXSxbIm1lbnUtMi0yIiwiQ2FybmUgZGUgcmVzIGVuIHZlcmRlIGNvbiBjYWxhYmF6YXMiXSxbIm1lbnUtMy0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTMtMSIsIkFycm96Il0sWyJtZW51LTMtMiIsIkNhbGRvIGRlIHJlcyJdXSwidG9kb3Nfb3JkZW5lcyI6W10sInRvZG9zX2JlYmlkYXMiOltdLCJ0b2Rvc19leHRyYXMiOltdLCJ0b2Rvc19kZXNheXVub3MiOltdLCJpZF9vcmRlbl9nZW5lcmFkYSI6MTB9','2021-05-08 22:01:15.372848'),('7k0l8xhscb0yet0wcxrdiayahdpriwkd','OWQ4Mzk1OTAxYzFhZTI4ZmZlNTY5YmJiMmRmNWE3MWY3ODNlOTNlZjp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiQ29uIHRvZG8iLCJ0b2Rvc19tZW51cyI6W1sibWVudS0xLTAiLCJDb25zb21cdTAwZTkiXSxbIm1lbnUtMS0xIiwiQXJyb3oiXSxbIm1lbnUtMS0yIiwiQ2FsZG8gZGUgcmVzIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwN2Y3NzVhODM3ZDU3NjM3MzY0OTU0YzkxZTRkZTM2OGI0ZjNiIiwidG9kb3NfZGVzYXl1bm9zIjpbXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjksInRlbGVmb25vIjoiNzY1MTI2MzU3NSJ9','2021-05-15 17:33:59.714590'),('i6ntppeqbxby9xkrfurzdfy9rrm6di2d','M2MzYzQyMTk4ZWZhNDVlZTc1YTU2NWUwYjhlZjhmYjU3OTA0YmJhMTp7ImNsaWVudGVfYWN0dWFsIjoyLCJvYnNlcnZhY2lvbmVzIjoibXVjaGFzIHNlcnZpbGxldGFzIHBvciBmYXZvciIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNyZW1hIGRlIGJyb2NvbGkiXSxbIm1lbnUtMS0xIiwiRW5zYWxhZGEiXSxbIm1lbnUtMS0yIiwiRW5jaGlsYWRhcyBkZSBtb2xlIl0sWyJtZW51LTItMCIsIkNvbnNvbVx1MDBlOSJdLFsibWVudS0yLTEiLCJFbnNhbGFkYSJdLFsibWVudS0yLTIiLCJIdWV2b3MgY29uIGVqb3RlcyJdLFsibWVudS0zLTAiLCJDb25zb21cdTAwZTkiXSxbIm1lbnUtMy0xIiwiQ29kaXRvIGEgbGEgY3JlbWEiXSxbIm1lbnUtMy0yIiwiSHVldm9zIEFsIGd1c3RvIl1dLCJ0b2Rvc19vcmRlbmVzIjpbWyJBbGFtYnJlIGRlIHBvbGxvIiwiMyJdXSwidG9kb3NfYmViaWRhcyI6W1siQWd1YSBwYXJhIG5lc2NhZmUiLCIzIl0sWyJDYWZcdTAwZTkgYW1lcmljYW5vIiwiMiJdLFsiQ2FmXHUwMGU5IGNvbiBsZWNoZSIsIjEiXSxbIkNhZlx1MDBlOSBkZSBvbGxhIiwiMiJdLFsiQ2FwdWNoaW5vIiwiMiJdLFsiQ2hvY29sYXRlIiwiMiJdLFsiRXhwcmVzc28iLCIyIl0sWyJKdWdvIiwiMiJdLFsiTGVjaGUgQ2FsaWVudGUiLCIyIl0sWyJUXHUwMGU5IiwiMSJdXSwidG9kb3NfZXh0cmFzIjpbWyJDZXJlYWwgY29uIExlY2hlIiwiMiJdLFsiRnJ1dGEiLCIzIl0sWyJNb2xsZXRlcyIsIjIiXSxbIlNhbGNoaXB1bHBvcyIsIjIiXSxbIlNvcGVzIGNvbiBwb2xsbyIsIjIiXV0sInRvZG9zX2Rlc2F5dW5vcyI6W1siMSIsIlBhcXVldGUgMSJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiSG90Y2FrZXMiXSxbIjFfMyIsIkNob2NvbGF0ZSJdLFsiMiIsIlBhcXVldGUgMiJdLFsiMl8xIiwiRnJ1dGEiXSxbIjJfMiIsIkh1ZXZvcyBBbCBndXN0byJdLFsiMl8zIiwiQ2FmXHUwMGU5IGFtZXJpY2FubyJdXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjJ9','2021-05-08 05:27:05.445369'),('kisd1kybyyc5jcc8e0sm5vu8ff6oz4ds','ZmJmNjc5ZjkzYjc3MzNhZjJiOTkwODk0MTcwOGM0MTdlZjMzYWUwNjp7ImNsaWVudGVfYWN0dWFsIjoyLCJvYnNlcnZhY2lvbmVzIjoiRXN0byIsInRvZG9zX21lbnVzIjpbXSwidG9kb3Nfb3JkZW5lcyI6W1siQXJyb3oiLCIxIl0sWyJDb2RpdG8gYSBsYSBjcmVtYSIsIjEiXSxbIlBvbGxvIGNvbiBtb2xlIiwiMSJdLFsiRW5jaGlsYWRhcyBkZSBtb2xlIiwiMSJdXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W119','2021-04-24 16:54:49.224390'),('lm53bmcq9v73zdjentpp5mgbqhdvulq1','MjAyOGM5N2VjMmZhN2ZhNDIyZDcxOGIyNGZmNDFlMGViYWJkZTRlNzp7InRlbGVmb25vIjoiNTU1NTkzODU4MSIsImNsaWVudGVfYWN0dWFsIjo2LCJvYnNlcnZhY2lvbmVzIjoiT2xsYSIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNvbnNvbVx1MDBlOSJdLFsibWVudS0xLTEiLCJBcnJveiJdLFsibWVudS0xLTIiLCJBcnJhY2hlcmEiXSxbIm1lbnUtMi0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTItMSIsIkFycm96Il0sWyJtZW51LTItMiIsIlRvcnRhcyBkZSBwYXBhIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W10sImlkX29yZGVuX2dlbmVyYWRhIjoxNH0=','2021-05-17 12:41:32.568022'),('qerztvcq9wgqp5857r5h15s9m2qocpd0','ZDc2MzA1MDNhYTIxMGFmMDk0YzJkYjhjMjhjMTA0MzE5MWVlZjZlMDp7ImNsaWVudGVfYWN0dWFsIjoxLCJ0ZWxlZm9ubyI6IjQyMzQyMzQyMzIiLCJvYnNlcnZhY2lvbmVzIjoiU2Fsc2EgdmVyZGUiLCJ0b2Rvc19tZW51cyI6W1sibWVudS0xLTAiLCJDb25zb21cdTAwZTkiXSxbIm1lbnUtMS0xIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMiIsIkNlY2luYSJdXSwidG9kb3Nfb2JzZXJ2YWNpb25lc19pbmRpdmlkdWFsZXMiOltbIm9ic2VydmFjaW9uZXMtaW5kaXZpZHVhbGVzLTEiLCJGcmlqb2xlcyByZWZyaXRvcyJdXSwidG9kb3Nfb3JkZW5lcyI6W1siQ29uc29tXHUwMGU5IiwiMiJdXSwidG9kb3NfYmViaWRhcyI6W1siQ2VydmV6YSIsIjIiXV0sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX3N1c2hpcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W10sImlkX29yZGVuX2dlbmVyYWRhIjoxNiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjNjA3Zjc3NWE4MzdkNTc2MzczNjQ5NTRjOTFlNGRlMzY4YjRmM2IifQ==','2021-05-31 23:16:29.074096'),('qfee0knej7uewncruvf2hgtruas8o0cd','YjExNTYzNDJmZjdmMzkzY2I0OGRjOTVmZTE1ZTNkY2IwOTBjYjJlYzp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiY29uIGhhcnRvIGNoaWxlIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkNvZGl0byBhIGxhIGNyZW1hIl0sWyJtZW51LTEtMiIsIkNoaWxlIHJlbGxlbm8gZGUgcXVlc28iXV0sInRvZG9zX29yZGVuZXMiOltdLCJ0b2Rvc19iZWJpZGFzIjpbXSwidG9kb3NfZXh0cmFzIjpbXSwidG9kb3NfZGVzYXl1bm9zIjpbWyIxIiwiUGFxdWV0ZSBpbmZhbnRpbCJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiU2FsY2hpcHVscG9zIl0sWyIyIiwiUGFxdWV0ZSA1Il0sWyIyXzEiLCJKdWdvIl0sWyIyXzIiLCJQZWNodWdhIGFzYWRhIl0sWyIyXzMiLCJDaG9jb2xhdGUiXV0sImlkX29yZGVuX2dlbmVyYWRhIjozfQ==','2021-05-08 05:32:19.660420'),('s71haqfj0f0r8cw61uutkuenunwad3fa','NGRmMTM3YzMyM2RmMzZlYTVjYzZiNDg0MDJmMmZjNmJjZThiOTc5NDp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkFycm96Il0sWyJtZW51LTEtMiIsIkFsYW1icmUgZGUgcG9sbG8iXSxbIm1lbnUtMi0wIiwiQ2FsZG8gZGUgaGFiYSJdLFsibWVudS0yLTEiLCJFc3BhZ3VldHRpIl0sWyJtZW51LTItMiIsIkNodWxldGEgYWh1bWFkYSBhIGxhIHBsYW5jaGEiXV0sInRvZG9zX29yZGVuZXMiOltbIkFsYW1icmUgZGUgcG9sbG8iLCIxIl1dLCJ0b2Rvc19iZWJpZGFzIjpbWyJBZ3VhIGRlIHNhYm9yIiwiMSJdXSwidG9kb3NfZXh0cmFzIjpbWyIzIE1vbGxldGVzIiwiMSJdXSwidG9kb3NfZGVzYXl1bm9zIjpbWyIxIiwiUGFxdWV0ZSAxIl0sWyIxXzEiLCJKdWdvIl0sWyIxXzIiLCJTb3BlcyBjb24gcG9sbG8iXSxbIjFfMyIsIkNhZlx1MDBlOSBkZSBvbGxhIl1dLCJpZF9vcmRlbl9nZW5lcmFkYSI6MTF9','2021-05-09 03:00:56.812484'),('sybncfe8v3lmsi8823426oskhnsd0psx','NGEwMDc0MGMwYjhkYTk0ZDAxYmQ1OGQ0OGMyMjY2OTAxZDEwYzI4Mjp7ImNsaWVudGVfYWN0dWFsIjozLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vcmRlbmVzIjpbWyJBcnJveiIsIjEiXSxbIkVuc2FsYWRhIiwiMSJdLFsiRW5jaGlsYWRhcyBkZSBtb2xlIiwiMSJdXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W119','2021-04-24 22:26:51.533019'),('uanimrzcfdhfh6ncoeijplzxryhza9d8','ODZmZTg2N2RjMTVlOTc1MjNjMDkwODQ0MGM2NGZlNmUwMzNiNmEzNjp7ImNsaWVudGVfYWN0dWFsIjozLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W1siMSIsIlBhcXVldGUgMSJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiU29wZXMgY29uIHBvbGxvIl0sWyIxXzMiLCJDYXB1Y2hpbm8iXSxbIjIiLCJQYXF1ZXRlIDIiXSxbIjJfMSIsIkZydXRhIl0sWyIyXzIiLCJIdWV2b3MgQWwgZ3VzdG8iXSxbIjJfMyIsIkNhZlx1MDBlOSBhbWVyaWNhbm8iXV0sImlkX29yZGVuX2dlbmVyYWRhIjo3fQ==','2021-05-08 05:48:50.056754'),('xe3y7r66lyqoe8t065di5pdu6z84lp16','OTA1NjM0ZTA5YTE1ZDlmOTc1ZWY4Zjc4MWFlY2VmNjVhMGI2YmZhZTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiT2JzZXJ2YWNpb25lcyIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNyZW1hIGRlIGJyb2NvbGkiXSxbIm1lbnUtMS0xIiwiQ29kaXRvIGEgbGEgY3JlbWEiXSxbIm1lbnUtMS0yIiwiQ2h1bGV0YSBhaHVtYWRhIGEgbGEgcGxhbmNoYSJdXSwidG9kb3Nfb3JkZW5lcyI6W10sInRvZG9zX2JlYmlkYXMiOltdLCJ0b2Rvc19leHRyYXMiOltdLCJ0b2Rvc19kZXNheXVub3MiOltbIjEiLCJQYXF1ZXRlIDEiXSxbIjFfMSIsIkp1Z28iXSxbIjFfMiIsIkhvdGNha2VzIl0sWyIxXzMiLCJDYWZcdTAwZTkgYW1lcmljYW5vIl1dLCJpZF9vcmRlbl9nZW5lcmFkYSI6OCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjNjA3Zjc3NWE4MzdkNTc2MzczNjQ5NTRjOTFlNGRlMzY4YjRmM2IiLCJ0ZWxlZm9ubyI6Ijk1ODc3OCM0NE4ifQ==','2021-05-22 23:35:10.310935'),('zg20yjt0dl6way77atewu40wctw0e42w','Mjk5YjJhMjE0ODA5ZDE3NDdkZmVmZjQ4ODgzMzRhNTM3YjgwNDBiYTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkFycm96Il0sWyJtZW51LTEtMiIsIkNoaWxhcXVpbGVzIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W119','2021-05-08 05:35:48.966811');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_cliente`
--

DROP TABLE IF EXISTS `socorritomixcoacst_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `referencias` varchar(128) DEFAULT NULL,
  `tipo` varchar(2) NOT NULL,
  `telefono_alternativo` varchar(10) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `compras_realizadas` int(11) NOT NULL,
  `ingresos_generados` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_cliente`
--

LOCK TABLES `socorritomixcoacst_cliente` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_cliente` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_cliente` VALUES (1,'Tobias Palacios Reyes','1122334455','calle 13','entre calle 1 y 2','NU','5544332211','2021-04-24',10,2751.1005999999998),(2,'Yuri Gargarin','1231231231','Calle MIxcoac','en el Mercado','NU','1231231231','2021-04-24',1,1103.09172),(3,'El Anton Mendeleiev','5556736309','Rue Morgue','Enfrente de la Iglesia','NU','5568745167','2021-04-24',1,155),(4,'XX XX','5560290470','Guillain 37 Depto 202','Marcar antes de llevar','NU','','2021-04-24',1,390),(5,'Francisco santiago Na','5541443267','Capuchinas 55','San José insurgentes ','NU','','2021-05-01',1,150),(6,'Guadalupe Xx','5534747995','Parroquia 304 del valle','','NU','','2021-05-01',1,675),(7,'Mari ','5538874163','Rosa castilla 161','Molino de rosas','NU','','2021-05-01',0,0),(8,'Guadalupe lozano ','5555938581','Torre de mixcoac A13 de 1103','','NU','','2021-05-01',1,175);
/*!40000 ALTER TABLE `socorritomixcoacst_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_clientepromocion`
--

DROP TABLE IF EXISTS `socorritomixcoacst_clientepromocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_clientepromocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_c_cliente_id_6c7a908f_fk_socorrito` (`cliente_id`),
  KEY `socorritomixcoacst_c_promocion_id_54ce9218_fk_socorrito` (`promocion_id`),
  CONSTRAINT `socorritomixcoacst_c_cliente_id_6c7a908f_fk_socorrito` FOREIGN KEY (`cliente_id`) REFERENCES `socorritomixcoacst_cliente` (`id`),
  CONSTRAINT `socorritomixcoacst_c_promocion_id_54ce9218_fk_socorrito` FOREIGN KEY (`promocion_id`) REFERENCES `socorritomixcoacst_promocion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_clientepromocion`
--

LOCK TABLES `socorritomixcoacst_clientepromocion` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_clientepromocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `socorritomixcoacst_clientepromocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_desayuno`
--

DROP TABLE IF EXISTS `socorritomixcoacst_desayuno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_desayuno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_desayuno`
--

LOCK TABLES `socorritomixcoacst_desayuno` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_desayuno` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_desayuno` VALUES (1,'Paquete 1',60),(2,'Paquete 2',75),(3,'Paquete 3',85),(4,'Paquete 4',90),(5,'Paquete 5',95),(6,'Paquete 6',120),(7,'Paquete infantil',65);
/*!40000 ALTER TABLE `socorritomixcoacst_desayuno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_desayuno_platillos`
--

DROP TABLE IF EXISTS `socorritomixcoacst_desayuno_platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_desayuno_platillos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desayuno_id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socorritomixcoacst_desay_desayuno_id_platillo_id_f7f8c20a_uniq` (`desayuno_id`,`platillo_id`),
  KEY `socorritomixcoacst_d_platillo_id_0a65397d_fk_socorrito` (`platillo_id`),
  CONSTRAINT `socorritomixcoacst_d_desayuno_id_9ddf43f1_fk_socorrito` FOREIGN KEY (`desayuno_id`) REFERENCES `socorritomixcoacst_desayuno` (`id`),
  CONSTRAINT `socorritomixcoacst_d_platillo_id_0a65397d_fk_socorrito` FOREIGN KEY (`platillo_id`) REFERENCES `socorritomixcoacst_platillo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_desayuno_platillos`
--

LOCK TABLES `socorritomixcoacst_desayuno_platillos` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_desayuno_platillos` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_desayuno_platillos` VALUES (57,1,45),(58,1,46),(59,1,47),(3,1,51),(4,1,52),(5,1,53),(6,1,54),(7,1,55),(8,1,56),(9,1,57),(97,1,130),(60,2,48),(12,2,51),(13,2,52),(14,2,53),(15,2,54),(16,2,55),(17,2,56),(18,2,57),(98,2,130),(61,3,11),(62,3,12),(63,3,13),(64,3,14),(65,3,15),(66,3,16),(67,3,17),(68,3,18),(69,3,19),(70,3,20),(71,3,21),(72,3,22),(73,3,23),(74,3,24),(75,3,25),(76,3,26),(77,3,27),(78,3,28),(79,3,29),(80,3,30),(81,3,31),(82,3,32),(83,3,33),(84,3,34),(85,3,35),(21,3,51),(22,3,52),(23,3,53),(24,3,54),(25,3,55),(26,3,56),(27,3,57),(99,3,130),(86,4,40),(30,4,51),(31,4,52),(32,4,53),(33,4,54),(34,4,55),(35,4,56),(36,4,57),(100,4,130),(87,5,36),(88,5,37),(89,5,38),(90,5,39),(39,5,51),(40,5,52),(41,5,53),(42,5,54),(43,5,55),(44,5,56),(45,5,57),(101,5,130),(91,6,41),(48,6,51),(49,6,52),(50,6,53),(51,6,54),(52,6,55),(53,6,56),(54,6,57),(102,6,130),(96,7,14),(95,7,46),(92,7,48),(93,7,49),(94,7,50),(103,7,130);
/*!40000 ALTER TABLE `socorritomixcoacst_desayuno_platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_historialprecio`
--

DROP TABLE IF EXISTS `socorritomixcoacst_historialprecio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_historialprecio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` double NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `es_precio_actual` tinyint(1) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_h_platillo_id_c0c872c4_fk_socorrito` (`platillo_id`),
  CONSTRAINT `socorritomixcoacst_h_platillo_id_c0c872c4_fk_socorrito` FOREIGN KEY (`platillo_id`) REFERENCES `socorritomixcoacst_platillo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_historialprecio`
--

LOCK TABLES `socorritomixcoacst_historialprecio` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_historialprecio` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_historialprecio` VALUES (1,42.0094,'2021-04-22 13:07:24.936364',0,1),(2,19.7191,'2021-04-22 13:07:24.936364',0,2),(3,39.155,'2021-04-22 13:07:24.936364',0,3),(4,35,'2021-04-22 13:07:24.936364',0,4),(5,45.5824,'2021-04-22 13:07:24.936364',0,5),(6,30,'2021-04-22 13:07:24.936364',0,6),(7,16.7611,'2021-04-22 13:07:24.936364',0,7),(8,38.4115,'2021-04-22 13:07:24.936364',0,8),(9,13.8887,'2021-04-22 13:07:24.936364',0,9),(10,27.6985,'2021-04-22 13:07:24.936364',0,10),(11,23.8699,'2021-04-22 13:07:24.936364',0,11),(12,31.4435,'2021-04-22 13:07:24.936364',0,12),(13,18.2392,'2021-04-22 13:07:24.936364',0,13),(14,25.67,'2021-04-22 13:07:24.936364',0,14),(15,47.6115,'2021-04-22 13:07:24.936364',0,15),(16,45.8098,'2021-04-22 13:07:24.936364',0,16),(17,31.7856,'2021-04-22 13:07:24.936364',0,17),(18,35.8648,'2021-04-22 13:07:24.936364',0,18),(19,7.08013,'2021-04-22 13:07:24.936364',0,19),(20,30.3484,'2021-04-22 13:07:24.936364',0,20),(21,0.815029,'2021-04-22 13:07:24.936364',0,21),(22,12.1443,'2021-04-22 13:07:24.936364',0,22),(23,6.86158,'2021-04-22 13:07:24.936364',0,23),(24,40.2088,'2021-04-22 13:07:24.936364',0,24),(25,7.83395,'2021-04-22 13:07:24.936364',0,25),(26,20.0472,'2021-04-22 13:07:24.936364',0,26),(27,6.48952,'2021-04-22 13:07:24.936364',0,27),(28,5.44044,'2021-04-22 13:07:24.936364',0,28),(29,49.9462,'2021-04-22 13:07:24.936364',0,29),(30,10.9128,'2021-04-22 13:07:24.936364',0,30),(31,25.6466,'2021-04-22 13:07:24.936364',0,31),(32,41.9556,'2021-04-22 13:07:24.936364',0,32),(33,30.632,'2021-04-22 13:07:24.936364',0,33),(34,14.8016,'2021-04-22 13:07:24.936364',0,34),(35,31.8776,'2021-04-22 13:07:24.936364',0,35),(36,26.2144,'2021-04-22 13:07:24.936364',0,36),(37,24.6791,'2021-04-22 13:07:24.936364',0,37),(38,48.6388,'2021-04-22 13:07:24.936364',0,38),(39,14.6258,'2021-04-22 13:07:24.936364',0,39),(40,38.5679,'2021-04-22 13:07:24.936364',0,40),(41,26.3372,'2021-04-22 13:07:24.936364',0,41),(42,38.4957,'2021-04-22 13:07:24.936364',0,42),(43,20.0114,'2021-04-22 13:07:24.936364',0,43),(44,44.5765,'2021-04-22 13:07:24.936364',0,44),(45,14.1657,'2021-04-22 13:07:24.936364',0,45),(46,17.6229,'2021-04-22 13:07:24.936364',0,46),(47,40.3862,'2021-04-22 13:07:24.936364',0,47),(48,45.9513,'2021-04-22 13:07:24.936364',0,48),(49,3.48776,'2021-04-22 13:07:24.936364',0,49),(50,47.4664,'2021-04-22 13:07:24.936364',0,50),(51,26.2998,'2021-04-22 13:07:24.936364',0,51),(52,4.30279,'2021-04-22 13:07:24.936364',0,52),(53,9.61069,'2021-04-22 13:07:24.936364',0,53),(54,33.1613,'2021-04-22 13:07:24.936364',0,54),(55,44.5116,'2021-04-22 13:07:24.936364',0,55),(56,17.4446,'2021-04-22 13:07:24.936364',0,56),(57,3.20857,'2021-04-22 13:07:24.936364',0,57),(58,30,'2021-04-24 05:27:04.796676',0,1),(59,22,'2021-04-24 05:27:41.272877',0,2),(60,15,'2021-04-24 05:28:05.647390',0,3),(61,30,'2021-04-24 06:13:43.573628',0,8),(62,35,'2021-04-24 06:15:35.811521',0,16),(63,50,'2021-04-24 06:16:13.057881',0,14),(64,50,'2021-04-24 06:16:37.042274',0,12),(65,50,'2021-04-24 06:17:04.455558',0,11),(66,50,'2021-04-24 06:17:25.112084',0,15),(67,50,'2021-04-24 06:18:01.427523',0,5),(68,55,'2021-04-24 06:19:10.188781',0,17),(69,55,'2021-04-24 06:20:04.927697',0,22),(70,60,'2021-04-24 06:21:22.228147',0,22),(71,55,'2021-04-24 06:23:20.831517',0,47),(72,55,'2021-04-24 06:24:39.937296',0,20),(73,65,'2021-04-24 14:49:16.172946',0,25),(74,30,'2021-04-24 15:36:50.143549',0,58),(75,50,'2021-04-24 15:39:41.796661',0,59),(76,55,'2021-04-24 15:41:00.655111',0,60),(77,55,'2021-04-24 15:41:40.363498',0,61),(78,60,'2021-04-24 15:43:11.191097',0,62),(79,60,'2021-04-24 15:43:46.587548',0,63),(80,60,'2021-04-24 15:44:32.976622',0,64),(81,60,'2021-04-24 15:45:11.623404',0,65),(82,60,'2021-04-24 15:45:54.300077',0,66),(83,60,'2021-04-24 15:46:39.806527',0,67),(84,60,'2021-04-24 15:47:25.706593',0,27),(85,60,'2021-04-24 15:47:46.289612',0,29),(86,60,'2021-04-24 15:48:06.082984',0,28),(87,65,'2021-04-24 15:51:24.555896',0,29),(88,65,'2021-04-24 15:52:03.738534',0,30),(89,75,'2021-04-24 15:52:54.787394',0,68),(90,65,'2021-04-24 15:53:41.149231',0,69),(91,65,'2021-04-24 15:54:17.160031',0,70),(92,65,'2021-04-24 15:54:53.375670',0,71),(93,65,'2021-04-24 15:55:36.354126',0,72),(94,65,'2021-04-24 15:55:55.400892',0,34),(95,65,'2021-04-24 15:56:25.774118',0,35),(96,75,'2021-04-24 15:58:21.447205',0,73),(97,65,'2021-04-24 15:58:54.303816',0,74),(98,70,'2021-04-24 15:59:53.202694',0,75),(99,70,'2021-04-24 16:00:29.697963',0,39),(100,75,'2021-04-24 16:01:13.404340',0,36),(101,80,'2021-04-24 16:01:59.537666',0,76),(102,80,'2021-04-24 16:03:28.097287',0,77),(103,80,'2021-04-24 16:04:08.517811',0,37),(104,85,'2021-04-24 16:04:42.338098',0,78),(105,105,'2021-04-24 16:05:17.618023',0,79),(106,110,'2021-04-24 16:06:48.685988',0,80),(107,90,'2021-04-24 16:07:07.883457',0,81),(108,80,'2021-04-24 16:40:08.805663',0,40),(109,65,'2021-04-24 16:46:13.539180',0,82),(110,30,'2021-04-24 16:58:27.459187',0,83),(111,65,'2021-04-24 17:21:19.424179',0,84),(112,15,'2021-04-24 17:37:47.942420',0,85),(113,25,'2021-04-24 17:38:03.352358',0,86),(114,10,'2021-04-24 17:38:40.990267',0,87),(115,10,'2021-04-24 17:38:57.275641',0,88),(116,25,'2021-04-24 17:39:32.089480',0,49),(117,15,'2021-04-24 17:42:23.580137',0,46),(118,15,'2021-04-24 17:43:23.725246',0,89),(119,20,'2021-04-24 17:44:08.682081',0,45),(120,50,'2021-04-24 17:44:28.183777',0,90),(121,8,'2021-04-24 17:46:15.695303',0,91),(122,45,'2021-04-24 17:47:23.546748',0,48),(123,20,'2021-04-24 17:47:48.393722',0,92),(124,15,'2021-04-24 17:48:02.802283',0,43),(125,15,'2021-04-24 17:48:17.965686',0,52),(126,18,'2021-04-24 17:48:34.404574',0,53),(127,20,'2021-04-24 17:48:46.390609',0,93),(128,30,'2021-04-24 17:48:49.918491',0,56),(129,30,'2021-04-24 17:49:11.033239',0,57),(130,35,'2021-04-24 17:49:16.432666',0,94),(131,28,'2021-04-24 17:49:27.302597',0,55),(132,15,'2021-04-24 17:49:45.711635',0,51),(133,40,'2021-04-24 17:50:10.968485',0,95),(134,20,'2021-04-24 17:50:21.599387',0,96),(135,45,'2021-04-24 17:50:47.835520',0,97),(136,15,'2021-04-24 17:50:48.011804',0,98),(137,30,'2021-04-24 17:51:19.420159',0,99),(138,35,'2021-04-24 17:51:50.546331',0,100),(139,45,'2021-04-24 17:51:56.955280',0,101),(140,45,'2021-04-24 17:52:16.453820',0,102),(141,45,'2021-04-24 17:52:49.789758',0,103),(142,55,'2021-04-24 17:55:04.058417',0,104),(143,55,'2021-04-24 17:56:52.591435',0,105),(144,30,'2021-04-24 17:58:32.019410',0,7),(145,30,'2021-04-24 17:58:46.513633',0,9),(146,30,'2021-04-24 17:58:58.555073',0,10),(147,50,'2021-04-24 17:59:13.152806',0,13),(148,55,'2021-04-24 17:59:22.292950',0,106),(149,55,'2021-04-24 18:00:24.224991',0,18),(150,50,'2021-04-24 18:00:33.678440',0,19),(151,60,'2021-04-24 18:00:45.195689',0,21),(152,65,'2021-04-24 18:00:55.472520',0,23),(153,60,'2021-04-24 18:01:05.862148',0,24),(154,60,'2021-04-24 18:01:19.241515',0,26),(155,55,'2021-04-24 18:01:25.878641',0,107),(156,65,'2021-04-24 18:01:33.297246',0,31),(157,65,'2021-04-24 18:01:43.619824',0,32),(158,65,'2021-04-24 18:01:53.035420',0,33),(159,55,'2021-04-24 18:02:38.128328',0,108),(160,55,'2021-04-24 18:03:02.688036',0,109),(161,80,'2021-04-24 18:03:11.890588',0,38),(162,80,'2021-04-24 18:03:24.253302',0,41),(163,60,'2021-04-24 18:03:34.229780',0,42),(164,25,'2021-04-24 18:03:55.937595',0,44),(165,50,'2021-04-24 18:04:07.147244',0,50),(166,40,'2021-04-24 18:04:47.287631',0,54),(167,50,'2021-04-24 18:04:59.475192',0,110),(168,32,'2021-04-24 18:05:16.235366',0,2),(169,58,'2021-04-24 18:05:27.700780',0,111),(170,70,'2021-04-24 18:05:52.773985',0,112),(171,20,'2021-04-24 18:06:15.944579',0,87),(172,75,'2021-04-24 18:06:39.137453',0,113),(173,80,'2021-04-24 18:07:20.900144',0,114),(174,85,'2021-04-24 18:08:10.522211',0,115),(175,100,'2021-04-24 18:09:16.336898',0,116),(176,120,'2021-04-24 18:09:59.355711',0,117),(177,100,'2021-04-24 18:10:23.500467',0,118),(178,100,'2021-04-24 18:11:53.305851',0,119),(179,100,'2021-04-24 18:13:17.575560',0,120),(180,100,'2021-04-24 18:13:55.395891',0,121),(181,70,'2021-04-24 18:15:44.400751',0,122),(182,50,'2021-04-25 05:30:02.363565',0,123),(183,60,'2021-04-25 05:30:43.048246',0,124),(184,70,'2021-04-25 05:31:17.356709',0,125),(185,60,'2021-04-25 05:31:38.424680',0,126),(186,70,'2021-04-25 05:32:26.789723',0,127),(187,75,'2021-04-25 05:32:44.813107',0,128),(188,55,'2021-04-25 05:33:22.213480',0,129),(189,50,'2021-05-01 16:52:28.563141',0,131),(190,55,'2021-05-01 16:54:08.507151',0,132),(191,55,'2021-05-01 16:56:02.746143',0,133),(192,55,'2021-05-01 16:56:19.319235',0,134),(193,65,'2021-05-01 16:58:46.364928',0,135),(194,65,'2021-05-01 16:59:43.373967',0,136),(195,65,'2021-05-01 17:01:11.655132',0,137),(196,65,'2021-05-01 17:01:45.075684',0,138),(197,70,'2021-05-01 17:03:02.165585',0,139),(198,55,'2021-05-01 17:31:01.834324',0,64),(199,70,'2021-05-01 17:31:16.293171',0,74),(200,65,'2021-05-01 19:39:53.690704',0,140),(201,65,'2021-05-01 19:40:36.047695',0,141),(202,20,'2021-05-01 19:41:58.545164',0,142),(203,35,'2021-05-04 04:34:42.433724',0,6),(204,30,'2021-05-04 04:34:55.252336',0,6),(205,50,'2021-05-17 23:11:08.068944',1,90),(206,15,'2021-05-17 23:11:08.096905',1,98),(207,15,'2021-05-17 23:11:08.117376',1,3),(208,65,'2021-05-17 23:11:08.135798',1,30),(209,75,'2021-05-17 23:11:08.208106',1,68),(210,65,'2021-05-17 23:11:08.230211',1,71),(211,90,'2021-05-17 23:11:08.278943',1,81),(212,30,'2021-05-17 23:11:08.312989',1,1),(213,55,'2021-05-17 23:11:08.348892',1,107),(214,75,'2021-05-17 23:11:08.368862',1,128),(215,15,'2021-05-17 23:11:08.388184',1,89),(216,18,'2021-05-17 23:11:08.411456',1,53),(217,40,'2021-05-17 23:11:08.440414',1,54),(218,15,'2021-05-17 23:11:08.458681',1,52),(219,30,'2021-05-17 23:11:08.478817',1,83),(220,65,'2021-05-17 23:11:08.498237',1,140),(221,65,'2021-05-17 23:11:08.517070',1,141),(222,20,'2021-05-17 23:11:08.553337',1,142),(223,70,'2021-05-17 23:11:08.611916',1,74),(224,30,'2021-05-17 23:11:08.631104',1,56),(225,65,'2021-05-17 23:11:08.708735',1,32),(226,65,'2021-05-17 23:11:08.734004',1,137),(227,65,'2021-05-17 23:11:08.758970',1,72),(228,70,'2021-05-17 23:11:08.847566',1,39),(229,25,'2021-05-17 23:11:08.956219',1,49),(230,35,'2021-05-17 23:11:08.982098',1,100),(231,55,'2021-05-17 23:11:09.000374',1,64),(232,60,'2021-05-17 23:11:09.019669',1,42),(233,60,'2021-05-17 23:11:09.039563',1,67),(234,60,'2021-05-17 23:11:09.057966',1,22),(235,30,'2021-05-17 23:11:09.076419',1,57),(236,60,'2021-05-17 23:11:09.093702',1,28),(237,35,'2021-05-17 23:11:09.115505',1,4),(238,30,'2021-05-17 23:11:09.133027',1,8),(239,80,'2021-05-17 23:11:09.152207',1,40),(240,70,'2021-05-17 23:11:09.171347',1,75),(241,80,'2021-05-17 23:11:09.189679',1,77),(242,65,'2021-05-17 23:11:09.207807',1,33),(243,30,'2021-05-17 23:11:09.225933',1,9),(244,30,'2021-05-17 23:11:09.247373',1,10),(245,50,'2021-05-17 23:11:09.265012',1,14),(246,50,'2021-05-17 23:11:09.285008',1,59),(247,80,'2021-05-17 23:11:09.301893',1,38),(248,65,'2021-05-17 23:11:09.320425',1,35),(249,80,'2021-05-17 23:11:09.341157',1,76),(250,65,'2021-05-17 23:11:09.359475',1,25),(251,65,'2021-05-17 23:11:09.376607',1,29),(252,65,'2021-05-17 23:11:09.394537',1,138),(253,30,'2021-05-17 23:11:09.413446',1,6),(254,30,'2021-05-17 23:11:09.431715',1,58),(255,32,'2021-05-17 23:11:09.450259',1,2),(256,60,'2021-05-17 23:11:09.466797',1,62),(257,75,'2021-05-17 23:11:09.485379',1,73),(258,55,'2021-05-17 23:11:09.502809',1,108),(259,25,'2021-05-17 23:11:09.521705',1,44),(260,15,'2021-05-17 23:11:09.542639',1,85),(261,25,'2021-05-17 23:11:09.561056',1,86),(262,35,'2021-05-17 23:11:09.578695',1,94),(263,40,'2021-05-17 23:11:09.597655',1,95),(264,45,'2021-05-17 23:11:09.617050',1,97),(265,10,'2021-05-17 23:11:09.636374',1,88),(266,70,'2021-05-17 23:11:09.655268',1,122),(267,70,'2021-05-17 23:11:09.674388',1,139),(268,60,'2021-05-17 23:11:09.692575',1,26),(269,15,'2021-05-17 23:11:09.711194',1,46),(270,65,'2021-05-17 23:11:09.729128',1,135),(271,45,'2021-05-17 23:11:09.747054',1,48),(272,50,'2021-05-17 23:11:09.766650',1,13),(273,15,'2021-05-17 23:11:09.785592',1,43),(274,20,'2021-05-17 23:11:09.806213',1,93),(275,20,'2021-05-17 23:11:09.836903',1,92),(276,28,'2021-05-17 23:11:09.858276',1,55),(277,55,'2021-05-17 23:11:09.876999',1,109),(278,45,'2021-05-17 23:11:09.896298',1,102),(279,75,'2021-05-17 23:11:09.914275',1,36),(280,65,'2021-05-17 23:11:09.936137',1,84),(281,20,'2021-05-17 23:11:09.954474',1,45),(282,60,'2021-05-17 23:11:09.972123',1,27),(283,110,'2021-05-17 23:11:10.065758',1,80),(284,100,'2021-05-17 23:11:10.120956',1,121),(285,55,'2021-05-17 23:11:10.158045',1,61),(286,50,'2021-05-17 23:11:10.176492',1,12),(287,55,'2021-05-17 23:11:10.193646',1,132),(288,55,'2021-05-17 23:11:10.212980',1,17),(289,35,'2021-05-17 23:11:10.229808',1,16),(290,80,'2021-05-17 23:11:10.246439',1,41),(291,30,'2021-05-17 23:11:10.264132',1,99),(292,80,'2021-05-17 23:11:10.283092',1,37),(293,85,'2021-05-17 23:11:10.300270',1,78),(294,65,'2021-05-17 23:11:10.319233',1,31),(295,60,'2021-05-17 23:11:10.338704',1,66),(296,50,'2021-05-17 23:11:10.355535',1,19),(297,65,'2021-05-17 23:11:10.374410',1,69),(298,65,'2021-05-17 23:11:10.392482',1,23),(299,65,'2021-05-17 23:11:10.413205',1,82),(300,65,'2021-05-17 23:11:10.430784',1,34),(301,65,'2021-05-17 23:11:10.452520',1,136),(302,60,'2021-05-17 23:11:10.472802',1,65),(303,20,'2021-05-17 23:11:10.496446',1,96),(304,65,'2021-05-17 23:11:10.516270',1,70),(305,55,'2021-05-17 23:11:10.534352',1,104),(306,58,'2021-05-17 23:11:10.555514',1,111),(307,75,'2021-05-17 23:11:10.575343',1,113),(308,70,'2021-05-17 23:11:10.603499',1,112),(309,55,'2021-05-17 23:11:10.621143',1,105),(310,55,'2021-05-17 23:11:10.638294',1,106),(311,50,'2021-05-17 23:11:10.666322',1,110),(312,50,'2021-05-17 23:11:10.683288',1,5),(313,50,'2021-05-17 23:11:10.701208',1,50),(314,105,'2021-05-17 23:11:10.721252',1,79),(315,30,'2021-05-17 23:11:10.739676',1,7),(316,80,'2021-05-17 23:11:10.757055',1,114),(317,85,'2021-05-17 23:11:10.774343',1,115),(318,8,'2021-05-17 23:11:10.792816',1,91),(319,55,'2021-05-17 23:11:10.811663',1,47),(320,55,'2021-05-17 23:11:10.829140',1,20),(321,50,'2021-05-17 23:11:10.848523',1,131),(322,50,'2021-05-17 23:11:10.866204',1,15),(323,15,'2021-05-17 23:11:10.883653',1,51),(324,55,'2021-05-17 23:11:10.899691',1,129),(325,70,'2021-05-17 23:11:10.915929',1,125),(326,60,'2021-05-17 23:11:10.935256',1,124),(327,60,'2021-05-17 23:11:10.953223',1,126),(328,50,'2021-05-17 23:11:10.972728',1,123),(329,70,'2021-05-17 23:11:10.988962',1,127),(330,120,'2021-05-17 23:11:11.005605',1,117),(331,100,'2021-05-17 23:11:11.023405',1,116),(332,100,'2021-05-17 23:11:11.039764',1,118),(333,100,'2021-05-17 23:11:11.056943',1,119),(334,100,'2021-05-17 23:11:11.073289',1,120),(335,55,'2021-05-17 23:11:11.089407',1,60),(336,60,'2021-05-17 23:11:11.105264',1,24),(337,55,'2021-05-17 23:11:11.121206',1,133),(338,55,'2021-05-17 23:11:11.138546',1,18),(339,50,'2021-05-17 23:11:11.157485',1,11),(340,60,'2021-05-17 23:11:11.209078',1,21),(341,55,'2021-05-17 23:11:11.228358',1,134),(342,60,'2021-05-17 23:11:11.249615',1,63),(343,45,'2021-05-17 23:11:11.267878',1,101),(344,45,'2021-05-17 23:11:11.285681',1,103),(345,20,'2021-05-17 23:11:11.307047',1,87);
/*!40000 ALTER TABLE `socorritomixcoacst_historialprecio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_menu`
--

DROP TABLE IF EXISTS `socorritomixcoacst_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` date NOT NULL,
  `tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_menu`
--

LOCK TABLES `socorritomixcoacst_menu` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_menu` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_menu` VALUES (2,'2021-04-23','CO'),(5,'2021-04-24','CO'),(8,'2021-05-01','CO'),(9,'2021-05-03','CO'),(10,'2021-05-06','CO'),(11,'2021-05-08','CO'),(12,'2021-05-16','CO');
/*!40000 ALTER TABLE `socorritomixcoacst_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_orden`
--

DROP TABLE IF EXISTS `socorritomixcoacst_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `promocion` tinyint(1) NOT NULL,
  `total_descuento` double DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `aplica_comision` tinyint(1) NOT NULL,
  `cambio` double NOT NULL,
  `comision` int(11) NOT NULL,
  `lleva_topper` tinyint(1) NOT NULL,
  `cambio_devuelto` tinyint(1) NOT NULL,
  `metodo_pago` varchar(2) NOT NULL,
  `observaciones` varchar(256) DEFAULT NULL,
  `paga_con` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_o_cliente_id_13e7d9f1_fk_socorrito` (`cliente_id`),
  CONSTRAINT `socorritomixcoacst_o_cliente_id_13e7d9f1_fk_socorrito` FOREIGN KEY (`cliente_id`) REFERENCES `socorritomixcoacst_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_orden`
--

LOCK TABLES `socorritomixcoacst_orden` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_orden` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_orden` VALUES (1,486.79004999999995,0,0,'2021-04-24 05:23:04.552884',1,1,93.20995000000005,20,1,'EF','Sin comentarios',600),(2,1103.09172,0,0,'2021-04-24 05:27:05.274149',2,0,0,0,0,'EF','muchas servilletas por favor',1103.09172),(3,202.1443,0,0,'2021-04-24 05:32:19.608450',1,0,97.85570000000001,0,1,'EF','con harto chile',300),(4,190,0,0,'2021-04-24 05:32:39.192009',1,1,0,20,1,'TE',NULL,210),(5,350.16625,0,0,'2021-04-24 05:35:49.264592',1,0,49.83375000000001,0,1,'EF',NULL,400),(6,185,0,0,'2021-04-24 05:43:26.001177',1,0,0,0,0,'EF',NULL,185),(7,155,0,0,'2021-04-24 05:48:49.997294',3,0,4999999999845,0,1,'EF',NULL,5000000000000),(8,150,0,0,'2021-04-24 16:14:02.990039',1,1,40,10,1,'EF','Observaciones',200),(9,390,0,0,'2021-04-24 19:39:12.753280',4,1,95,15,0,'EF','coca y sprite',500),(10,290,0,0,'2021-04-24 22:01:15.291453',1,1,0,50,1,'EF',NULL,340),(11,365,0,0,'2021-04-25 03:00:56.709104',1,1,0,1,1,'EF',NULL,366),(12,150,0,0,'2021-05-01 19:10:58.766307',5,0,0,0,0,'EF','Frijoles olla y refritos ',150),(13,675,0,0,'2021-05-01 19:24:23.419943',6,0,325,0,0,'EF','Consome si verdura frijoles refritos tortas coliflor enjitimate 1',1000),(14,175,0,0,'2021-05-01 19:59:41.955274',8,0,25,0,0,'EF','Olla',200),(15,317,0,0,'2021-05-17 21:25:37.386941',1,1,153,30,1,'EF','Salsa aparte',500),(16,215,0,0,'2021-05-17 23:09:20.541361',1,1,15,20,1,'EF','Salsa verde',250);
/*!40000 ALTER TABLE `socorritomixcoacst_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_ordendesayuno`
--

DROP TABLE IF EXISTS `socorritomixcoacst_ordendesayuno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_ordendesayuno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_total` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `desayuno_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_o_desayuno_id_60171718_fk_socorrito` (`desayuno_id`),
  KEY `socorritomixcoacst_o_orden_id_4dc5cc53_fk_socorrito` (`orden_id`),
  CONSTRAINT `socorritomixcoacst_o_desayuno_id_60171718_fk_socorrito` FOREIGN KEY (`desayuno_id`) REFERENCES `socorritomixcoacst_desayuno` (`id`),
  CONSTRAINT `socorritomixcoacst_o_orden_id_4dc5cc53_fk_socorrito` FOREIGN KEY (`orden_id`) REFERENCES `socorritomixcoacst_orden` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_ordendesayuno`
--

LOCK TABLES `socorritomixcoacst_ordendesayuno` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_ordendesayuno` DISABLE KEYS */;
/*!40000 ALTER TABLE `socorritomixcoacst_ordendesayuno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_ordenplatillo`
--

DROP TABLE IF EXISTS `socorritomixcoacst_ordenplatillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_ordenplatillo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_total` double NOT NULL,
  `es_completa` tinyint(1) NOT NULL,
  `numero_completa` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  `observaciones_completa` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_o_orden_id_837d3d65_fk_socorrito` (`orden_id`),
  KEY `socorritomixcoacst_o_platillo_id_df5b33a2_fk_socorrito` (`platillo_id`),
  CONSTRAINT `socorritomixcoacst_o_orden_id_837d3d65_fk_socorrito` FOREIGN KEY (`orden_id`) REFERENCES `socorritomixcoacst_orden` (`id`),
  CONSTRAINT `socorritomixcoacst_o_platillo_id_df5b33a2_fk_socorrito` FOREIGN KEY (`platillo_id`) REFERENCES `socorritomixcoacst_platillo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_ordenplatillo`
--

LOCK TABLES `socorritomixcoacst_ordenplatillo` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_ordenplatillo` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_ordenplatillo` VALUES (1,0,1,1,1,1,8,NULL),(2,0,1,1,1,1,1,NULL),(3,68.6388,1,1,1,1,38,NULL),(4,0,1,2,1,1,9,NULL),(5,0,1,2,1,1,1,NULL),(6,51.4435,1,2,1,1,12,NULL),(7,10.9128,0,NULL,1,1,30,NULL),(8,42.0094,0,NULL,1,1,1,NULL),(9,41.9556,0,NULL,1,1,32,NULL),(10,3.48776,0,NULL,1,1,49,NULL),(11,44.5765,0,NULL,1,1,44,NULL),(12,39.155,0,NULL,1,1,3,NULL),(13,9.61069,0,NULL,1,1,53,NULL),(14,0,1,3,1,1,43,NULL),(15,0,1,3,1,1,46,NULL),(16,80,1,3,1,1,55,NULL),(17,0,1,4,1,1,43,NULL),(18,0,1,4,1,1,37,NULL),(19,95,1,4,1,1,52,NULL),(20,0,1,1,1,2,9,NULL),(21,0,1,1,1,2,6,NULL),(22,51.8776,1,1,1,2,35,NULL),(23,0,1,2,1,2,8,NULL),(24,0,1,2,1,2,6,NULL),(25,38.2392,1,2,1,2,13,NULL),(26,0,1,3,1,2,8,NULL),(27,0,1,3,1,2,4,NULL),(28,65.9513,1,3,1,2,48,NULL),(29,32.7384,0,NULL,3,2,30,NULL),(30,6.97552,0,NULL,2,2,49,NULL),(31,133.7295,0,NULL,3,2,44,NULL),(32,28.3314,0,NULL,2,2,45,NULL),(33,94.9328,0,NULL,2,2,50,NULL),(34,80.7724,0,NULL,2,2,47,NULL),(35,117.465,0,NULL,3,2,3,NULL),(36,19.22138,0,NULL,2,2,53,NULL),(37,33.1613,0,NULL,1,2,54,NULL),(38,8.60558,0,NULL,2,2,52,NULL),(39,34.8892,0,NULL,2,2,56,NULL),(40,6.41714,0,NULL,2,2,57,NULL),(41,39.4382,0,NULL,2,2,2,NULL),(42,40.0228,0,NULL,2,2,43,NULL),(43,89.0232,0,NULL,2,2,55,NULL),(44,26.2998,0,NULL,1,2,51,NULL),(45,0,1,4,1,2,43,NULL),(46,0,1,4,1,2,46,NULL),(47,80,1,4,1,2,57,NULL),(48,0,1,5,1,2,44,NULL),(49,0,1,5,1,2,48,NULL),(50,75,1,5,1,2,53,NULL),(51,0,1,1,1,3,8,NULL),(52,0,1,1,1,3,4,NULL),(53,32.1443,1,1,1,3,22,NULL),(54,0,1,2,1,3,43,NULL),(55,65,1,2,1,3,50,NULL),(56,0,1,3,1,3,43,NULL),(57,0,1,3,1,3,37,NULL),(58,105,1,3,1,3,57,NULL),(59,0,1,1,1,4,43,NULL),(60,0,1,1,1,4,29,NULL),(61,85,1,1,1,4,53,NULL),(62,0,1,2,1,4,44,NULL),(63,0,1,2,1,4,38,NULL),(64,105,1,2,1,4,54,NULL),(65,0,1,1,1,5,9,NULL),(66,0,1,1,1,5,6,NULL),(67,40.047200000000004,1,1,1,5,26,NULL),(68,10.9128,0,NULL,1,5,30,NULL),(69,30,0,NULL,1,5,1,NULL),(70,41.9556,0,NULL,1,5,32,NULL),(71,14.6258,0,NULL,1,5,39,NULL),(72,3.48776,0,NULL,1,5,49,NULL),(73,44.5765,0,NULL,1,5,44,NULL),(74,17.6229,0,NULL,1,5,46,NULL),(75,14.1657,0,NULL,1,5,45,NULL),(76,15,0,NULL,1,5,3,NULL),(77,9.61069,0,NULL,1,5,53,NULL),(78,33.1613,0,NULL,1,5,54,NULL),(79,0,1,2,1,5,44,NULL),(80,0,1,2,1,5,48,NULL),(81,75,1,2,1,5,53,NULL),(82,0,1,1,1,6,43,NULL),(83,0,1,1,1,6,46,NULL),(84,80,1,1,1,6,56,NULL),(85,0,1,2,1,6,43,NULL),(86,0,1,2,1,6,39,NULL),(87,105,1,2,1,6,56,NULL),(88,0,1,1,1,7,43,NULL),(89,0,1,1,1,7,47,NULL),(90,80,1,1,1,7,56,NULL),(91,0,1,2,1,7,44,NULL),(92,0,1,2,1,7,48,NULL),(93,75,1,2,1,7,53,NULL),(94,0,1,1,1,8,9,NULL),(95,0,1,1,1,8,4,NULL),(96,80,1,1,1,8,28,NULL),(97,0,1,2,1,8,43,NULL),(98,0,1,2,1,8,46,NULL),(99,70,1,2,1,8,53,NULL),(100,0,1,1,1,9,83,NULL),(101,0,1,1,1,9,1,NULL),(102,70,1,1,1,9,14,NULL),(103,0,1,2,1,9,83,NULL),(104,0,1,2,1,9,6,NULL),(105,80,1,2,1,9,62,NULL),(106,60,0,NULL,2,9,1,NULL),(107,40,0,NULL,2,9,96,NULL),(108,0,1,3,1,9,44,NULL),(109,0,1,3,1,9,48,NULL),(110,75,1,3,1,9,53,NULL),(111,0,1,4,1,9,44,NULL),(112,65,1,4,1,9,48,NULL),(113,0,1,1,1,10,83,NULL),(114,0,1,1,1,10,6,NULL),(115,125,1,1,1,10,79,NULL),(116,0,1,2,1,10,8,NULL),(117,0,1,2,1,10,58,NULL),(118,85,1,2,1,10,72,NULL),(119,0,1,3,1,10,8,NULL),(120,0,1,3,1,10,1,NULL),(121,80,1,3,1,10,74,NULL),(122,0,1,1,1,11,8,NULL),(123,0,1,1,1,11,1,NULL),(124,85,1,1,1,11,30,NULL),(125,0,1,2,1,11,83,NULL),(126,0,1,2,1,11,58,NULL),(127,80,1,2,1,11,28,NULL),(128,65,0,NULL,1,11,30,NULL),(129,50,0,NULL,1,11,90,NULL),(130,15,0,NULL,1,11,98,NULL),(131,0,1,3,1,11,43,NULL),(132,0,1,3,1,11,47,NULL),(133,70,1,3,1,11,52,NULL),(134,0,1,1,1,12,7,NULL),(135,0,1,1,1,12,1,NULL),(136,75,1,1,1,12,133,NULL),(137,0,1,2,1,12,7,NULL),(138,0,1,2,1,12,58,NULL),(139,75,1,2,1,12,64,NULL),(140,0,1,1,1,13,7,NULL),(141,0,1,1,1,13,1,NULL),(142,90,1,1,1,13,36,NULL),(143,0,1,2,1,13,8,NULL),(144,0,1,2,1,13,1,NULL),(145,80,1,2,1,13,21,NULL),(146,0,1,3,1,13,8,NULL),(147,0,1,3,1,13,58,NULL),(148,85,1,3,1,13,139,NULL),(149,0,1,4,1,13,8,NULL),(150,0,1,4,1,13,1,NULL),(151,75,1,4,1,13,133,NULL),(152,0,1,5,1,13,8,NULL),(153,0,1,5,1,13,1,NULL),(154,90,1,5,1,13,36,NULL),(155,0,1,6,1,13,7,NULL),(156,0,1,6,1,13,58,NULL),(157,75,1,6,1,13,133,NULL),(158,30,0,NULL,1,13,58,NULL),(159,150,0,NULL,2,13,36,NULL),(160,0,1,1,1,14,8,NULL),(161,0,1,1,1,14,1,NULL),(162,105,1,1,1,14,81,NULL),(163,0,1,2,1,14,8,NULL),(164,0,1,2,1,14,1,NULL),(165,70,1,2,1,14,11,NULL),(166,0,1,1,1,15,1,NULL),(167,0,1,1,1,15,8,NULL),(168,85,1,1,1,15,74,'Refritos'),(169,0,1,2,1,15,1,NULL),(170,0,1,2,1,15,1,NULL),(171,85,1,2,1,15,39,'De la olla'),(172,60,0,NULL,2,15,8,NULL),(173,32,0,NULL,1,15,2,NULL),(174,55,0,NULL,1,15,107,NULL),(175,0,1,1,1,16,8,NULL),(176,0,1,1,1,16,8,NULL),(177,85,1,1,1,16,39,'Frijoles refritos'),(178,60,0,NULL,2,16,8,NULL),(179,70,0,NULL,2,16,100,NULL);
/*!40000 ALTER TABLE `socorritomixcoacst_ordenplatillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_platillo`
--

DROP TABLE IF EXISTS `socorritomixcoacst_platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_platillo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `es_complemento` tinyint(1) NOT NULL,
  `esta_eliminado` tinyint(1) NOT NULL,
  `es_constante` tinyint(1) NOT NULL,
  `tipo_desayuno` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_platillo`
--

LOCK TABLES `socorritomixcoacst_platillo` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_platillo` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_platillo` VALUES (1,'Arroz','sin descripción','ST',1,0,0,NULL),(2,'Expresso','Descripción del platillo','BE',0,0,0,NULL),(3,'Agua para nescafe','Descripción del platillo','BE',0,0,0,NULL),(4,'Codito a la crema','descripción','ST',1,0,0,NULL),(5,'Salchichas fritas','Descripción del platillo','GU',0,0,0,NULL),(6,'Ensalada','Descripción','ST',1,0,0,NULL),(7,'Sopa','Descripción del platillo','EN',1,0,0,NULL),(8,'Consomé','Descripción del platillo','EN',1,0,0,NULL),(9,'Crema de brocoli','Descripción del platillo','EN',1,0,0,NULL),(10,'Crema de zanahoria','Descripción del platillo','EN',1,0,0,NULL),(11,'Tortas de papa','Descripción del platillo','GU',0,0,0,NULL),(12,'Nuggets de pollo','Descripción del platillo','GU',0,0,0,NULL),(13,'Huevos con ejotes','Descripción del platillo','GU',0,0,0,NULL),(14,'Croqueta de pollo','Descripción del platillo','GU',0,0,0,NULL),(15,'Tacos dorados de pollo','Descripción del platillo','GU',0,0,0,NULL),(16,'Pambazo','Descripción del platillo','GU',0,0,0,NULL),(17,'Omelet de papa ','Descripción del platillo','GU',0,0,0,NULL),(18,'Tortas de espinaca','Descripción del platillo','GU',0,0,0,NULL),(19,'Picadillo','Descripción del platillo','GU',0,0,0,NULL),(20,'Sopes con quesillo','Descripción del platillo','GU',0,0,0,NULL),(21,'Tortas de pollo en salsa verde','Descripción del platillo','GU',0,0,0,NULL),(22,'Chile relleno de queso','Descripción del platillo','GU',0,0,0,NULL),(23,'Pollo a la barbacoa c/ensalada de papas','Descripción del platillo','GU',0,0,0,NULL),(24,'Tortas de carne en salsa verde','Descripción del platillo','GU',0,0,0,NULL),(25,'Enchiladas jaliciences','Descripción del platillo','GU',0,0,0,NULL),(26,'Higado encebollado','Descripción del platillo','GU',0,0,0,NULL),(27,'Muslo empanizado con papas','con ensalada o enchiladas verdes','GU',0,0,0,NULL),(28,'Chuleta ahumada a la plancha','Descripción del platillo','GU',0,0,0,NULL),(29,'Enchiladas verdes','Descripción del platillo','GU',0,0,0,NULL),(30,'Alambre de pollo','Descripción','GU',0,0,0,NULL),(31,'Pechuga rellena en crema de chipotle','Descripción del platillo','GU',0,0,0,NULL),(32,'Carne de res en asado','Descripción del platillo','GU',0,0,0,NULL),(33,'Costilla de puerco en verde con verdolagas','Descripción del platillo','GU',0,0,0,NULL),(34,'Pollo con mole','Descripción del platillo','GU',0,0,0,NULL),(35,'Enchiladas de mole','Descripción del platillo','GU',0,0,0,NULL),(36,'Milanesa','Con papas o ensalada','GU',0,0,0,NULL),(37,'Pechuga asada','(o empanizada) con papas','GU',0,0,0,NULL),(38,'Empanizada','Descripción del platillo','GU',0,0,0,NULL),(39,'Cecina','Descripción del platillo','GU',0,0,0,NULL),(40,'Costilla','con chilaquiles o con sopes(2)','GU',0,0,0,NULL),(41,'Pancita','Descripción del platillo','GU',0,0,0,NULL),(42,'Chilaquiles','Descripción del platillo','GU',0,0,0,NULL),(43,'Jugo','vaso chico','BE',0,0,0,'D1'),(44,'Fruta','Del desayuno','EX',0,0,0,'D1'),(45,'Molletes','Del desayuno','EX',0,0,0,'D2'),(46,'Hotcakes',' ','EX',0,0,0,'D2'),(47,'Sopes con pollo',' ','GU',0,0,0,'D2'),(48,'Huevos Al gusto','Rancheros,con Jamón, al albañil o con longaniza','GU',0,0,0,'D2'),(49,'Cereal con Leche','Descripción','EX',0,0,0,'D2'),(50,'Salchipulpos','Descripción de platillo','EX',0,0,0,'D2'),(51,'Té','taza chica','BE',0,0,0,'D3'),(52,'Café de olla','taza chica','BE',0,0,0,'D3'),(53,'Café americano','taza chica','BE',0,0,0,'D3'),(54,'Café con leche','taza chica','BE',0,0,0,'D3'),(55,'Leche Caliente','taza chica','BE',0,0,0,'D3'),(56,'Capuchino','Taza chica','BE',0,0,0,'D3'),(57,'Chocolate','taza chica','BE',0,0,0,'D3'),(58,'Espaguetti','Descripción','ST',1,0,0,NULL),(59,'Croquetas de atún','Descripción','GU',0,0,0,NULL),(60,'Tortas de brócoli','Descripción','GU',0,0,0,NULL),(61,'Nopal capeado','Relleno de queso capeado','GU',0,0,0,NULL),(62,'Fajitas de pollo','En chile de árbol con champiñones','GU',0,0,0,NULL),(63,'Tostadas de pescado','Descripción','GU',0,0,0,NULL),(64,'Chicharrón en salsa verde','Con nopales','GU',0,0,0,NULL),(65,'Pollo frito con enchiladas verdes','Descripción','GU',0,0,0,NULL),(66,'Pechuguitas al tamarindo','Descripción','GU',0,0,0,NULL),(67,'Chilaquiles con pollo','Descripción','GU',0,0,0,NULL),(68,'Alambre de pollo con queso','Descripción','GU',0,0,0,NULL),(69,'Pollo a la barbacoa','Descripción','GU',0,0,0,NULL),(70,'Rico pozole','Descripción','GU',0,0,0,NULL),(71,'Albóndigas en chipotle','Descripción','GU',0,0,0,NULL),(72,'Carne de res en verde con calabazas','Descripción','GU',0,0,0,NULL),(73,'Filete de pescado empanizado','Descripción','GU',0,0,0,NULL),(74,'Caldo de res','Descripción','GU',0,0,0,NULL),(75,'Costilla con chilaquiles','Descripción','GU',0,0,0,NULL),(76,'Enchiladas gratinadas verdes','Descripción','GU',0,0,0,NULL),(77,'Costilla con sopes','Descripción','GU',0,0,0,NULL),(78,'Pechuga rellena empanizada','Descripción','GU',0,0,0,NULL),(79,'Salmón a la plancha','Descripción','GU',0,0,0,NULL),(80,'New york','Descripción','GU',0,0,0,NULL),(81,'Arrachera','Descripción','GU',0,0,0,NULL),(82,'Pollo a la cubana','Pollo con jitomate, longaniza y salchichas','GU',0,0,0,NULL),(83,'Caldo de haba','Descripción','EN',1,0,0,NULL),(84,'Mole de olla','Mole de olla','GU',0,0,0,NULL),(85,'Fruta chica','Descripción','EX',0,0,0,NULL),(86,'Fruta grande','Descripción','EX',0,0,0,NULL),(87,'Yogurt','Descripción','EX',0,0,0,NULL),(88,'Granola','Descripción','EX',0,0,0,NULL),(89,'Bisquet con mermelada','Descripción','EX',0,0,0,NULL),(90,'3 Molletes','Descripción','EX',0,0,0,NULL),(91,'Sope sencillo','Descripción','EX',0,0,0,NULL),(92,'Kushiage de queso','Queso manchego, con panko','EX',0,0,0,NULL),(93,'Kushiage de plátano con queso','Plátano, queso manchego. Empanizadas con panko.','EX',0,0,0,NULL),(94,'Gohan','Arroz al vapor con ajonjolí.','EX',0,0,0,NULL),(95,'Gohan furikake ebi','Arroz al vapor con condimento de camarón.','EX',0,0,0,NULL),(96,'Refresco','Descripción','BE',0,0,0,NULL),(97,'Gohan furikake sake','Arroz al vapor con condimento dr salmón.','EX',0,0,0,NULL),(98,'Agua de sabor','1 litro','BE',0,0,0,NULL),(99,'Papas a la francesa','Descripción','EX',0,0,0,NULL),(100,'Cerveza','Descripción','BE',0,0,0,NULL),(101,'Yakimeshi de pollo','Pollo, zanahoria, calabaza, cebolla, condimentos, huevo al gusto.','EX',0,0,0,NULL),(102,'Michelada','Descripción','BE',0,0,0,NULL),(103,'Yakimeshi de res','Carne de res, zanahoria, calabaza, cebolla, condimentos, huevo al gusto.','EX',0,0,0,NULL),(104,'Rollo California','Queso Philadelphia, camarón, aguacate, pepino, ajonjolí por fuera.','EX',0,0,0,NULL),(105,'Rollo Philadelphia','Salmón, aguacate, pepino, queso Philadelphia, ajonjolí por fuera.','EX',0,0,0,NULL),(106,'Rollo Tampico','Queso Philadelphia, aguacate, pepino, ajonjolí por fuera y salsa Tampico.','EX',0,0,0,NULL),(107,'Avocado Roll','Aguacate por fuera, queso Philadelphia, pepino, surimi y ajonjolí.','EX',0,0,0,NULL),(108,'Fresa Roll','Camarón, aguacate, pepino, queso Philadelphia, fresa por fuera y ajonjolí dulce.','EX',0,0,0,NULL),(109,'Mango Roll','Camarón, aguacate, pepino, queso Philadelphia, mango por fuera y ajonjolí dulce.','EX',0,0,0,NULL),(110,'Rollo Vegetariano','Pepino, queso y aguacate.','EX',0,0,0,NULL),(111,'Rollo de Surimi','Pepino, queso y surimi.','EX',0,0,0,NULL),(112,'Rollo de Surimi empanizado','Pepino, queso y surimi, con panko.','EX',0,0,0,NULL),(113,'Rollo de Surimi con salma','Pepino, queso y surimi.','EX',0,0,0,NULL),(114,'Sopa meshiudon','Arroz, pollo, brocoli, alga marina y salsa agridulce.','EX',0,0,0,NULL),(115,'Sopa yakiudon','Pollo, brocoli, champiñón, pimineto morrón, cebolla y fideo ó Ramen.','EX',0,0,0,NULL),(116,'Teriyaki de pollo','Pollo, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','EX',0,0,0,NULL),(117,'Teriyaki de camarón','Camarón, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','EX',0,0,0,NULL),(118,'Teriyaki de res','Carne de res, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','EX',0,0,0,NULL),(119,'Teriyaki mixto','Pollo, carne de res, camarón, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','EX',0,0,0,NULL),(120,'Torikatsu Roll','Filete de pollo, zanahoria, queso manchego, pimiento morrón, empanizado, acompañado de una ensalada fresca de zanahoria, lechuga, jícama, con aderezo ranch y mil íslas.','EX',0,0,0,NULL),(121,'Nikukatsu Roll','Filete de res, zanahoria, queso manchego, pimiento morrón, empanizado, acompañado de una ensalada fresca de zanahoria, lechuga, jícama, con aderezo ranch y mil íslas.','EX',0,0,0,NULL),(122,'Gyudo','Carne de res (500g.) en salsa teriyaki.','EX',0,0,0,NULL),(123,'Teppanyaki de verduras','Zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','EX',0,0,0,NULL),(124,'Teppanyaki de pollo','Pollo, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','EX',0,0,0,NULL),(125,'Teppanyaki de camarón','Camarón, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','EX',0,0,0,NULL),(126,'Teppanyaki de res','Carne de res, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','EX',0,0,0,NULL),(127,'Teppanyaki mixto','Carne de res, camarón, pollo, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','EX',0,0,0,NULL),(128,'Banana Roll','Rollito de plátano.','EX',0,0,0,NULL),(129,'Tempura helado','Helado empanizado.','EX',0,0,0,NULL),(130,'Jugo y fruta','(del desayuno)','EX',0,0,0,'D1'),(131,'Tacos adobados de pollo','Descripción','GU',0,0,0,NULL),(132,'Omelet de champiñón','Descripción','GU',0,0,0,NULL),(133,'Tortas de coliflor','Descripción','GU',0,0,0,NULL),(134,'Tortas de quelites','Descripción','GU',0,0,0,NULL),(135,'Huazontle en pasilla','Descripción','GU',0,0,0,NULL),(136,'Pollo en verde con verdolagas','Descripción','GU',0,0,0,NULL),(137,'Carne de res en pasilla','con champiñones','GU',0,0,0,NULL),(138,'Enfrijoladas','Descripción','GU',0,0,0,NULL),(139,'Hamburguesa con papas','Descripción','GU',0,0,0,NULL),(140,'Caldo de pollo ','Caldo con pollo y verduras ','GU',0,0,0,NULL),(141,'Caldo de pollo con pieza','Guisado','EX',0,0,0,NULL),(142,'Caldo de pollo con pollo desebrado','Caldo con pollo desebrado','EX',0,0,0,NULL);
/*!40000 ALTER TABLE `socorritomixcoacst_platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_platillomenu`
--

DROP TABLE IF EXISTS `socorritomixcoacst_platillomenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_platillomenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disponible` tinyint(1) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `platillo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_p_menu_id_4553556a_fk_socorrito` (`menu_id`),
  KEY `socorritomixcoacst_p_platillo_id_09a6d572_fk_socorrito` (`platillo_id`),
  CONSTRAINT `socorritomixcoacst_p_menu_id_4553556a_fk_socorrito` FOREIGN KEY (`menu_id`) REFERENCES `socorritomixcoacst_menu` (`id`),
  CONSTRAINT `socorritomixcoacst_p_platillo_id_09a6d572_fk_socorrito` FOREIGN KEY (`platillo_id`) REFERENCES `socorritomixcoacst_platillo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_platillomenu`
--

LOCK TABLES `socorritomixcoacst_platillomenu` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_platillomenu` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_platillomenu` VALUES (1,1,2,1),(2,1,2,8),(3,1,2,58),(4,1,2,71),(6,1,2,30),(7,1,2,68),(8,1,2,81),(9,1,2,83),(10,1,2,74),(11,1,2,72),(12,1,2,39),(13,1,2,64),(14,1,2,67),(15,1,2,22),(16,1,2,28),(17,1,2,75),(18,1,2,77),(19,1,2,14),(20,1,2,59),(21,1,2,35),(22,1,2,76),(23,1,2,29),(24,1,2,6),(25,1,2,62),(26,1,2,73),(27,1,2,36),(28,1,2,27),(29,1,2,80),(30,1,2,61),(31,1,2,12),(32,1,2,17),(33,1,2,16),(34,1,2,37),(35,1,2,78),(36,1,2,66),(37,1,2,69),(38,1,2,34),(39,1,2,65),(40,1,2,70),(41,1,2,5),(42,1,2,79),(43,1,2,47),(44,1,2,20),(45,1,2,15),(46,1,2,60),(47,1,2,11),(48,1,2,63),(49,1,2,3),(50,1,2,53),(51,1,2,54),(52,1,2,52),(53,1,2,56),(54,1,2,57),(55,1,2,2),(56,1,2,43),(57,1,2,55),(58,1,2,51),(59,1,2,49),(61,1,2,46),(62,1,2,45),(64,1,2,90),(65,1,2,89),(66,1,2,85),(67,1,2,86),(68,1,2,88),(69,1,2,48),(70,1,2,99),(71,1,2,91),(72,1,2,87),(73,1,2,98),(74,1,2,100),(75,1,2,102),(76,1,2,96),(77,1,5,90),(78,1,5,98),(79,1,5,3),(80,1,5,30),(81,1,5,68),(82,1,5,71),(83,1,5,81),(84,1,5,1),(85,1,5,89),(86,1,5,53),(87,1,5,54),(88,1,5,52),(89,1,5,83),(90,1,5,74),(91,1,5,56),(92,1,5,72),(93,1,5,39),(94,1,5,49),(95,1,5,100),(96,1,5,64),(97,1,5,67),(98,1,5,22),(99,1,5,57),(100,1,5,28),(101,1,5,8),(102,1,5,75),(103,1,5,77),(104,1,5,14),(105,1,5,59),(106,1,5,35),(107,1,5,76),(108,1,5,29),(109,1,5,6),(110,1,5,58),(111,1,5,2),(112,1,5,62),(113,1,5,73),(114,1,5,85),(115,1,5,86),(116,1,5,88),(117,1,5,46),(118,1,5,48),(119,1,5,43),(120,1,5,55),(121,1,5,102),(122,1,5,36),(123,1,5,45),(124,1,5,27),(125,1,5,80),(126,1,5,61),(127,1,5,12),(128,1,5,17),(129,1,5,16),(130,1,5,99),(131,1,5,37),(132,1,5,78),(133,1,5,66),(134,1,5,69),(135,1,5,34),(136,1,5,65),(137,1,5,96),(138,1,5,70),(139,1,5,5),(140,1,5,79),(141,1,5,91),(142,1,5,47),(143,1,5,20),(144,1,5,15),(145,1,5,51),(146,1,5,60),(147,1,5,11),(148,1,5,63),(149,1,5,87),(221,1,8,90),(222,1,8,98),(223,1,8,3),(224,1,8,30),(225,1,8,68),(226,1,8,81),(227,1,8,1),(228,1,8,107),(229,1,8,128),(230,1,8,89),(231,1,8,53),(232,1,8,54),(233,1,8,52),(234,1,8,74),(235,1,8,56),(236,1,8,137),(237,1,8,39),(238,1,8,49),(239,1,8,100),(240,1,8,64),(241,1,8,67),(242,1,8,22),(243,1,8,57),(244,1,8,28),(245,1,8,8),(246,1,8,75),(247,1,8,77),(248,1,8,14),(249,1,8,35),(250,1,8,76),(251,1,8,29),(252,1,8,138),(253,1,8,6),(254,1,8,58),(255,1,8,2),(256,1,8,62),(257,1,8,73),(258,1,8,108),(259,1,8,44),(260,1,8,85),(261,1,8,86),(262,1,8,94),(263,1,8,95),(264,1,8,97),(265,1,8,88),(266,1,8,122),(267,1,8,139),(268,1,8,46),(269,1,8,135),(270,1,8,43),(271,1,8,130),(272,1,8,93),(273,1,8,92),(274,1,8,55),(275,1,8,109),(276,1,8,102),(277,1,8,36),(278,1,8,45),(279,1,8,27),(280,1,8,80),(281,1,8,121),(282,1,8,12),(283,1,8,132),(284,1,8,16),(285,1,8,99),(286,1,8,37),(287,1,8,78),(288,1,8,34),(289,1,8,136),(290,1,8,96),(291,1,8,104),(292,1,8,111),(293,1,8,113),(294,1,8,112),(295,1,8,105),(296,1,8,106),(297,1,8,110),(298,1,8,5),(299,1,8,50),(300,1,8,79),(301,1,8,7),(302,1,8,114),(303,1,8,115),(304,1,8,91),(305,1,8,47),(306,1,8,20),(307,1,8,131),(308,1,8,15),(309,1,8,51),(310,1,8,129),(311,1,8,125),(312,1,8,124),(313,1,8,126),(314,1,8,123),(315,1,8,127),(316,1,8,117),(317,1,8,116),(318,1,8,118),(319,1,8,119),(320,1,8,120),(321,1,8,24),(322,1,8,133),(323,1,8,11),(324,1,8,21),(325,1,8,134),(326,1,8,101),(327,1,8,103),(328,1,8,87),(329,0,8,140),(330,1,9,90),(331,1,9,98),(332,1,9,3),(333,1,9,30),(334,1,9,68),(335,1,9,81),(336,1,9,1),(337,1,9,107),(338,1,9,128),(339,1,9,89),(340,1,9,53),(341,1,9,54),(342,1,9,52),(343,1,9,140),(344,1,9,74),(345,1,9,56),(346,1,9,137),(347,1,9,39),(348,1,9,49),(349,1,9,100),(350,1,9,64),(351,1,9,67),(352,1,9,22),(353,1,9,57),(354,1,9,28),(355,1,9,8),(356,1,9,75),(357,1,9,77),(358,1,9,14),(359,1,9,35),(360,1,9,76),(361,1,9,29),(362,1,9,138),(363,1,9,6),(364,1,9,58),(365,1,9,2),(366,1,9,62),(367,1,9,73),(368,1,9,108),(369,1,9,44),(370,1,9,85),(371,1,9,86),(372,1,9,94),(373,1,9,95),(374,1,9,97),(375,1,9,88),(376,1,9,122),(377,1,9,139),(378,1,9,46),(379,1,9,135),(380,1,9,43),(381,1,9,130),(382,1,9,93),(383,1,9,92),(384,1,9,55),(385,1,9,109),(386,1,9,102),(387,1,9,36),(388,1,9,45),(389,1,9,27),(390,1,9,80),(391,1,9,121),(392,1,9,12),(393,1,9,132),(394,1,9,16),(395,1,9,99),(396,1,9,37),(397,1,9,78),(398,1,9,34),(399,1,9,136),(400,1,9,96),(401,1,9,104),(402,1,9,111),(403,1,9,113),(404,1,9,112),(405,1,9,105),(406,1,9,106),(407,1,9,110),(408,1,9,5),(409,1,9,50),(410,1,9,79),(411,1,9,7),(412,1,9,114),(413,1,9,115),(414,1,9,91),(415,1,9,47),(416,1,9,20),(417,1,9,131),(418,1,9,15),(419,1,9,51),(420,1,9,129),(421,1,9,125),(422,1,9,124),(423,1,9,126),(424,1,9,123),(425,1,9,127),(426,1,9,117),(427,1,9,116),(428,1,9,118),(429,1,9,119),(430,1,9,120),(431,1,9,24),(432,1,9,133),(433,1,9,11),(434,1,9,21),(435,1,9,134),(436,1,9,101),(437,1,9,103),(438,1,9,87),(439,1,10,90),(440,1,10,98),(441,1,10,3),(442,1,10,30),(443,1,10,68),(444,1,10,81),(445,1,10,1),(446,1,10,107),(447,1,10,128),(448,1,10,89),(449,1,10,53),(450,1,10,54),(451,1,10,52),(452,1,10,140),(453,1,10,74),(454,1,10,56),(455,1,10,137),(456,1,10,39),(457,1,10,49),(458,1,10,100),(459,1,10,64),(460,1,10,67),(461,1,10,22),(462,1,10,57),(463,1,10,28),(464,1,10,8),(465,1,10,75),(466,1,10,77),(467,1,10,14),(468,1,10,35),(469,1,10,76),(470,1,10,29),(471,1,10,138),(472,1,10,6),(473,1,10,58),(474,1,10,2),(475,1,10,62),(476,1,10,73),(477,1,10,108),(478,1,10,44),(479,1,10,85),(480,1,10,86),(481,1,10,94),(482,1,10,95),(483,1,10,97),(484,1,10,88),(485,1,10,122),(486,1,10,139),(487,1,10,46),(488,1,10,135),(489,1,10,43),(490,1,10,130),(491,1,10,93),(492,1,10,92),(493,1,10,55),(494,1,10,109),(495,1,10,102),(496,1,10,36),(497,1,10,45),(498,1,10,27),(499,1,10,80),(500,1,10,121),(501,1,10,12),(502,1,10,132),(503,1,10,16),(504,1,10,99),(505,1,10,37),(506,1,10,78),(507,1,10,34),(508,1,10,136),(509,1,10,96),(510,1,10,104),(511,1,10,111),(512,1,10,113),(513,1,10,112),(514,1,10,105),(515,1,10,106),(516,1,10,110),(517,1,10,5),(518,1,10,50),(519,1,10,79),(520,1,10,7),(521,1,10,114),(522,1,10,115),(523,1,10,91),(524,1,10,47),(525,1,10,20),(526,1,10,131),(527,1,10,15),(528,1,10,51),(529,1,10,129),(530,1,10,125),(531,1,10,124),(532,1,10,126),(533,1,10,123),(534,1,10,127),(535,1,10,117),(536,1,10,116),(537,1,10,118),(538,1,10,119),(539,1,10,120),(540,1,10,24),(541,1,10,133),(542,1,10,11),(543,1,10,21),(544,1,10,134),(545,1,10,101),(546,1,10,103),(547,1,10,87),(548,1,11,90),(549,1,11,98),(550,1,11,3),(551,1,11,30),(552,1,11,68),(553,1,11,81),(554,1,11,1),(555,1,11,107),(556,1,11,128),(557,1,11,89),(558,1,11,53),(559,1,11,54),(560,1,11,52),(561,1,11,140),(562,1,11,74),(563,1,11,56),(564,1,11,137),(565,1,11,39),(566,1,11,49),(567,1,11,100),(568,1,11,64),(569,1,11,67),(570,1,11,22),(571,1,11,57),(572,1,11,28),(573,1,11,8),(574,1,11,75),(575,1,11,77),(576,1,11,14),(577,1,11,35),(578,1,11,76),(579,1,11,29),(580,1,11,138),(581,1,11,6),(582,1,11,58),(583,1,11,2),(584,1,11,62),(585,1,11,73),(586,1,11,108),(587,1,11,44),(588,1,11,85),(589,1,11,86),(590,1,11,94),(591,1,11,95),(592,1,11,97),(593,1,11,88),(594,1,11,122),(595,1,11,139),(596,1,11,46),(597,1,11,135),(598,1,11,43),(599,1,11,130),(600,1,11,93),(601,1,11,92),(602,1,11,55),(603,1,11,109),(604,1,11,102),(605,1,11,36),(606,1,11,45),(607,1,11,27),(608,1,11,80),(609,1,11,121),(610,1,11,12),(611,1,11,132),(612,1,11,16),(613,1,11,99),(614,1,11,37),(615,1,11,78),(616,1,11,34),(617,1,11,136),(618,1,11,96),(619,1,11,104),(620,1,11,111),(621,1,11,113),(622,1,11,112),(623,1,11,105),(624,1,11,106),(625,1,11,110),(626,1,11,5),(627,1,11,50),(628,1,11,79),(629,1,11,7),(630,1,11,114),(631,1,11,115),(632,1,11,91),(633,1,11,47),(634,1,11,20),(635,1,11,131),(636,1,11,15),(637,1,11,51),(638,1,11,129),(639,1,11,125),(640,1,11,124),(641,1,11,126),(642,1,11,123),(643,1,11,127),(644,1,11,117),(645,1,11,116),(646,1,11,118),(647,1,11,119),(648,1,11,120),(649,1,11,24),(650,1,11,133),(651,1,11,11),(652,1,11,21),(653,1,11,134),(654,1,11,101),(655,1,11,103),(656,1,11,87),(657,1,12,90),(658,1,12,98),(659,1,12,3),(660,1,12,30),(661,1,12,68),(662,1,12,81),(663,1,12,1),(664,1,12,107),(665,1,12,128),(666,1,12,89),(667,1,12,53),(668,1,12,54),(669,1,12,52),(670,1,12,140),(671,1,12,74),(672,1,12,56),(673,1,12,137),(674,1,12,39),(675,1,12,49),(676,1,12,100),(677,1,12,64),(678,1,12,67),(679,1,12,22),(680,1,12,57),(681,1,12,28),(682,1,12,8),(683,1,12,75),(684,1,12,77),(685,1,12,14),(686,1,12,35),(687,1,12,76),(688,1,12,29),(689,1,12,138),(690,1,12,6),(691,1,12,58),(692,1,12,2),(693,1,12,62),(694,1,12,73),(695,1,12,108),(696,1,12,44),(697,1,12,85),(698,1,12,86),(699,1,12,94),(700,1,12,95),(701,1,12,97),(702,1,12,88),(703,1,12,122),(704,1,12,139),(705,1,12,46),(706,1,12,135),(707,1,12,43),(708,1,12,130),(709,1,12,93),(710,1,12,92),(711,1,12,55),(712,1,12,109),(713,1,12,102),(714,1,12,36),(715,1,12,45),(716,1,12,27),(717,1,12,80),(718,1,12,121),(719,1,12,12),(720,1,12,132),(721,1,12,16),(722,1,12,99),(723,1,12,37),(724,1,12,78),(725,1,12,34),(726,1,12,136),(727,1,12,96),(728,1,12,104),(729,1,12,111),(730,1,12,113),(731,1,12,112),(732,1,12,105),(733,1,12,106),(734,1,12,110),(735,1,12,5),(736,1,12,50),(737,1,12,79),(738,1,12,7),(739,1,12,114),(740,1,12,115),(741,1,12,91),(742,1,12,47),(743,1,12,20),(744,1,12,131),(745,1,12,15),(746,1,12,51),(747,1,12,129),(748,1,12,125),(749,1,12,124),(750,1,12,126),(751,1,12,123),(752,1,12,127),(753,1,12,117),(754,1,12,116),(755,1,12,118),(756,1,12,119),(757,1,12,120),(758,1,12,24),(759,1,12,133),(760,1,12,11),(761,1,12,21),(762,1,12,134),(763,1,12,101),(764,1,12,103),(765,1,12,87);
/*!40000 ALTER TABLE `socorritomixcoacst_platillomenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_promocion`
--

DROP TABLE IF EXISTS `socorritomixcoacst_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `vigencia_dias` int(11) DEFAULT NULL,
  `es_por_periodo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_promocion`
--

LOCK TABLES `socorritomixcoacst_promocion` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `socorritomixcoacst_promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socorritomixcoacst_usuario`
--

DROP TABLE IF EXISTS `socorritomixcoacst_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socorritomixcoacst_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `socorritomixcoacst_usuario_user_id_f46b8f90_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_usuario`
--

LOCK TABLES `socorritomixcoacst_usuario` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `socorritomixcoacst_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-22 23:45:49
