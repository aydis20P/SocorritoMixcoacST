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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$m7NYrD35N7Kg$AEcCUaUEs0jrtUf1fEiQVJaMvTGFIMgUE3MY3K0RICU=','2021-06-17 01:39:24.405705',1,'socorritomixcoacst','','','desarrollo.socorrito@gmail.com',1,1,'2021-04-10 03:50:27.483117');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-24 18:17:40.271872','2','Día: 2021-04-23, Tipo: CO',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(2,'2021-04-24 18:18:48.228511','3','Día: 2021-04-23, Tipo: CE',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(3,'2021-04-24 18:18:55.703757','1','Día: 2021-04-23, Tipo: DE',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(4,'2021-04-25 14:47:24.735360','130','ID:130 Nombre: Jugo y fruta Tipo: EX Es complemento: False Es constante: False tipo_desayuno: D1',1,'[{\"added\": {}}]',9,1),(5,'2021-05-01 19:44:36.723508','329','Menú: (Día: 2021-05-01, Tipo: CO), Platillo: (ID:141 Nombre: Caldo de pollo con pieza Tipo: EX Es complemento: False Es constante: False), Disponible: False',1,'[{\"added\": {}}]',14,1),(6,'2021-05-01 19:45:57.834895','329','Menú: (Día: 2021-05-01, Tipo: CO), Platillo: (ID:140 Nombre: Caldo de pollo  Tipo: GU Es complemento: False Es constante: False), Disponible: False',2,'[{\"changed\": {\"fields\": [\"platillo\"]}}]',14,1),(7,'2021-05-17 23:14:30.100428','12','Día: 2021-05-16, Tipo: CO',2,'[{\"changed\": {\"fields\": [\"dia\"]}}]',13,1),(8,'2021-05-23 00:34:16.589154','129','ID:129 Nombre: Tempura helado Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(9,'2021-05-23 00:34:42.281648','128','ID:128 Nombre: Banana Roll Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(10,'2021-05-23 00:35:05.758926','127','ID:127 Nombre: Teppanyaki mixto Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(11,'2021-05-23 00:35:20.436066','126','ID:126 Nombre: Teppanyaki de res Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(12,'2021-05-23 00:35:35.049715','125','ID:125 Nombre: Teppanyaki de camarón Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(13,'2021-05-23 00:35:47.560942','124','ID:124 Nombre: Teppanyaki de pollo Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(14,'2021-05-23 00:36:02.936725','123','ID:123 Nombre: Teppanyaki de verduras Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(15,'2021-05-23 01:20:22.061655','101','ID:101 Nombre: Yakimeshi de pollo Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(16,'2021-05-23 01:21:33.557173','92','ID:92 Nombre: Kushiage de queso Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(17,'2021-05-23 01:21:47.798436','93','ID:93 Nombre: Kushiage de plátano con queso Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(18,'2021-05-23 01:21:58.387619','94','ID:94 Nombre: Gohan Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(19,'2021-05-23 01:22:09.940950','95','ID:95 Nombre: Gohan furikake ebi Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(20,'2021-05-23 01:22:30.314056','97','ID:97 Nombre: Gohan furikake sake Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1),(21,'2021-05-23 01:22:55.733012','99','ID:99 Nombre: Papas a la francesa Tipo: SU Es complemento: False Es constante: False',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',9,1);
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
INSERT INTO `django_session` VALUES ('24m3ve701z1hzxanikql5mz255rh0fkl','YTU5YzBmOWU0ZjkzZmFiN2RiNjY1YTllYTZmNzMzMzg1YmU2ZDM2Nzp7ImNsaWVudGVfYWN0dWFsIjoxfQ==','2021-05-02 06:40:36.209478'),('6umdz3vavxnhdbjp3rh0d69iiyak7g2q','Y2Q2YzE3MTQzZDZjZDRmYTJlMjQyYmQ3N2JhZjI4YWE4YmQ1ZTQyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwN2Y3NzVhODM3ZDU3NjM3MzY0OTU0YzkxZTRkZTM2OGI0ZjNiIiwiY2xpZW50ZV9hY3R1YWwiOjF9','2021-05-09 05:38:24.362978'),('6wcc3topl5biq1pq3p6s3zdppnzo804p','ZGM1MjgxYjY4MzE2ZmEzOTk0NmIxZDUxNmY2NDIzZWIxMGIxNWE1OTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ2FsZG8gZGUgaGFiYSJdLFsibWVudS0xLTEiLCJFbnNhbGFkYSJdLFsibWVudS0xLTIiLCJTYWxtXHUwMGYzbiBhIGxhIHBsYW5jaGEiXSxbIm1lbnUtMi0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTItMSIsIkVzcGFndWV0dGkiXSxbIm1lbnUtMi0yIiwiQ2FybmUgZGUgcmVzIGVuIHZlcmRlIGNvbiBjYWxhYmF6YXMiXSxbIm1lbnUtMy0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTMtMSIsIkFycm96Il0sWyJtZW51LTMtMiIsIkNhbGRvIGRlIHJlcyJdXSwidG9kb3Nfb3JkZW5lcyI6W10sInRvZG9zX2JlYmlkYXMiOltdLCJ0b2Rvc19leHRyYXMiOltdLCJ0b2Rvc19kZXNheXVub3MiOltdLCJpZF9vcmRlbl9nZW5lcmFkYSI6MTB9','2021-05-08 22:01:15.372848'),('7k0l8xhscb0yet0wcxrdiayahdpriwkd','OWQ4Mzk1OTAxYzFhZTI4ZmZlNTY5YmJiMmRmNWE3MWY3ODNlOTNlZjp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiQ29uIHRvZG8iLCJ0b2Rvc19tZW51cyI6W1sibWVudS0xLTAiLCJDb25zb21cdTAwZTkiXSxbIm1lbnUtMS0xIiwiQXJyb3oiXSxbIm1lbnUtMS0yIiwiQ2FsZG8gZGUgcmVzIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwN2Y3NzVhODM3ZDU3NjM3MzY0OTU0YzkxZTRkZTM2OGI0ZjNiIiwidG9kb3NfZGVzYXl1bm9zIjpbXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjksInRlbGVmb25vIjoiNzY1MTI2MzU3NSJ9','2021-05-15 17:33:59.714590'),('7pu1r9faiyp0qf1ypc6ltqddxjc60y65','NTg4ZDRhYTBkYTNkYTQwMTU4YjBlMDU4ZjgwYTVjZWU1MjYwNjhlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwN2Y3NzVhODM3ZDU3NjM3MzY0OTU0YzkxZTRkZTM2OGI0ZjNiIn0=','2021-07-01 01:39:24.414971'),('banh2bvqasducd9hq1yq70rz43yhs95z','N2FmNWMzZTE0MjVlMmE4NWExMWRlZDY0NTQ4MGRmOGJmNzc1NDg2Nzp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiRW5zYWxhZGEiXSxbIm1lbnUtMS0xIiwiU29wYSJdLFsibWVudS0xLTIiLCJDaHVsZXRhIGFodW1hZGEgYSBsYSBwbGFuY2hhIl1dLCJ0b2Rvc19vYnNlcnZhY2lvbmVzX2luZGl2aWR1YWxlcyI6W1sib2JzZXJ2YWNpb25lcy1pbmRpdmlkdWFsZXMtMSIsIiJdXSwidG9kb3Nfb3JkZW5lcyI6W1siQWxhbWJyZSBkZSBwb2xsbyIsIjIiXSxbIkFycm96IiwiMiJdLFsiQ2FsZG8gdGxhbHBlXHUwMGYxbyIsIjIiXSxbIkNhcm5lIGRlIHJlcyBlbiB2ZXJkZSBjb24gY2FsYWJhemFzIiwiMiJdXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX3N1c2hpcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W119','2021-06-08 03:13:38.847773'),('caxnjn3hp5kt2yg6yujx3toms9tkpgf8','YWZiMjdjNjI5ZTdjNmMxYjQ0ZjA4MzE4NDZiZTE4MjM0MGZhYjMzNTp7ImNsaWVudGVfYWN0dWFsIjoxLCJ0ZWxlZm9ubyI6Ijg3NTU1NTQ2NDYifQ==','2021-06-06 17:02:43.427040'),('i6ntppeqbxby9xkrfurzdfy9rrm6di2d','M2MzYzQyMTk4ZWZhNDVlZTc1YTU2NWUwYjhlZjhmYjU3OTA0YmJhMTp7ImNsaWVudGVfYWN0dWFsIjoyLCJvYnNlcnZhY2lvbmVzIjoibXVjaGFzIHNlcnZpbGxldGFzIHBvciBmYXZvciIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNyZW1hIGRlIGJyb2NvbGkiXSxbIm1lbnUtMS0xIiwiRW5zYWxhZGEiXSxbIm1lbnUtMS0yIiwiRW5jaGlsYWRhcyBkZSBtb2xlIl0sWyJtZW51LTItMCIsIkNvbnNvbVx1MDBlOSJdLFsibWVudS0yLTEiLCJFbnNhbGFkYSJdLFsibWVudS0yLTIiLCJIdWV2b3MgY29uIGVqb3RlcyJdLFsibWVudS0zLTAiLCJDb25zb21cdTAwZTkiXSxbIm1lbnUtMy0xIiwiQ29kaXRvIGEgbGEgY3JlbWEiXSxbIm1lbnUtMy0yIiwiSHVldm9zIEFsIGd1c3RvIl1dLCJ0b2Rvc19vcmRlbmVzIjpbWyJBbGFtYnJlIGRlIHBvbGxvIiwiMyJdXSwidG9kb3NfYmViaWRhcyI6W1siQWd1YSBwYXJhIG5lc2NhZmUiLCIzIl0sWyJDYWZcdTAwZTkgYW1lcmljYW5vIiwiMiJdLFsiQ2FmXHUwMGU5IGNvbiBsZWNoZSIsIjEiXSxbIkNhZlx1MDBlOSBkZSBvbGxhIiwiMiJdLFsiQ2FwdWNoaW5vIiwiMiJdLFsiQ2hvY29sYXRlIiwiMiJdLFsiRXhwcmVzc28iLCIyIl0sWyJKdWdvIiwiMiJdLFsiTGVjaGUgQ2FsaWVudGUiLCIyIl0sWyJUXHUwMGU5IiwiMSJdXSwidG9kb3NfZXh0cmFzIjpbWyJDZXJlYWwgY29uIExlY2hlIiwiMiJdLFsiRnJ1dGEiLCIzIl0sWyJNb2xsZXRlcyIsIjIiXSxbIlNhbGNoaXB1bHBvcyIsIjIiXSxbIlNvcGVzIGNvbiBwb2xsbyIsIjIiXV0sInRvZG9zX2Rlc2F5dW5vcyI6W1siMSIsIlBhcXVldGUgMSJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiSG90Y2FrZXMiXSxbIjFfMyIsIkNob2NvbGF0ZSJdLFsiMiIsIlBhcXVldGUgMiJdLFsiMl8xIiwiRnJ1dGEiXSxbIjJfMiIsIkh1ZXZvcyBBbCBndXN0byJdLFsiMl8zIiwiQ2FmXHUwMGU5IGFtZXJpY2FubyJdXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjJ9','2021-05-08 05:27:05.445369'),('kisd1kybyyc5jcc8e0sm5vu8ff6oz4ds','ZmJmNjc5ZjkzYjc3MzNhZjJiOTkwODk0MTcwOGM0MTdlZjMzYWUwNjp7ImNsaWVudGVfYWN0dWFsIjoyLCJvYnNlcnZhY2lvbmVzIjoiRXN0byIsInRvZG9zX21lbnVzIjpbXSwidG9kb3Nfb3JkZW5lcyI6W1siQXJyb3oiLCIxIl0sWyJDb2RpdG8gYSBsYSBjcmVtYSIsIjEiXSxbIlBvbGxvIGNvbiBtb2xlIiwiMSJdLFsiRW5jaGlsYWRhcyBkZSBtb2xlIiwiMSJdXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W119','2021-04-24 16:54:49.224390'),('lm53bmcq9v73zdjentpp5mgbqhdvulq1','MjAyOGM5N2VjMmZhN2ZhNDIyZDcxOGIyNGZmNDFlMGViYWJkZTRlNzp7InRlbGVmb25vIjoiNTU1NTkzODU4MSIsImNsaWVudGVfYWN0dWFsIjo2LCJvYnNlcnZhY2lvbmVzIjoiT2xsYSIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNvbnNvbVx1MDBlOSJdLFsibWVudS0xLTEiLCJBcnJveiJdLFsibWVudS0xLTIiLCJBcnJhY2hlcmEiXSxbIm1lbnUtMi0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTItMSIsIkFycm96Il0sWyJtZW51LTItMiIsIlRvcnRhcyBkZSBwYXBhIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W10sImlkX29yZGVuX2dlbmVyYWRhIjoxNH0=','2021-05-17 12:41:32.568022'),('mxq6s9twlhb7vu7cs57qinoirb5s03cz','ZjEwYjRiYTcyYjEwODhlNmIzODYwNGNlMGZiN2NjY2RmNDA5NmEwYjp7InRlbGVmb25vIjoiNTUzMDU3MDYwMSIsImNsaWVudGVfYWN0dWFsIjo1NSwib2JzZXJ2YWNpb25lcyI6IiIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIlNvcGEiXSxbIm1lbnUtMS0xIiwiQXJyb3oiXSxbIm1lbnUtMS0yIiwiQ2FybmUgZGUgcmVzIGVuIGVudG9tYXRhZG8iXSxbIm1lbnUtMi0wIiwiRXNwYWd1ZXR0aSJdLFsibWVudS0yLTEiLCJFbnNhbGFkYSJdLFsibWVudS0yLTIiLCJBbGFtYnJlIGRlIHBvbGxvIl1dLCJ0b2Rvc19vYnNlcnZhY2lvbmVzX2luZGl2aWR1YWxlcyI6W1sib2JzZXJ2YWNpb25lcy1pbmRpdmlkdWFsZXMtMSIsIiJdLFsib2JzZXJ2YWNpb25lcy1pbmRpdmlkdWFsZXMtMiIsIiJdXSwidG9kb3Nfb3JkZW5lcyI6W10sInRvZG9zX2JlYmlkYXMiOltdLCJ0b2Rvc19leHRyYXMiOltdLCJ0b2Rvc19zdXNoaXMiOltdLCJ0b2Rvc19kZXNheXVub3MiOltdLCJpZF9vcmRlbl9nZW5lcmFkYSI6NjF9','2021-06-09 18:21:29.296131'),('qerztvcq9wgqp5857r5h15s9m2qocpd0','MWMxMDY5ZjI0ZmMwNjRjY2IxNWNmNzU0OWRkNmQ5OThiZDc3ZmVjMTp7ImNsaWVudGVfYWN0dWFsIjoxLCJ0ZWxlZm9ubyI6IjQyMzQyMzQyMzIiLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vYnNlcnZhY2lvbmVzX2luZGl2aWR1YWxlcyI6W10sInRvZG9zX29yZGVuZXMiOltdLCJ0b2Rvc19iZWJpZGFzIjpbXSwidG9kb3NfZXh0cmFzIjpbXSwidG9kb3Nfc3VzaGlzIjpbWyJBdm9jYWRvIFJvbGwiLCIxIl0sWyJCYW5hbmEgUm9sbCIsIjIiXSxbIkZyZXNhIFJvbGwiLCIyIl0sWyJHb2hhbiIsIjEiXV0sInRvZG9zX2Rlc2F5dW5vcyI6W10sImlkX29yZGVuX2dlbmVyYWRhIjoxNywiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjNjA3Zjc3NWE4MzdkNTc2MzczNjQ5NTRjOTFlNGRlMzY4YjRmM2IifQ==','2021-06-08 02:46:32.429387'),('qfee0knej7uewncruvf2hgtruas8o0cd','YjExNTYzNDJmZjdmMzkzY2I0OGRjOTVmZTE1ZTNkY2IwOTBjYjJlYzp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiY29uIGhhcnRvIGNoaWxlIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkNvZGl0byBhIGxhIGNyZW1hIl0sWyJtZW51LTEtMiIsIkNoaWxlIHJlbGxlbm8gZGUgcXVlc28iXV0sInRvZG9zX29yZGVuZXMiOltdLCJ0b2Rvc19iZWJpZGFzIjpbXSwidG9kb3NfZXh0cmFzIjpbXSwidG9kb3NfZGVzYXl1bm9zIjpbWyIxIiwiUGFxdWV0ZSBpbmZhbnRpbCJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiU2FsY2hpcHVscG9zIl0sWyIyIiwiUGFxdWV0ZSA1Il0sWyIyXzEiLCJKdWdvIl0sWyIyXzIiLCJQZWNodWdhIGFzYWRhIl0sWyIyXzMiLCJDaG9jb2xhdGUiXV0sImlkX29yZGVuX2dlbmVyYWRhIjozfQ==','2021-05-08 05:32:19.660420'),('rj5cva1ve2eeuxr4ix4qmpsna6qnnid7','MTAzZDk0NjYxYWJmMjA3NTg1YzEyMjFmYzhlNmUwNDZmYzNlNjVhMTp7InRlbGVmb25vIjoiOTEyMzg3NjEyOCIsImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiU2Fsc2EgYXBhcnRlIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQXJyb3oiXSxbIm1lbnUtMS0xIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMiIsIkNhbGRvIGRlIHJlcyJdLFsibWVudS0yLTAiLCJBcnJveiJdLFsibWVudS0yLTEiLCJBcnJveiJdLFsibWVudS0yLTIiLCJDZWNpbmEiXV0sInRvZG9zX29ic2VydmFjaW9uZXNfaW5kaXZpZHVhbGVzIjpbWyJvYnNlcnZhY2lvbmVzLWluZGl2aWR1YWxlcy0xIiwiUmVmcml0b3MiXSxbIm9ic2VydmFjaW9uZXMtaW5kaXZpZHVhbGVzLTIiLCJEZSBsYSBvbGxhIl1dLCJ0b2Rvc19vcmRlbmVzIjpbWyJDb25zb21cdTAwZTkiLCIyIl1dLCJ0b2Rvc19iZWJpZGFzIjpbWyJFeHByZXNzbyIsIjEiXV0sInRvZG9zX2V4dHJhcyI6W1siQXZvY2FkbyBSb2xsIiwiMSJdXSwidG9kb3Nfc3VzaGlzIjpbXSwidG9kb3NfZGVzYXl1bm9zIjpbXSwiaWRfb3JkZW5fZ2VuZXJhZGEiOjE1LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGM2MDdmNzc1YTgzN2Q1NzYzNzM2NDk1NGM5MWU0ZGUzNjhiNGYzYiJ9','2021-06-08 17:45:05.094303'),('s71haqfj0f0r8cw61uutkuenunwad3fa','NGRmMTM3YzMyM2RmMzZlYTVjYzZiNDg0MDJmMmZjNmJjZThiOTc5NDp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkFycm96Il0sWyJtZW51LTEtMiIsIkFsYW1icmUgZGUgcG9sbG8iXSxbIm1lbnUtMi0wIiwiQ2FsZG8gZGUgaGFiYSJdLFsibWVudS0yLTEiLCJFc3BhZ3VldHRpIl0sWyJtZW51LTItMiIsIkNodWxldGEgYWh1bWFkYSBhIGxhIHBsYW5jaGEiXV0sInRvZG9zX29yZGVuZXMiOltbIkFsYW1icmUgZGUgcG9sbG8iLCIxIl1dLCJ0b2Rvc19iZWJpZGFzIjpbWyJBZ3VhIGRlIHNhYm9yIiwiMSJdXSwidG9kb3NfZXh0cmFzIjpbWyIzIE1vbGxldGVzIiwiMSJdXSwidG9kb3NfZGVzYXl1bm9zIjpbWyIxIiwiUGFxdWV0ZSAxIl0sWyIxXzEiLCJKdWdvIl0sWyIxXzIiLCJTb3BlcyBjb24gcG9sbG8iXSxbIjFfMyIsIkNhZlx1MDBlOSBkZSBvbGxhIl1dLCJpZF9vcmRlbl9nZW5lcmFkYSI6MTF9','2021-05-09 03:00:56.812484'),('sybncfe8v3lmsi8823426oskhnsd0psx','NGEwMDc0MGMwYjhkYTk0ZDAxYmQ1OGQ0OGMyMjY2OTAxZDEwYzI4Mjp7ImNsaWVudGVfYWN0dWFsIjozLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vcmRlbmVzIjpbWyJBcnJveiIsIjEiXSxbIkVuc2FsYWRhIiwiMSJdLFsiRW5jaGlsYWRhcyBkZSBtb2xlIiwiMSJdXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W119','2021-04-24 22:26:51.533019'),('uanimrzcfdhfh6ncoeijplzxryhza9d8','ODZmZTg2N2RjMTVlOTc1MjNjMDkwODQ0MGM2NGZlNmUwMzNiNmEzNjp7ImNsaWVudGVfYWN0dWFsIjozLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W1siMSIsIlBhcXVldGUgMSJdLFsiMV8xIiwiSnVnbyJdLFsiMV8yIiwiU29wZXMgY29uIHBvbGxvIl0sWyIxXzMiLCJDYXB1Y2hpbm8iXSxbIjIiLCJQYXF1ZXRlIDIiXSxbIjJfMSIsIkZydXRhIl0sWyIyXzIiLCJIdWV2b3MgQWwgZ3VzdG8iXSxbIjJfMyIsIkNhZlx1MDBlOSBhbWVyaWNhbm8iXV0sImlkX29yZGVuX2dlbmVyYWRhIjo3fQ==','2021-05-08 05:48:50.056754'),('vthtm62b90binbpv09htaioggtm7xbqr','YTU5YzBmOWU0ZjkzZmFiN2RiNjY1YTllYTZmNzMzMzg1YmU2ZDM2Nzp7ImNsaWVudGVfYWN0dWFsIjoxfQ==','2021-06-12 16:11:05.919251'),('xe3y7r66lyqoe8t065di5pdu6z84lp16','OTA1NjM0ZTA5YTE1ZDlmOTc1ZWY4Zjc4MWFlY2VmNjVhMGI2YmZhZTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiT2JzZXJ2YWNpb25lcyIsInRvZG9zX21lbnVzIjpbWyJtZW51LTEtMCIsIkNyZW1hIGRlIGJyb2NvbGkiXSxbIm1lbnUtMS0xIiwiQ29kaXRvIGEgbGEgY3JlbWEiXSxbIm1lbnUtMS0yIiwiQ2h1bGV0YSBhaHVtYWRhIGEgbGEgcGxhbmNoYSJdXSwidG9kb3Nfb3JkZW5lcyI6W10sInRvZG9zX2JlYmlkYXMiOltdLCJ0b2Rvc19leHRyYXMiOltdLCJ0b2Rvc19kZXNheXVub3MiOltbIjEiLCJQYXF1ZXRlIDEiXSxbIjFfMSIsIkp1Z28iXSxbIjFfMiIsIkhvdGNha2VzIl0sWyIxXzMiLCJDYWZcdTAwZTkgYW1lcmljYW5vIl1dLCJpZF9vcmRlbl9nZW5lcmFkYSI6OCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjNjA3Zjc3NWE4MzdkNTc2MzczNjQ5NTRjOTFlNGRlMzY4YjRmM2IiLCJ0ZWxlZm9ubyI6Ijk1ODc3OCM0NE4ifQ==','2021-05-22 23:35:10.310935'),('ze3dydja2wi4h81pqmrxd3wrvu9xdvit','N2ZmYzdkNzU1YjlhZWU2NTlmNTljYzkzMWMzNGI1NDAyNjFmZWQzMjp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltdLCJ0b2Rvc19vYnNlcnZhY2lvbmVzX2luZGl2aWR1YWxlcyI6W10sInRvZG9zX29yZGVuZXMiOltdLCJ0b2Rvc19iZWJpZGFzIjpbXSwidG9kb3NfZXh0cmFzIjpbXSwidG9kb3Nfc3VzaGlzIjpbXSwidG9kb3NfZGVzYXl1bm9zIjpbWyIxIiwiUGFxdWV0ZSAxIl0sWyIxXzEiLCJKdWdvIHkgRnJ1dGEiXSxbIjFfMiIsIkhvdGNha2VzIl0sWyIxXzMiLCJDYWZcdTAwZTkgYW1lcmljYW5vIl0sWyIyIiwiUGFxdWV0ZSAxIl0sWyIyXzEiLCJKdWdvIHkgRnJ1dGEiXSxbIjJfMiIsIkhvdGNha2VzIl0sWyIyXzMiLCJDYWZcdTAwZTkgYW1lcmljYW5vIl0sWyIzIiwiUGFxdWV0ZSBpbmZhbnRpbCJdLFsiM18xIiwiSnVnbyB5IEZydXRhIl0sWyIzXzIiLCJIdWV2b3MgQWwgZ3VzdG8iXV19','2021-06-06 16:55:44.866296'),('zg20yjt0dl6way77atewu40wctw0e42w','Mjk5YjJhMjE0ODA5ZDE3NDdkZmVmZjQ4ODgzMzRhNTM3YjgwNDBiYTp7ImNsaWVudGVfYWN0dWFsIjoxLCJvYnNlcnZhY2lvbmVzIjoiIiwidG9kb3NfbWVudXMiOltbIm1lbnUtMS0wIiwiQ29uc29tXHUwMGU5Il0sWyJtZW51LTEtMSIsIkFycm96Il0sWyJtZW51LTEtMiIsIkNoaWxhcXVpbGVzIl1dLCJ0b2Rvc19vcmRlbmVzIjpbXSwidG9kb3NfYmViaWRhcyI6W10sInRvZG9zX2V4dHJhcyI6W10sInRvZG9zX2Rlc2F5dW5vcyI6W119','2021-05-08 05:35:48.966811');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_cliente`
--

LOCK TABLES `socorritomixcoacst_cliente` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_cliente` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_cliente` VALUES (1,'Tobias Palacios Reyes','1122334455','calle 13','entre calle 1 y 2','NU','5544332211','2021-04-24',11,3101.1005999999998),(2,'Yuri Gargarin','1231231231','Calle MIxcoac','en el Mercado','NU','1231231231','2021-04-24',1,1103.09172),(3,'El Anton Mendeleiev','5556736309','Rue Morgue','Enfrente de la Iglesia','NU','5568745167','2021-04-24',1,155),(4,'Yolanda','5560290470','Guillain 37 Depto 202','Marcar antes de llevar','NU','','2021-04-24',2,470),(5,'Francisco santiago Na','5541443267','Capuchinas 55','San José insurgentes ','NU','','2021-05-01',1,150),(6,'Guadalupe Xx','5534747995','Parroquia 304 del valle','','NU','','2021-05-01',1,675),(7,'Mari ','5538874163','Rosa castilla 161','Molino de rosas','NU','','2021-05-01',0,0),(8,'Guadalupe lozano ','5555938581','Torre de mixcoac A13 de 1103','','NU','','2021-05-01',1,175),(9,'otoño 21','5543185110','otoño21  merced gomez','','NU','','2021-05-23',1,100),(10,'teresa mendoza','5529190390','Mario moreno 63 hogar redencion ','','NU','','2021-05-23',1,75),(11,'rafael sanchez ','5558471791','vandik 79  Santa maria nonoalco ','','NU','','2021-05-23',1,80),(12,'sr raul','5555630000','Cda guillain 19 depto 2 mixcoac','','NU','','2021-05-23',1,240),(13,'Alejandro macias','5581010188','Felix Parra 99 San José insurgentes','','NU','','2021-05-23',1,330),(14,'Sr leon','5680050028','Rosa Reyna 35 Molino Rosas','','NU','','2021-05-23',1,75),(15,'Gil','5555981326','López Mateos # 74','Entre Tiziano y Giotto ','NU','','2021-05-23',1,165),(16,'Jessica González ','5522538895','Carlos Dolci # 73 casa 2 Alfonso 13','','NU','','2021-05-23',1,155),(17,'Isaac ','5561119500','Leonardo davinci # 73 int 1 Mixcoac','','NU','','2021-05-23',1,95),(18,'José romero','5526589550','Av Revolución 821 Mixcoac','Alado farmacia similares tocar timbre de hasta arriba ','NU','','2021-05-23',1,95),(19,'Mario Hinojosa ','5556115969','Rebull # 51 int E 201  Mixcoac','','NU','','2021-05-23',2,255),(20,'Graciela','5556113114','Castañeda # 21  Mixcoac','','NU','','2021-05-23',1,160),(21,'Arturo Hinojosa ','5535180491','Jose María rico # 123 int 501 del valle ','','NU','','2021-05-23',1,85),(22,'Sra.Fernanda','5588910081','D3 depto 2 Plateros','','NU','','2021-05-24',2,160),(23,'Chacón','5513793021','Rosa esmeralda 48- 501 Molinos de rosas','','NU','','2021-05-24',1,70),(24,'Laura','5525581637','Palomar 25 General Anaya','','NU','','2021-05-24',1,85),(25,'Guadalupe ','5534746995','Parroquia 304 Del valle','','NU','','2021-05-24',2,320),(26,'Daniel','5531381628','Rebull 5-2 Mixcoac','','NU','','2021-05-24',2,310),(27,'Sandra','5543303424','Leonardo da Vinci 43 Mixcoac','','NU','','2021-05-24',1,70),(28,'Guadalupe','5555635705','Donatello 58 B Insurgentes Mixcoac','','NU','','2021-05-24',1,150),(29,'Jazmín','5526940147','Amores 1868 int 101 Del valle','','NU','','2021-05-24',1,160),(30,'Norma','5556119171','Natal pesado 27 int 1 Mixcoac','','NU','','2021-05-24',2,170),(31,'Sr.Ruben Ramirez','5556518471','Av del rosal 291 edificio 32 depto 301 Olivar del conde','','NU','','2021-05-25',0,0),(32,'Gloria','5571435621','Siciliano Manzana 15  Lote  12 Primera victoria','','NU','','2021-05-25',0,0),(33,'Aurora','5555638278','Leonardo Da Vinci 9 Mixcoac','','NU','','2021-05-25',0,0),(34,'Miguel ','5566968178','Molinos 20 - 5 Mixcoac','','NU','','2021-05-25',0,0),(35,'Jesus','5555038722','Franz Halls 94 .','','NU','','2021-05-25',0,0),(36,'Sra. Mary','5538814163','Rosa de Castilla 161 Molino de rosas','','NU','','2021-05-25',0,0),(37,'Victor','5556517647','Rosa Perla  Molino de rosas','','NU','','2021-05-25',0,0),(38,'Monse','5586701185','Calle 12 no. 25 Olivar del conde','','NU','','2021-05-25',0,0),(39,'Betty','5523002855','Giotto 38 - 305 .','','NU','','2021-05-25',1,170),(40,'Ruben','5563619885','Giotto 52- 203 B .','','NU','','2021-05-25',1,230),(41,'Carlos','5617449013','Calle 17 #108 int 5 San pedro','','NU','','2021-05-25',1,165),(42,'Sra Arcos','5555633279','Charco azul 39 Mixcoac','','NU','','2021-05-25',1,165),(43,'Ruben','5573869142','Chilla 111 - 46 Mixcoac','','NU','','2021-05-25',1,245),(44,'Ruth','5543904974','Rosa violeta 108 .','','NU','','2021-05-25',0,0),(45,'Isidro','5556152841','Giotto 110 esa Carlos Dolci .','','NU','','2021-05-25',1,150),(46,'Yamilet','5528904994','Felix Parra 62 .','Portón de Madera','NU','','2021-05-25',1,305),(47,'Efraín Morales','5525306012','Sebastián del piombo 48 int 405 .','','NU','','2021-05-26',1,170),(48,'Xxx','5516786857','San Antonio Mitla 303 .','','NU','','2021-05-26',1,345),(49,'Xxx','5582479885','Cerrada 8 de agosto No. 5 8 de agosto','','NU','','2021-05-26',1,80),(50,'Xxx','5520784373','Augusto Rodin 452 int 403 Insurgentes Mixcoac','A lado de la universidad Panamericana \r\nEntre Goya y Extremadura','NU','','2021-05-26',1,150),(51,'Alejandro Esquivel','5573818233','Hotel Pasadena .','','NU','','2021-05-26',1,130),(52,'Pineda','5534996461','Pineda Tlacoquemecatl','','NU','','2021-05-26',1,85),(53,'Norma Morales','5518497574','Adriano Brower 98 Alfonso XIII','','NU','','2021-05-26',1,160),(54,'Jessica','5528978172','Gas Licuado .','','NU','','2021-05-26',1,70),(55,'Tiziano 48','5530570601','Tiziano 48 Depto 201 .','','NU','','2021-05-26',1,170);
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
INSERT INTO `socorritomixcoacst_desayuno` VALUES (1,'Paquete 1',80),(2,'Paquete 2',85),(3,'Paquete 3',95),(4,'Paquete 4',100),(5,'Paquete 5',105),(6,'Paquete 6',130),(7,'Paquete infantil',65);
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
) ENGINE=InnoDB AUTO_INCREMENT=704 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_historialprecio`
--

LOCK TABLES `socorritomixcoacst_historialprecio` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_historialprecio` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_historialprecio` VALUES (523,50,'2021-05-23 16:44:17.622709',1,90),(524,20,'2021-05-23 16:44:17.638546',1,151),(525,15,'2021-05-23 16:44:17.654732',1,98),(526,15,'2021-05-23 16:44:17.670695',1,3),(527,65,'2021-05-23 16:44:17.689851',1,30),(528,75,'2021-05-23 16:44:17.706592',1,68),(529,65,'2021-05-23 16:44:17.722931',1,71),(530,100,'2021-05-23 16:44:17.740731',1,81),(531,30,'2021-05-23 16:44:17.761141',1,1),(532,55,'2021-05-23 16:44:17.776062',1,107),(533,75,'2021-05-23 16:44:17.791457',1,128),(534,15,'2021-05-23 16:44:17.807126',1,89),(535,18,'2021-05-23 16:44:17.823158',1,53),(536,40,'2021-05-23 16:44:17.838102',1,54),(537,15,'2021-05-23 16:44:17.853843',1,52),(538,30,'2021-05-23 16:44:17.869691',1,83),(539,65,'2021-05-23 16:44:17.884622',1,140),(540,65,'2021-05-23 16:44:17.899981',1,141),(541,20,'2021-05-23 16:44:17.915779',1,142),(542,70,'2021-05-23 16:44:17.931207',1,74),(543,30,'2021-05-23 16:44:17.947079',1,56),(544,65,'2021-05-23 16:44:17.965443',1,32),(545,65,'2021-05-23 16:44:17.982793',1,156),(546,65,'2021-05-23 16:44:17.998712',1,137),(547,65,'2021-05-23 16:44:18.023119',1,72),(548,70,'2021-05-23 16:44:18.049698',1,39),(549,25,'2021-05-23 16:44:18.065116',1,49),(550,35,'2021-05-23 16:44:18.080205',1,100),(551,75,'2021-05-23 16:44:18.095323',1,159),(552,55,'2021-05-23 16:44:18.110412',1,64),(553,60,'2021-05-23 16:44:18.125814',1,42),(554,60,'2021-05-23 16:44:18.142615',1,67),(555,60,'2021-05-23 16:44:18.158396',1,22),(556,30,'2021-05-23 16:44:18.173185',1,57),(557,60,'2021-05-23 16:44:18.188230',1,28),(558,20,'2021-05-23 16:44:18.203434',1,143),(559,35,'2021-05-23 16:44:18.224237',1,4),(560,30,'2021-05-23 16:44:18.240422',1,8),(561,80,'2021-05-23 16:44:18.257010',1,40),(562,70,'2021-05-23 16:44:18.272264',1,75),(563,80,'2021-05-23 16:44:18.287547',1,77),(564,65,'2021-05-23 16:44:18.303368',1,33),(565,30,'2021-05-23 16:44:18.318770',1,9),(566,30,'2021-05-23 16:44:18.334385',1,10),(567,50,'2021-05-23 16:44:18.350246',1,14),(568,50,'2021-05-23 16:44:18.366619',1,59),(569,80,'2021-05-23 16:44:18.384058',1,38),(570,65,'2021-05-23 16:44:18.400850',1,35),(571,80,'2021-05-23 16:44:18.420266',1,76),(572,65,'2021-05-23 16:44:18.437305',1,25),(573,65,'2021-05-23 16:44:18.455294',1,29),(574,65,'2021-05-23 16:44:18.476919',1,138),(575,30,'2021-05-23 16:44:18.494518',1,6),(576,30,'2021-05-23 16:44:18.511360',1,58),(577,32,'2021-05-23 16:44:18.527458',1,2),(578,60,'2021-05-23 16:44:18.542473',1,62),(579,55,'2021-05-23 16:44:18.559229',1,152),(580,20,'2021-05-23 16:44:18.574013',1,150),(581,70,'2021-05-23 16:44:18.589672',1,73),(582,60,'2021-05-23 16:44:18.607320',1,154),(583,55,'2021-05-23 16:44:18.623517',1,108),(584,25,'2021-05-23 16:44:18.639655',1,44),(585,15,'2021-05-23 16:44:18.655145',1,85),(586,25,'2021-05-23 16:44:18.670139',1,86),(587,35,'2021-05-23 16:44:18.684789',1,94),(588,40,'2021-05-23 16:44:18.700220',1,95),(589,45,'2021-05-23 16:44:18.717941',1,97),(590,10,'2021-05-23 16:44:18.733972',1,88),(591,70,'2021-05-23 16:44:18.748691',1,122),(592,70,'2021-05-23 16:44:18.763639',1,139),(593,60,'2021-05-23 16:44:18.778592',1,26),(594,15,'2021-05-23 16:44:18.796913',1,46),(595,65,'2021-05-23 16:44:18.811912',1,135),(596,45,'2021-05-23 16:44:18.828076',1,48),(597,50,'2021-05-23 16:44:18.850694',1,13),(598,15,'2021-05-23 16:44:18.868147',1,43),(599,20,'2021-05-23 16:44:18.887671',1,93),(600,20,'2021-05-23 16:44:18.911705',1,92),(601,65,'2021-05-23 16:44:18.939217',1,157),(602,28,'2021-05-23 16:44:18.970493',1,55),(603,55,'2021-05-23 16:44:18.990690',1,109),(604,20,'2021-05-23 16:44:19.009493',1,145),(605,45,'2021-05-23 16:44:19.029445',1,102),(606,75,'2021-05-23 16:44:19.046773',1,36),(607,20,'2021-05-23 16:44:19.063635',1,147),(608,70,'2021-05-23 16:44:19.079249',1,84),(609,20,'2021-05-23 16:44:19.095012',1,45),(610,60,'2021-05-23 16:44:19.110670',1,27),(611,110,'2021-05-23 16:44:19.125140',1,80),(612,100,'2021-05-23 16:44:19.139962',1,121),(613,55,'2021-05-23 16:44:19.157637',1,61),(614,50,'2021-05-23 16:44:19.188198',1,12),(615,55,'2021-05-23 16:44:19.205852',1,132),(616,55,'2021-05-23 16:44:19.222528',1,17),(617,55,'2021-05-23 16:44:19.238087',1,153),(618,35,'2021-05-23 16:44:19.254864',1,16),(619,80,'2021-05-23 16:44:19.270449',1,41),(620,30,'2021-05-23 16:44:19.286651',1,99),(621,80,'2021-05-23 16:44:19.306079',1,37),(622,85,'2021-05-23 16:44:19.321744',1,78),(623,65,'2021-05-23 16:44:19.337792',1,31),(624,60,'2021-05-23 16:44:19.357181',1,66),(625,50,'2021-05-23 16:44:19.374025',1,19),(626,65,'2021-05-23 16:44:19.389767',1,69),(627,65,'2021-05-23 16:44:19.405138',1,23),(628,65,'2021-05-23 16:44:19.426576',1,82),(629,65,'2021-05-23 16:44:19.443217',1,34),(630,65,'2021-05-23 16:44:19.458801',1,155),(631,65,'2021-05-23 16:44:19.474387',1,136),(632,60,'2021-05-23 16:44:19.489803',1,65),(633,20,'2021-05-23 16:44:19.504511',1,96),(634,110,'2021-05-23 16:44:19.521030',1,160),(635,65,'2021-05-23 16:44:19.538419',1,70),(636,55,'2021-05-23 16:44:19.556169',1,104),(637,58,'2021-05-23 16:44:19.574922',1,111),(638,75,'2021-05-23 16:44:19.591792',1,113),(639,70,'2021-05-23 16:44:19.607114',1,112),(640,55,'2021-05-23 16:44:19.622064',1,105),(641,55,'2021-05-23 16:44:19.637308',1,106),(642,50,'2021-05-23 16:44:19.653245',1,110),(643,65,'2021-05-23 16:44:19.670320',1,158),(644,50,'2021-05-23 16:44:19.687450',1,5),(645,50,'2021-05-23 16:44:19.703838',1,50),(646,105,'2021-05-23 16:44:19.721083',1,79),(647,20,'2021-05-23 16:44:19.736344',1,148),(648,20,'2021-05-23 16:44:19.751860',1,146),(649,30,'2021-05-23 16:44:19.769038',1,7),(650,80,'2021-05-23 16:44:19.785065',1,114),(651,85,'2021-05-23 16:44:19.800090',1,115),(652,8,'2021-05-23 16:44:19.817746',1,91),(653,55,'2021-05-23 16:44:19.833165',1,47),(654,55,'2021-05-23 16:44:19.848879',1,20),(655,20,'2021-05-23 16:44:19.865118',1,149),(656,20,'2021-05-23 16:44:19.881173',1,144),(657,50,'2021-05-23 16:44:19.901167',1,131),(658,50,'2021-05-23 16:44:19.918737',1,15),(659,15,'2021-05-23 16:44:19.935557',1,51),(660,55,'2021-05-23 16:44:19.952665',1,129),(661,70,'2021-05-23 16:44:19.969849',1,125),(662,60,'2021-05-23 16:44:19.988225',1,124),(663,60,'2021-05-23 16:44:20.006048',1,126),(664,50,'2021-05-23 16:44:20.023478',1,123),(665,70,'2021-05-23 16:44:20.038946',1,127),(666,120,'2021-05-23 16:44:20.054518',1,117),(667,100,'2021-05-23 16:44:20.070327',1,116),(668,100,'2021-05-23 16:44:20.091133',1,118),(669,100,'2021-05-23 16:44:20.110322',1,119),(670,100,'2021-05-23 16:44:20.125145',1,120),(671,55,'2021-05-23 16:44:20.140730',1,60),(672,60,'2021-05-23 16:44:20.156995',1,24),(673,55,'2021-05-23 16:44:20.174149',1,133),(674,55,'2021-05-23 16:44:20.193162',1,18),(675,50,'2021-05-23 16:44:20.210327',1,11),(676,60,'2021-05-23 16:44:20.226102',1,21),(677,55,'2021-05-23 16:44:20.243999',1,134),(678,60,'2021-05-23 16:44:20.260908',1,63),(679,45,'2021-05-23 16:44:20.277978',1,101),(680,45,'2021-05-23 16:44:20.295509',1,103),(681,20,'2021-05-23 16:44:20.313214',1,87),(682,50,'2021-05-24 17:20:58.128968',1,161),(683,50,'2021-05-24 17:21:37.557542',1,162),(684,55,'2021-05-24 17:22:06.795193',1,163),(685,55,'2021-05-24 17:22:36.954429',1,164),(686,60,'2021-05-24 17:46:30.784933',1,165),(687,60,'2021-05-24 17:47:04.230421',1,166),(688,65,'2021-05-24 17:48:42.652931',1,167),(689,65,'2021-05-24 17:50:18.966587',1,168),(690,65,'2021-05-24 17:50:55.164474',1,169),(691,65,'2021-05-24 17:51:22.963333',1,170),(692,55,'2021-05-25 15:34:49.138143',1,171),(693,55,'2021-05-25 15:36:55.310250',1,172),(694,60,'2021-05-25 15:37:43.519097',1,173),(695,65,'2021-05-25 15:38:26.355673',1,174),(696,65,'2021-05-25 15:38:49.006828',1,175),(697,65,'2021-05-25 15:39:11.751644',1,176),(698,50,'2021-05-25 16:19:04.605011',1,177),(699,30,'2021-05-25 18:39:51.720356',1,178),(700,30,'2021-05-25 18:40:11.609677',1,179),(701,65,'2021-05-26 15:24:18.342601',1,180),(702,65,'2021-05-26 15:24:38.187852',1,181),(703,65,'2021-05-26 15:25:19.953595',1,182);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_menu`
--

LOCK TABLES `socorritomixcoacst_menu` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_menu` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_menu` VALUES (2,'2021-04-23','CO'),(5,'2021-04-24','CO'),(8,'2021-05-01','CO'),(9,'2021-05-03','CO'),(10,'2021-05-06','CO'),(11,'2021-05-08','CO'),(12,'2021-05-16','CO'),(13,'2021-05-22','CO'),(14,'2021-05-23','CO'),(15,'2021-05-24','CO'),(16,'2021-05-25','CO'),(17,'2021-05-26','CO');
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
  `metodo_pago` varchar(2) NOT NULL,
  `observaciones` varchar(256) DEFAULT NULL,
  `paga_con` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `socorritomixcoacst_o_cliente_id_13e7d9f1_fk_socorrito` (`cliente_id`),
  CONSTRAINT `socorritomixcoacst_o_cliente_id_13e7d9f1_fk_socorrito` FOREIGN KEY (`cliente_id`) REFERENCES `socorritomixcoacst_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_orden`
--

LOCK TABLES `socorritomixcoacst_orden` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_orden` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_orden` VALUES (1,486.79004999999995,0,0,'2021-04-24 05:23:04.552884',1,1,93.20995000000005,20,1,'EF','Sin comentarios',600),(2,1103.09172,0,0,'2021-04-24 05:27:05.274149',2,0,0,0,0,'EF','muchas servilletas por favor',1103.09172),(3,202.1443,0,0,'2021-04-24 05:32:19.608450',1,0,97.85570000000001,0,1,'EF','con harto chile',300),(4,190,0,0,'2021-04-24 05:32:39.192009',1,1,0,20,1,'TE',NULL,210),(5,350.16625,0,0,'2021-04-24 05:35:49.264592',1,0,49.83375000000001,0,1,'EF',NULL,400),(6,185,0,0,'2021-04-24 05:43:26.001177',1,0,0,0,0,'EF',NULL,185),(7,155,0,0,'2021-04-24 05:48:49.997294',3,0,4999999999845,0,1,'EF',NULL,5000000000000),(8,150,0,0,'2021-04-24 16:14:02.990039',1,1,40,10,1,'EF','Observaciones',200),(9,390,0,0,'2021-04-24 19:39:12.753280',4,1,95,15,0,'EF','coca y sprite',500),(10,290,0,0,'2021-04-24 22:01:15.291453',1,1,0,50,1,'EF',NULL,340),(11,365,0,0,'2021-04-25 03:00:56.709104',1,1,0,1,1,'EF',NULL,366),(12,150,0,0,'2021-05-01 19:10:58.766307',5,0,0,0,0,'EF','Frijoles olla y refritos ',150),(13,675,0,0,'2021-05-01 19:24:23.419943',6,0,325,0,0,'EF','Consome si verdura frijoles refritos tortas coliflor enjitimate 1',1000),(14,175,0,0,'2021-05-01 19:59:41.955274',8,0,25,0,0,'EF','Olla',200),(15,317,0,0,'2021-05-17 21:25:37.386941',1,1,153,30,1,'EF','Salsa aparte',500),(16,215,0,0,'2021-05-17 23:09:20.541361',1,1,15,20,1,'EF','Salsa verde',250),(17,350,0,0,'2021-05-23 01:24:35.099725',1,0,150,0,0,'EF',NULL,500),(18,100,0,0,'2021-05-23 18:22:13.909045',9,0,0,0,0,'EF',NULL,100),(19,75,0,0,'2021-05-23 18:26:24.131837',10,0,425,0,0,'EF',NULL,500),(20,80,0,0,'2021-05-23 18:42:52.686676',11,1,110,10,0,'EF',NULL,200),(21,240,0,0,'2021-05-23 18:59:18.473274',12,0,260,0,1,'EF','1 refritos 1 olla',500),(22,330,0,0,'2021-05-23 19:24:10.845513',13,0,170,0,0,'EF',NULL,500),(23,75,0,0,'2021-05-23 19:27:39.521787',14,0,25,0,1,'EF','Frijoles olla',100),(24,165,0,0,'2021-05-23 19:49:17.873206',15,0,35,0,0,'EF',NULL,200),(25,155,0,0,'2021-05-23 20:02:52.341528',16,0,45,0,1,'EF',NULL,200),(26,95,0,0,'2021-05-23 20:18:36.399887',17,1,325,80,0,'EF',NULL,500),(27,95,0,0,'2021-05-23 20:30:34.967028',18,0,405,0,0,'EF',NULL,500),(28,85,0,0,'2021-05-23 21:48:37.836009',19,0,415,0,0,'EF',NULL,500),(29,160,0,0,'2021-05-23 21:59:59.011343',20,0,40,0,0,'EF',NULL,200),(30,85,0,0,'2021-05-23 22:04:58.718032',21,0,415,0,0,'EF',NULL,500),(31,80,0,0,'2021-05-24 18:06:07.265972',22,0,120,0,0,'EF',NULL,200),(32,70,0,0,'2021-05-24 18:44:20.110304',23,0,130,0,0,'EF',NULL,200),(33,85,0,0,'2021-05-24 18:46:43.405364',24,1,390,25,0,'EF',NULL,500),(34,160,0,0,'2021-05-24 18:50:03.633380',25,1,10,30,0,'EF',NULL,200),(35,160,0,0,'2021-05-24 18:50:04.474679',25,1,10,30,0,'EF',NULL,200),(36,150,0,0,'2021-05-24 19:22:54.751663',26,0,350,0,0,'EF',NULL,500),(37,70,0,0,'2021-05-24 19:25:01.679310',27,0,0,0,0,'EF',NULL,70),(38,150,0,0,'2021-05-24 19:29:58.130940',28,0,50,0,0,'EF',NULL,200),(39,160,0,0,'2021-05-24 19:43:52.825910',29,1,20,20,0,'EF',NULL,200),(40,85,0,0,'2021-05-24 19:52:12.506749',30,0,15,0,0,'EF',NULL,100),(41,170,0,0,'2021-05-24 20:14:02.307420',19,0,330,0,0,'EF',NULL,500),(42,80,0,0,'2021-05-25 17:37:31.171784',22,0,420,0,0,'EF',NULL,500),(43,230,0,0,'2021-05-25 18:43:20.062384',40,0,0,0,0,'EF',NULL,230),(44,85,0,0,'2021-05-25 18:50:28.232631',30,0,415,0,0,'EF',NULL,500),(45,165,0,0,'2021-05-25 19:22:39.940519',41,1,0,10,0,'TE',NULL,175),(46,165,0,0,'2021-05-25 19:26:23.098382',42,0,0,0,0,'EF',NULL,165),(47,245,0,0,'2021-05-25 19:29:47.755701',43,0,0,0,0,'EF','Frijoles de la olla',245),(48,160,0,0,'2021-05-25 19:33:42.572641',26,0,40,0,0,'EF','Frijoles de la olla',200),(49,150,0,0,'2021-05-25 19:56:50.346230',45,0,0,0,0,'EF','F de la olla',150),(50,170,0,0,'2021-05-25 20:01:57.397895',39,0,0,0,0,'EF',NULL,170),(51,305,0,0,'2021-05-25 20:07:48.211471',46,0,195,0,0,'EF',NULL,500),(52,170,0,0,'2021-05-26 15:56:39.898187',47,0,0,0,0,'EF',NULL,170),(53,80,0,0,'2021-05-26 16:20:49.659492',4,0,420,0,0,'EF',NULL,500),(54,345,0,0,'2021-05-26 16:46:25.305838',48,0,0,0,0,'EF',NULL,345),(55,80,0,0,'2021-05-26 16:53:29.216919',49,0,0,0,0,'EF',NULL,80),(56,150,0,0,'2021-05-26 16:57:54.143501',50,0,0,0,0,'EF',NULL,150),(57,130,0,0,'2021-05-26 17:31:03.385611',51,0,0,0,0,'EF',NULL,130),(58,85,0,0,'2021-05-26 17:38:39.703882',52,0,0,0,1,'EF',NULL,85),(59,160,0,0,'2021-05-26 17:46:25.944078',53,0,0,0,0,'EF',NULL,160),(60,70,0,0,'2021-05-26 18:10:37.912937',54,0,0,0,0,'EF',NULL,70),(61,170,0,0,'2021-05-26 18:21:29.244793',55,0,0,0,0,'EF',NULL,170);
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
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_ordenplatillo`
--

LOCK TABLES `socorritomixcoacst_ordenplatillo` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_ordenplatillo` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_ordenplatillo` VALUES (1,0,1,1,1,1,8,NULL),(2,0,1,1,1,1,1,NULL),(3,68.6388,1,1,1,1,38,NULL),(4,0,1,2,1,1,9,NULL),(5,0,1,2,1,1,1,NULL),(6,51.4435,1,2,1,1,12,NULL),(7,10.9128,0,NULL,1,1,30,NULL),(8,42.0094,0,NULL,1,1,1,NULL),(9,41.9556,0,NULL,1,1,32,NULL),(10,3.48776,0,NULL,1,1,49,NULL),(11,44.5765,0,NULL,1,1,44,NULL),(12,39.155,0,NULL,1,1,3,NULL),(13,9.61069,0,NULL,1,1,53,NULL),(14,0,1,3,1,1,43,NULL),(15,0,1,3,1,1,46,NULL),(16,80,1,3,1,1,55,NULL),(17,0,1,4,1,1,43,NULL),(18,0,1,4,1,1,37,NULL),(19,95,1,4,1,1,52,NULL),(20,0,1,1,1,2,9,NULL),(21,0,1,1,1,2,6,NULL),(22,51.8776,1,1,1,2,35,NULL),(23,0,1,2,1,2,8,NULL),(24,0,1,2,1,2,6,NULL),(25,38.2392,1,2,1,2,13,NULL),(26,0,1,3,1,2,8,NULL),(27,0,1,3,1,2,4,NULL),(28,65.9513,1,3,1,2,48,NULL),(29,32.7384,0,NULL,3,2,30,NULL),(30,6.97552,0,NULL,2,2,49,NULL),(31,133.7295,0,NULL,3,2,44,NULL),(32,28.3314,0,NULL,2,2,45,NULL),(33,94.9328,0,NULL,2,2,50,NULL),(34,80.7724,0,NULL,2,2,47,NULL),(35,117.465,0,NULL,3,2,3,NULL),(36,19.22138,0,NULL,2,2,53,NULL),(37,33.1613,0,NULL,1,2,54,NULL),(38,8.60558,0,NULL,2,2,52,NULL),(39,34.8892,0,NULL,2,2,56,NULL),(40,6.41714,0,NULL,2,2,57,NULL),(41,39.4382,0,NULL,2,2,2,NULL),(42,40.0228,0,NULL,2,2,43,NULL),(43,89.0232,0,NULL,2,2,55,NULL),(44,26.2998,0,NULL,1,2,51,NULL),(45,0,1,4,1,2,43,NULL),(46,0,1,4,1,2,46,NULL),(47,80,1,4,1,2,57,NULL),(48,0,1,5,1,2,44,NULL),(49,0,1,5,1,2,48,NULL),(50,75,1,5,1,2,53,NULL),(51,0,1,1,1,3,8,NULL),(52,0,1,1,1,3,4,NULL),(53,32.1443,1,1,1,3,22,NULL),(54,0,1,2,1,3,43,NULL),(55,65,1,2,1,3,50,NULL),(56,0,1,3,1,3,43,NULL),(57,0,1,3,1,3,37,NULL),(58,105,1,3,1,3,57,NULL),(59,0,1,1,1,4,43,NULL),(60,0,1,1,1,4,29,NULL),(61,85,1,1,1,4,53,NULL),(62,0,1,2,1,4,44,NULL),(63,0,1,2,1,4,38,NULL),(64,105,1,2,1,4,54,NULL),(65,0,1,1,1,5,9,NULL),(66,0,1,1,1,5,6,NULL),(67,40.047200000000004,1,1,1,5,26,NULL),(68,10.9128,0,NULL,1,5,30,NULL),(69,30,0,NULL,1,5,1,NULL),(70,41.9556,0,NULL,1,5,32,NULL),(71,14.6258,0,NULL,1,5,39,NULL),(72,3.48776,0,NULL,1,5,49,NULL),(73,44.5765,0,NULL,1,5,44,NULL),(74,17.6229,0,NULL,1,5,46,NULL),(75,14.1657,0,NULL,1,5,45,NULL),(76,15,0,NULL,1,5,3,NULL),(77,9.61069,0,NULL,1,5,53,NULL),(78,33.1613,0,NULL,1,5,54,NULL),(79,0,1,2,1,5,44,NULL),(80,0,1,2,1,5,48,NULL),(81,75,1,2,1,5,53,NULL),(82,0,1,1,1,6,43,NULL),(83,0,1,1,1,6,46,NULL),(84,80,1,1,1,6,56,NULL),(85,0,1,2,1,6,43,NULL),(86,0,1,2,1,6,39,NULL),(87,105,1,2,1,6,56,NULL),(88,0,1,1,1,7,43,NULL),(89,0,1,1,1,7,47,NULL),(90,80,1,1,1,7,56,NULL),(91,0,1,2,1,7,44,NULL),(92,0,1,2,1,7,48,NULL),(93,75,1,2,1,7,53,NULL),(94,0,1,1,1,8,9,NULL),(95,0,1,1,1,8,4,NULL),(96,80,1,1,1,8,28,NULL),(97,0,1,2,1,8,43,NULL),(98,0,1,2,1,8,46,NULL),(99,70,1,2,1,8,53,NULL),(100,0,1,1,1,9,83,NULL),(101,0,1,1,1,9,1,NULL),(102,70,1,1,1,9,14,NULL),(103,0,1,2,1,9,83,NULL),(104,0,1,2,1,9,6,NULL),(105,80,1,2,1,9,62,NULL),(106,60,0,NULL,2,9,1,NULL),(107,40,0,NULL,2,9,96,NULL),(108,0,1,3,1,9,44,NULL),(109,0,1,3,1,9,48,NULL),(110,75,1,3,1,9,53,NULL),(111,0,1,4,1,9,44,NULL),(112,65,1,4,1,9,48,NULL),(113,0,1,1,1,10,83,NULL),(114,0,1,1,1,10,6,NULL),(115,125,1,1,1,10,79,NULL),(116,0,1,2,1,10,8,NULL),(117,0,1,2,1,10,58,NULL),(118,85,1,2,1,10,72,NULL),(119,0,1,3,1,10,8,NULL),(120,0,1,3,1,10,1,NULL),(121,80,1,3,1,10,74,NULL),(122,0,1,1,1,11,8,NULL),(123,0,1,1,1,11,1,NULL),(124,85,1,1,1,11,30,NULL),(125,0,1,2,1,11,83,NULL),(126,0,1,2,1,11,58,NULL),(127,80,1,2,1,11,28,NULL),(128,65,0,NULL,1,11,30,NULL),(129,50,0,NULL,1,11,90,NULL),(130,15,0,NULL,1,11,98,NULL),(131,0,1,3,1,11,43,NULL),(132,0,1,3,1,11,47,NULL),(133,70,1,3,1,11,52,NULL),(134,0,1,1,1,12,7,NULL),(135,0,1,1,1,12,1,NULL),(136,75,1,1,1,12,133,NULL),(137,0,1,2,1,12,7,NULL),(138,0,1,2,1,12,58,NULL),(139,75,1,2,1,12,64,NULL),(140,0,1,1,1,13,7,NULL),(141,0,1,1,1,13,1,NULL),(142,90,1,1,1,13,36,NULL),(143,0,1,2,1,13,8,NULL),(144,0,1,2,1,13,1,NULL),(145,80,1,2,1,13,21,NULL),(146,0,1,3,1,13,8,NULL),(147,0,1,3,1,13,58,NULL),(148,85,1,3,1,13,139,NULL),(149,0,1,4,1,13,8,NULL),(150,0,1,4,1,13,1,NULL),(151,75,1,4,1,13,133,NULL),(152,0,1,5,1,13,8,NULL),(153,0,1,5,1,13,1,NULL),(154,90,1,5,1,13,36,NULL),(155,0,1,6,1,13,7,NULL),(156,0,1,6,1,13,58,NULL),(157,75,1,6,1,13,133,NULL),(158,30,0,NULL,1,13,58,NULL),(159,150,0,NULL,2,13,36,NULL),(160,0,1,1,1,14,8,NULL),(161,0,1,1,1,14,1,NULL),(162,105,1,1,1,14,81,NULL),(163,0,1,2,1,14,8,NULL),(164,0,1,2,1,14,1,NULL),(165,70,1,2,1,14,11,NULL),(166,0,1,1,1,15,1,NULL),(167,0,1,1,1,15,8,NULL),(168,85,1,1,1,15,74,'Refritos'),(169,0,1,2,1,15,1,NULL),(170,0,1,2,1,15,1,NULL),(171,85,1,2,1,15,39,'De la olla'),(172,60,0,NULL,2,15,8,NULL),(173,32,0,NULL,1,15,2,NULL),(174,55,0,NULL,1,15,107,NULL),(175,0,1,1,1,16,8,NULL),(176,0,1,1,1,16,8,NULL),(177,85,1,1,1,16,39,'Frijoles refritos'),(178,60,0,NULL,2,16,8,NULL),(179,70,0,NULL,2,16,100,NULL),(180,55,0,NULL,1,17,107,NULL),(181,150,0,NULL,2,17,128,NULL),(182,110,0,NULL,2,17,108,NULL),(183,35,0,NULL,1,17,94,NULL),(184,0,1,1,1,18,8,NULL),(185,0,1,1,1,18,1,NULL),(186,100,1,1,1,18,78,'Refritos'),(187,0,1,1,1,19,8,NULL),(188,0,1,1,1,19,7,NULL),(189,75,1,1,1,19,132,'El omelet de flor'),(190,0,1,1,1,20,7,NULL),(191,0,1,1,1,20,1,NULL),(192,80,1,1,1,20,154,'con papas fritas'),(193,0,1,1,1,21,8,NULL),(194,0,1,1,1,21,6,NULL),(195,95,1,1,1,21,37,'con puro jitomate'),(196,0,1,2,1,21,7,NULL),(197,0,1,2,1,21,58,NULL),(198,75,1,2,1,21,152,''),(199,0,1,3,1,21,8,NULL),(200,0,1,3,1,21,1,NULL),(201,70,1,3,1,21,5,''),(202,0,1,1,1,22,1,NULL),(203,0,1,1,1,22,7,NULL),(204,85,1,1,1,22,30,''),(205,0,1,2,1,22,1,NULL),(206,0,1,2,1,22,7,NULL),(207,115,1,2,1,22,81,''),(208,50,0,NULL,1,22,59,NULL),(209,80,0,NULL,1,22,37,NULL),(210,0,1,1,1,23,1,NULL),(211,0,1,1,1,23,7,NULL),(212,75,1,1,1,23,132,'Omelet flor de calabaza'),(213,0,1,1,1,24,7,NULL),(214,0,1,1,1,24,1,NULL),(215,95,1,1,1,24,76,''),(216,0,1,2,1,24,7,NULL),(217,0,1,2,1,24,1,NULL),(218,70,1,2,1,24,14,'Frijoles de la olla '),(219,0,1,1,1,25,8,NULL),(220,0,1,1,1,25,1,NULL),(221,80,1,1,1,25,24,''),(222,0,1,2,1,25,8,NULL),(223,0,1,2,1,25,1,NULL),(224,75,1,2,1,25,152,'Frijoles refritos '),(225,0,1,1,1,26,1,NULL),(226,0,1,1,1,26,8,NULL),(227,95,1,1,1,26,37,''),(228,0,1,1,1,27,8,NULL),(229,0,1,1,1,27,58,NULL),(230,95,1,1,1,27,77,'Refritos '),(231,0,1,1,1,28,7,NULL),(232,0,1,1,1,28,1,NULL),(233,85,1,1,1,28,157,'Sin frijoles '),(234,0,1,1,1,29,7,NULL),(235,0,1,1,1,29,6,NULL),(236,80,1,1,1,29,22,''),(237,0,1,2,1,29,7,NULL),(238,0,1,2,1,29,6,NULL),(239,80,1,2,1,29,154,'Refritos '),(240,0,1,1,1,30,7,NULL),(241,0,1,1,1,30,58,NULL),(242,85,1,1,1,30,34,'Frijolesde la olla '),(243,0,1,1,1,31,10,NULL),(244,0,1,1,1,31,1,NULL),(245,80,1,1,1,31,154,'Frijoles olla'),(246,70,0,NULL,1,32,84,NULL),(247,0,1,1,1,33,8,NULL),(248,0,1,1,1,33,1,NULL),(249,85,1,1,1,33,72,''),(250,0,1,1,1,34,8,NULL),(251,0,1,1,1,34,1,NULL),(252,70,1,1,1,34,12,'Caldo sin verduras '),(253,0,1,2,1,34,8,NULL),(254,0,1,2,1,34,1,NULL),(255,90,1,2,1,34,68,''),(256,0,1,1,1,35,8,NULL),(257,0,1,1,1,35,1,NULL),(258,70,1,1,1,35,12,'Caldo sin verduras '),(259,0,1,2,1,35,8,NULL),(260,0,1,2,1,35,1,NULL),(261,90,1,2,1,35,68,''),(262,0,1,1,1,36,8,NULL),(263,0,1,1,1,36,8,NULL),(264,70,1,1,1,36,11,'Sin salsa'),(265,0,1,2,1,36,8,NULL),(266,0,1,2,1,36,58,NULL),(267,80,1,2,1,36,28,'Frijoles olla'),(268,0,1,1,1,37,8,NULL),(269,0,1,1,1,37,1,NULL),(270,70,1,1,1,37,15,''),(271,0,1,1,1,38,10,NULL),(272,0,1,1,1,38,58,NULL),(273,75,1,1,1,38,60,'En jitomate'),(274,0,1,2,1,38,10,NULL),(275,0,1,2,1,38,58,NULL),(276,75,1,2,1,38,60,'En jitomate'),(277,0,1,1,1,39,10,NULL),(278,0,1,1,1,39,8,NULL),(279,80,1,1,1,39,24,'Frijoles olla'),(280,0,1,2,1,39,1,NULL),(281,0,1,2,1,39,58,NULL),(282,80,1,2,1,39,24,''),(283,0,1,1,1,40,1,NULL),(284,0,1,1,1,40,6,NULL),(285,85,1,1,1,40,84,'Con chambarete'),(286,0,1,1,1,41,8,NULL),(287,0,1,1,1,41,1,NULL),(288,85,1,1,1,41,157,''),(289,0,1,2,1,41,8,NULL),(290,0,1,2,1,41,1,NULL),(291,85,1,2,1,41,157,''),(292,0,1,1,1,42,7,NULL),(293,0,1,1,1,42,58,NULL),(294,80,1,1,1,42,173,'F. De la olla'),(295,70,0,NULL,2,43,16,NULL),(296,100,0,NULL,2,43,15,NULL),(297,30,0,NULL,1,43,178,NULL),(298,30,0,NULL,1,43,179,NULL),(299,0,1,1,1,44,7,NULL),(300,0,1,1,1,44,1,NULL),(301,85,1,1,1,44,174,'Frijoles de la olla '),(302,0,1,1,1,45,1,NULL),(303,0,1,1,1,45,58,NULL),(304,80,1,1,1,45,22,'Frijoles refritos'),(305,0,1,2,1,45,1,NULL),(306,0,1,2,1,45,58,NULL),(307,85,1,2,1,45,35,'Frijoles refritos '),(308,0,1,1,1,46,7,NULL),(309,0,1,1,1,46,58,NULL),(310,80,1,1,1,46,173,''),(311,0,1,2,1,46,7,NULL),(312,0,1,2,1,46,58,NULL),(313,85,1,2,1,46,174,''),(314,0,1,1,1,47,7,NULL),(315,0,1,1,1,47,1,NULL),(316,80,1,1,1,47,24,''),(317,0,1,2,1,47,7,NULL),(318,0,1,2,1,47,1,NULL),(319,80,1,2,1,47,24,''),(320,0,1,3,1,47,7,NULL),(321,0,1,3,1,47,1,NULL),(322,85,1,3,1,47,136,''),(323,0,1,1,1,48,8,NULL),(324,0,1,1,1,48,8,NULL),(325,75,1,1,1,48,20,'SIN SALSA'),(326,0,1,2,1,48,8,NULL),(327,0,1,2,1,48,58,NULL),(328,85,1,2,1,48,71,''),(329,0,1,1,1,49,8,NULL),(330,0,1,1,1,49,1,NULL),(331,70,1,1,1,49,11,''),(332,0,1,2,1,49,8,NULL),(333,0,1,2,1,49,1,NULL),(334,80,1,2,1,49,22,''),(335,0,1,1,1,50,8,NULL),(336,0,1,1,1,50,7,NULL),(337,85,1,1,1,50,73,''),(338,0,1,2,1,50,8,NULL),(339,0,1,2,1,50,7,NULL),(340,85,1,2,1,50,136,'MUSLO'),(341,0,1,1,1,51,7,NULL),(342,0,1,1,1,51,1,NULL),(343,85,1,1,1,51,35,''),(344,0,1,2,1,51,7,NULL),(345,0,1,2,1,51,1,NULL),(346,85,1,2,1,51,35,''),(347,0,1,3,1,51,1,NULL),(348,0,1,3,1,51,1,NULL),(349,80,1,3,1,51,21,''),(350,55,0,NULL,1,51,106,NULL),(351,0,1,1,1,52,8,NULL),(352,0,1,1,1,52,6,NULL),(353,85,1,1,1,52,30,''),(354,0,1,2,1,52,1,NULL),(355,0,1,2,1,52,58,NULL),(356,85,1,2,1,52,181,''),(357,0,1,1,1,53,130,NULL),(358,0,1,1,1,53,47,NULL),(359,80,1,1,1,53,52,NULL),(360,75,0,NULL,1,54,159,NULL),(361,70,0,NULL,1,54,84,NULL),(362,200,0,NULL,2,54,119,NULL),(363,0,1,1,1,55,7,NULL),(364,0,1,1,1,55,58,NULL),(365,80,1,1,1,55,42,'Con pollo'),(366,150,0,NULL,3,56,11,NULL),(367,0,1,1,1,57,7,NULL),(368,0,1,1,1,57,1,NULL),(369,130,1,1,1,57,160,''),(370,0,1,1,1,58,8,NULL),(371,0,1,1,1,58,1,NULL),(372,85,1,1,1,58,181,''),(373,0,1,1,1,59,8,NULL),(374,0,1,1,1,59,1,NULL),(375,85,1,1,1,59,182,''),(376,0,1,2,1,59,8,NULL),(377,0,1,2,1,59,1,NULL),(378,75,1,2,1,59,133,''),(379,0,1,1,1,60,8,NULL),(380,0,1,1,1,60,1,NULL),(381,70,1,1,1,60,15,''),(382,0,1,1,1,61,7,NULL),(383,0,1,1,1,61,1,NULL),(384,85,1,1,1,61,156,''),(385,0,1,2,1,61,58,NULL),(386,0,1,2,1,61,6,NULL),(387,85,1,2,1,61,30,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_platillo`
--

LOCK TABLES `socorritomixcoacst_platillo` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_platillo` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_platillo` VALUES (1,'Arroz','sin descripción','ST',1,0,0,NULL),(2,'Expresso','Descripción del platillo','BE',0,0,0,NULL),(3,'Agua para nescafe','Descripción del platillo','BE',0,0,0,NULL),(4,'Codito a la crema','descripción','ST',1,0,0,NULL),(5,'Salchichas fritas','Descripción del platillo','GU',0,0,0,NULL),(6,'Ensalada','Descripción','ST',1,0,0,NULL),(7,'Sopa','Descripción del platillo','EN',1,0,0,NULL),(8,'Consomé','Descripción del platillo','EN',1,0,0,NULL),(9,'Crema de brocoli','Descripción del platillo','EN',1,0,0,NULL),(10,'Crema de zanahoria','Descripción del platillo','EN',1,0,0,NULL),(11,'Tortas de papa','Descripción del platillo','GU',0,0,0,NULL),(12,'Nuggets de pollo','Descripción del platillo','GU',0,0,0,NULL),(13,'Huevos con ejotes','Descripción del platillo','GU',0,0,0,NULL),(14,'Croqueta de pollo','Descripción del platillo','GU',0,0,0,NULL),(15,'Tacos dorados de pollo','Descripción del platillo','GU',0,0,0,NULL),(16,'Pambazo','Descripción del platillo','GU',0,0,0,NULL),(17,'Omelet de papa ','Descripción del platillo','GU',0,0,0,NULL),(18,'Tortas de espinaca','Descripción del platillo','GU',0,0,0,NULL),(19,'Picadillo','Descripción del platillo','GU',0,0,0,NULL),(20,'Sopes con quesillo','Descripción del platillo','GU',0,0,0,NULL),(21,'Tortas de pollo en salsa verde','Descripción del platillo','GU',0,0,0,NULL),(22,'Chile relleno de queso','Descripción del platillo','GU',0,0,0,NULL),(23,'Pollo a la barbacoa c/ensalada de papas','Descripción del platillo','GU',0,0,0,NULL),(24,'Tortas de carne en salsa verde','Descripción del platillo','GU',0,0,0,NULL),(25,'Enchiladas jaliciences','Descripción del platillo','GU',0,0,0,NULL),(26,'Higado encebollado','Descripción del platillo','GU',0,0,0,NULL),(27,'Muslo empanizado con papas','con ensalada o enchiladas verdes','GU',0,0,0,NULL),(28,'Chuleta ahumada a la plancha','Descripción del platillo','GU',0,0,0,NULL),(29,'Enchiladas verdes','Descripción del platillo','GU',0,0,0,NULL),(30,'Alambre de pollo','Descripción','GU',0,0,0,NULL),(31,'Pechuga rellena en crema de chipotle','Descripción del platillo','GU',0,0,0,NULL),(32,'Carne de res en asado','Descripción del platillo','GU',0,0,0,NULL),(33,'Costilla de puerco en verde con verdolagas','Descripción del platillo','GU',0,0,0,NULL),(34,'Pollo con mole','Descripción del platillo','GU',0,0,0,NULL),(35,'Enchiladas de mole','Descripción del platillo','GU',0,0,0,NULL),(36,'Milanesa','Con papas o ensalada','GU',0,0,0,NULL),(37,'Pechuga asada','(o empanizada) con papas','GU',0,0,0,NULL),(38,'Empanizada','Descripción del platillo','GU',0,0,0,NULL),(39,'Cecina','Descripción del platillo','GU',0,0,0,NULL),(40,'Costilla','con chilaquiles o con sopes(2)','GU',0,0,0,NULL),(41,'Pancita','Descripción del platillo','GU',0,0,0,NULL),(42,'Chilaquiles','Descripción del platillo','GU',0,0,0,NULL),(43,'Jugo','vaso chico','BE',0,0,0,'D1'),(44,'Fruta','Del desayuno','EX',0,0,0,'D1'),(45,'Molletes','Del desayuno','EX',0,0,0,'D2'),(46,'Hotcakes',' ','EX',0,0,0,'D2'),(47,'Sopes con pollo',' ','GU',0,0,0,'D2'),(48,'Huevos Al gusto','Rancheros,con Jamón, al albañil o con longaniza','GU',0,0,0,'D2'),(49,'Cereal con Leche','Descripción','EX',0,0,0,'D2'),(50,'Salchipulpos','Descripción de platillo','EX',0,0,0,'D2'),(51,'Té','taza chica','BE',0,0,0,'D3'),(52,'Café de olla','taza chica','BE',0,0,0,'D3'),(53,'Café americano','taza chica','BE',0,0,0,'D3'),(54,'Café con leche','taza chica','BE',0,0,0,'D3'),(55,'Leche Caliente','taza chica','BE',0,0,0,'D3'),(56,'Capuchino','Taza chica','BE',0,0,0,'D3'),(57,'Chocolate','taza chica','BE',0,0,0,'D3'),(58,'Espaguetti','Descripción','ST',1,0,0,NULL),(59,'Croquetas de atún','Descripción','GU',0,0,0,NULL),(60,'Tortas de brócoli','Descripción','GU',0,0,0,NULL),(61,'Nopal capeado','Relleno de queso capeado','GU',0,0,0,NULL),(62,'Fajitas de pollo','En chile de árbol con champiñones','GU',0,0,0,NULL),(63,'Tostadas de pescado','Descripción','GU',0,0,0,NULL),(64,'Chicharrón en salsa verde','Con nopales','GU',0,0,0,NULL),(65,'Pollo frito con enchiladas verdes','Descripción','GU',0,0,0,NULL),(66,'Pechuguitas al tamarindo','Descripción','GU',0,0,0,NULL),(67,'Chilaquiles con pollo','Chilaquiles con pollo','GU',0,0,0,NULL),(68,'Alambre de pollo con queso','Descripción','GU',0,0,0,NULL),(69,'Pollo a la barbacoa','Descripción','GU',0,0,0,NULL),(70,'Rico pozole','Descripción','GU',0,0,0,NULL),(71,'Albóndigas en chipotle','Descripción','GU',0,0,0,NULL),(72,'Carne de res en verde con calabazas','Descripción','GU',0,0,0,NULL),(73,'Filete de pescado empanizado','.','GU',0,0,0,NULL),(74,'Caldo de res','Descripción','GU',0,0,0,NULL),(75,'Costilla con chilaquiles','Descripción','GU',0,0,0,NULL),(76,'Enchiladas gratinadas verdes','Descripción','GU',0,0,0,NULL),(77,'Costilla con sopes','Descripción','GU',0,0,0,NULL),(78,'Pechuga rellena empanizada','Descripción','GU',0,0,0,NULL),(79,'Salmón a la plancha','Descripción','GU',0,0,0,NULL),(80,'New york','Descripción','GU',0,0,0,NULL),(81,'Arrachera','Corte de carne','GU',0,0,0,NULL),(82,'Pollo a la cubana','Pollo con jitomate, longaniza y salchichas','GU',0,0,0,NULL),(83,'Caldo de haba','Descripción','EN',1,0,0,NULL),(84,'Mole de olla','Mole de olla','GU',0,0,0,NULL),(85,'Fruta chica','Descripción','EX',0,0,0,NULL),(86,'Fruta grande','Descripción','EX',0,0,0,NULL),(87,'Yogurt','Descripción','EX',0,0,0,NULL),(88,'Granola','Descripción','EX',0,0,0,NULL),(89,'Bisquet con mermelada','Descripción','EX',0,0,0,NULL),(90,'3 Molletes','Descripción','EX',0,0,0,NULL),(91,'Sope sencillo','Descripción','EX',0,0,0,NULL),(92,'Kushiage de queso','Queso manchego, con panko','SU',1,0,0,NULL),(93,'Kushiage de plátano con queso','Plátano, queso manchego. Empanizadas con panko.','SU',1,0,0,NULL),(94,'Gohan','Arroz al vapor con ajonjolí.','SU',1,0,0,NULL),(95,'Gohan furikake ebi','Arroz al vapor con condimento de camarón.','SU',1,0,0,NULL),(96,'Refresco','Descripción','BE',0,0,0,NULL),(97,'Gohan furikake sake','Arroz al vapor con condimento dr salmón.','SU',1,0,0,NULL),(98,'Agua de sabor','1 litro','BE',0,0,0,NULL),(99,'Papas a la francesa','Descripción','SU',1,0,0,NULL),(100,'Cerveza','Descripción','BE',0,0,0,NULL),(101,'Yakimeshi de pollo','Pollo, zanahoria, calabaza, cebolla, condimentos, huevo al gusto.','SU',1,0,0,NULL),(102,'Michelada','Descripción','BE',0,0,0,NULL),(103,'Yakimeshi de res','Carne de res, zanahoria, calabaza, cebolla, condimentos, huevo al gusto.','SU',1,0,0,NULL),(104,'Rollo California','Queso Philadelphia, camarón, aguacate, pepino, ajonjolí por fuera.','SU',1,0,0,NULL),(105,'Rollo Philadelphia','Salmón, aguacate, pepino, queso Philadelphia, ajonjolí por fuera.','SU',1,0,0,NULL),(106,'Rollo Tampico','Queso Philadelphia, aguacate, pepino, ajonjolí por fuera y salsa Tampico.','SU',1,0,0,NULL),(107,'Avocado Roll','Aguacate por fuera, queso Philadelphia, pepino, surimi y ajonjolí.','SU',1,0,0,NULL),(108,'Fresa Roll','Camarón, aguacate, pepino, queso Philadelphia, fresa por fuera y ajonjolí dulce.','SU',1,0,0,NULL),(109,'Mango Roll','Camarón, aguacate, pepino, queso Philadelphia, mango por fuera y ajonjolí dulce.','SU',1,0,0,NULL),(110,'Rollo Vegetariano','Pepino, queso y aguacate.','SU',1,0,0,NULL),(111,'Rollo de Surimi','Pepino, queso y surimi.','SU',1,0,0,NULL),(112,'Rollo de Surimi empanizado','Pepino, queso y surimi, con panko.','SU',1,0,0,NULL),(113,'Rollo de Surimi con salma','Pepino, queso y surimi.','SU',1,0,0,NULL),(114,'Sopa meshiudon','Arroz, pollo, brocoli, alga marina y salsa agridulce.','SU',1,0,0,NULL),(115,'Sopa yakiudon','Pollo, brocoli, champiñón, pimineto morrón, cebolla y fideo ó Ramen.','SU',1,0,0,NULL),(116,'Teriyaki de pollo','Pollo, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','SU',1,0,0,NULL),(117,'Teriyaki de camarón','Camarón, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','SU',1,0,0,NULL),(118,'Teriyaki de res','Carne de res, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','SU',1,0,0,NULL),(119,'Teriyaki mixto','Pollo, carne de res, camarón, zanahoria, calabaza, cebolla, champiñón, pimiento morrón, salsa agridulce y ajonjolí.','SU',1,0,0,NULL),(120,'Torikatsu Roll','Filete de pollo, zanahoria, queso manchego, pimiento morrón, empanizado, acompañado de una ensalada fresca de zanahoria, lechuga, jícama, con aderezo ranch y mil íslas.','SU',1,0,0,NULL),(121,'Nikukatsu Roll','Filete de res, zanahoria, queso manchego, pimiento morrón, empanizado, acompañado de una ensalada fresca de zanahoria, lechuga, jícama, con aderezo ranch y mil íslas.','SU',1,0,0,NULL),(122,'Gyudo','Carne de res (500g.) en salsa teriyaki.','SU',1,0,0,NULL),(123,'Teppanyaki de verduras','Zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','SU',1,0,0,NULL),(124,'Teppanyaki de pollo','Pollo, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','SU',1,0,0,NULL),(125,'Teppanyaki de camarón','Camarón, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','SU',1,0,0,NULL),(126,'Teppanyaki de res','Carne de res, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','SU',1,0,0,NULL),(127,'Teppanyaki mixto','Carne de res, camarón, pollo, zanahoria, calabaza, cebolla, pimiento morrón, champiñón con germen de soya.','SU',1,0,0,NULL),(128,'Banana Roll','Rollito de plátano.','SU',1,0,0,NULL),(129,'Tempura helado','Helado empanizado.','SU',1,0,0,NULL),(130,'Jugo y fruta','(del desayuno)','EX',0,0,0,'D1'),(131,'Tacos adobados de pollo','Descripción','GU',0,0,0,NULL),(132,'Omelet de champiñón','Descripción','GU',0,0,0,NULL),(133,'Tortas de coliflor','Descripción','GU',0,0,0,NULL),(134,'Tortas de quelites','Descripción','GU',0,0,0,NULL),(135,'Huazontle en pasilla','Descripción','GU',0,0,0,NULL),(136,'Pollo en verde con verdolagas','Descripción','GU',0,0,0,NULL),(137,'Carne de res en pasilla','con champiñones','GU',0,0,0,NULL),(138,'Enfrijoladas','Descripción','GU',0,0,0,NULL),(139,'Hamburguesa con papas','Descripción','GU',0,0,0,NULL),(140,'Caldo de pollo ','Caldo con pollo y verduras ','GU',0,0,0,NULL),(141,'Caldo de pollo con pieza','Guisado','EX',0,0,0,NULL),(142,'Caldo de pollo con pollo desebrado','Caldo con pollo desebrado','EX',0,0,0,NULL),(143,'Coca-Cola','Descripción','BE',0,0,0,NULL),(144,'Squirt','Descripción','BE',0,0,0,NULL),(145,'Manzanita','Descripción','BE',0,0,0,NULL),(146,'Sidral','Descripción','BE',0,0,0,NULL),(147,'Mirinda','Descripción','BE',0,0,0,NULL),(148,'Sangría','Descripción','BE',0,0,0,NULL),(149,'Sprite','Descripción','BE',0,0,0,NULL),(150,'Fanta','Descripción','BE',0,0,0,NULL),(151,'7 up','Descripción','BE',0,0,0,NULL),(152,'Fajitas de pollo a la barbacoa','Descripción','GU',0,0,0,NULL),(153,'Omelete de flor de calabaza','Descripción ','GU',0,0,0,NULL),(154,'Filetitos rebosados','Descripción','GU',0,0,0,NULL),(155,'Pollo en mole verde','Descripción','GU',0,0,0,NULL),(156,'Carne de res en entomatado','Descripción','GU',0,0,0,NULL),(157,'Lasaña de carne','Descripción','GU',0,0,0,NULL),(158,'Romeritos','Descripción','GU',0,0,0,NULL),(159,'Chamorro en salsa borracha','Descripción','GU',0,0,0,NULL),(160,'Ribeye','Corte de carne','GU',0,0,0,NULL),(161,'Tacos dorados de papa ahogados','Deliciosos tacos dorados de papa ahogados','GU',0,0,0,NULL),(162,'Mollejas en chipotle','Mollejas en chipotle','GU',0,0,0,NULL),(163,'Omelet de flor de calabaza','Omelet de flor de calabaza','GU',0,0,0,NULL),(164,'Sopes de pollo','Sopes de pollo','GU',0,0,0,NULL),(165,'Caldo tlalpeño','Caldo tlalpeño','GU',0,0,0,NULL),(166,'Fajitas de pollo en pasilla','Fajitas de pollo en pasilla','GU',0,0,0,NULL),(167,'Carne de res en verde con ejotes y papas','Carne de res en verde con ejotes y papas','GU',0,0,0,NULL),(168,'Pollo en estofado','Pollo en estofado','GU',0,0,0,NULL),(169,'Cecina enchilada gratinada','Cecina enchilada gratinada','GU',0,0,0,NULL),(170,'Chile ancho relleno de picadillo dulce','Chile ancho relleno de picadillo dulce','GU',0,0,0,NULL),(171,'Tortas de calabaza capeada','Tortas de calabaza capeada','GU',0,0,0,NULL),(172,'Omelet vegetariano','Omelet vegetariano','GU',0,0,0,NULL),(173,'Fajitas de puerco en morita con nopales','Fajitas de puerco en morita con nopales','GU',0,0,0,NULL),(174,'Costilla de puerco BBQ con puré','Costilla de puerco BBQ con puré','GU',0,0,0,NULL),(175,'Sopes de cecina','Sopes de cecina','GU',0,0,0,NULL),(176,'Taco azteca','Taco azteca','GU',0,0,0,NULL),(177,'Platillo prueba','...','GU',0,0,0,NULL),(178,'1 orden de Frijoles refritos','.','EX',0,0,0,NULL),(179,'Orden de arroz','.','EX',0,0,0,NULL),(180,'Pollo Xochitl','Pollo xochitl','GU',0,0,0,NULL),(181,'Caldo pueblerino','Caldo pueblerino','GU',0,0,0,NULL),(182,'Espinazo en salsa de arbol con nopales','Espinazo en salsa de arbol con nopales','GU',0,0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1356 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socorritomixcoacst_platillomenu`
--

LOCK TABLES `socorritomixcoacst_platillomenu` WRITE;
/*!40000 ALTER TABLE `socorritomixcoacst_platillomenu` DISABLE KEYS */;
INSERT INTO `socorritomixcoacst_platillomenu` VALUES (1,1,2,1),(2,1,2,8),(3,1,2,58),(4,1,2,71),(6,1,2,30),(7,1,2,68),(8,1,2,81),(9,1,2,83),(10,1,2,74),(11,1,2,72),(12,1,2,39),(13,1,2,64),(14,1,2,67),(15,1,2,22),(16,1,2,28),(17,1,2,75),(18,1,2,77),(19,1,2,14),(20,1,2,59),(21,1,2,35),(22,1,2,76),(23,1,2,29),(24,1,2,6),(25,1,2,62),(26,1,2,73),(27,1,2,36),(28,1,2,27),(29,1,2,80),(30,1,2,61),(31,1,2,12),(32,1,2,17),(33,1,2,16),(34,1,2,37),(35,1,2,78),(36,1,2,66),(37,1,2,69),(38,1,2,34),(39,1,2,65),(40,1,2,70),(41,1,2,5),(42,1,2,79),(43,1,2,47),(44,1,2,20),(45,1,2,15),(46,1,2,60),(47,1,2,11),(48,1,2,63),(49,1,2,3),(50,1,2,53),(51,1,2,54),(52,1,2,52),(53,1,2,56),(54,1,2,57),(55,1,2,2),(56,1,2,43),(57,1,2,55),(58,1,2,51),(59,1,2,49),(61,1,2,46),(62,1,2,45),(64,1,2,90),(65,1,2,89),(66,1,2,85),(67,1,2,86),(68,1,2,88),(69,1,2,48),(70,1,2,99),(71,1,2,91),(72,1,2,87),(73,1,2,98),(74,1,2,100),(75,1,2,102),(76,1,2,96),(77,1,5,90),(78,1,5,98),(79,1,5,3),(80,1,5,30),(81,1,5,68),(82,1,5,71),(83,1,5,81),(84,1,5,1),(85,1,5,89),(86,1,5,53),(87,1,5,54),(88,1,5,52),(89,1,5,83),(90,1,5,74),(91,1,5,56),(92,1,5,72),(93,1,5,39),(94,1,5,49),(95,1,5,100),(96,1,5,64),(97,1,5,67),(98,1,5,22),(99,1,5,57),(100,1,5,28),(101,1,5,8),(102,1,5,75),(103,1,5,77),(104,1,5,14),(105,1,5,59),(106,1,5,35),(107,1,5,76),(108,1,5,29),(109,1,5,6),(110,1,5,58),(111,1,5,2),(112,1,5,62),(113,1,5,73),(114,1,5,85),(115,1,5,86),(116,1,5,88),(117,1,5,46),(118,1,5,48),(119,1,5,43),(120,1,5,55),(121,1,5,102),(122,1,5,36),(123,1,5,45),(124,1,5,27),(125,1,5,80),(126,1,5,61),(127,1,5,12),(128,1,5,17),(129,1,5,16),(130,1,5,99),(131,1,5,37),(132,1,5,78),(133,1,5,66),(134,1,5,69),(135,1,5,34),(136,1,5,65),(137,1,5,96),(138,1,5,70),(139,1,5,5),(140,1,5,79),(141,1,5,91),(142,1,5,47),(143,1,5,20),(144,1,5,15),(145,1,5,51),(146,1,5,60),(147,1,5,11),(148,1,5,63),(149,1,5,87),(221,1,8,90),(222,1,8,98),(223,1,8,3),(224,1,8,30),(225,1,8,68),(226,1,8,81),(227,1,8,1),(228,1,8,107),(229,1,8,128),(230,1,8,89),(231,1,8,53),(232,1,8,54),(233,1,8,52),(234,1,8,74),(235,1,8,56),(236,1,8,137),(237,1,8,39),(238,1,8,49),(239,1,8,100),(240,1,8,64),(241,1,8,67),(242,1,8,22),(243,1,8,57),(244,1,8,28),(245,1,8,8),(246,1,8,75),(247,1,8,77),(248,1,8,14),(249,1,8,35),(250,1,8,76),(251,1,8,29),(252,1,8,138),(253,1,8,6),(254,1,8,58),(255,1,8,2),(256,1,8,62),(257,1,8,73),(258,1,8,108),(259,1,8,44),(260,1,8,85),(261,1,8,86),(262,1,8,94),(263,1,8,95),(264,1,8,97),(265,1,8,88),(266,1,8,122),(267,1,8,139),(268,1,8,46),(269,1,8,135),(270,1,8,43),(271,1,8,130),(272,1,8,93),(273,1,8,92),(274,1,8,55),(275,1,8,109),(276,1,8,102),(277,1,8,36),(278,1,8,45),(279,1,8,27),(280,1,8,80),(281,1,8,121),(282,1,8,12),(283,1,8,132),(284,1,8,16),(285,1,8,99),(286,1,8,37),(287,1,8,78),(288,1,8,34),(289,1,8,136),(290,1,8,96),(291,1,8,104),(292,1,8,111),(293,1,8,113),(294,1,8,112),(295,1,8,105),(296,1,8,106),(297,1,8,110),(298,1,8,5),(299,1,8,50),(300,1,8,79),(301,1,8,7),(302,1,8,114),(303,1,8,115),(304,1,8,91),(305,1,8,47),(306,1,8,20),(307,1,8,131),(308,1,8,15),(309,1,8,51),(310,1,8,129),(311,1,8,125),(312,1,8,124),(313,1,8,126),(314,1,8,123),(315,1,8,127),(316,1,8,117),(317,1,8,116),(318,1,8,118),(319,1,8,119),(320,1,8,120),(321,1,8,24),(322,1,8,133),(323,1,8,11),(324,1,8,21),(325,1,8,134),(326,1,8,101),(327,1,8,103),(328,1,8,87),(329,0,8,140),(330,1,9,90),(331,1,9,98),(332,1,9,3),(333,1,9,30),(334,1,9,68),(335,1,9,81),(336,1,9,1),(337,1,9,107),(338,1,9,128),(339,1,9,89),(340,1,9,53),(341,1,9,54),(342,1,9,52),(343,1,9,140),(344,1,9,74),(345,1,9,56),(346,1,9,137),(347,1,9,39),(348,1,9,49),(349,1,9,100),(350,1,9,64),(351,1,9,67),(352,1,9,22),(353,1,9,57),(354,1,9,28),(355,1,9,8),(356,1,9,75),(357,1,9,77),(358,1,9,14),(359,1,9,35),(360,1,9,76),(361,1,9,29),(362,1,9,138),(363,1,9,6),(364,1,9,58),(365,1,9,2),(366,1,9,62),(367,1,9,73),(368,1,9,108),(369,1,9,44),(370,1,9,85),(371,1,9,86),(372,1,9,94),(373,1,9,95),(374,1,9,97),(375,1,9,88),(376,1,9,122),(377,1,9,139),(378,1,9,46),(379,1,9,135),(380,1,9,43),(381,1,9,130),(382,1,9,93),(383,1,9,92),(384,1,9,55),(385,1,9,109),(386,1,9,102),(387,1,9,36),(388,1,9,45),(389,1,9,27),(390,1,9,80),(391,1,9,121),(392,1,9,12),(393,1,9,132),(394,1,9,16),(395,1,9,99),(396,1,9,37),(397,1,9,78),(398,1,9,34),(399,1,9,136),(400,1,9,96),(401,1,9,104),(402,1,9,111),(403,1,9,113),(404,1,9,112),(405,1,9,105),(406,1,9,106),(407,1,9,110),(408,1,9,5),(409,1,9,50),(410,1,9,79),(411,1,9,7),(412,1,9,114),(413,1,9,115),(414,1,9,91),(415,1,9,47),(416,1,9,20),(417,1,9,131),(418,1,9,15),(419,1,9,51),(420,1,9,129),(421,1,9,125),(422,1,9,124),(423,1,9,126),(424,1,9,123),(425,1,9,127),(426,1,9,117),(427,1,9,116),(428,1,9,118),(429,1,9,119),(430,1,9,120),(431,1,9,24),(432,1,9,133),(433,1,9,11),(434,1,9,21),(435,1,9,134),(436,1,9,101),(437,1,9,103),(438,1,9,87),(439,1,10,90),(440,1,10,98),(441,1,10,3),(442,1,10,30),(443,1,10,68),(444,1,10,81),(445,1,10,1),(446,1,10,107),(447,1,10,128),(448,1,10,89),(449,1,10,53),(450,1,10,54),(451,1,10,52),(452,1,10,140),(453,1,10,74),(454,1,10,56),(455,1,10,137),(456,1,10,39),(457,1,10,49),(458,1,10,100),(459,1,10,64),(460,1,10,67),(461,1,10,22),(462,1,10,57),(463,1,10,28),(464,1,10,8),(465,1,10,75),(466,1,10,77),(467,1,10,14),(468,1,10,35),(469,1,10,76),(470,1,10,29),(471,1,10,138),(472,1,10,6),(473,1,10,58),(474,1,10,2),(475,1,10,62),(476,1,10,73),(477,1,10,108),(478,1,10,44),(479,1,10,85),(480,1,10,86),(481,1,10,94),(482,1,10,95),(483,1,10,97),(484,1,10,88),(485,1,10,122),(486,1,10,139),(487,1,10,46),(488,1,10,135),(489,1,10,43),(490,1,10,130),(491,1,10,93),(492,1,10,92),(493,1,10,55),(494,1,10,109),(495,1,10,102),(496,1,10,36),(497,1,10,45),(498,1,10,27),(499,1,10,80),(500,1,10,121),(501,1,10,12),(502,1,10,132),(503,1,10,16),(504,1,10,99),(505,1,10,37),(506,1,10,78),(507,1,10,34),(508,1,10,136),(509,1,10,96),(510,1,10,104),(511,1,10,111),(512,1,10,113),(513,1,10,112),(514,1,10,105),(515,1,10,106),(516,1,10,110),(517,1,10,5),(518,1,10,50),(519,1,10,79),(520,1,10,7),(521,1,10,114),(522,1,10,115),(523,1,10,91),(524,1,10,47),(525,1,10,20),(526,1,10,131),(527,1,10,15),(528,1,10,51),(529,1,10,129),(530,1,10,125),(531,1,10,124),(532,1,10,126),(533,1,10,123),(534,1,10,127),(535,1,10,117),(536,1,10,116),(537,1,10,118),(538,1,10,119),(539,1,10,120),(540,1,10,24),(541,1,10,133),(542,1,10,11),(543,1,10,21),(544,1,10,134),(545,1,10,101),(546,1,10,103),(547,1,10,87),(548,1,11,90),(549,1,11,98),(550,1,11,3),(551,1,11,30),(552,1,11,68),(553,1,11,81),(554,1,11,1),(555,1,11,107),(556,1,11,128),(557,1,11,89),(558,1,11,53),(559,1,11,54),(560,1,11,52),(561,1,11,140),(562,1,11,74),(563,1,11,56),(564,1,11,137),(565,1,11,39),(566,1,11,49),(567,1,11,100),(568,1,11,64),(569,1,11,67),(570,1,11,22),(571,1,11,57),(572,1,11,28),(573,1,11,8),(574,1,11,75),(575,1,11,77),(576,1,11,14),(577,1,11,35),(578,1,11,76),(579,1,11,29),(580,1,11,138),(581,1,11,6),(582,1,11,58),(583,1,11,2),(584,1,11,62),(585,1,11,73),(586,1,11,108),(587,1,11,44),(588,1,11,85),(589,1,11,86),(590,1,11,94),(591,1,11,95),(592,1,11,97),(593,1,11,88),(594,1,11,122),(595,1,11,139),(596,1,11,46),(597,1,11,135),(598,1,11,43),(599,1,11,130),(600,1,11,93),(601,1,11,92),(602,1,11,55),(603,1,11,109),(604,1,11,102),(605,1,11,36),(606,1,11,45),(607,1,11,27),(608,1,11,80),(609,1,11,121),(610,1,11,12),(611,1,11,132),(612,1,11,16),(613,1,11,99),(614,1,11,37),(615,1,11,78),(616,1,11,34),(617,1,11,136),(618,1,11,96),(619,1,11,104),(620,1,11,111),(621,1,11,113),(622,1,11,112),(623,1,11,105),(624,1,11,106),(625,1,11,110),(626,1,11,5),(627,1,11,50),(628,1,11,79),(629,1,11,7),(630,1,11,114),(631,1,11,115),(632,1,11,91),(633,1,11,47),(634,1,11,20),(635,1,11,131),(636,1,11,15),(637,1,11,51),(638,1,11,129),(639,1,11,125),(640,1,11,124),(641,1,11,126),(642,1,11,123),(643,1,11,127),(644,1,11,117),(645,1,11,116),(646,1,11,118),(647,1,11,119),(648,1,11,120),(649,1,11,24),(650,1,11,133),(651,1,11,11),(652,1,11,21),(653,1,11,134),(654,1,11,101),(655,1,11,103),(656,1,11,87),(657,1,12,90),(658,1,12,98),(659,1,12,3),(660,1,12,30),(661,1,12,68),(662,1,12,81),(663,1,12,1),(664,1,12,107),(665,1,12,128),(666,1,12,89),(667,1,12,53),(668,1,12,54),(669,1,12,52),(670,1,12,140),(671,1,12,74),(672,1,12,56),(673,1,12,137),(674,1,12,39),(675,1,12,49),(676,1,12,100),(677,1,12,64),(678,1,12,67),(679,1,12,22),(680,1,12,57),(681,1,12,28),(682,1,12,8),(683,1,12,75),(684,1,12,77),(685,1,12,14),(686,1,12,35),(687,1,12,76),(688,1,12,29),(689,1,12,138),(690,1,12,6),(691,1,12,58),(692,1,12,2),(693,1,12,62),(694,1,12,73),(695,1,12,108),(696,1,12,44),(697,1,12,85),(698,1,12,86),(699,1,12,94),(700,1,12,95),(701,1,12,97),(702,1,12,88),(703,1,12,122),(704,1,12,139),(705,1,12,46),(706,1,12,135),(707,1,12,43),(708,1,12,130),(709,1,12,93),(710,1,12,92),(711,1,12,55),(712,1,12,109),(713,1,12,102),(714,1,12,36),(715,1,12,45),(716,1,12,27),(717,1,12,80),(718,1,12,121),(719,1,12,12),(720,1,12,132),(721,1,12,16),(722,1,12,99),(723,1,12,37),(724,1,12,78),(725,1,12,34),(726,1,12,136),(727,1,12,96),(728,1,12,104),(729,1,12,111),(730,1,12,113),(731,1,12,112),(732,1,12,105),(733,1,12,106),(734,1,12,110),(735,1,12,5),(736,1,12,50),(737,1,12,79),(738,1,12,7),(739,1,12,114),(740,1,12,115),(741,1,12,91),(742,1,12,47),(743,1,12,20),(744,1,12,131),(745,1,12,15),(746,1,12,51),(747,1,12,129),(748,1,12,125),(749,1,12,124),(750,1,12,126),(751,1,12,123),(752,1,12,127),(753,1,12,117),(754,1,12,116),(755,1,12,118),(756,1,12,119),(757,1,12,120),(758,1,12,24),(759,1,12,133),(760,1,12,11),(761,1,12,21),(762,1,12,134),(763,1,12,101),(764,1,12,103),(765,1,12,87),(766,1,13,90),(767,1,13,98),(768,1,13,3),(769,1,13,30),(770,1,13,68),(771,1,13,81),(772,1,13,1),(773,1,13,107),(774,1,13,128),(775,1,13,89),(776,1,13,53),(777,1,13,54),(778,1,13,52),(779,1,13,140),(780,1,13,74),(781,1,13,56),(782,1,13,137),(783,1,13,39),(784,1,13,49),(785,1,13,100),(786,1,13,64),(787,1,13,67),(788,1,13,22),(789,1,13,57),(790,1,13,28),(791,1,13,8),(792,1,13,75),(793,1,13,77),(794,1,13,14),(795,1,13,35),(796,1,13,76),(797,1,13,29),(798,1,13,138),(799,1,13,6),(800,1,13,58),(801,1,13,2),(802,1,13,62),(803,1,13,73),(804,1,13,108),(805,1,13,44),(806,1,13,85),(807,1,13,86),(808,1,13,94),(809,1,13,95),(810,1,13,97),(811,1,13,88),(812,1,13,122),(813,1,13,139),(814,1,13,46),(815,1,13,135),(816,1,13,43),(817,1,13,130),(818,1,13,93),(819,1,13,92),(820,1,13,55),(821,1,13,109),(822,1,13,102),(823,1,13,36),(824,1,13,45),(825,1,13,27),(826,1,13,80),(827,1,13,121),(828,1,13,12),(829,1,13,132),(830,1,13,16),(831,1,13,99),(832,1,13,37),(833,1,13,78),(834,1,13,34),(835,1,13,136),(836,1,13,96),(837,1,13,104),(838,1,13,111),(839,1,13,113),(840,1,13,112),(841,1,13,105),(842,1,13,106),(843,1,13,110),(844,1,13,5),(845,1,13,50),(846,1,13,79),(847,1,13,7),(848,1,13,114),(849,1,13,115),(850,1,13,91),(851,1,13,47),(852,1,13,20),(853,1,13,131),(854,1,13,15),(855,1,13,51),(856,1,13,129),(857,1,13,125),(858,1,13,124),(859,1,13,126),(860,1,13,123),(861,1,13,127),(862,1,13,117),(863,1,13,116),(864,1,13,118),(865,1,13,119),(866,1,13,120),(867,1,13,24),(868,1,13,133),(869,1,13,11),(870,1,13,21),(871,1,13,134),(872,1,13,101),(873,1,13,103),(874,1,13,87),(875,1,14,90),(876,1,14,151),(877,1,14,98),(878,1,14,3),(879,1,14,30),(880,1,14,81),(881,1,14,1),(882,1,14,107),(883,1,14,128),(884,1,14,89),(885,1,14,53),(886,1,14,54),(887,1,14,52),(888,1,14,141),(889,1,14,142),(890,1,14,56),(891,1,14,39),(892,1,14,49),(893,1,14,100),(894,1,14,67),(895,1,14,22),(896,1,14,57),(897,1,14,28),(898,1,14,143),(899,1,14,8),(900,1,14,75),(901,1,14,77),(902,1,14,14),(903,1,14,59),(904,1,14,35),(905,1,14,76),(906,1,14,29),(907,1,14,6),(908,1,14,58),(909,1,14,2),(910,1,14,150),(911,1,14,73),(912,1,14,108),(913,1,14,44),(914,1,14,85),(915,1,14,86),(916,1,14,94),(917,1,14,95),(918,1,14,97),(919,1,14,88),(920,1,14,122),(921,1,14,139),(922,1,14,46),(923,1,14,43),(924,1,14,130),(925,1,14,93),(926,1,14,92),(927,1,14,55),(928,1,14,109),(929,1,14,145),(930,1,14,102),(931,1,14,36),(932,1,14,147),(933,1,14,84),(934,1,14,45),(935,1,14,27),(936,1,14,80),(937,1,14,121),(938,1,14,12),(939,1,14,132),(940,1,14,16),(941,1,14,99),(942,1,14,37),(943,1,14,78),(944,1,14,34),(945,1,14,96),(946,1,14,104),(947,1,14,111),(948,1,14,113),(949,1,14,112),(950,1,14,105),(951,1,14,106),(952,1,14,110),(953,1,14,5),(954,1,14,50),(955,1,14,79),(956,1,14,148),(957,1,14,146),(958,1,14,7),(959,1,14,114),(960,1,14,115),(961,1,14,91),(962,1,14,47),(963,1,14,20),(964,1,14,149),(965,1,14,144),(966,1,14,15),(967,1,14,51),(968,1,14,129),(969,1,14,125),(970,1,14,124),(971,1,14,126),(972,1,14,123),(973,1,14,127),(974,1,14,117),(975,1,14,116),(976,1,14,118),(977,1,14,119),(978,1,14,120),(979,1,14,24),(980,1,14,11),(981,1,14,134),(982,1,14,101),(983,1,14,103),(984,1,14,87),(985,1,14,156),(986,1,14,159),(987,1,14,152),(988,1,14,154),(989,1,14,157),(990,1,14,153),(991,1,14,155),(992,1,14,160),(993,1,14,158),(994,1,15,90),(995,1,15,151),(996,1,15,98),(997,1,15,3),(998,1,15,30),(999,1,15,68),(1000,1,15,107),(1001,1,15,128),(1002,1,15,89),(1003,1,15,53),(1004,1,15,54),(1005,1,15,52),(1006,1,15,141),(1007,1,15,142),(1008,1,15,56),(1009,1,15,72),(1010,1,15,49),(1011,1,15,100),(1012,1,15,22),(1013,1,15,57),(1014,1,15,28),(1015,1,15,143),(1016,1,15,14),(1017,1,15,59),(1018,1,15,35),(1019,1,15,29),(1020,1,15,2),(1021,1,15,150),(1022,1,15,154),(1023,1,15,108),(1024,1,15,44),(1025,1,15,85),(1026,1,15,86),(1027,1,15,94),(1028,1,15,95),(1029,1,15,97),(1030,1,15,88),(1031,1,15,122),(1032,1,15,46),(1033,1,15,43),(1034,1,15,130),(1035,1,15,93),(1036,1,15,92),(1037,1,15,157),(1038,1,15,55),(1039,1,15,109),(1040,1,15,145),(1041,1,15,102),(1042,1,15,147),(1043,1,15,45),(1044,1,15,27),(1045,1,15,121),(1046,1,15,12),(1047,1,15,16),(1048,1,15,99),(1049,1,15,34),(1050,1,15,96),(1051,1,15,104),(1052,1,15,111),(1053,1,15,113),(1054,1,15,112),(1055,1,15,105),(1056,1,15,106),(1057,1,15,110),(1058,1,15,5),(1059,1,15,50),(1060,1,15,148),(1061,1,15,146),(1062,1,15,114),(1063,1,15,115),(1064,1,15,91),(1065,1,15,47),(1066,1,15,20),(1067,1,15,149),(1068,1,15,144),(1069,1,15,15),(1070,1,15,51),(1071,1,15,129),(1072,1,15,125),(1073,1,15,124),(1074,1,15,126),(1075,1,15,123),(1076,1,15,127),(1077,1,15,117),(1078,1,15,116),(1079,1,15,118),(1080,1,15,119),(1081,1,15,120),(1082,1,15,60),(1083,1,15,24),(1084,1,15,11),(1085,1,15,134),(1086,1,15,101),(1087,1,15,103),(1088,1,15,87),(1089,1,15,67),(1090,1,15,84),(1091,1,15,163),(1092,1,15,164),(1093,1,15,161),(1094,1,15,21),(1095,1,15,165),(1096,1,15,167),(1097,1,15,169),(1098,1,15,170),(1099,1,15,166),(1100,1,15,168),(1101,1,15,1),(1102,1,15,8),(1103,1,15,10),(1104,1,15,6),(1105,1,15,7),(1106,1,15,58),(1107,1,16,90),(1108,1,16,151),(1109,1,16,98),(1110,1,16,3),(1111,1,16,30),(1112,1,16,68),(1113,1,16,71),(1114,1,16,1),(1115,1,16,107),(1116,1,16,128),(1117,1,16,89),(1118,1,16,53),(1119,1,16,54),(1120,1,16,52),(1121,1,16,141),(1122,1,16,142),(1124,1,16,56),(1128,1,16,49),(1129,1,16,100),(1130,1,16,67),(1132,1,16,22),(1133,1,16,57),(1134,1,16,28),(1135,1,16,143),(1136,1,16,8),(1137,1,16,10),(1138,1,16,14),(1140,1,16,35),(1141,1,16,29),(1142,1,16,6),(1143,1,16,58),(1144,1,16,2),(1146,1,16,150),(1148,1,16,108),(1149,1,16,44),(1150,1,16,85),(1151,1,16,86),(1152,1,16,94),(1153,1,16,95),(1154,1,16,97),(1155,1,16,88),(1156,1,16,122),(1157,1,16,46),(1158,1,16,13),(1159,1,16,43),(1160,1,16,130),(1161,1,16,93),(1162,1,16,92),(1164,1,16,55),(1165,1,16,109),(1166,1,16,145),(1167,1,16,102),(1168,1,16,147),(1170,1,16,45),(1171,1,16,27),(1172,1,16,121),(1173,1,16,12),(1175,1,16,16),(1176,1,16,99),(1177,1,16,34),(1179,1,16,136),(1180,1,16,96),(1181,1,16,104),(1182,1,16,111),(1183,1,16,113),(1184,1,16,112),(1185,1,16,105),(1186,1,16,106),(1187,1,16,110),(1188,1,16,5),(1189,1,16,50),(1190,1,16,148),(1191,1,16,146),(1192,1,16,7),(1193,1,16,114),(1194,1,16,115),(1195,1,16,91),(1196,1,16,47),(1197,1,16,20),(1198,1,16,164),(1199,1,16,149),(1200,1,16,144),(1202,1,16,15),(1203,1,16,51),(1204,1,16,129),(1205,1,16,125),(1206,1,16,124),(1207,1,16,126),(1208,1,16,123),(1209,1,16,127),(1210,1,16,117),(1211,1,16,116),(1212,1,16,118),(1213,1,16,119),(1214,1,16,120),(1216,1,16,24),(1217,1,16,11),(1218,1,16,21),(1220,1,16,101),(1221,1,16,103),(1222,1,16,87),(1223,1,16,171),(1224,1,16,174),(1225,1,16,173),(1226,1,16,172),(1227,1,16,175),(1228,1,16,176),(1229,1,16,177),(1230,1,16,178),(1231,1,16,179),(1232,1,16,73),(1233,1,17,178),(1234,1,17,90),(1235,1,17,151),(1236,1,17,98),(1237,1,17,3),(1238,1,17,30),(1239,1,17,68),(1240,1,17,81),(1241,1,17,107),(1242,1,17,128),(1243,1,17,89),(1244,1,17,53),(1245,1,17,54),(1246,1,17,52),(1247,1,17,141),(1248,1,17,142),(1249,1,17,56),(1252,1,17,49),(1253,1,17,100),(1254,1,17,159),(1255,1,17,42),(1256,1,17,170),(1257,1,17,22),(1258,1,17,57),(1259,1,17,28),(1260,1,17,143),(1261,1,17,75),(1262,1,17,77),(1263,1,17,14),(1264,1,17,35),(1265,1,17,76),(1266,1,17,29),(1267,1,17,2),(1268,1,17,150),(1269,1,17,73),(1270,1,17,108),(1271,1,17,44),(1272,1,17,85),(1273,1,17,86),(1274,1,17,94),(1275,1,17,95),(1276,1,17,97),(1277,1,17,88),(1278,1,17,122),(1279,1,17,139),(1280,1,17,46),(1281,1,17,43),(1282,1,17,130),(1283,1,17,93),(1284,1,17,92),(1285,1,17,55),(1286,1,17,109),(1287,1,17,145),(1288,1,17,102),(1289,1,17,36),(1290,1,17,147),(1291,1,17,84),(1292,1,17,45),(1293,1,17,27),(1294,1,17,80),(1295,1,17,121),(1296,1,17,12),(1297,1,17,132),(1298,1,17,179),(1299,1,17,16),(1300,1,17,99),(1301,1,17,37),(1302,1,17,78),(1303,1,17,34),(1304,1,17,65),(1305,1,17,96),(1306,1,17,160),(1307,1,17,104),(1308,1,17,111),(1309,1,17,113),(1310,1,17,112),(1311,1,17,105),(1312,1,17,106),(1313,1,17,110),(1314,1,17,158),(1315,1,17,50),(1316,1,17,79),(1317,1,17,148),(1318,1,17,146),(1319,1,17,114),(1320,1,17,115),(1321,1,17,91),(1322,1,17,47),(1323,1,17,20),(1324,1,17,149),(1325,1,17,144),(1326,1,17,131),(1327,1,17,15),(1328,1,17,51),(1329,1,17,129),(1330,1,17,125),(1331,1,17,124),(1332,1,17,126),(1333,1,17,123),(1334,1,17,127),(1335,1,17,117),(1336,1,17,116),(1337,1,17,118),(1338,1,17,119),(1339,1,17,120),(1340,1,17,24),(1341,1,17,133),(1342,1,17,11),(1343,1,17,21),(1344,1,17,101),(1345,1,17,103),(1346,1,17,87),(1347,1,17,181),(1348,1,17,182),(1349,1,17,180),(1350,1,17,1),(1351,1,17,8),(1352,1,17,6),(1353,1,17,58),(1354,1,17,7),(1355,1,17,156);
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

-- Dump completed on 2021-06-17  2:00:22
