-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: drishtigems
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `is_shipping_address` tinyint(1) NOT NULL,
  `is_billing_address` tinyint(1) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_id_c030de7d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `address_user_id_c030de7d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_module`
--

DROP TABLE IF EXISTS `admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_module`
--

LOCK TABLES `admin_module` WRITE;
/*!40000 ALTER TABLE `admin_module` DISABLE KEYS */;
INSERT INTO `admin_module` VALUES (1,'Staff'),(2,'State Distributor'),(3,'District Distributor'),(4,'City Distributor'),(5,'Jewellers'),(6,'Customers'),(7,'Categories'),(8,'Products'),(9,'Career'),(10,'Contact Us'),(11,'Jewellery Type'),(12,'Metal Type'),(13,'Jewellery'),(14,'Certification Type');
/*!40000 ALTER TABLE `admin_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_module_permission`
--

DROP TABLE IF EXISTS `admin_module_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_module_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_module_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_module_permiss_admin_module_id_b6a26b0f_fk_admin_mod` (`admin_module_id`),
  KEY `admin_module_permission_user_id_35cd7e94_fk_auth_user_id` (`user_id`),
  CONSTRAINT `admin_module_permiss_admin_module_id_b6a26b0f_fk_admin_mod` FOREIGN KEY (`admin_module_id`) REFERENCES `admin_module` (`id`),
  CONSTRAINT `admin_module_permission_user_id_35cd7e94_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_module_permission`
--

LOCK TABLES `admin_module_permission` WRITE;
/*!40000 ALTER TABLE `admin_module_permission` DISABLE KEYS */;
INSERT INTO `admin_module_permission` VALUES (93,1,114),(94,2,114),(95,3,114),(96,4,114),(97,5,114),(98,14,114),(99,13,114),(100,1,125),(101,2,125),(102,3,125),(103,4,125),(104,5,125),(105,6,125);
/*!40000 ALTER TABLE `admin_module_permission` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin'),(5,'City Distributor'),(7,'Customer'),(4,'District Distributor'),(6,'Jeweller'),(2,'Staff'),(3,'State Distributor');
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152);
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
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add admin module',5,'add_adminmodule'),(18,'Can change admin module',5,'change_adminmodule'),(19,'Can delete admin module',5,'delete_adminmodule'),(20,'Can view admin module',5,'view_adminmodule'),(21,'Can add careers',6,'add_careers'),(22,'Can change careers',6,'change_careers'),(23,'Can delete careers',6,'delete_careers'),(24,'Can view careers',6,'view_careers'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add contact us',8,'add_contactus'),(30,'Can change contact us',8,'change_contactus'),(31,'Can delete contact us',8,'delete_contactus'),(32,'Can view contact us',8,'view_contactus'),(33,'Can add dealership distribution',9,'add_dealershipdistribution'),(34,'Can change dealership distribution',9,'change_dealershipdistribution'),(35,'Can delete dealership distribution',9,'delete_dealershipdistribution'),(36,'Can view dealership distribution',9,'view_dealershipdistribution'),(37,'Can add gem',10,'add_gem'),(38,'Can change gem',10,'change_gem'),(39,'Can delete gem',10,'delete_gem'),(40,'Can view gem',10,'view_gem'),(41,'Can add home page in the news',11,'add_homepageinthenews'),(42,'Can change home page in the news',11,'change_homepageinthenews'),(43,'Can delete home page in the news',11,'delete_homepageinthenews'),(44,'Can view home page in the news',11,'view_homepageinthenews'),(45,'Can add home page video',12,'add_homepagevideo'),(46,'Can change home page video',12,'change_homepagevideo'),(47,'Can delete home page video',12,'delete_homepagevideo'),(48,'Can view home page video',12,'view_homepagevideo'),(49,'Can add home page why us',13,'add_homepagewhyus'),(50,'Can change home page why us',13,'change_homepagewhyus'),(51,'Can delete home page why us',13,'delete_homepagewhyus'),(52,'Can view home page why us',13,'view_homepagewhyus'),(53,'Can add offer',14,'add_offer'),(54,'Can change offer',14,'change_offer'),(55,'Can delete offer',14,'delete_offer'),(56,'Can view offer',14,'view_offer'),(57,'Can add offer type',15,'add_offertype'),(58,'Can change offer type',15,'change_offertype'),(59,'Can delete offer type',15,'delete_offertype'),(60,'Can view offer type',15,'view_offertype'),(61,'Can add order status',16,'add_orderstatus'),(62,'Can change order status',16,'change_orderstatus'),(63,'Can delete order status',16,'delete_orderstatus'),(64,'Can view order status',16,'view_orderstatus'),(65,'Can add payment method',17,'add_paymentmethod'),(66,'Can change payment method',17,'change_paymentmethod'),(67,'Can delete payment method',17,'delete_paymentmethod'),(68,'Can view payment method',17,'view_paymentmethod'),(69,'Can add shape',18,'add_shape'),(70,'Can change shape',18,'change_shape'),(71,'Can delete shape',18,'delete_shape'),(72,'Can view shape',18,'view_shape'),(73,'Can add state',19,'add_state'),(74,'Can change state',19,'change_state'),(75,'Can delete state',19,'delete_state'),(76,'Can view state',19,'view_state'),(77,'Can add user order',20,'add_userorder'),(78,'Can change user order',20,'change_userorder'),(79,'Can delete user order',20,'delete_userorder'),(80,'Can view user order',20,'view_userorder'),(81,'Can add weight unit',21,'add_weightunit'),(82,'Can change weight unit',21,'change_weightunit'),(83,'Can delete weight unit',21,'delete_weightunit'),(84,'Can view weight unit',21,'view_weightunit'),(85,'Can add user wishlist',22,'add_userwishlist'),(86,'Can change user wishlist',22,'change_userwishlist'),(87,'Can delete user wishlist',22,'delete_userwishlist'),(88,'Can view user wishlist',22,'view_userwishlist'),(89,'Can add user order item',23,'add_userorderitem'),(90,'Can change user order item',23,'change_userorderitem'),(91,'Can delete user order item',23,'delete_userorderitem'),(92,'Can view user order item',23,'view_userorderitem'),(93,'Can add user log',24,'add_userlog'),(94,'Can change user log',24,'change_userlog'),(95,'Can delete user log',24,'delete_userlog'),(96,'Can view user log',24,'view_userlog'),(97,'Can add user cart',25,'add_usercart'),(98,'Can change user cart',25,'change_usercart'),(99,'Can delete user cart',25,'delete_usercart'),(100,'Can view user cart',25,'view_usercart'),(101,'Can add offer retailer',26,'add_offerretailer'),(102,'Can change offer retailer',26,'change_offerretailer'),(103,'Can delete offer retailer',26,'delete_offerretailer'),(104,'Can view offer retailer',26,'view_offerretailer'),(105,'Can add notification',27,'add_notification'),(106,'Can change notification',27,'change_notification'),(107,'Can delete notification',27,'delete_notification'),(108,'Can view notification',27,'view_notification'),(109,'Can add my stock',28,'add_mystock'),(110,'Can change my stock',28,'change_mystock'),(111,'Can delete my stock',28,'delete_mystock'),(112,'Can view my stock',28,'view_mystock'),(113,'Can add gem video',29,'add_gemvideo'),(114,'Can change gem video',29,'change_gemvideo'),(115,'Can delete gem video',29,'delete_gemvideo'),(116,'Can view gem video',29,'view_gemvideo'),(117,'Can add gem image',30,'add_gemimage'),(118,'Can change gem image',30,'change_gemimage'),(119,'Can delete gem image',30,'delete_gemimage'),(120,'Can view gem image',30,'view_gemimage'),(121,'Can add district',31,'add_district'),(122,'Can change district',31,'change_district'),(123,'Can delete district',31,'delete_district'),(124,'Can view district',31,'view_district'),(125,'Can add city',32,'add_city'),(126,'Can change city',32,'change_city'),(127,'Can delete city',32,'delete_city'),(128,'Can view city',32,'view_city'),(129,'Can add admin module permission',33,'add_adminmodulepermission'),(130,'Can change admin module permission',33,'change_adminmodulepermission'),(131,'Can delete admin module permission',33,'delete_adminmodulepermission'),(132,'Can view admin module permission',33,'view_adminmodulepermission'),(133,'Can add address',34,'add_address'),(134,'Can change address',34,'change_address'),(135,'Can delete address',34,'delete_address'),(136,'Can view address',34,'view_address'),(137,'Can add log entry',35,'add_logentry'),(138,'Can change log entry',35,'change_logentry'),(139,'Can delete log entry',35,'delete_logentry'),(140,'Can view log entry',35,'view_logentry'),(141,'Can add session',36,'add_session'),(142,'Can change session',36,'change_session'),(143,'Can delete session',36,'delete_session'),(144,'Can view session',36,'view_session'),(145,'Can add Token',37,'add_token'),(146,'Can change Token',37,'change_token'),(147,'Can delete Token',37,'delete_token'),(148,'Can view Token',37,'view_token'),(149,'Can add token',38,'add_tokenproxy'),(150,'Can change token',38,'change_tokenproxy'),(151,'Can delete token',38,'delete_tokenproxy'),(152,'Can view token',38,'view_tokenproxy'),(153,'Can add stone cut',39,'add_stonecut'),(154,'Can change stone cut',39,'change_stonecut'),(155,'Can delete stone cut',39,'delete_stonecut'),(156,'Can view stone cut',39,'view_stonecut'),(157,'Can add stone quality',40,'add_stonequality'),(158,'Can change stone quality',40,'change_stonequality'),(159,'Can delete stone quality',40,'delete_stonequality'),(160,'Can view stone quality',40,'view_stonequality'),(161,'Can add category color',41,'add_categorycolor'),(162,'Can change category color',41,'change_categorycolor'),(163,'Can delete category color',41,'delete_categorycolor'),(164,'Can view category color',41,'view_categorycolor'),(165,'Can add otp verification',42,'add_otpverification'),(166,'Can change otp verification',42,'change_otpverification'),(167,'Can delete otp verification',42,'delete_otpverification'),(168,'Can view otp verification',42,'view_otpverification'),(169,'Can add jewellery type',43,'add_jewellerytype'),(170,'Can change jewellery type',43,'change_jewellerytype'),(171,'Can delete jewellery type',43,'delete_jewellerytype'),(172,'Can view jewellery type',43,'view_jewellerytype'),(173,'Can add metal type',44,'add_metaltype'),(174,'Can change metal type',44,'change_metaltype'),(175,'Can delete metal type',44,'delete_metaltype'),(176,'Can view metal type',44,'view_metaltype'),(177,'Can add jewellery design',45,'add_jewellerydesign'),(178,'Can change jewellery design',45,'change_jewellerydesign'),(179,'Can delete jewellery design',45,'delete_jewellerydesign'),(180,'Can view jewellery design',45,'view_jewellerydesign'),(181,'Can add jewellery',46,'add_jewellery'),(182,'Can change jewellery',46,'change_jewellery'),(183,'Can delete jewellery',46,'delete_jewellery'),(184,'Can view jewellery',46,'view_jewellery'),(185,'Can add jewellery image',47,'add_jewelleryimage'),(186,'Can change jewellery image',47,'change_jewelleryimage'),(187,'Can delete jewellery image',47,'delete_jewelleryimage'),(188,'Can view jewellery image',47,'view_jewelleryimage'),(189,'Can add jewellery video',48,'add_jewelleryvideo'),(190,'Can change jewellery video',48,'change_jewelleryvideo'),(191,'Can delete jewellery video',48,'delete_jewelleryvideo'),(192,'Can view jewellery video',48,'view_jewelleryvideo'),(193,'Can add certification type',49,'add_certificationtype'),(194,'Can change certification type',49,'change_certificationtype'),(195,'Can delete certification type',49,'delete_certificationtype'),(196,'Can view certification type',49,'view_certificationtype'),(197,'Can add origin',50,'add_origin'),(198,'Can change origin',50,'change_origin'),(199,'Can delete origin',50,'delete_origin'),(200,'Can view origin',50,'view_origin'),(201,'Can add forget password log',51,'add_forgetpasswordlog'),(202,'Can change forget password log',51,'change_forgetpasswordlog'),(203,'Can delete forget password log',51,'delete_forgetpasswordlog'),(204,'Can view forget password log',51,'view_forgetpasswordlog'),(205,'Can add target incentive',52,'add_targetincentive'),(206,'Can change target incentive',52,'change_targetincentive'),(207,'Can delete target incentive',52,'delete_targetincentive'),(208,'Can view target incentive',52,'view_targetincentive'),(209,'Can add universal target and commission',53,'add_universaltargetandcommission'),(210,'Can change universal target and commission',53,'change_universaltargetandcommission'),(211,'Can delete universal target and commission',53,'delete_universaltargetandcommission'),(212,'Can view universal target and commission',53,'view_universaltargetandcommission'),(213,'Can add staff user target',54,'add_staffusertarget'),(214,'Can change staff user target',54,'change_staffusertarget'),(215,'Can delete staff user target',54,'delete_staffusertarget'),(216,'Can view staff user target',54,'view_staffusertarget'),(217,'Can add distributor user commission',55,'add_distributorusercommission'),(218,'Can change distributor user commission',55,'change_distributorusercommission'),(219,'Can delete distributor user commission',55,'delete_distributorusercommission'),(220,'Can view distributor user commission',55,'view_distributorusercommission');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  `user_status` int DEFAULT NULL,
  `profile_status` int DEFAULT NULL,
  `address_city_id` bigint DEFAULT NULL,
  `address_district_id` bigint DEFAULT NULL,
  `address_pin_code` int DEFAULT NULL,
  `address_state_id` bigint DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `auth_user_phone_number_21846c29_uniq` (`phone_number`),
  KEY `auth_user_city_id_c89da070_fk_city_id` (`city_id`),
  KEY `auth_user_state_id_8d7a006e_fk_state_id` (`state_id`),
  KEY `auth_user_district_id_7f6b072a_fk_district_id` (`district_id`),
  KEY `auth_user_address_city_id_2fbb2861_fk_city_id` (`address_city_id`),
  KEY `auth_user_address_district_id_64a3632b_fk_district_id` (`address_district_id`),
  KEY `auth_user_address_state_id_c2fe8bed_fk_state_id` (`address_state_id`),
  CONSTRAINT `auth_user_address_city_id_2fbb2861_fk_city_id` FOREIGN KEY (`address_city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `auth_user_address_district_id_64a3632b_fk_district_id` FOREIGN KEY (`address_district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `auth_user_address_state_id_c2fe8bed_fk_state_id` FOREIGN KEY (`address_state_id`) REFERENCES `state` (`id`),
  CONSTRAINT `auth_user_city_id_c89da070_fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `auth_user_district_id_7f6b072a_fk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `auth_user_state_id_8d7a006e_fk_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (37,'pbkdf2_sha256$260000$MYcyAel956fPwV0KWmsZ58$CILpbxg2AKOL7CYUEo1BNB/ZFvhXCZq+mOgel+j3ux0=','2021-11-23 04:51:56.957958',0,'Gurmukh','Singh',0,1,'2021-10-04 13:37:52.333593','gurmukh@yopmail.com','9876543210','Goa','user_images/48b2eb21-f083-460d-a146-31ae80d43c12/tree-736885_960_720.png',NULL,11,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(109,'pbkdf2_sha256$260000$Th11jMX2fY90OZfFj5lzbN$TvbL5GDw9nxHoMuXn+SDNaNsJRPhCcvB/9WG8vaxEBE=','2021-11-12 08:24:36.482999',1,'','',1,1,'2021-11-12 08:24:13.160007','ajamal@gmail.com',NULL,NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(110,'pbkdf2_sha256$260000$Hzz04JKMedqaqTTElaQsz3$giQskB0D2VvOhSSkW3nC4FJF2jmcz5dpVtO4SF8/vIE=',NULL,0,'srfdf','vfcgg',0,1,'2021-11-12 08:30:14.583768','f@yopmail.com','4524252875','fbccfbgfg','user_images/40fe41f3-7f78-439b-adad-c61d1f13c40b/greg-rakozy-oMpAz-DN-9I-unsplash.jpg',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(111,'pbkdf2_sha256$260000$CldHiHyrWvvlOlBNa2eOe3$XFYFsORiu+jlpPxBvziBn8d7L87w+qCfFGe4kbh8B5Y=','2021-11-12 08:41:59.472583',0,'Check','User',0,1,'2021-11-12 08:41:27.255761','Check@yopmail.com','2121212121','Mohali','user_images/40fe41f3-7f78-439b-adad-c61d1f13c40b/images_6.jpeg',NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL),(112,'pbkdf2_sha256$260000$RDXDXoMYZPf8pIIccYyh7V$CvgC1EMVhOe90QzO9C3C++rScqaeeXBicESDxUfoUog=','2021-11-13 05:58:59.519074',0,'max','thakur',0,1,'2021-11-12 09:31:44.186115','max@yopmail.com','5454324654','sfh','user_images/40fe41f3-7f78-439b-adad-c61d1f13c40b/istockphoto-1179420343-612x612.jpg',NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL),(113,'pbkdf2_sha256$260000$xP1O5o3yoAo2WnfqxhMkmX$vkfbteVaEuv0PEi5FrUlsuAk7eZIdPL+tiiMksiVoVc=','2021-11-23 03:20:15.671411',0,'naruto','thakur',0,1,'2021-11-12 09:33:06.488288','naruto@yopmail.com','5465465463','kfhsjkhf','user_images/40fe41f3-7f78-439b-adad-c61d1f13c40b/istockphoto-1179420343-612x612_QKz8El3.jpg',NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL),(114,'pbkdf2_sha256$260000$6u8rzzKOQSPnh2JZkzClfk$8LYwayG4HBYg9GsDkuifXuIEqZPGH0ahA+WH2b+F7XY=','2021-11-23 03:50:33.319520',0,'Ap','Dhillion',0,1,'2021-11-12 09:40:02.054230','staff1@yopmail.com','8000000000','# 8055 majail','user_images/ad18fcad-94e4-486b-83eb-7cffd30eae59/IMG_20211123_120609665.jpg',NULL,NULL,NULL,1,0,950,NULL,434343,28,'1995-10-18'),(119,'pbkdf2_sha256$260000$2VD5walL6gfTUw5MoiaCUS$CioOZBi7BhqCxAwhZMVKlH1Y1VHCZHv2aD1JKeWGQUY=',NULL,0,'','',0,1,'2021-11-15 10:06:02.784820','abc11@yopmail.com','9888000142',NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(120,'pbkdf2_sha256$260000$nc8Z2DKtehJC6Cl4Fw1mvu$SbOFkbofFJAnW8iYTEEYn9XLwoPn6EVjAjio1sICMeg=',NULL,0,'','',0,1,'2021-11-15 10:10:50.468710','anil@yopmail.com','7988426437',NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(121,'pbkdf2_sha256$260000$Hl4c72vOemLcBMj0uqNZnr$u4PWIJgIg19mx0UzYeXm+Vrm3MgFlD5U2iQd2gZzn1Q=','2021-11-15 10:21:51.745906',0,'','',0,1,'2021-11-15 10:18:59.545654','diksha@gmail.com','1111111111',NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(123,'pbkdf2_sha256$260000$n4KEoGAOvrUhabpDBJQPea$gv6hIX5metWkrj1571k5RfwnsLpdJHpJ/3RaxS8Evcg=',NULL,0,'','',0,1,'2021-11-17 03:43:15.767672','xyz@yopmail.com','9999999997',NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(124,'pbkdf2_sha256$260000$fmK0w42NJ38vYwbnJhsd9F$jhpPS+svksB9xHTlSmBNtmUkW8dDIob4RfaVSvpK1Yw=',NULL,0,'','',0,1,'2021-11-17 09:44:32.345167','anil@gmail.com','9898989898',NULL,'',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(125,'pbkdf2_sha256$260000$zmJqwrIi6dDsDmqjMfDs1o$NLbOyOZCbRhjPL/AapDf8lLttfKkrPwa5zKUvc4lBsA=','2021-11-18 08:55:38.971802',0,'nester','software',0,1,'2021-11-18 04:32:39.043392','nmetset@gmail.com','98856456405','Mohali','user_images/f1972cd2-ca9f-4d1a-8d05-23ef4d9e488d/Screenshot_from_2020-11-13_17-34-31.png',NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL);
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
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (27,37,1),(149,110,7),(150,111,7),(151,112,7),(152,113,7),(153,114,2),(158,119,7),(159,120,7),(160,121,7),(163,123,7),(164,124,7),(165,125,2);
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
  `user_id` bigint NOT NULL,
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
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('132c2e4dbe591bb3d7b62934c3b0bb5f1d7ed7df','2021-11-17 09:44:32.555362',124),('26728bafe7df403082d6f494210cc60b3a9bcf8e','2021-11-13 05:58:59.731085',112),('2bf20950c18e292d9b54da602ae674fef09c44f9','2021-11-15 10:21:52.036220',121),('34fab0198c4d987f5a1d6ac85f2d37543138dd40','2021-11-17 03:43:16.293415',123),('79e5b156c8e0bfde1e5e1165a1aaf4ee8cd31663','2021-11-23 04:51:57.190145',37),('7a38fbc0fc3f9f2fe582127790f6d2cf161171b7','2021-11-23 03:20:16.154671',113),('8f0d1cbdca7e86d21a1a07139c0013d2fc67884c','2021-11-18 08:55:39.218824',125),('96c1ef64d7cc96dc76da237a4b56a9403413e3d8','2021-11-12 08:41:59.708118',111),('bf56e48229f4cb6b8f6632b27a8a08847757cba1','2021-11-15 10:06:02.955246',119),('e5e038b5ab219180def2ec1946f81ce1ddb72e2d','2021-11-15 10:10:50.669336',120),('f259dc15ca3c84f5156a8baf48870831191a37b4','2021-11-23 03:50:33.549299',114);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext,
  `resume_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Gurmukh','gurmukh@yopmail.com','9888000142','My Subjects','its yo boi...',''),(2,'sulabh','sulabh@yopmail.com','9876543210','Velle','Hlo MF.',''),(3,'ashima','ashima@yopmail.com','1234567890','jus testing','Hi there.',''),(4,'property','loki@yopmail.com','1597536548','jhbj jkf bn','hi its lol.','');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `gst` double NOT NULL,
  `shape_id` bigint DEFAULT NULL,
  `birefringence` varchar(255) DEFAULT NULL,
  `comment` longtext,
  `image` varchar(100) DEFAULT NULL,
  `magnification` varchar(255) DEFAULT NULL,
  `optic_character` varchar(255) DEFAULT NULL,
  `referactive_index` varchar(255) DEFAULT NULL,
  `specific_gravity` varchar(255) DEFAULT NULL,
  `unique_number_prefix` varchar(255) DEFAULT NULL,
  `stone_cut_id` bigint DEFAULT NULL,
  `stone_quality_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_number_prefix` (`unique_number_prefix`),
  KEY `category_shape_id_b97348b7_fk_shape_id` (`shape_id`),
  KEY `category_stone_cut_id_4577faa9_fk_stone_cut_id` (`stone_cut_id`),
  KEY `category_stone_quality_id_c382b114_fk_stone_quality_id` (`stone_quality_id`),
  CONSTRAINT `category_shape_id_b97348b7_fk_shape_id` FOREIGN KEY (`shape_id`) REFERENCES `shape` (`id`),
  CONSTRAINT `category_stone_cut_id_4577faa9_fk_stone_cut_id` FOREIGN KEY (`stone_cut_id`) REFERENCES `stone_cut` (`id`),
  CONSTRAINT `category_stone_quality_id_c382b114_fk_stone_quality_id` FOREIGN KEY (`stone_quality_id`) REFERENCES `stone_quality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Natural Ruby',5000.00,0.25,1,'2.2','Natural ruby','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-6.png','2.2','3','2','4','1.3',2,3),(5,'Blue Sapphire',1000.00,3,7,'6','Blur sapphire','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-1.png','5','1','3','5','2',1,4),(6,'Natural Emerald',2000.00,5,1,'1.3','Natural emerald','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-7.png','2.2','2.2','3.2','2.1','3.2',2,3),(7,'Hessonite Garnet',3000.00,3,1,'2.33','Hessonite garnet','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-4.png','2.1','3.3','4.5','5.2','5',2,3),(8,'Cat\'s Eye',2500.00,0.25,1,'21','Ctat\'s eye','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-5.png','52','3.2','4.1','2.2','22',2,3),(9,'Natural Coral',2000.00,3,1,'1.1','Natural coral','category_images/c10603e4-9b11-44b8-b495-111815793d70/Wed_Nov_10_2021_101132_GMT0530_Ind_1cPYCf8.jpeg','2.5','4.2','4.2','1.4','2.6',2,4),(10,'Natural Pearl',4000.00,5,2,'2.0','Natural pearl','category_images/e0388f48-07df-48c8-ac27-8d7d8699d5eb/img-3.png','2.3','3.6','4.2','2.6','2.36',1,2),(26,'Yellow Sapphire',622.20,0.25,13,'5.23','hghj','category_images/c791287d-551e-41c9-adf2-570af069ece4/Mon_Nov_15_2021_120027_GMT0530_Ind_S8ZKVRa.jpeg','0.85','0.42','0.95','0.788','0.66',1,2);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_color`
--

DROP TABLE IF EXISTS `category_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_color_category_id_e5fcdb92_fk_category_id` (`category_id`),
  CONSTRAINT `category_color_category_id_e5fcdb92_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_color`
--

LOCK TABLES `category_color` WRITE;
/*!40000 ALTER TABLE `category_color` DISABLE KEYS */;
INSERT INTO `category_color` VALUES (9,'Blue',5),(10,'Green',6),(11,'Barn Red',7),(12,'Dijon',8),(13,'Red',9),(14,'White',10),(15,'Ruby Red',4),(38,'Red',26),(39,'Yellow',26);
/*!40000 ALTER TABLE `category_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification_type`
--

DROP TABLE IF EXISTS `certification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certification_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification_type`
--

LOCK TABLES `certification_type` WRITE;
/*!40000 ALTER TABLE `certification_type` DISABLE KEYS */;
INSERT INTO `certification_type` VALUES (1,'Certification One'),(2,'Certification Two'),(3,'Certification Three'),(4,'Certification   Four'),(5,'Certifiation Five'),(6,'Certifiaction Six');
/*!40000 ALTER TABLE `certification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_district_id_a6eb324a_fk_district_id` (`district_id`),
  KEY `city_state_id_b686921b_fk_state_id` (`state_id`),
  CONSTRAINT `city_district_id_a6eb324a_fk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `city_state_id_b686921b_fk_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (676,'Kupwara',47,15),(677,'Handwara',47,15),(678,'Karnah',47,15),(679,'Khag',39,15),(680,'Beerwah',39,15),(681,'Khansahib',39,15),(682,'Budgam',39,15),(683,'Chadoora',39,15),(684,'Charar- E- Shrief',39,15),(685,'Leh',48,15),(686,'Nubra',48,15),(687,'Khalsi',48,15),(688,'Kargil',43,15),(689,'Sanku',43,15),(690,'Zanskar',43,15),(691,'Haveli',49,15),(692,'Mandi',49,15),(693,'Mendhar',49,15),(694,'Surankote',49,15),(695,'Thanamandi',51,15),(696,'Darhal',51,15),(697,'Rajauri',51,15),(698,'Budhal',51,15),(699,'Kalakote',51,15),(700,'Nowshehra',51,15),(701,'Sunderbani',51,15),(702,'Billawar',44,15),(703,'Bashohli',44,15),(704,'Bani',44,15),(705,'Kathua',44,15),(706,'Hiranagar',44,15),(707,'Sopore',38,15),(708,'Rafiabad',38,15),(709,'Pattan',38,15),(710,'Baramulla',38,15),(711,'Kreeri',38,15),(712,'Uri',38,15),(713,'Boniyar',38,15),(714,'Tangmarg',38,15),(715,'Gurez',37,15),(716,'Bandipora',37,15),(717,'Sonawari',37,15),(718,'Srinagar (North)',56,15),(719,'Srinagar (South)',56,15),(720,'Lar',41,15),(721,'Kangan',41,15),(722,'Ganderbal',41,15),(723,'Pampore',50,15),(724,'Awantipora',50,15),(725,'Tral',50,15),(726,'Pulwama',50,15),(727,'Shopian',55,15),(728,'Pahalgam',36,15),(729,'Bijbehara',36,15),(730,'Anantnag',36,15),(731,'Shangus',36,15),(732,'Kokernag',36,15),(733,'Dooru',36,15),(734,'Kulgam',46,15),(735,'Devsar',46,15),(736,'Damhal Hanjipora',46,15),(737,'Doda',40,15),(738,'Thathri',40,15),(739,'Gandoh',40,15),(740,'Bhaderwah',40,15),(741,'Banihal',52,15),(742,'Ramban',52,15),(743,'Kishtwar',45,15),(744,'Marwah',45,15),(745,'Chhatroo',45,15),(746,'Atholi (Paddar)',45,15),(747,'Udhampur',57,15),(748,'Chenani',57,15),(749,'Ramnagar',57,15),(750,'Majalta',57,15),(751,'Gool-Gulabgarh',53,15),(752,'Reasi',53,15),(753,'Akhnoor',42,15),(754,'Jammu',42,15),(755,'Ranbir Singh Pora',42,15),(756,'Bishnah',42,15),(757,'Samba',54,15),(758,'Pangi',59,14),(759,'Chaurah',59,14),(760,'Saluni',59,14),(761,'Bhalai',59,14),(762,'Dalhousie',59,14),(763,'Bhattiyat',59,14),(764,'Sihunta',59,14),(765,'Chamba',59,14),(766,'Holi',59,14),(767,'Brahmaur',59,14),(768,'Nurpur',61,14),(769,'Indora',61,14),(770,'Fatehpur',61,14),(771,'Jawali',61,14),(772,'Harchakian',61,14),(773,'Shahpur',61,14),(774,'Dharmsala',61,14),(775,'Kangra',61,14),(776,'Nagrota Bagwan',61,14),(777,'Baroh',61,14),(778,'Dera Gopipur',61,14),(779,'Jawalamukhi',61,14),(780,'Jaswan',61,14),(781,'Rakkar',61,14),(782,'Khundian',61,14),(783,'Thural',61,14),(784,'Dhira',61,14),(785,'Jaisinghpur',61,14),(786,'Palampur',61,14),(787,'Baijnath',61,14),(788,'Multhan',61,14),(789,'Udaipur',64,14),(790,'Lahul',64,14),(791,'Spiti',64,14),(792,'Manali',63,14),(793,'Kullu',63,14),(794,'Sainj',63,14),(795,'Banjar',63,14),(796,'Ani',63,14),(797,'Nermand',63,14),(798,'Padhar',65,14),(799,'Jogindarnagar',65,14),(800,'Lad Bharol',65,14),(801,'Sandhol',65,14),(802,'Dharmpur',65,14),(803,'Kotli',65,14),(804,'Sarkaghat',65,14),(805,'Bhadrota',65,14),(806,'Baldwara',65,14),(807,'Sundarnagar',65,14),(808,'Mandi',65,14),(809,'Aut',65,14),(810,'Bali Chowki',65,14),(811,'Thunag',65,14),(812,'Chachyot',65,14),(813,'Nihri',65,14),(814,'Karsog',65,14),(815,'Tira Sujanpur',60,14),(816,'Nadaun',60,14),(817,'Galore',60,14),(818,'Hamirpur',60,14),(819,'Barsar',60,14),(820,'Dhatwal',60,14),(821,'Bhoranj',60,14),(822,'Bharwain',69,14),(823,'Amb',69,14),(824,'Bangana',69,14),(825,'Una',69,14),(826,'Haroli',69,14),(827,'Ghumarwin',58,14),(828,'Bharari',58,14),(829,'Jhanduta',58,14),(830,'Naina Devi',58,14),(831,'Bilaspur Sadar',58,14),(832,'Namhol',58,14),(833,'Arki',68,14),(834,'Darlaghat',68,14),(835,'Ramshahr',68,14),(836,'Nalagarh',68,14),(837,'Baddi',68,14),(838,'Krishangarh',68,14),(839,'Kasauli',68,14),(840,'Solan',68,14),(841,'Kandaghat',68,14),(842,'Rajgarh',67,14),(843,'Nohra',67,14),(844,'Pachhad',67,14),(845,'Renuka',67,14),(846,'Dadahu',67,14),(847,'Nahan',67,14),(848,'Paonta Sahib',67,14),(849,'Kamrau',67,14),(850,'Shalai',67,14),(851,'Ronhat',67,14),(852,'Rampur',66,14),(853,'Nankhari',66,14),(854,'Kumharsain',66,14),(855,'Seoni',66,14),(856,'Shimla (Rural)',66,14),(857,'Shimla (Urban)',66,14),(858,'Junga',66,14),(859,'Theog',66,14),(860,'Chaupal',66,14),(861,'Cheta',66,14),(862,'Nerua',66,14),(863,'Jubbal',66,14),(864,'Kotkhai',66,14),(865,'Tikar',66,14),(866,'Rohru',66,14),(867,'Chirgaon',66,14),(868,'Dodra Kwar',66,14),(869,'Hangrang',62,14),(870,'Poo',62,14),(871,'Morang',62,14),(872,'Kalpa',62,14),(873,'Nichar',62,14),(874,'Sangla',62,14),(875,'Dhar Kalan',76,28),(876,'Pathankot',76,28),(877,'Gurdaspur',76,28),(878,'Batala',76,28),(879,'Dera Baba Nanak',76,28),(880,'Bhulath',79,28),(881,'Kapurthala',79,28),(882,'Sultanpur Lodhi',79,28),(883,'Phagwara',79,28),(884,'Shahkot',78,28),(885,'Nakodar',78,28),(886,'Phillaur',78,28),(887,'Jalandhar - I',78,28),(888,'Jalandhar - Ii',78,28),(889,'Dasua',77,28),(890,'Mukerian',77,28),(891,'Hoshiarpur',77,28),(892,'Garhshankar',77,28),(893,'Nawanshahr',88,28),(894,'Balachaur',88,28),(895,'Bassi Pathana',74,28),(896,'Fatehgarh Sahib',74,28),(897,'Amloh',74,28),(898,'Khamanon',74,28),(899,'Samrala',80,28),(900,'Khanna',80,28),(901,'Payal',80,28),(902,'Ludhiana (East)',80,28),(903,'Ludhiana (West)',80,28),(904,'Raikot',80,28),(905,'Jagraon',80,28),(906,'Nihal Singhwala',82,28),(907,'Bagha Purana',82,28),(908,'Moga',82,28),(909,'Zira',75,28),(910,'Firozpur',75,28),(911,'Jalalabad',75,28),(912,'Fazilka',75,28),(913,'Abohar',75,28),(914,'Malout',83,28),(915,'Gidderbaha',83,28),(916,'Muktsar',83,28),(917,'Faridkot',73,28),(918,'Jaitu',73,28),(919,'Rampura Phul',72,28),(920,'Bathinda',72,28),(921,'Talwandi Sabo',72,28),(922,'Sardulgarh',81,28),(923,'Budhlada',81,28),(924,'Mansa',81,28),(925,'Samana',84,28),(926,'Patran',84,28),(927,'Nabha',84,28),(928,'Patiala',84,28),(929,'Rajpura',84,28),(930,'Ajnala',70,28),(931,'Amritsar -I',70,28),(932,'Amritsar- Ii',70,28),(933,'Baba Bakala',70,28),(934,'Tarn Taran',89,28),(935,'Patti',89,28),(936,'Khadur Sahib',89,28),(937,'Anandpur Sahib',85,28),(938,'Nangal',85,28),(939,'Rupnagar',85,28),(940,'Chamkaur Sahib',85,28),(941,'Kharar',86,28),(942,'Sas Nagar (Mohali)',86,28),(943,'Dera Bassi',86,28),(944,'Malerkotla',87,28),(945,'Dhuri',87,28),(946,'Sangrur',87,28),(947,'Sunam',87,28),(948,'Lehra',87,28),(949,'Moonak',87,28),(950,'Barnala',71,28),(951,'Tapa',71,28),(952,'Chandigarh',90,6),(953,'Puraula',103,34),(954,'Mori',103,34),(955,'Rajgarhi',103,34),(956,'Dunda',103,34),(957,'Chiniyalisaur',103,34),(958,'Bhatwari',103,34),(959,'Joshimath',93,34),(960,'Chamoli',93,34),(961,'Pokhari',93,34),(962,'Karnaprayag',93,34),(963,'Tharali',93,34),(964,'Gairsain',93,34),(965,'Ukhimath',100,34),(966,'Rudraprayag',100,34),(967,'Jakholi*',100,34),(968,'Ghansali',101,34),(969,'Devprayag',101,34),(970,'Pratapnagar',101,34),(971,'Jakhnidhar',101,34),(972,'Tehri',101,34),(973,'Dhanaulti',101,34),(974,'Narendranagar',101,34),(975,'Chakrata',95,34),(976,'Tyuni',95,34),(977,'Kalsi',95,34),(978,'Vikasnagar',95,34),(979,'Dehradun',95,34),(980,'Rishikesh',95,34),(981,'Srinagar',98,34),(982,'Pauri',98,34),(983,'Thalisain',98,34),(984,'Dhoomakot',98,34),(985,'Lansdowne',98,34),(986,'Satpuli',98,34),(987,'Chaubattakhal',98,34),(988,'Kotdwara',98,34),(989,'Yamkeshwar',98,34),(990,'Munsiari',99,34),(991,'Dharchula',99,34),(992,'Didihat',99,34),(993,'Berinag',99,34),(994,'Gangolihat',99,34),(995,'Pithoragarh',99,34),(996,'Kapkot',92,34),(997,'Kanda',92,34),(998,'Bageshwar',92,34),(999,'Garud',92,34),(1000,'Bhikiyasain',91,34),(1001,'Chaukhutiya',91,34),(1002,'Sult',91,34),(1003,'Ranikhet',91,34),(1004,'Dwarahat',91,34),(1005,'Almora',91,34),(1006,'Someshwar',91,34),(1007,'Jainti',91,34),(1008,'Bhanoli',91,34),(1009,'Champawat',94,34),(1010,'Pati',94,34),(1011,'Lohaghat',94,34),(1012,'Poornagiri',94,34),(1013,'Kosya Kutauli',97,34),(1014,'Betalghat',97,34),(1015,'Nainital',97,34),(1016,'Dhari',97,34),(1017,'Haldwani',97,34),(1018,'Ramnagar',97,34),(1019,'Kaladhungi',97,34),(1020,'Lalkuan',97,34),(1021,'Kashipur',102,34),(1022,'Jaspur',102,34),(1023,'Bajpur',102,34),(1024,'Kichha',102,34),(1025,'Gadarpur',102,34),(1026,'Sitarganj',102,34),(1027,'Khatima',102,34),(1028,'Roorkee',96,34),(1029,'Hardwar',96,34),(1030,'Laksar',96,34),(1031,'Kalka',118,13),(1032,'Panchkula',118,13),(1033,'Naraingarh',104,13),(1034,'Ambala',104,13),(1035,'Barara',104,13),(1036,'Jagadhri',124,13),(1037,'Bilaspur',124,13),(1038,'Chhachhrauli',124,13),(1039,'Shahbad',114,13),(1040,'Pehowa',114,13),(1041,'Thanesar',114,13),(1042,'Guhla',112,13),(1043,'Kaithal',112,13),(1044,'Fatehpur Pundri',112,13),(1045,'Nilokheri',113,13),(1046,'Indri',113,13),(1047,'Karnal',113,13),(1048,'Assandh',113,13),(1049,'Gharaunda',113,13),(1050,'Panipat',119,13),(1051,'Israna',119,13),(1052,'Samalkha',119,13),(1053,'Gohana',123,13),(1054,'Ganaur',123,13),(1055,'Sonipat',123,13),(1056,'Kharkhoda',123,13),(1057,'Narwana',111,13),(1058,'Jind',111,13),(1059,'Julana',111,13),(1060,'Safidon',111,13),(1061,'Ratia',107,13),(1062,'Tohana',107,13),(1063,'Fatehabad',107,13),(1064,'Dabwali',122,13),(1065,'Sirsa',122,13),(1066,'Rania',122,13),(1067,'Ellenabad',122,13),(1068,'Adampur',109,13),(1069,'Hisar',109,13),(1070,'Narnaund',109,13),(1071,'Hansi',109,13),(1072,'Bawani Khera',105,13),(1073,'Bhiwani',105,13),(1074,'Tosham',105,13),(1075,'Siwani',105,13),(1076,'Loharu',105,13),(1077,'Dadri',105,13),(1078,'Badhra',105,13),(1079,'Maham',121,13),(1080,'Rohtak',121,13),(1081,'Sampla',121,13),(1082,'Beri',110,13),(1083,'Bahadurgarh',110,13),(1084,'Jhajjar',110,13),(1085,'Matenhail',110,13),(1086,'Mahendragarh',115,13),(1087,'Narnaul',115,13),(1088,'Kosli',120,13),(1089,'Rewari',120,13),(1090,'Bawal',120,13),(1091,'Pataudi',108,13),(1092,'Gurgaon',108,13),(1093,'Farrukhnagar',108,13),(1094,'Manesar',108,13),(1095,'Sohna',108,13),(1096,'Taoru',116,13),(1097,'Nuh',116,13),(1098,'Ferozepur Jhirka',116,13),(1099,'Punahana',116,13),(1100,'Faridabad',106,13),(1101,'Ballabgarh',106,13),(1102,'Palwal',117,13),(1103,'Hathin',117,13),(1104,'Hodal',117,13),(1105,'Narela',130,10),(1106,'Saraswati Vihar',130,10),(1107,'Delhi Cantonment',132,10),(1108,'Civil Lines',128,10),(1109,'Sadar Bazar',128,10),(1110,'Gandhi Nagar',126,10),(1111,'Kotwali',128,10),(1112,'Shahdara',129,10),(1113,'Model Town',130,10),(1114,'Parliament Street',127,10),(1115,'Vivek Vihar',126,10),(1116,'Preet Vihar',126,10),(1117,'Connaught Place',127,10),(1118,'Chanakya Puri',127,10),(1119,'Rajouri Garden',133,10),(1120,'Darya Ganj',125,10),(1121,'Pahar Ganj',125,10),(1122,'Karol Bagh',125,10),(1123,'Patel Nagar',133,10),(1124,'Seelam Pur',129,10),(1125,'Punjabi Bagh',133,10),(1126,'Najafgarh',132,10),(1127,'Seema Puri',129,10),(1128,'Vasant Vihar',132,10),(1129,'Hauz Khas',131,10),(1130,'Defence Colony',131,10),(1131,'Kalkaji',131,10),(1132,'Karanpur',148,29),(1133,'Ganganagar',148,29),(1134,'Sadulshahar',148,29),(1135,'Padampur',148,29),(1136,'Raisinghnagar',148,29),(1137,'Anupgarh',148,29),(1138,'Gharsana',148,29),(1139,'Vijainagar',148,29),(1140,'Suratgarh',148,29),(1141,'Sangaria',149,29),(1142,'Tibi',149,29),(1143,'Hanumangarh',149,29),(1144,'Pilibanga',149,29),(1145,'Rawatsar',149,29),(1146,'Nohar',149,29),(1147,'Bhadra',149,29),(1148,'Bikaner',141,29),(1149,'Poogal',141,29),(1150,'Lunkaransar',141,29),(1151,'Kolayat',141,29),(1152,'Nokha',141,29),(1153,'Khajuwala',141,29),(1154,'Chhatargarh',141,29),(1155,'Sridungargarh',141,29),(1156,'Taranagar',144,29),(1157,'Rajgarh',144,29),(1158,'Sardarshahar',144,29),(1159,'Churu',144,29),(1160,'Ratangarh',144,29),(1161,'Sujangarh',144,29),(1162,'Jhunjhunun',154,29),(1163,'Chirawa',154,29),(1164,'Buhana',154,29),(1165,'Khetri',154,29),(1166,'Nawalgarh',154,29),(1167,'Udaipurwati',154,29),(1168,'Behror',135,29),(1169,'Mandawar',135,29),(1170,'Kotkasim',135,29),(1171,'Tijara',135,29),(1172,'Kishangarh Bas',135,29),(1173,'Ramgarh',135,29),(1174,'Alwar',135,29),(1175,'Bansur',135,29),(1176,'Thanagazi',135,29),(1177,'Rajgarh',135,29),(1178,'Lachhmangarh',135,29),(1179,'Kathumar',135,29),(1180,'Pahari',139,29),(1181,'Kaman',139,29),(1182,'Nagar',139,29),(1183,'Deeg',139,29),(1184,'Nadbai',139,29),(1185,'Kumher',139,29),(1186,'Bharatpur',139,29),(1187,'Weir',139,29),(1188,'Bayana',139,29),(1189,'Rupbas',139,29),(1190,'Baseri',146,29),(1191,'Bari',146,29),(1192,'Sepau',146,29),(1193,'Dhaulpur',146,29),(1194,'Rajakhera',146,29),(1195,'Todabhim',156,29),(1196,'Nadoti',156,29),(1197,'Hindaun',156,29),(1198,'Karauli',156,29),(1199,'Mandrail',156,29),(1200,'Sapotra',156,29),(1201,'Gangapur',162,29),(1202,'Bamanwas',162,29),(1203,'Malarna Doongar',162,29),(1204,'Bonli',162,29),(1205,'Chauth Ka Barwara',162,29),(1206,'Sawai Madhopur',162,29),(1207,'Khandar',162,29),(1208,'Baswa',145,29),(1209,'Mahwa',145,29),(1210,'Sikrai',145,29),(1211,'Dausa',145,29),(1212,'Lalsot',145,29),(1213,'Kotputli',150,29),(1214,'Viratnagar',150,29),(1215,'Shahpura',150,29),(1216,'Chomu',150,29),(1217,'Phulera (Sambhar)',150,29),(1218,'Mauzamabad',150,29),(1219,'Phagi',150,29),(1220,'Sanganer',150,29),(1221,'Jaipur',150,29),(1222,'Amber',150,29),(1223,'Jamwa Ramgarh',150,29),(1224,'Bassi',150,29),(1225,'Chaksu',150,29),(1226,'Fatehpur',163,29),(1227,'Lachhmangarh',163,29),(1228,'Sikar',163,29),(1229,'Danta Ramgarh',163,29),(1230,'Sri Madhopur',163,29),(1231,'Neem-Ka-Thana',163,29),(1232,'Ladnu',158,29),(1233,'Didwana',158,29),(1234,'Jayal',158,29),(1235,'Nagaur',158,29),(1236,'Kheenvsar',158,29),(1237,'Merta',158,29),(1238,'Degana',158,29),(1239,'Parbatsar',158,29),(1240,'Makrana',158,29),(1241,'Nawa',158,29),(1242,'Phalodi',155,29),(1243,'Osian',155,29),(1244,'Bhopalgarh',155,29),(1245,'Jodhpur',155,29),(1246,'Shergarh',155,29),(1247,'Luni',155,29),(1248,'Bilara',155,29),(1249,'Jaisalmer',151,29),(1250,'Pokaran',151,29),(1251,'Fatehgarh',151,29),(1252,'Sheo',138,29),(1253,'Baytoo',138,29),(1254,'Pachpadra',138,29),(1255,'Siwana',138,29),(1256,'Gudha Malani',138,29),(1257,'Barmer',138,29),(1258,'Ramsar',138,29),(1259,'Chohtan',138,29),(1260,'Sayla',152,29),(1261,'Ahore',152,29),(1262,'Jalor',152,29),(1263,'Bhinmal',152,29),(1264,'Bagora',152,29),(1265,'Sanchore',152,29),(1266,'Raniwara',152,29),(1267,'Sheoganj',164,29),(1268,'Sirohi',164,29),(1269,'Pindwara',164,29),(1270,'Abu Road',164,29),(1271,'Reodar',164,29),(1272,'Jaitaran',159,29),(1273,'Raipur',159,29),(1274,'Sojat',159,29),(1275,'Rohat',159,29),(1276,'Pali',159,29),(1277,'Marwar Junction',159,29),(1278,'Desuri',159,29),(1279,'Sumerpur',159,29),(1280,'Bali',159,29),(1281,'Kishangarh',134,29),(1282,'Ajmer',134,29),(1283,'Peesangan',134,29),(1284,'Beawar',134,29),(1285,'Masuda',134,29),(1286,'Nasirabad',134,29),(1287,'Bhinay',134,29),(1288,'Sarwar',134,29),(1289,'Kekri',134,29),(1290,'Malpura',165,29),(1291,'Peeplu',165,29),(1292,'Niwai',165,29),(1293,'Tonk',165,29),(1294,'Todaraisingh',165,29),(1295,'Deoli',165,29),(1296,'Uniara',165,29),(1297,'Hindoli',142,29),(1298,'Nainwa',142,29),(1299,'Indragarh',142,29),(1300,'Keshoraipatan',142,29),(1301,'Bundi',142,29),(1302,'Asind',140,29),(1303,'Hurda',140,29),(1304,'Shahpura',140,29),(1305,'Banera',140,29),(1306,'Mandal',140,29),(1307,'Raipur',140,29),(1308,'Sahara',140,29),(1309,'Bhilwara',140,29),(1310,'Kotri',140,29),(1311,'Jahazpur',140,29),(1312,'Mandalgarh',140,29),(1313,'Beejoliya',140,29),(1314,'Bhim',161,29),(1315,'Deogarh',161,29),(1316,'Amet',161,29),(1317,'Kumbhalgarh',161,29),(1318,'Rajsamand',161,29),(1319,'Railmagra',161,29),(1320,'Nathdwara',161,29),(1321,'Dungarpur',147,29),(1322,'Aspur',147,29),(1323,'Sagwara',147,29),(1324,'Simalwara',147,29),(1325,'Ghatol',136,29),(1326,'Garhi',136,29),(1327,'Banswara',136,29),(1328,'Bagidora',136,29),(1329,'Kushalgarh',136,29),(1330,'Rashmi',143,29),(1331,'Gangrar',143,29),(1332,'Begun',143,29),(1333,'Rawatbhata',143,29),(1334,'Chittaurgarh',143,29),(1335,'Kapasan',143,29),(1336,'Dungla',143,29),(1337,'Bhadesar',143,29),(1338,'Nimbahera',143,29),(1339,'Bari Sadri',143,29),(1340,'Pipalda',157,29),(1341,'Digod',157,29),(1342,'Ladpura',157,29),(1343,'Ramganj Mandi',157,29),(1344,'Sangod',157,29),(1345,'Mangrol',137,29),(1346,'Antah',137,29),(1347,'Baran',137,29),(1348,'Atru',137,29),(1349,'Kishanganj',137,29),(1350,'Shahbad',137,29),(1351,'Chhabra',137,29),(1352,'Chhipabarod',137,29),(1353,'Khanpur',153,29),(1354,'Jhalrapatan',153,29),(1355,'Aklera',153,29),(1356,'Manohar Thana',153,29),(1357,'Pachpahar',153,29),(1358,'Pirawa',153,29),(1359,'Gangdhar',153,29),(1360,'Mavli',166,29),(1361,'Gogunda',166,29),(1362,'Kotra',166,29),(1363,'Jhadol',166,29),(1364,'Girwa',166,29),(1365,'Vallabhnagar',166,29),(1366,'Lasadiya',166,29),(1367,'Salumbar',166,29),(1368,'Sarada',166,29),(1369,'Rishabhdeo',166,29),(1370,'Kherwara',166,29),(1371,'Dhariawad',160,29),(1372,'Peepalkhoont',160,29),(1373,'Chhoti Sadri',160,29),(1374,'Pratapgarh',160,29),(1375,'Arnod',160,29),(1376,'Behat',227,33),(1377,'Saharanpur',227,33),(1378,'Nakur',227,33),(1379,'Deoband',227,33),(1380,'Rampur Maniharan',227,33),(1381,'Kairana',222,33),(1382,'Shamli',222,33),(1383,'Muzaffarnagar',222,33),(1384,'Budhana',222,33),(1385,'Khatauli',222,33),(1386,'Jansath',222,33),(1387,'Najibabad',181,33),(1388,'Bijnor',181,33),(1389,'Nagina',181,33),(1390,'Dhampur',181,33),(1391,'Chandpur',181,33),(1392,'Thakurdwara',221,33),(1393,'Kanth',221,33),(1394,'Moradabad',221,33),(1395,'Bilari',221,33),(1396,'Sambhal',221,33),(1397,'Chandausi',221,33),(1398,'Suar',226,33),(1399,'Tanda',226,33),(1400,'Bilaspur',226,33),(1401,'Rampur',226,33),(1402,'Shahabad',226,33),(1403,'Milak',226,33),(1404,'Dhanaura',204,33),(1405,'Amroha',204,33),(1406,'Hasanpur',204,33),(1407,'Sardhana',219,33),(1408,'Mawana',219,33),(1409,'Meerut',219,33),(1410,'Baraut',173,33),(1411,'Baghpat',173,33),(1412,'Khekada',173,33),(1413,'Modinagar',194,33),(1414,'Ghaziabad',194,33),(1415,'Hapur',194,33),(1416,'Garhmukteshwar',194,33),(1417,'Dadri',193,33),(1418,'Gautam Buddha Nagar',193,33),(1419,'Jewar',193,33),(1420,'Sikandrabad',183,33),(1421,'Bulandshahr',183,33),(1422,'Siana',183,33),(1423,'Anupshahr',183,33),(1424,'Debai',183,33),(1425,'Shikarpur',183,33),(1426,'Khurja',183,33),(1427,'Khair',168,33),(1428,'Gabhana',168,33),(1429,'Atrauli',168,33),(1430,'Koil',168,33),(1431,'Iglas',168,33),(1432,'Sasni',200,33),(1433,'Sikandra Rao',200,33),(1434,'Hathras',200,33),(1435,'Sadabad',200,33),(1436,'Chhata',217,33),(1437,'Mat',217,33),(1438,'Mahavan',217,33),(1439,'Mathura',217,33),(1440,'Etmadpur',167,33),(1441,'Agra',167,33),(1442,'Kiraoli',167,33),(1443,'Kheragarh',167,33),(1444,'Fatehabad',167,33),(1445,'Bah',167,33),(1446,'Tundla',192,33),(1447,'Firozabad',192,33),(1448,'Jasrana',192,33),(1449,'Shikohabad',192,33),(1450,'Mainpuri',216,33),(1451,'Karhal',216,33),(1452,'Bhogaon',216,33),(1453,'Gunnaur',182,33),(1454,'Bisauli',182,33),(1455,'Bilsi',182,33),(1456,'Sahaswan',182,33),(1457,'Budaun',182,33),(1458,'Dataganj',182,33),(1459,'Baheri',179,33),(1460,'Meerganj',179,33),(1461,'Aonla',179,33),(1462,'Bareilly',179,33),(1463,'Nawabganj',179,33),(1464,'Faridpur',179,33),(1465,'Pilibhit',223,33),(1466,'Bisalpur',223,33),(1467,'Puranpur',223,33),(1468,'Powayan',230,33),(1469,'Tilhar',230,33),(1470,'Shahjahanpur',230,33),(1471,'Jalalabad',230,33),(1472,'Nighasan',210,33),(1473,'Palia',210,33),(1474,'Gola Gokaran Nath',210,33),(1475,'Mohammdi',210,33),(1476,'Lakhimpur',210,33),(1477,'Dhaurahara',210,33),(1478,'Misrikh',233,33),(1479,'Sitapur',233,33),(1480,'Laharpur',233,33),(1481,'Biswan',233,33),(1482,'Mahmudabad',233,33),(1483,'Sidhauli',233,33),(1484,'Shahabad',199,33),(1485,'Sawayajpur',199,33),(1486,'Hardoi',199,33),(1487,'Bilgram',199,33),(1488,'Sandila',199,33),(1489,'Safipur',236,33),(1490,'Hasanganj',236,33),(1491,'Unnao',236,33),(1492,'Purwa',236,33),(1493,'Bighapur',236,33),(1494,'Malihabad',213,33),(1495,'Bakshi Ka Talab',213,33),(1496,'Lucknow',213,33),(1497,'Mohanlalganj',213,33),(1498,'Maharajganj',225,33),(1499,'Tiloi',225,33),(1500,'Rae Bareli',225,33),(1501,'Lalganj',225,33),(1502,'Dalmau',225,33),(1503,'Unchahar',225,33),(1504,'Salon',225,33),(1505,'Kaimganj',190,33),(1506,'Amritpur',190,33),(1507,'Farrukhabad',190,33),(1508,'Chhibramau',205,33),(1509,'Kannauj',205,33),(1510,'Tirwa',205,33),(1511,'Jaswantnagar',188,33),(1512,'Saifai',188,33),(1513,'Etawah',188,33),(1514,'Bharthana',188,33),(1515,'Chakarnagar',188,33),(1516,'Bidhuna',171,33),(1517,'Auraiya',171,33),(1518,'Rasulabad',206,33),(1519,'Derapur',206,33),(1520,'Akbarpur',206,33),(1521,'Bhognipur',206,33),(1522,'Sikandra',206,33),(1523,'Bilhaur',207,33),(1524,'Kanpur',207,33),(1525,'Ghatampur',207,33),(1526,'Madhogarh',201,33),(1527,'Jalaun',201,33),(1528,'Kalpi',201,33),(1529,'Orai',201,33),(1530,'Konch',201,33),(1531,'Moth',203,33),(1532,'Garautha',203,33),(1533,'Tahrauli',203,33),(1534,'Mauranipur',203,33),(1535,'Jhansi',203,33),(1536,'Talbehat',212,33),(1537,'Lalitpur',212,33),(1538,'Mahroni',212,33),(1539,'Hamirpur',198,33),(1540,'Rath',198,33),(1541,'Sarila',198,33),(1542,'Maudaha',198,33),(1543,'Kulpahar',215,33),(1544,'Charkhari',215,33),(1545,'Mahoba',215,33),(1546,'Banda',177,33),(1547,'Baberu',177,33),(1548,'Atarra',177,33),(1549,'Naraini',177,33),(1550,'Karwi',185,33),(1551,'Mau',185,33),(1552,'Bindki',191,33),(1553,'Fatehpur',191,33),(1554,'Khaga',191,33),(1555,'Lalganj',224,33),(1556,'Kunda',224,33),(1557,'Pratapgarh',224,33),(1558,'Patti',224,33),(1559,'Raniganj',224,33),(1560,'Sirathu',209,33),(1561,'Manjhanpur',209,33),(1562,'Chail',209,33),(1563,'Soraon',169,33),(1564,'Phulpur',169,33),(1565,'Allahabad',169,33),(1566,'Bara',169,33),(1567,'Karchhana',169,33),(1568,'Handia',169,33),(1569,'Meja',169,33),(1570,'Koraon',169,33),(1571,'Fatehpur',178,33),(1572,'Ramnagar',178,33),(1573,'Nawabganj',178,33),(1574,'Sirauli Gauspur',178,33),(1575,'Ramsanehighat',178,33),(1576,'Haidergarh',178,33),(1577,'Rudauli',189,33),(1578,'Milkipur',189,33),(1579,'Sohawal',189,33),(1580,'Faizabad',189,33),(1581,'Bikapur',189,33),(1582,'Tanda',170,33),(1583,'Allapur',170,33),(1584,'Jalalpur',170,33),(1585,'Akbarpur',170,33),(1586,'Bhiti',170,33),(1587,'Musafirkhana',235,33),(1588,'Gauriganj',235,33),(1589,'Amethi',235,33),(1590,'Sultanpur',235,33),(1591,'Jaisinghpur',235,33),(1592,'Lambhua',235,33),(1593,'Kadipur',235,33),(1594,'Nanpara',174,33),(1595,'Mahasi',174,33),(1596,'Bahraich',174,33),(1597,'Kaiserganj',174,33),(1598,'Bhinga',231,33),(1599,'Ikauna',231,33),(1600,'Balrampur',176,33),(1601,'Tulsipur',176,33),(1602,'Utraula',176,33),(1603,'Gonda',196,33),(1604,'Colonelganj',196,33),(1605,'Tarabganj',196,33),(1606,'Mankapur',196,33),(1607,'Shohratgarh',232,33),(1608,'Naugarh',232,33),(1609,'Bansi',232,33),(1610,'Itwa',232,33),(1611,'Domariyaganj',232,33),(1612,'Bhanpur',180,33),(1613,'Harraiya',180,33),(1614,'Basti',180,33),(1615,'Rudhauli',180,33),(1616,'Mehdawal',228,33),(1617,'Khalilabad',228,33),(1618,'Ghanghata',228,33),(1619,'Nautanwa',214,33),(1620,'Nichlaul',214,33),(1621,'Pharenda',214,33),(1622,'Maharajganj',214,33),(1623,'Campierganj',197,33),(1624,'Sahjanwa',197,33),(1625,'Gorakhpur',197,33),(1626,'Chauri Chaura',197,33),(1627,'Bansgaon',197,33),(1628,'Khajni',197,33),(1629,'Gola',197,33),(1630,'Padrauna',211,33),(1631,'Hata',211,33),(1632,'Kasya',211,33),(1633,'Tamkuhi Raj',211,33),(1634,'Deoria',186,33),(1635,'Rudrapur',186,33),(1636,'Barhaj',186,33),(1637,'Salempur',186,33),(1638,'Bhatpar Rani',186,33),(1639,'Burhanpur',172,33),(1640,'Sagri',172,33),(1641,'Azamgarh',172,33),(1642,'Nizamabad',172,33),(1643,'Phulpur',172,33),(1644,'Lalganj',172,33),(1645,'Mehnagar',172,33),(1646,'Ghosi',218,33),(1647,'Madhuban',218,33),(1648,'Maunath Bhanjan',218,33),(1649,'Muhammadabad Gohna',218,33),(1650,'Belthara Road',175,33),(1651,'Sikanderpur',175,33),(1652,'Rasra',175,33),(1653,'Ballia',175,33),(1654,'Bansdih',175,33),(1655,'Bairia',175,33),(1656,'Shahganj',202,33),(1657,'Badlapur',202,33),(1658,'Machhlishahr',202,33),(1659,'Jaunpur',202,33),(1660,'Mariahu',202,33),(1661,'Kerakat',202,33),(1662,'Jakhania',195,33),(1663,'Saidpur',195,33),(1664,'Ghazipur',195,33),(1665,'Mohammadabad',195,33),(1666,'Zamania',195,33),(1667,'Sakaldiha',184,33),(1668,'Chandauli',184,33),(1669,'Chakia',184,33),(1670,'Pindra',237,33),(1671,'Varanasi',237,33),(1672,'Bhadohi',229,33),(1673,'Gyanpur',229,33),(1674,'Aurai',229,33),(1675,'Mirzapur',220,33),(1676,'Lalganj',220,33),(1677,'Marihan',220,33),(1678,'Chunar',220,33),(1679,'Ghorawal',234,33),(1680,'Robertsganj',234,33),(1681,'Dudhi',234,33),(1682,'Aliganj',187,33),(1683,'Etah',187,33),(1684,'Jalesar',187,33),(1685,'Kasganj',208,33),(1686,'Sahawar',208,33),(1687,'Patiyali',208,33),(1688,'Sidhaw',275,5),(1689,'Ramnagar',275,5),(1690,'Gaunaha',275,5),(1691,'Mainatanr',275,5),(1692,'Narkatiaganj',275,5),(1693,'Lauriya',275,5),(1694,'Bagaha',275,5),(1695,'Piprasi',275,5),(1696,'Madhubani',275,5),(1697,'Bhitaha',275,5),(1698,'Thakrahan',275,5),(1699,'Jogapatti',275,5),(1700,'Chanpatia',275,5),(1701,'Sikta',275,5),(1702,'Majhaulia',275,5),(1703,'Bettiah',275,5),(1704,'Bairia',275,5),(1705,'Nautan',275,5),(1706,'Raxaul',247,5),(1707,'Adapur',247,5),(1708,'Ramgarhwa',247,5),(1709,'Sugauli',247,5),(1710,'Banjaria',247,5),(1711,'Narkatia',247,5),(1712,'Bankatwa',247,5),(1713,'Ghorasahan',247,5),(1714,'Dhaka',247,5),(1715,'Chiraia',247,5),(1716,'Motihari',247,5),(1717,'Turkaulia',247,5),(1718,'Harsidhi',247,5),(1719,'Paharpur',247,5),(1720,'Areraj',247,5),(1721,'Sangrampur',247,5),(1722,'Kesaria',247,5),(1723,'Kalyanpur',247,5),(1724,'Kotwa',247,5),(1725,'Piprakothi',247,5),(1726,'Chakia (Pipra)',247,5),(1727,'Pakri Dayal',247,5),(1728,'Patahi',247,5),(1729,'Phenhara',247,5),(1730,'Madhuban',247,5),(1731,'Tetaria',247,5),(1732,'Mehsi',247,5),(1733,'Purnahiya',270,5),(1734,'Piprarhi',270,5),(1735,'Sheohar',270,5),(1736,'Dumri Katsari',270,5),(1737,'Tariani Chowk',270,5),(1738,'Bairgania',271,5),(1739,'Suppi',271,5),(1740,'Majorganj',271,5),(1741,'Sonbarsa',271,5),(1742,'Parihar',271,5),(1743,'Sursand',271,5),(1744,'Bathnaha',271,5),(1745,'Riga',271,5),(1746,'Parsauni',271,5),(1747,'Belsand',271,5),(1748,'Runisaidpur',271,5),(1749,'Dumra',271,5),(1750,'Bajpatti',271,5),(1751,'Charaut',271,5),(1752,'Pupri',271,5),(1753,'Nanpur',271,5),(1754,'Bokhara',271,5),(1755,'Madhwapur',258,5),(1756,'Harlakhi',258,5),(1757,'Basopatti',258,5),(1758,'Jainagar',258,5),(1759,'Ladania',258,5),(1760,'Laukaha',258,5),(1761,'Laukahi',258,5),(1762,'Phulparas',258,5),(1763,'Babubarhi',258,5),(1764,'Khajauli',258,5),(1765,'Kaluahi',258,5),(1766,'Benipatti',258,5),(1767,'Bisfi',258,5),(1768,'Madhubani',258,5),(1769,'Pandaul',258,5),(1770,'Rajnagar',258,5),(1771,'Andhratharhi',258,5),(1772,'Jhanjharpur',258,5),(1773,'Ghoghardiha',258,5),(1774,'Lakhnaur',258,5),(1775,'Madhepur',258,5),(1776,'Nirmali',273,5),(1777,'Basantpur',273,5),(1778,'Chhatapur',273,5),(1779,'Pratapganj',273,5),(1780,'Raghopur',273,5),(1781,'Saraigarh Bhaptiyahi',273,5),(1782,'Kishanpur',273,5),(1783,'Marauna',273,5),(1784,'Supaul',273,5),(1785,'Pipra',273,5),(1786,'Tribeniganj',273,5),(1787,'Narpatganj',238,5),(1788,'Forbesganj',238,5),(1789,'Bhargama',238,5),(1790,'Raniganj',238,5),(1791,'Araria',238,5),(1792,'Kursakatta',238,5),(1793,'Sikti',238,5),(1794,'Palasi',238,5),(1795,'Jokihat',238,5),(1796,'Terhagachh',255,5),(1797,'Dighalbank',255,5),(1798,'Thakurganj',255,5),(1799,'Pothia',255,5),(1800,'Bahadurganj',255,5),(1801,'Kochadhamin',255,5),(1802,'Kishanganj',255,5),(1803,'Banmankhi',264,5),(1804,'Barhara',264,5),(1805,'Bhawanipur',264,5),(1806,'Rupauli',264,5),(1807,'Dhamdaha',264,5),(1808,'Krityanand Nagar',264,5),(1809,'Purnia East',264,5),(1810,'Kasba',264,5),(1811,'Srinagar',264,5),(1812,'Jalalgarh',264,5),(1813,'Amour',264,5),(1814,'Baisa',264,5),(1815,'Baisi',264,5),(1816,'Dagarua',264,5),(1817,'Falka',253,5),(1818,'Korha',253,5),(1819,'Hasanganj',253,5),(1820,'Kadwa',253,5),(1821,'Balrampur',253,5),(1822,'Barsoi',253,5),(1823,'Azamnagar',253,5),(1824,'Pranpur',253,5),(1825,'Dandkhora',253,5),(1826,'Katihar',253,5),(1827,'Mansahi',253,5),(1828,'Barari',253,5),(1829,'Sameli',253,5),(1830,'Kursela',253,5),(1831,'Manihari',253,5),(1832,'Amdabad',253,5),(1833,'Gamharia',257,5),(1834,'Singheshwar',257,5),(1835,'Ghailarh',257,5),(1836,'Madhepura',257,5),(1837,'Shankarpur',257,5),(1838,'Kumarkhand',257,5),(1839,'Murliganj',257,5),(1840,'Gwalpara',257,5),(1841,'Bihariganj',257,5),(1842,'Kishanganj',257,5),(1843,'Puraini',257,5),(1844,'Alamnagar',257,5),(1845,'Chausa',257,5),(1846,'Nauhatta',266,5),(1847,'Satar Kataiya',266,5),(1848,'Mahishi',266,5),(1849,'Kahara',266,5),(1850,'Saur Bazar',266,5),(1851,'Patarghat',266,5),(1852,'Sonbarsa',266,5),(1853,'Simri Bakhtiarpur',266,5),(1854,'Salkhua',266,5),(1855,'Banma Itahri',266,5),(1856,'Jale',246,5),(1857,'Singhwara',246,5),(1858,'Keotiranway',246,5),(1859,'Darbhanga',246,5),(1860,'Manigachhi',246,5),(1861,'Tardih',246,5),(1862,'Alinagar',246,5),(1863,'Benipur',246,5),(1864,'Bahadurpur',246,5),(1865,'Hanumannagar',246,5),(1866,'Hayaghat',246,5),(1867,'Baheri',246,5),(1868,'Biraul',246,5),(1869,'Ghanshyampur',246,5),(1870,'Kiratpur',246,5),(1871,'Gora Bauram',246,5),(1872,'Kusheshwar Asthan',246,5),(1873,'Kusheshwar Asthan Purbi',246,5),(1874,'Sahebganj',260,5),(1875,'Baruraj (Motipur)',260,5),(1876,'Paroo',260,5),(1877,'Saraiya',260,5),(1878,'Marwan',260,5),(1879,'Kanti',260,5),(1880,'Minapur',260,5),(1881,'Bochaha',260,5),(1882,'Aurai',260,5),(1883,'Katra',260,5),(1884,'Gaighat',260,5),(1885,'Bandra',260,5),(1886,'Dholi (Moraul)',260,5),(1887,'Musahri',260,5),(1888,'Kurhani',260,5),(1889,'Sakra',260,5),(1890,'Katiya',249,5),(1891,'Bijaipur',249,5),(1892,'Bhorey',249,5),(1893,'Pach Deuri',249,5),(1894,'Kuchaikote',249,5),(1895,'Phulwaria',249,5),(1896,'Hathua',249,5),(1897,'Uchkagaon',249,5),(1898,'Thawe',249,5),(1899,'Gopalganj',249,5),(1900,'Manjha',249,5),(1901,'Barauli',249,5),(1902,'Sidhwalia',249,5),(1903,'Baikunthpur',249,5),(1904,'Nautan',272,5),(1905,'Siwan',272,5),(1906,'Barharia',272,5),(1907,'Goriakothi',272,5),(1908,'Lakri Nabiganj',272,5),(1909,'Basantpur',272,5),(1910,'Bhagwanpur Hat',272,5),(1911,'Maharajganj',272,5),(1912,'Pachrukhi',272,5),(1913,'Hussainganj',272,5),(1914,'Ziradei',272,5),(1915,'Mairwa',272,5),(1916,'Guthani',272,5),(1917,'Darauli',272,5),(1918,'Andar',272,5),(1919,'Raghunathpur',272,5),(1920,'Hasanpura',272,5),(1921,'Daraundha',272,5),(1922,'Siswan',272,5),(1923,'Mashrakh',268,5),(1924,'Panapur',268,5),(1925,'Taraiya',268,5),(1926,'Ishupur',268,5),(1927,'Baniapur',268,5),(1928,'Lahladpur',268,5),(1929,'Ekma',268,5),(1930,'Manjhi',268,5),(1931,'Jalalpur',268,5),(1932,'Revelganj',268,5),(1933,'Chapra',268,5),(1934,'Nagra',268,5),(1935,'Marhaura',268,5),(1936,'Amnour',268,5),(1937,'Maker',268,5),(1938,'Parsa',268,5),(1939,'Dariapur',268,5),(1940,'Garkha',268,5),(1941,'Dighwara',268,5),(1942,'Sonepur',268,5),(1943,'Vaishali',274,5),(1944,'Paterhi Belsar',274,5),(1945,'Lalganj',274,5),(1946,'Bhagwanpur',274,5),(1947,'Goraul',274,5),(1948,'Chehra Kalan',274,5),(1949,'Patepur',274,5),(1950,'Mahua',274,5),(1951,'Jandaha',274,5),(1952,'Raja Pakar',274,5),(1953,'Hajipur',274,5),(1954,'Raghopur',274,5),(1955,'Bidupur',274,5),(1956,'Desri',274,5),(1957,'Sahdai Buzurg',274,5),(1958,'Mahnar',274,5),(1959,'Kalyanpur',267,5),(1960,'Warisnagar',267,5),(1961,'Shivaji Nagar',267,5),(1962,'Khanpur',267,5),(1963,'Samastipur',267,5),(1964,'Pusa',267,5),(1965,'Tajpur',267,5),(1966,'Morwa',267,5),(1967,'Patori',267,5),(1968,'Mohanpur',267,5),(1969,'Mohiuddinagar',267,5),(1970,'Sarairanjan',267,5),(1971,'Vidyapati Nagar',267,5),(1972,'Dalsinghsarai',267,5),(1973,'Ujiarpur',267,5),(1974,'Bibhutpur',267,5),(1975,'Rosera',267,5),(1976,'Singhia',267,5),(1977,'Hasanpur',267,5),(1978,'Bithan',267,5),(1979,'Khudabandpur',242,5),(1980,'Chhorahi',242,5),(1981,'Garhpura',242,5),(1982,'Cheria Bariarpur',242,5),(1983,'Bhagwanpur',242,5),(1984,'Mansurchak',242,5),(1985,'Bachhwara',242,5),(1986,'Teghra',242,5),(1987,'Barauni',242,5),(1988,'Birpur',242,5),(1989,'Begusarai',242,5),(1990,'Naokothi',242,5),(1991,'Bakhri',242,5),(1992,'Dandari',242,5),(1993,'Sahebpur Kamal',242,5),(1994,'Balia',242,5),(1995,'Matihani',242,5),(1996,'Shamho Akha Kurha',242,5),(1997,'Alauli',254,5),(1998,'Khagaria',254,5),(1999,'Mansi',254,5),(2000,'Chautham',254,5),(2001,'Beldaur',254,5),(2002,'Gogri',254,5),(2003,'Parbatta',254,5),(2004,'Narayanpur',243,5),(2005,'Bihpur',243,5),(2006,'Kharik',243,5),(2007,'Naugachhia',243,5),(2008,'Rangra Chowk',243,5),(2009,'Gopalpur',243,5),(2010,'Pirpainti',243,5),(2011,'Colgong',243,5),(2012,'Ismailpur',243,5),(2013,'Sabour',243,5),(2014,'Nathnagar',243,5),(2015,'Sultanganj',243,5),(2016,'Shahkund',243,5),(2017,'Goradih',243,5),(2018,'Jagdishpur',243,5),(2019,'Sonhaula',243,5),(2020,'Shambhuganj',241,5),(2021,'Amarpur',241,5),(2022,'Rajaun',241,5),(2023,'Dhuraiya',241,5),(2024,'Barahat',241,5),(2025,'Banka',241,5),(2026,'Phulidumar',241,5),(2027,'Belhar',241,5),(2028,'Chanan',241,5),(2029,'Katoria',241,5),(2030,'Bausi',241,5),(2031,'Munger',259,5),(2032,'Bariarpur',259,5),(2033,'Jamalpur',259,5),(2034,'Dharhara',259,5),(2035,'Kharagpur',259,5),(2036,'Asarganj',259,5),(2037,'Tarapur',259,5),(2038,'Tetiha Bambor',259,5),(2039,'Sangrampur',259,5),(2040,'Barahiya',256,5),(2041,'Pipariya',256,5),(2042,'Surajgarha',256,5),(2043,'Lakhisarai',256,5),(2044,'Chanan*',256,5),(2045,'Ramgarh Chowk',256,5),(2046,'Halsi',256,5),(2047,'Barbigha',269,5),(2048,'Shekhopur Sarai',269,5),(2049,'Sheikhpura',269,5),(2050,'Ghat Kusumbha',269,5),(2051,'Chewara',269,5),(2052,'Ariari',269,5),(2053,'Karai Parsurai',261,5),(2054,'Nagar Nausa',261,5),(2055,'Harnaut',261,5),(2056,'Chandi',261,5),(2057,'Rahui',261,5),(2058,'Bind',261,5),(2059,'Sarmera',261,5),(2060,'Asthawan',261,5),(2061,'Bihar',261,5),(2062,'Noorsarai',261,5),(2063,'Tharthari',261,5),(2064,'Parbalpur',261,5),(2065,'Hilsa',261,5),(2066,'Ekangarsarai',261,5),(2067,'Islampur',261,5),(2068,'Ben',261,5),(2069,'Rajgir',261,5),(2070,'Silao',261,5),(2071,'Giriak',261,5),(2072,'Katrisarai',261,5),(2073,'Maner',263,5),(2074,'Dinapur-Cum-Khagaul',263,5),(2075,'Patna Rural',263,5),(2076,'Sampatchak',263,5),(2077,'Phulwari',263,5),(2078,'Bihta',263,5),(2079,'Naubatpur',263,5),(2080,'Bikram',263,5),(2081,'Dulhin Bazar',263,5),(2082,'Paliganj',263,5),(2083,'Masaurhi',263,5),(2084,'Dhanarua',263,5),(2085,'Punpun',263,5),(2086,'Fatwah',263,5),(2087,'Daniawan',263,5),(2088,'Khusrupur',263,5),(2089,'Bakhtiarpur',263,5),(2090,'Athmalgola',263,5),(2091,'Belchhi',263,5),(2092,'Barh',263,5),(2093,'Pandarak',263,5),(2094,'Ghoswari',263,5),(2095,'Mokameh',263,5),(2096,'Shahpur',244,5),(2097,'Arrah',244,5),(2098,'Barhara',244,5),(2099,'Koilwar',244,5),(2100,'Sandesh',244,5),(2101,'Udwant Nagar',244,5),(2102,'Behea',244,5),(2103,'Jagdishpur',244,5),(2104,'Piro',244,5),(2105,'Charpokhari',244,5),(2106,'Garhani',244,5),(2107,'Agiaon',244,5),(2108,'Tarari',244,5),(2109,'Sahar',244,5),(2110,'Simri',245,5),(2111,'Chakki',245,5),(2112,'Barhampur',245,5),(2113,'Chaugain',245,5),(2114,'Kesath',245,5),(2115,'Dumraon',245,5),(2116,'Buxar',245,5),(2117,'Chausa',245,5),(2118,'Rajpur',245,5),(2119,'Itarhi',245,5),(2120,'Nawanagar',245,5),(2121,'Ramgarh',252,5),(2122,'Nuaon',252,5),(2123,'Kudra',252,5),(2124,'Mohania',252,5),(2125,'Durgawati',252,5),(2126,'Chand',252,5),(2127,'Chainpur',252,5),(2128,'Bhabua',252,5),(2129,'Rampur',252,5),(2130,'Bhagwanpur',252,5),(2131,'Adhaura',252,5),(2132,'Kochas',265,5),(2133,'Dinara',265,5),(2134,'Dawath',265,5),(2135,'Suryapura',265,5),(2136,'Bikramganj',265,5),(2137,'Karakat',265,5),(2138,'Nasriganj',265,5),(2139,'Rajpur',265,5),(2140,'Sanjhauli',265,5),(2141,'Nokha',265,5),(2142,'Kargahar',265,5),(2143,'Chenari',265,5),(2144,'Nauhatta',265,5),(2145,'Sheosagar',265,5),(2146,'Sasaram',265,5),(2147,'Akorhi Gola',265,5),(2148,'Dehri',265,5),(2149,'Tilouthu',265,5),(2150,'Rohtas',265,5),(2151,'Daudnagar',240,5),(2152,'Haspura',240,5),(2153,'Goh',240,5),(2154,'Rafiganj',240,5),(2155,'Obra',240,5),(2156,'Aurangabad',240,5),(2157,'Barun',240,5),(2158,'Nabinagar',240,5),(2159,'Kutumba',240,5),(2160,'Deo',240,5),(2161,'Madanpur',240,5),(2162,'Konch',248,5),(2163,'Tikari',248,5),(2164,'Belaganj',248,5),(2165,'Khizirsarai',248,5),(2166,'Neem Chak Bathani',248,5),(2167,'Muhra',248,5),(2168,'Atri',248,5),(2169,'Manpur',248,5),(2170,'Gaya Town C.D.Block',248,5),(2171,'Paraiya',248,5),(2172,'Guraru',248,5),(2173,'Gurua',248,5),(2174,'Amas',248,5),(2175,'Banke Bazar',248,5),(2176,'Imamganj',248,5),(2177,'Dumaria',248,5),(2178,'Sherghati',248,5),(2179,'Dobhi',248,5),(2180,'Bodh Gaya',248,5),(2181,'Tan Kuppa',248,5),(2182,'Wazirganj',248,5),(2183,'Fatehpur',248,5),(2184,'Mohanpur',248,5),(2185,'Barachatti',248,5),(2186,'Nardiganj',262,5),(2187,'Nawada',262,5),(2188,'Warisaliganj',262,5),(2189,'Kashi Chak',262,5),(2190,'Pakribarawan',262,5),(2191,'Kawakol',262,5),(2192,'Roh',262,5),(2193,'Gobindpur',262,5),(2194,'Akbarpur',262,5),(2195,'Hisua',262,5),(2196,'Narhat',262,5),(2197,'Meskaur',262,5),(2198,'Sirdala',262,5),(2199,'Rajauli',262,5),(2200,'Islamnagar Aliganj',250,5),(2201,'Sikandra',250,5),(2202,'Jamui',250,5),(2203,'Barhat',250,5),(2204,'Lakshmipur',250,5),(2205,'Jhajha',250,5),(2206,'Gidhaur',250,5),(2207,'Khaira',250,5),(2208,'Sono',250,5),(2209,'Chakai',250,5),(2210,'Ratni Faridpur',251,5),(2211,'Jehanabad',251,5),(2212,'Kako',251,5),(2213,'Modanganj',251,5),(2214,'Ghoshi',251,5),(2215,'Makhdumpur',251,5),(2216,'Hulasganj',251,5),(2217,'Arwal',239,5),(2218,'Kaler',239,5),(2219,'Karpi',239,5),(2220,'Sonbhadra Banshi Suryapur',239,5),(2221,'Kurtha',239,5),(2222,'Chungthang',277,30),(2223,'Mangan',277,30),(2224,'Gyalshing',279,30),(2225,'Soreng',279,30),(2226,'Namchi',278,30),(2227,'Ravong',278,30),(2228,'Gangtok',276,30),(2229,'Pakyong',276,30),(2230,'Rongli',276,30),(2231,'Zemithang',290,3),(2232,'Lumla',290,3),(2233,'Dudunghar',290,3),(2234,'Tawang Circle',290,3),(2235,'Kitpi Circle',290,3),(2236,'Jang',290,3),(2237,'Lhou',290,3),(2238,'Mukto Circle',290,3),(2239,'Bongkhar',290,3),(2240,'Thingbu',290,3),(2241,'Dirang',294,3),(2242,'Thembang',294,3),(2243,'Nafra',294,3),(2244,'Bomdila',294,3),(2245,'Kalaktang',294,3),(2246,'Shergaon',294,3),(2247,'Rupa',294,3),(2248,'Singchung',294,3),(2249,'Jamiri',294,3),(2250,'Thrizino',294,3),(2251,'Bhalukpong',294,3),(2252,'Kamengbari-Doimara',294,3),(2253,'Balemu',294,3),(2254,'Seijosa',283,3),(2255,'Dissing-Passo',283,3),(2256,'Pakke-Kessang',283,3),(2257,'Pizirang(Veo)',283,3),(2258,'Richukrong',283,3),(2259,'Seppa',283,3),(2260,'Lada',283,3),(2261,'Bameng',283,3),(2262,'Pipu-Dipu',283,3),(2263,'Gyawe Purang',283,3),(2264,'Khenewa',283,3),(2265,'Chayangtajo',283,3),(2266,'Sawa',283,3),(2267,'Balijan',289,3),(2268,'Banderdawa',289,3),(2269,'Sangdupota (Besar Nello)',289,3),(2270,'Taraso',289,3),(2271,'Itanagar',289,3),(2272,'Naharlagun',289,3),(2273,'Doimukh',289,3),(2274,'Gumto',289,3),(2275,'Toru',289,3),(2276,'Sagalee',289,3),(2277,'Parang',289,3),(2278,'Leporiang',289,3),(2279,'Mengio',289,3),(2280,'Kimin',289,3),(2281,'Kakoi',289,3),(2282,'Taksing',293,3),(2283,'Limeking',293,3),(2284,'Nacho',293,3),(2285,'Siyum',293,3),(2286,'Taliha',293,3),(2287,'Payeng',293,3),(2288,'Giba',293,3),(2289,'Chetam (Peer Yapu)',293,3),(2290,'Daporijo',293,3),(2291,'Puchi Geko',293,3),(2292,'Dumporijo',293,3),(2293,'Gussar',293,3),(2294,'Gite-Ripa',293,3),(2295,'Baririjo',293,3),(2296,'Maro',293,3),(2297,'Mechuka',295,3),(2298,'Monigong',295,3),(2299,'Pidi',295,3),(2300,'Payum',295,3),(2301,'Tato',295,3),(2302,'Kaying',295,3),(2303,'Darak',295,3),(2304,'Kamba',295,3),(2305,'Rumgong',295,3),(2306,'Jomlo Mobuk',295,3),(2307,'Liromoba',295,3),(2308,'Yomcha',295,3),(2309,'Aalo',295,3),(2310,'Tirbin',295,3),(2311,'Basar',295,3),(2312,'Daring',295,3),(2313,'Gensi',295,3),(2314,'Sibe',295,3),(2315,'Likabali',295,3),(2316,'Kangku',295,3),(2317,'Bagra',295,3),(2318,'Boleng',284,3),(2319,'Riga',284,3),(2320,'Pangin',284,3),(2321,'Kebang',284,3),(2322,'Rebo-Perging',284,3),(2323,'Koyu',284,3),(2324,'Kora',284,3),(2325,'Nari',284,3),(2326,'New Seren',284,3),(2327,'Bilat',284,3),(2328,'Ruksin',284,3),(2329,'Sille-Oyan',284,3),(2330,'Pasighat',284,3),(2331,'Mebo',284,3),(2332,'Namsing',284,3),(2333,'Tuting',292,3),(2334,'Migging',292,3),(2335,'Palling',292,3),(2336,'Gelling',292,3),(2337,'Singa',292,3),(2338,'Yingkiong',292,3),(2339,'Jengging',292,3),(2340,'Geku',292,3),(2341,'Mariyang',292,3),(2342,'Mopom ( Adipasi )',292,3),(2343,'Katan',292,3),(2344,'Khimiyong',281,3),(2345,'Yatdam',281,3),(2346,'Changlang',281,3),(2347,'Namtok',281,3),(2348,'Manmao',281,3),(2349,'Renuk',281,3),(2350,'Lyngok-Longtoi',281,3),(2351,'Nampong',281,3),(2352,'Tikhak Rima Putok',281,3),(2353,'Jairampur',281,3),(2354,'Vijoynagar',281,3),(2355,'Miao',281,3),(2356,'Kharsang',281,3),(2357,'Diyun',281,3),(2358,'Bordumsa',281,3),(2359,'Namsang',291,3),(2360,'Soha',291,3),(2361,'Khonsa',291,3),(2362,'Dadam',291,3),(2363,'Kanubari',291,3),(2364,'Lawnu',291,3),(2365,'Longding',291,3),(2366,'Pumao',291,3),(2367,'Pangchao',291,3),(2368,'Wakka',291,3),(2369,'Laju',291,3),(2370,'Ziro (Sadar)',288,3),(2371,'Old Ziro',288,3),(2372,'Yachuli',288,3),(2373,'Yazali',288,3),(2374,'Pistana',288,3),(2375,'Kamporijo',288,3),(2376,'Dollungmukh',288,3),(2377,'Raga',288,3),(2378,'Palin',285,3),(2379,'Yangte',285,3),(2380,'Sangram',285,3),(2381,'Nyapin',285,3),(2382,'Phassang',285,3),(2383,'Koloriang',285,3),(2384,'Chambang',285,3),(2385,'Gangte',285,3),(2386,'Tarak-Lengdi',285,3),(2387,'Sarli',285,3),(2388,'Parsi-Parlo',285,3),(2389,'Damin',285,3),(2390,'Longding Koling (Pipsorang)',285,3),(2391,'Tali',285,3),(2392,'Mipi',282,3),(2393,'Anini',282,3),(2394,'Etalin',282,3),(2395,'Anelih',282,3),(2396,'Kronli (Arzoo Circle)',282,3),(2397,'Hunli',287,3),(2398,'Desali',287,3),(2399,'Roing',287,3),(2400,'Dambuk',287,3),(2401,'Tinali ( Paglam )',287,3),(2402,'Koronu',287,3),(2403,'Sunpura',286,3),(2404,'Tezu',286,3),(2405,'Wakro',286,3),(2406,'Chongkham',286,3),(2407,'Namsai',286,3),(2408,'Lathao',286,3),(2409,'Piyong',286,3),(2410,'Lekang (Mahadevpur)',286,3),(2411,'Hayuliang',280,3),(2412,'Manchal',280,3),(2413,'Goiliang',280,3),(2414,'Chaglagam',280,3),(2415,'Metengliang',280,3),(2416,'Kibithoo',280,3),(2417,'Walong',280,3),(2418,'Hawai',280,3),(2419,'Naginimora',301,25),(2420,'Tizit',301,25),(2421,'Hunta',301,25),(2422,'Shangnyu',301,25),(2423,'Mon Sadar',301,25),(2424,'Wakching',301,25),(2425,'Aboi',301,25),(2426,'Longshen',301,25),(2427,'Phomching',301,25),(2428,'Chen',301,25),(2429,'Angjangyang',301,25),(2430,'Mopong',301,25),(2431,'Tobu',301,25),(2432,'Monyakshu',301,25),(2433,'Longchem',300,25),(2434,'Alongkima',300,25),(2435,'Tuli',300,25),(2436,'Changtongya',300,25),(2437,'Chuchuyimlang',300,25),(2438,'Kubolong',300,25),(2439,'Mangkolemba',300,25),(2440,'Merangmen',300,25),(2441,'Ongpangkong',300,25),(2442,'V.K.',306,25),(2443,'Akuluto',306,25),(2444,'Suruhuto',306,25),(2445,'Asuto',306,25),(2446,'Aghunato',306,25),(2447,'Zunheboto Sadar',306,25),(2448,'Atoizu',306,25),(2449,'Akuhaito',306,25),(2450,'Pughoboto',306,25),(2451,'Ghathashi',306,25),(2452,'Satakha',306,25),(2453,'Saptiqa',306,25),(2454,'Satoi',306,25),(2455,'Changpang',305,25),(2456,'Aitepyong',305,25),(2457,'Bhandari',305,25),(2458,'Baghty',305,25),(2459,'Sungro',305,25),(2460,'Sanis',305,25),(2461,'Lotsu',305,25),(2462,'Ralan',305,25),(2463,'Wozhuro',305,25),(2464,'Wokha Sadar',305,25),(2465,'Englan',305,25),(2466,'Chukitong',305,25),(2467,'Niuland',296,25),(2468,'Aquqhnaqua',296,25),(2469,'Kuhoboto',296,25),(2470,'Nihokhu',296,25),(2471,'Dimapur Sadar',296,25),(2472,'Chumukedima',296,25),(2473,'Dhansiripar',296,25),(2474,'Medziphema',296,25),(2475,'Sekruzu',303,25),(2476,'Phek Sadar',303,25),(2477,'Khuza',303,25),(2478,'Meluri',303,25),(2479,'Phor',303,25),(2480,'Phokhungri',303,25),(2481,'Chozuba',303,25),(2482,'Chetheba',303,25),(2483,'Sakraba',303,25),(2484,'Pfutsero',303,25),(2485,'Zuketsa',303,25),(2486,'Khezhakeno',303,25),(2487,'Chizami',303,25),(2488,'Razieba',303,25),(2489,'Noksen',304,25),(2490,'Chare',304,25),(2491,'Longkhim',304,25),(2492,'Tuensang Sadar',304,25),(2493,'Ngoungchung',304,25),(2494,'Sangsangnyu',304,25),(2495,'Sotokur',304,25),(2496,'Noklak',304,25),(2497,'Chingmei',304,25),(2498,'Nokhu',304,25),(2499,'Panso',304,25),(2500,'Shamator',304,25),(2501,'Tsurungto',304,25),(2502,'Chessore',304,25),(2503,'Mangko',304,25),(2504,'Thonoknyu',304,25),(2505,'Tamlu',299,25),(2506,'Namsang',299,25),(2507,'Yongnyah',299,25),(2508,'Longleng',299,25),(2509,'Sakshi',299,25),(2510,'Seyochung',297,25),(2511,'Amahator',297,25),(2512,'Kiphire Sadar',297,25),(2513,'Kiusam',297,25),(2514,'Sitimi',297,25),(2515,'Longmatra',297,25),(2516,'Pungro',297,25),(2517,'Khongsa',297,25),(2518,'Tseminyu',298,25),(2519,'Tsogin',298,25),(2520,'Chiephobozou',298,25),(2521,'Botsa',298,25),(2522,'Kezocha',298,25),(2523,'Jakhama',298,25),(2524,'Kohima Sadar',298,25),(2525,'Sechu-Zubza',298,25),(2526,'Pedi (Ngwalwa)',302,25),(2527,'Jalukie',302,25),(2528,'Athibung',302,25),(2529,'Kebai Khelma',302,25),(2530,'Nsong',302,25),(2531,'Tening',302,25),(2532,'Peren',302,25),(2533,'Mao-Maram',312,22),(2534,'Paomata',312,22),(2535,'Purul',312,22),(2536,'Sadar Hills West',312,22),(2537,'Saitu-Gamphazol',312,22),(2538,'Sadar Hills East',312,22),(2539,'Tamenglong West',313,22),(2540,'Tamenglong North',313,22),(2541,'Tamenglong',313,22),(2542,'Nungba',313,22),(2543,'Tipaimukh',309,22),(2544,'Thanlon',309,22),(2545,'Churachandpur North',309,22),(2546,'Churachandpur',309,22),(2547,'Singngat',309,22),(2548,'Nambol',307,22),(2549,'Bishnupur',307,22),(2550,'Moirang',307,22),(2551,'Lilong',314,22),(2552,'Thoubal',314,22),(2553,'Kakching',314,22),(2554,'Lamshang',311,22),(2555,'Patsoi',311,22),(2556,'Lamphelpat',311,22),(2557,'Wangoi',311,22),(2558,'Jiribam',310,22),(2559,'Sawombung',310,22),(2560,'Porompat',310,22),(2561,'Keirao Bitra',310,22),(2562,'Ukhrul North',315,22),(2563,'Ukhurl Central',315,22),(2564,'Kamjong-Chassad',315,22),(2565,'Phungyar-Phaisat',315,22),(2566,'Ukhrul South',315,22),(2567,'Machi',308,22),(2568,'Tengnoupal',308,22),(2569,'Chandel',308,22),(2570,'Chakpikarong',308,22),(2571,'Zawlnuam',321,24),(2572,'West Phaileng',321,24),(2573,'Reiek',321,24),(2574,'N Thingdawl',318,24),(2575,'Bilkhawthlir',318,24),(2576,'Tlangnuam (Part)',318,24),(2577,'Darlawn',316,24),(2578,'Phullen',316,24),(2579,'Aibawk',316,24),(2580,'Thingsulthliah (Part)',316,24),(2581,'Ngopa',317,24),(2582,'Khawzawl',317,24),(2583,'Champhai',317,24),(2584,'Khawbung',317,24),(2585,'East Lungdar (Part)',317,24),(2586,'Serchhip',323,24),(2587,'West Bunghmun',320,24),(2588,'Lungsen',320,24),(2589,'Lunglei',320,24),(2590,'Hnahthial',320,24),(2591,'Chawngte',319,24),(2592,'Lawngtlai',319,24),(2593,'S Bungtlang',319,24),(2594,'Sangau',319,24),(2595,'Tuipang',322,24),(2596,'Saiha',322,24),(2597,'Mohanpur',327,32),(2598,'Hezamara',327,32),(2599,'Padmabil',327,32),(2600,'Khowai',327,32),(2601,'Tulashikhar',327,32),(2602,'Kalyanpur',327,32),(2603,'Teliamura',327,32),(2604,'Mungiakumi',327,32),(2605,'Mandai',327,32),(2606,'Jirania',327,32),(2607,'Dukli',327,32),(2608,'Jampuijala',327,32),(2609,'Bishalgarh',327,32),(2610,'Boxanagar',327,32),(2611,'Melaghar',327,32),(2612,'Kathalia',327,32),(2613,'Killa',326,32),(2614,'Amarpur',326,32),(2615,'Ompi',326,32),(2616,'Matarbari',326,32),(2617,'Kakraban',326,32),(2618,'Rajnagar',326,32),(2619,'Hrishyamukh',326,32),(2620,'Bokafa',326,32),(2621,'Karbuk',326,32),(2622,'Rupaichhari',326,32),(2623,'Satchand',326,32),(2624,'Salema',324,32),(2625,'Manu',324,32),(2626,'Ambassa',324,32),(2627,'Chhamanu',324,32),(2628,'Dumburnagar',324,32),(2629,'Gournagar',325,32),(2630,'Kadamtala',325,32),(2631,'Panisagar',325,32),(2632,'Damchhara',325,32),(2633,'Pencharthal',325,32),(2634,'Kumarghat',325,32),(2635,'Dasda',325,32),(2636,'Jampuii Hills',325,32),(2637,'Selsella',333,23),(2638,'Dadenggiri',333,23),(2639,'Tikrikilla',333,23),(2640,'Rongram',333,23),(2641,'Betasing',333,23),(2642,'Zikzak',333,23),(2643,'Gambegre',333,23),(2644,'Dalu',333,23),(2645,'Resubelpara',328,23),(2646,'Dambo Rongjeng',328,23),(2647,'Kharkutta',328,23),(2648,'Songsak',328,23),(2649,'Samanda',328,23),(2650,'Chokpot',332,23),(2651,'Gasuapara',332,23),(2652,'Baghmara',332,23),(2653,'Rongara',332,23),(2654,'Mawshynrut',334,23),(2655,'Nongstoin',334,23),(2656,'Mawthadraishan',334,23),(2657,'Mairang',334,23),(2658,'Ranikor',334,23),(2659,'Mawkyrwat',334,23),(2660,'Umling',331,23),(2661,'Jirang',331,23),(2662,'Umsning',331,23),(2663,'Mawphlang',329,23),(2664,'Mylliem',329,23),(2665,'Mawryngkneng',329,23),(2666,'Mawkynrew',329,23),(2667,'Khatarshnong Laitkroh',329,23),(2668,'Mawsynram',329,23),(2669,'Shella Bholaganj',329,23),(2670,'Pynursla',329,23),(2671,'Thadlaskein',330,23),(2672,'Laskein',330,23),(2673,'Amlarem',330,23),(2674,'Khliehriat',330,23),(2675,'Saipung',330,23),(2676,'Gossaigaon (Pt)',353,4),(2677,'Bhowraguri',353,4),(2678,'Dotoma',353,4),(2679,'Kokrajhar (Pt)',353,4),(2680,'Bagribari (Pt)',353,4),(2681,'Golokganj (Pt)',353,4),(2682,'Dhubri (Pt)',353,4),(2683,'Bilasipara (Pt)',353,4),(2684,'Chapar (Pt)',353,4),(2685,'Agamoni',342,4),(2686,'South Salmara',342,4),(2687,'Mankachar',342,4),(2688,'Lakhipur',345,4),(2689,'Balijana',345,4),(2690,'Matia',345,4),(2691,'Dudhnai',345,4),(2692,'Rangjuli',345,4),(2693,'Barnagar (Pt)',336,4),(2694,'Kalgachia',336,4),(2695,'Baghbor',336,4),(2696,'Chenga',336,4),(2697,'Barpeta',336,4),(2698,'Sarthebari',336,4),(2699,'Bajali (Pt)',336,4),(2700,'Sarupeta (Pt)',336,4),(2701,'Jalah (Pt)',336,4),(2702,'Mayong',355,4),(2703,'Bhuragaon',355,4),(2704,'Laharighat',355,4),(2705,'Marigaon',355,4),(2706,'Mikirbheta',355,4),(2707,'Kaliabor',356,4),(2708,'Samaguri',356,4),(2709,'Rupahi',356,4),(2710,'Dhing',356,4),(2711,'Nagaon',356,4),(2712,'Raha',356,4),(2713,'Kampur',356,4),(2714,'Hojai',356,4),(2715,'Doboka',356,4),(2716,'Lanka',356,4),(2717,'Dhekiajuli (Pt)',359,4),(2718,'Chariduar',359,4),(2719,'Tezpur',359,4),(2720,'Na-Duar',359,4),(2721,'Biswanath',359,4),(2722,'Helem',359,4),(2723,'Gohpur',359,4),(2724,'Narayanpur',354,4),(2725,'Bihpuria',354,4),(2726,'Naobaicha',354,4),(2727,'Kadam',354,4),(2728,'North Lakhimpur',354,4),(2729,'Dhakuakhana (Pt)',354,4),(2730,'Subansiri (Pt)',354,4),(2731,'Dhemaji',341,4),(2732,'Sissibargaon',341,4),(2733,'Jonai',341,4),(2734,'Gogamukh',341,4),(2735,'Sadiya',360,4),(2736,'Doom Dooma',360,4),(2737,'Tinsukia',360,4),(2738,'Margherita',360,4),(2739,'Dibrugarh West',343,4),(2740,'Dibrugarh East',343,4),(2741,'Chabua',343,4),(2742,'Tengakhat',343,4),(2743,'Moran',343,4),(2744,'Tingkhong',343,4),(2745,'Naharkatiya',343,4),(2746,'Dimow',358,4),(2747,'Sibsagar',358,4),(2748,'Amguri',358,4),(2749,'Nazira',358,4),(2750,'Sonari',358,4),(2751,'Mahmora',358,4),(2752,'Majuli',348,4),(2753,'Jorhat West',348,4),(2754,'Jorhat East',348,4),(2755,'Teok',348,4),(2756,'Titabor',348,4),(2757,'Mariani',348,4),(2758,'Bokakhat',346,4),(2759,'Khumtai',346,4),(2760,'Dergaon',346,4),(2761,'Golaghat',346,4),(2762,'Morangi',346,4),(2763,'Sarupathar',346,4),(2764,'Donka',351,4),(2765,'Diphu',351,4),(2766,'Phuloni',351,4),(2767,'Silonijan',351,4),(2768,'Umrangso',344,4),(2769,'Haflong',344,4),(2770,'Mahur',344,4),(2771,'Maibong',344,4),(2772,'Katigora',338,4),(2773,'Silchar',338,4),(2774,'Udarbond',338,4),(2775,'Sonai',338,4),(2776,'Lakhipur',338,4),(2777,'Karimganj',352,4),(2778,'Badarpur',352,4),(2779,'Nilambazar',352,4),(2780,'Patharkandi',352,4),(2781,'Ramkrishna Nagar',352,4),(2782,'Algapur',347,4),(2783,'Hailakandi',347,4),(2784,'Lala',347,4),(2785,'Katlichara',347,4),(2786,'Bongaigaon (Pt)',337,4),(2787,'Boitamari',337,4),(2788,'Srijangram',337,4),(2789,'Sidli (Pt)',337,4),(2790,'Bijni (Pt)',337,4),(2791,'Bengtol',339,4),(2792,'Rangia (Pt)',349,4),(2793,'Koya',349,4),(2794,'Kamalpur',349,4),(2795,'Hajo',349,4),(2796,'Chhaygaon',349,4),(2797,'Goroimari',349,4),(2798,'Chamaria',349,4),(2799,'Nagarbera',349,4),(2800,'Boko',349,4),(2801,'Palasbari',349,4),(2802,'North Guwahati (Pt)',349,4),(2803,'Goreswar (Pt)',349,4),(2804,'Azara',350,4),(2805,'Guwahati',350,4),(2806,'Dispur',350,4),(2807,'Sonapur',350,4),(2808,'Chandrapur',350,4),(2809,'Tihu (Pt)',357,4),(2810,'Pachim Nalbari',357,4),(2811,'Barkhetri',357,4),(2812,'Barbhag',357,4),(2813,'Nalbari',357,4),(2814,'Banekuchi',357,4),(2815,'Ghograpar (Pt)',357,4),(2816,'Baganpara (Pt)',357,4),(2817,'Barama (Pt)',357,4),(2818,'Baska',335,4),(2819,'Tamulpur',335,4),(2820,'Pathorighat (Pt)',335,4),(2821,'Khoirabari (Pt)',340,4),(2822,'Sipajhar',340,4),(2823,'Mangaldoi (Pt)',340,4),(2824,'Dalgaon (Pt)',340,4),(2825,'Kalaigaon (Pt)',340,4),(2826,'Harisinga',361,4),(2827,'Udalguri',361,4),(2828,'Mazbat',361,4),(2829,'Darjeeling Pulbazar',367,35),(2830,'Rangli Rangliot',367,35),(2831,'Kalimpong -I',367,35),(2832,'Kalimpong - Ii',367,35),(2833,'Gorubathan',367,35),(2834,'Jorebunglow Sukiapokhri',367,35),(2835,'Mirik',367,35),(2836,'Kurseong',367,35),(2837,'Matigara',367,35),(2838,'Naxalbari',367,35),(2839,'Phansidewa',367,35),(2840,'Kharibari',367,35),(2841,'Rajganj',370,35),(2842,'Mal',370,35),(2843,'Matiali',370,35),(2844,'Nagrakata',370,35),(2845,'Madarihat',370,35),(2846,'Kalchini',370,35),(2847,'Kumargram',370,35),(2848,'Alipurduar - I',370,35),(2849,'Alipurduar - Ii',370,35),(2850,'Falakata',370,35),(2851,'Dhupguri',370,35),(2852,'Maynaguri',370,35),(2853,'Jalpaiguri',370,35),(2854,'Haldibari',365,35),(2855,'Mekliganj',365,35),(2856,'Mathabhanga - I',365,35),(2857,'Mathabhanga - Ii',365,35),(2858,'Cooch Behar - I',365,35),(2859,'Cooch Behar - Ii',365,35),(2860,'Tufanganj - I',365,35),(2861,'Tufanganj - Ii',365,35),(2862,'Dinhata - I',365,35),(2863,'Dinhata - Ii',365,35),(2864,'Sitai',365,35),(2865,'Sitalkuchi',365,35),(2866,'Chopra',380,35),(2867,'Islampur',380,35),(2868,'Goalpokhar - I',380,35),(2869,'Goalpokhar - Ii',380,35),(2870,'Karandighi',380,35),(2871,'Raiganj',380,35),(2872,'Hemtabad',380,35),(2873,'Kaliaganj',380,35),(2874,'Itahar',380,35),(2875,'Kushmundi',366,35),(2876,'Gangarampur',366,35),(2877,'Kumarganj',366,35),(2878,'Hilli',366,35),(2879,'Balurghat',366,35),(2880,'Tapan',366,35),(2881,'Bansihari',366,35),(2882,'Harirampur',366,35),(2883,'Harischandrapur - I',372,35),(2884,'Harischandrapur - Ii',372,35),(2885,'Chanchal - I',372,35),(2886,'Chanchal - Ii',372,35),(2887,'Ratua - I',372,35),(2888,'Ratua - Ii',372,35),(2889,'Gazole',372,35),(2890,'Bamangola',372,35),(2891,'Habibpur',372,35),(2892,'Maldah (Old)',372,35),(2893,'English Bazar',372,35),(2894,'Manikchak',372,35),(2895,'Kaliachak - I',372,35),(2896,'Kaliachak - Ii',372,35),(2897,'Kaliachak - Iii',372,35),(2898,'Farakka',373,35),(2899,'Samserganj',373,35),(2900,'Suti - I',373,35),(2901,'Suti - Ii',373,35),(2902,'Raghunathganj - I',373,35),(2903,'Raghunathganj - Ii',373,35),(2904,'Lalgola',373,35),(2905,'Sagardighi',373,35),(2906,'Bhagawangola - I',373,35),(2907,'Bhagawangola - Ii',373,35),(2908,'Raninagar - Ii',373,35),(2909,'Jalangi',373,35),(2910,'Domkal',373,35),(2911,'Raninagar - I',373,35),(2912,'Murshidabad Jiaganj',373,35),(2913,'Nabagram',373,35),(2914,'Khargram',373,35),(2915,'Kandi',373,35),(2916,'Berhampore',373,35),(2917,'Hariharpara',373,35),(2918,'Nawda',373,35),(2919,'Beldanga - I',373,35),(2920,'Beldanga - Ii',373,35),(2921,'Bharatpur - Ii',373,35),(2922,'Bharatpur - I',373,35),(2923,'Burwan',373,35),(2924,'Murarai - I',364,35),(2925,'Murarai - Ii',364,35),(2926,'Nalhati - I',364,35),(2927,'Nalhati - Ii',364,35),(2928,'Rampurhat - I',364,35),(2929,'Rampurhat - Ii',364,35),(2930,'Mayureswar - I',364,35),(2931,'Mayureswar - Ii',364,35),(2932,'Mohammad Bazar',364,35),(2933,'Rajnagar',364,35),(2934,'Suri - I',364,35),(2935,'Suri - Ii',364,35),(2936,'Sainthia',364,35),(2937,'Labpur',364,35),(2938,'Nanoor',364,35),(2939,'Bolpur Sriniketan',364,35),(2940,'Illambazar',364,35),(2941,'Dubrajpur',364,35),(2942,'Khoyrasol',364,35),(2943,'Salanpur',363,35),(2944,'Barabani',363,35),(2945,'Jamuria',363,35),(2946,'Raniganj',363,35),(2947,'Ondal',363,35),(2948,'Pandabeswar',363,35),(2949,'Faridpur Durgapur',363,35),(2950,'Kanksa',363,35),(2951,'Ausgram - Ii',363,35),(2952,'Ausgram - I',363,35),(2953,'Mangolkote',363,35),(2954,'Ketugram - I',363,35),(2955,'Ketugram - Ii',363,35),(2956,'Katwa - I',363,35),(2957,'Katwa - Ii',363,35),(2958,'Purbasthali - I',363,35),(2959,'Purbasthali - Ii',363,35),(2960,'Manteswar',363,35),(2961,'Bhatar',363,35),(2962,'Galsi - I',363,35),(2963,'Galsi - Ii',363,35),(2964,'Burdwan - I',363,35),(2965,'Burdwan - Ii',363,35),(2966,'Memari - I',363,35),(2967,'Memari - Ii',363,35),(2968,'Kalna - I',363,35),(2969,'Kalna - Ii',363,35),(2970,'Jamalpur',363,35),(2971,'Raina - I',363,35),(2972,'Khandaghosh',363,35),(2973,'Raina - Ii',363,35),(2974,'Karimpur - I',374,35),(2975,'Karimpur - Ii',374,35),(2976,'Tehatta - I',374,35),(2977,'Tehatta - Ii',374,35),(2978,'Kaliganj',374,35),(2979,'Nakashipara',374,35),(2980,'Chapra',374,35),(2981,'Krishnagar - Ii',374,35),(2982,'Nabadwip',374,35),(2983,'Krishnagar - I',374,35),(2984,'Krishnaganj',374,35),(2985,'Hanskhali',374,35),(2986,'Santipur',374,35),(2987,'Ranaghat - I',374,35),(2988,'Ranaghat - Ii',374,35),(2989,'Chakdah',374,35),(2990,'Haringhata',374,35),(2991,'Bagda',375,35),(2992,'Bongaon',375,35),(2993,'Gaighata',375,35),(2994,'Swarupnagar',375,35),(2995,'Habra - I',375,35),(2996,'Habra - Ii',375,35),(2997,'Amdanga',375,35),(2998,'Barrackpur - I',375,35),(2999,'Barrackpur - Ii',375,35),(3000,'Barasat - I',375,35),(3001,'Barasat - Ii',375,35),(3002,'Deganga',375,35),(3003,'Baduria',375,35),(3004,'Basirhat - I',375,35),(3005,'Basirhat - Ii',375,35),(3006,'Haroa',375,35),(3007,'Rajarhat',375,35),(3008,'Minakhan',375,35),(3009,'Sandeshkhali - I',375,35),(3010,'Sandeshkhali - Ii',375,35),(3011,'Hasnabad',375,35),(3012,'Hingalganj',375,35),(3013,'Goghat - I',368,35),(3014,'Goghat - Ii',368,35),(3015,'Arambag',368,35),(3016,'Pursura',368,35),(3017,'Tarakeswar',368,35),(3018,'Dhaniakhali',368,35),(3019,'Pandua',368,35),(3020,'Balagarh',368,35),(3021,'Chinsurah - Magra',368,35),(3022,'Polba - Dadpur',368,35),(3023,'Haripal',368,35),(3024,'Singur',368,35),(3025,'Serampur Uttarpara',368,35),(3026,'Chanditala - I',368,35),(3027,'Chanditala - Ii',368,35),(3028,'Jangipara',368,35),(3029,'Khanakul - I',368,35),(3030,'Khanakul - Ii',368,35),(3031,'Saltora',362,35),(3032,'Mejhia',362,35),(3033,'Gangajalghati',362,35),(3034,'Chhatna',362,35),(3035,'Indpur',362,35),(3036,'Bankura - I',362,35),(3037,'Bankura - Ii',362,35),(3038,'Barjora',362,35),(3039,'Sonamukhi',362,35),(3040,'Patrasayer',362,35),(3041,'Indus',362,35),(3042,'Kotulpur',362,35),(3043,'Jaypur',362,35),(3044,'Vishnupur',362,35),(3045,'Onda',362,35),(3046,'Taldangra',362,35),(3047,'Simlapal',362,35),(3048,'Khatra',362,35),(3049,'Hirbandh',362,35),(3050,'Ranibundh',362,35),(3051,'Raipur',362,35),(3052,'Sarenga',362,35),(3053,'Jaipur',378,35),(3054,'Purulia - Ii',378,35),(3055,'Para',378,35),(3056,'Raghunathpur - Ii',378,35),(3057,'Raghunathpur - I',378,35),(3058,'Neturia',378,35),(3059,'Santuri',378,35),(3060,'Kashipur',378,35),(3061,'Hura',378,35),(3062,'Purulia - I',378,35),(3063,'Puncha',378,35),(3064,'Arsha',378,35),(3065,'Jhalda - I',378,35),(3066,'Jhalda - Ii',378,35),(3067,'Bagmundi',378,35),(3068,'Balarampur',378,35),(3069,'Barabazar',378,35),(3070,'Manbazar - I',378,35),(3071,'Manbazar - Ii',378,35),(3072,'Bundwan',378,35),(3073,'Udaynarayanpur',369,35),(3074,'Amta - Ii',369,35),(3075,'Amta - I',369,35),(3076,'Jagatballavpur',369,35),(3077,'Domjur',369,35),(3078,'Bally Jagachha',369,35),(3079,'Sankrail',369,35),(3080,'Panchla',369,35),(3081,'Uluberia - Ii',369,35),(3082,'Uluberia - I',369,35),(3083,'Bagnan - I',369,35),(3084,'Bagnan - Ii',369,35),(3085,'Shyampur - I',369,35),(3086,'Shyampur - Ii',369,35),(3087,'Thakurpukur Mahestola',379,35),(3088,'Budge Budge - I',379,35),(3089,'Budge Budge - Ii',379,35),(3090,'Bishnupur - I',379,35),(3091,'Bishnupur - Ii',379,35),(3092,'Sonarpur',379,35),(3093,'Bhangar - I',379,35),(3094,'Bhangar - Ii',379,35),(3095,'Canning - I',379,35),(3096,'Canning - Ii',379,35),(3097,'Baruipur',379,35),(3098,'Magrahat - Ii',379,35),(3099,'Magrahat - I',379,35),(3100,'Falta',379,35),(3101,'Diamond Harbour - I',379,35),(3102,'Diamond Harbour - Ii',379,35),(3103,'Kulpi',379,35),(3104,'Mandirbazar',379,35),(3105,'Mathurapur - I',379,35),(3106,'Jaynagar - I',379,35),(3107,'Jaynagar - Ii',379,35),(3108,'Kultali',379,35),(3109,'Basanti',379,35),(3110,'Gosaba',379,35),(3111,'Mathurapur - Ii',379,35),(3112,'Kakdwip',379,35),(3113,'Sagar',379,35),(3114,'Namkhana',379,35),(3115,'Patharpratima',379,35),(3116,'Binpur - Ii',376,35),(3117,'Binpur - I',376,35),(3118,'Garbeta - Ii',376,35),(3119,'Garbeta - I',376,35),(3120,'Garbeta - Iii',376,35),(3121,'Chandrakona - I',376,35),(3122,'Chandrakona - Ii',376,35),(3123,'Ghatal',376,35),(3124,'Daspur - I',376,35),(3125,'Daspur - Ii',376,35),(3126,'Keshpur',376,35),(3127,'Salbani',376,35),(3128,'Midnapore',376,35),(3129,'Jhargram',376,35),(3130,'Jamboni',376,35),(3131,'Gopiballavpur - Ii',376,35),(3132,'Gopiballavpur - I',376,35),(3133,'Nayagram',376,35),(3134,'Sankrail',376,35),(3135,'Kharagpur - I',376,35),(3136,'Kharagpur - Ii',376,35),(3137,'Debra',376,35),(3138,'Pingla',376,35),(3139,'Sabang',376,35),(3140,'Narayangarh',376,35),(3141,'Keshiary',376,35),(3142,'Dantan - I',376,35),(3143,'Dantan - Ii',376,35),(3144,'Mohanpur',376,35),(3145,'Panskura',377,35),(3146,'Kolaghat',377,35),(3147,'Tamluk',377,35),(3148,'Sahid Matangini',377,35),(3149,'Nanda Kumar',377,35),(3150,'Mahisadal',377,35),(3151,'Moyna',377,35),(3152,'Potashpur - I',377,35),(3153,'Potashpur - Ii',377,35),(3154,'Bhagawanpur - Ii',377,35),(3155,'Bhagawanpur - I',377,35),(3156,'Chandipur',377,35),(3157,'Sutahata',377,35),(3158,'Haldia',377,35),(3159,'Nandigram - I',377,35),(3160,'Nandigram - Ii',377,35),(3161,'Khejuri - I',377,35),(3162,'Khejuri - Ii',377,35),(3163,'Contai - I',377,35),(3164,'Deshopran',377,35),(3165,'Contai - Iii',377,35),(3166,'Egra - I',377,35),(3167,'Egra - Ii',377,35),(3168,'Ramnagar - I',377,35),(3169,'Ramnagar - Ii',377,35),(3170,'Kharaundhi',387,16),(3171,'Bhawnathpur',387,16),(3172,'Ketar*',387,16),(3173,'Kandi',387,16),(3174,'Majhiaon',387,16),(3175,'Bardiha',387,16),(3176,'Ramna',387,16),(3177,'Bishunpura',387,16),(3178,'Nagaruntari',387,16),(3179,'Dhurki',387,16),(3180,'Sagma',387,16),(3181,'Dandai',387,16),(3182,'Chinia',387,16),(3183,'Meral (Pipra Kalan)',387,16),(3184,'Garhwa',387,16),(3185,'Danda',387,16),(3186,'Ranka',387,16),(3187,'Ramkanda',387,16),(3188,'Bhandaria',387,16),(3189,'Shaligram Ram Narayanpur(Hunterganj)',382,16),(3190,'Pratappur',382,16),(3191,'Kunda',382,16),(3192,'Lawalaung',382,16),(3193,'Chatra',382,16),(3194,'Kanha Chatti',382,16),(3195,'Itkhori',382,16),(3196,'Mayur Hand',382,16),(3197,'Gidhaur',382,16),(3198,'Pathalgora',382,16),(3199,'Simaria',382,16),(3200,'Tandwa',382,16),(3201,'Satgawan',394,16),(3202,'Kodarma',394,16),(3203,'Domchanch',394,16),(3204,'Jainagar',394,16),(3205,'Chandwara',394,16),(3206,'Markacho',394,16),(3207,'Gawan',388,16),(3208,'Tisri',388,16),(3209,'Deori',388,16),(3210,'Dhanwar',388,16),(3211,'Jamua',388,16),(3212,'Bengabad',388,16),(3213,'Gande',388,16),(3214,'Giridih',388,16),(3215,'Birni',388,16),(3216,'Bagodar',388,16),(3217,'Sariya',388,16),(3218,'Dumri',388,16),(3219,'Pirtanr',388,16),(3220,'Deoghar',383,16),(3221,'Mohanpur',383,16),(3222,'Sarwan',383,16),(3223,'Sona Rai Tharhi',383,16),(3224,'Devipur',383,16),(3225,'Madhupur',383,16),(3226,'Margo Munda',383,16),(3227,'Karon',383,16),(3228,'Sarath',383,16),(3229,'Palojori',383,16),(3230,'Meherma',389,16),(3231,'Thakurgangti',389,16),(3232,'Boarijor',389,16),(3233,'Mahagama',389,16),(3234,'Pathargama',389,16),(3235,'Bashant Rai*',389,16),(3236,'Godda',389,16),(3237,'Poreyahat',389,16),(3238,'Sundarpahari',389,16),(3239,'Sahibganj',401,16),(3240,'Mandro',401,16),(3241,'Borio',401,16),(3242,'Barhait',401,16),(3243,'Taljhari',401,16),(3244,'Rajmahal',401,16),(3245,'Udhwa',401,16),(3246,'Pathna',401,16),(3247,'Barharwa',401,16),(3248,'Litipara',397,16),(3249,'Amrapara',397,16),(3250,'Hiranpur',397,16),(3251,'Pakaur',397,16),(3252,'Maheshpur',397,16),(3253,'Pakuria',397,16),(3254,'Tundi',384,16),(3255,'Purbi Tundi*',384,16),(3256,'Topchanchi',384,16),(3257,'Baghmara-Cum-Katras',384,16),(3258,'Gobindpur',384,16),(3259,'Dhanbad-Cum-Kenduadih-Cum-Jagata',384,16),(3260,'Jharia-Cum-Jorapokhar-Cum-Sindri',384,16),(3261,'Baliapur',384,16),(3262,'Nirsa-Cum-Chirkunda',384,16),(3263,'Nawadih',381,16),(3264,'Chandrapura',381,16),(3265,'Bermo',381,16),(3266,'Gumia',381,16),(3267,'Peterwar',381,16),(3268,'Kasmar',381,16),(3269,'Jaridih',381,16),(3270,'Chas',381,16),(3271,'Chandankiyari',381,16),(3272,'Kisko',396,16),(3273,'Peshrar',396,16),(3274,'Kuru',396,16),(3275,'Kairo',396,16),(3276,'Lohardaga',396,16),(3277,'Senha',396,16),(3278,'Bhandra',396,16),(3279,'Patamda',386,16),(3280,'Boram',386,16),(3281,'Golmuri-Cum-Jugsalai',386,16),(3282,'Ghatshila',386,16),(3283,'Potka',386,16),(3284,'Musabani',386,16),(3285,'Dumaria',386,16),(3286,'Dhalbhumgarh',386,16),(3287,'Gurbandha',386,16),(3288,'Chakulia',386,16),(3289,'Baharagora',386,16),(3290,'Hussainabad',398,16),(3291,'Haidernagar',398,16),(3292,'Mohammad Ganj',398,16),(3293,'Hariharganj',398,16),(3294,'Pipra',398,16),(3295,'Chhatarpur',398,16),(3296,'Nawadiha Bazar/Nawadiha*',398,16),(3297,'Pandu',398,16),(3298,'Untari Road',398,16),(3299,'Bishrampur',398,16),(3300,'Nawa Bazar',398,16),(3301,'Patan',398,16),(3302,'Padwa',398,16),(3303,'Manatu',398,16),(3304,'Tarhasi',398,16),(3305,'Panki',398,16),(3306,'Satbarwa',398,16),(3307,'Nilambar-Pitambarpur(Lesliganj)',398,16),(3308,'Medininagar(Daltonganj)',398,16),(3309,'Chainpur',398,16),(3310,'Manika',395,16),(3311,'Barwadih',395,16),(3312,'Mahuadanr',395,16),(3313,'Garu',395,16),(3314,'Latehar',395,16),(3315,'Balumath',395,16),(3316,'Bariyatu',395,16),(3317,'Herhanj',395,16),(3318,'Chandwa',395,16),(3319,'Chauparan',391,16),(3320,'Barhi',391,16),(3321,'Padma',391,16),(3322,'Ichak',391,16),(3323,'Tati Jhariya',391,16),(3324,'Daru',391,16),(3325,'Barkatha',391,16),(3326,'Chalkusa',391,16),(3327,'Bishungarh',391,16),(3328,'Hazaribag',391,16),(3329,'Katkamsandi',391,16),(3330,'Katamdag',391,16),(3331,'Keredari',391,16),(3332,'Barkagaon',391,16),(3333,'Churchu',391,16),(3334,'Dadi',391,16),(3335,'Patratu',399,16),(3336,'Mandu',399,16),(3337,'Ramgarh',399,16),(3338,'Dulmi',399,16),(3339,'Chitarpur',399,16),(3340,'Gola',399,16),(3341,'Saraiyahat',385,16),(3342,'Jarmundi',385,16),(3343,'Ramgarh',385,16),(3344,'Gopikandar',385,16),(3345,'Kathikund',385,16),(3346,'Shikaripara',385,16),(3347,'Ranishwar',385,16),(3348,'Dumka',385,16),(3349,'Jama',385,16),(3350,'Masalia',385,16),(3351,'Narayanpur',392,16),(3352,'Karma Tanr Vidyasagar*',392,16),(3353,'Jamtara',392,16),(3354,'Nala',392,16),(3355,'Fatehpur',392,16),(3356,'Kundhit',392,16),(3357,'Burmu',400,16),(3358,'Khelari',400,16),(3359,'Kanke',400,16),(3360,'Ormanjhi',400,16),(3361,'Angara',400,16),(3362,'Rahe',400,16),(3363,'Silli',400,16),(3364,'Sonahatu',400,16),(3365,'Namkum',400,16),(3366,'Ratu',400,16),(3367,'Nagri',400,16),(3368,'Mandar',400,16),(3369,'Chanho',400,16),(3370,'Bero',400,16),(3371,'Itki',400,16),(3372,'Lapung',400,16),(3373,'Bundu',400,16),(3374,'Tamar I',400,16),(3375,'Karra',393,16),(3376,'Torpa',393,16),(3377,'Rania',393,16),(3378,'Murhu',393,16),(3379,'Khunti',393,16),(3380,'Erki(Tamar Ii)',393,16),(3381,'Bishunpur',390,16),(3382,'Ghaghra',390,16),(3383,'Sisai',390,16),(3384,'Verno',390,16),(3385,'Kamdara',390,16),(3386,'Basia',390,16),(3387,'Gumla',390,16),(3388,'Chainpur',390,16),(3389,'Dumri',390,16),(3390,'Albert Ekka(Jari)',390,16),(3391,'Raidih',390,16),(3392,'Palkot',390,16),(3393,'Simdega',403,16),(3394,'Pakar Tanr',403,16),(3395,'Kurdeg',403,16),(3396,'Kersai',403,16),(3397,'Bolba',403,16),(3398,'Thethaitangar',403,16),(3399,'Kolebira',403,16),(3400,'Jaldega',403,16),(3401,'Bansjor',403,16),(3402,'Bano',403,16),(3403,'Sonua',404,16),(3404,'Gudri',404,16),(3405,'Bandgaon',404,16),(3406,'Chakradharpur',404,16),(3407,'Khuntpani',404,16),(3408,'Goilkera',404,16),(3409,'Anandpur',404,16),(3410,'Manoharpur',404,16),(3411,'Noamundi',404,16),(3412,'Tonto',404,16),(3413,'Hat Gamharia',404,16),(3414,'Chaibasa',404,16),(3415,'Tantnagar',404,16),(3416,'Manjhari',404,16),(3417,'Jhinkpani',404,16),(3418,'Jagannathpur',404,16),(3419,'Kumardungi',404,16),(3420,'Majhgaon',404,16),(3421,'Kuchai',402,16),(3422,'Kharsawan',402,16),(3423,'Chandil',402,16),(3424,'Ichagarh',402,16),(3425,'Kukru',402,16),(3426,'Nimdih',402,16),(3427,'Adityapur(Gamharia)',402,16),(3428,'Saraikela',402,16),(3429,'Gobindpur(Rajnagar)',402,16),(3430,'Paikamal',408,26),(3431,'Jharbandha',408,26),(3432,'Padmapur',408,26),(3433,'Burdenp.S.',408,26),(3434,'Gaisilet',408,26),(3435,'Melchhamunda',408,26),(3436,'Sohela',408,26),(3437,'Bijepur',408,26),(3438,'Barapali',408,26),(3439,'Bheden',408,26),(3440,'Bargarh',408,26),(3441,'Bargarh Sadar',408,26),(3442,'Bhatli',408,26),(3443,'Ambabhona',408,26),(3444,'Attabira',408,26),(3445,'Rengali',418,26),(3446,'Lakhanpur',418,26),(3447,'Belpahar',418,26),(3448,'Banaharapali',418,26),(3449,'Orient',418,26),(3450,'Brajarajnagar',418,26),(3451,'Jharsuguda',418,26),(3452,'Badmal',418,26),(3453,'Laikera',418,26),(3454,'Kolabira',418,26),(3455,'Govindpur',432,26),(3456,'Mahulpalli',432,26),(3457,'Kochinda',432,26),(3458,'Katarbaga',432,26),(3459,'Thelkoloi',432,26),(3460,'Rengali',432,26),(3461,'Sasan',432,26),(3462,'Hirakud',432,26),(3463,'Burla',432,26),(3464,'Dhanupali',432,26),(3465,'Ainthapali',432,26),(3466,'Sadar',432,26),(3467,'Jamankira',432,26),(3468,'Kisinda',432,26),(3469,'Jujomura',432,26),(3470,'Dhama',432,26),(3471,'Charamal',432,26),(3472,'Rairakhol',432,26),(3473,'Naktideul',432,26),(3474,'Sambalpur (M)',432,26),(3475,'Debagarh',412,26),(3476,'Barkot',412,26),(3477,'Kundheigola',412,26),(3478,'Reamal',412,26),(3479,'Hemgir',434,26),(3480,'Lephripara',434,26),(3481,'Bhasma',434,26),(3482,'Dharuadihi',434,26),(3483,'Sundargarh Town',434,26),(3484,'Sundargarh',434,26),(3485,'Kinjirkela',434,26),(3486,'Talasara',434,26),(3487,'Baragaon',434,26),(3488,'Kutra',434,26),(3489,'Rajagangapur',434,26),(3490,'Raiboga',434,26),(3491,'Biramitrapur',434,26),(3492,'Hatibari',434,26),(3493,'Bisra',434,26),(3494,'Bondamunda',434,26),(3495,'Brahmani Tarang',434,26),(3496,'Raghunathapali',434,26),(3497,'Tangarapali',434,26),(3498,'Lathikata',434,26),(3499,'Chandiposh',434,26),(3500,'Kamarposh Balang',434,26),(3501,'Koida',434,26),(3502,'Lahunipara',434,26),(3503,'Gurundia',434,26),(3504,'Tikaetpali',434,26),(3505,'Banei',434,26),(3506,'Mahulapada',434,26),(3507,'Raurkela (M)',434,26),(3508,'Raurkela (Its)P.S.',434,26),(3509,'Barbil',422,26),(3510,'Bolani',422,26),(3511,'Rugudi',422,26),(3512,'Joda',422,26),(3513,'Bamebari',422,26),(3514,'Champua',422,26),(3515,'Jhumpura',422,26),(3516,'Baria',422,26),(3517,'Turumunga',422,26),(3518,'Patana',422,26),(3519,'Kendujhar Sadar',422,26),(3520,'Kendujhar Town',422,26),(3521,'Nayakote',422,26),(3522,'Kanjipani',422,26),(3523,'Telkoi',422,26),(3524,'Pandapara',422,26),(3525,'Ghatgaon',422,26),(3526,'Harichandanpur',422,26),(3527,'Daitari',422,26),(3528,'Ghasipura',422,26),(3529,'Anandapur',422,26),(3530,'Soso',422,26),(3531,'Nandipada',422,26),(3532,'Sainkul',422,26),(3533,'Tiring',426,26),(3534,'Bahalda',426,26),(3535,'Jamda',426,26),(3536,'Rairangpur Town',426,26),(3537,'Gorumahisani',426,26),(3538,'Jharpokharia',426,26),(3539,'Bisoi',426,26),(3540,'Rairangpur',426,26),(3541,'Badampahar',426,26),(3542,'Jashipur',426,26),(3543,'Raruan',426,26),(3544,'Ghagarbeda',426,26),(3545,'Karanjia',426,26),(3546,'Thakurmunda',426,26),(3547,'Baripada Sadar',426,26),(3548,'Baripada Town',426,26),(3549,'Koliana',426,26),(3550,'Bangiriposi',426,26),(3551,'Chandua',426,26),(3552,'Suliapada',426,26),(3553,'Muruda',426,26),(3554,'Rasagobindapur',426,26),(3555,'Baisinga',426,26),(3556,'Betanati',426,26),(3557,'Barsahi',426,26),(3558,'Khunta',426,26),(3559,'Udala',426,26),(3560,'Kaptipada',426,26),(3561,'Sharata',426,26),(3562,'Mahuldiha',426,26),(3563,'Baripada (M)',426,26),(3564,'Raibania',407,26),(3565,'Jaleswar',407,26),(3566,'Bhograi',407,26),(3567,'Kamarda',407,26),(3568,'Baliapal',407,26),(3569,'Singla',407,26),(3570,'Basta',407,26),(3571,'Rupsa',407,26),(3572,'Baleshwar Sadar',407,26),(3573,'Sahadevkhunta',407,26),(3574,'Chandipur',407,26),(3575,'Balaramgadi Marine',407,26),(3576,'Bampada',407,26),(3577,'Remuna',407,26),(3578,'Nilagiri',407,26),(3579,'Berhampur',407,26),(3580,'Oupada',407,26),(3581,'Khaira',407,26),(3582,'Soro',407,26),(3583,'Similia',407,26),(3584,'Baleshwar (M)',407,26),(3585,'Agarpada',409,26),(3586,'Bant',409,26),(3587,'Bhandari Pokhari',409,26),(3588,'Dhamanagar',409,26),(3589,'Bhadrak Rural',409,26),(3590,'Basudebpur',409,26),(3591,'Naikanidihi',409,26),(3592,'Tihidi',409,26),(3593,'Dhusuri',409,26),(3594,'Chandabali',409,26),(3595,'Bansada',409,26),(3596,'Dhamara Marine',409,26),(3597,'Rajkanika',421,26),(3598,'Rajnagar',421,26),(3599,'Jamboo Marine',421,26),(3600,'Aali',421,26),(3601,'Pattamundai',421,26),(3602,'Kendrapara',421,26),(3603,'Kendrapara Sadar',421,26),(3604,'Nikirai',421,26),(3605,'Derabish',421,26),(3606,'Patkura',421,26),(3607,'Marsaghai',421,26),(3608,'Mahakalapada',421,26),(3609,'Paradip',416,26),(3610,'Paradeep Lock',416,26),(3611,'Kujang',416,26),(3612,'Abhyachandpur',416,26),(3613,'Ersama',416,26),(3614,'Tirtol',416,26),(3615,'Jagatsinghapur',416,26),(3616,'Biridi',416,26),(3617,'Naugaon',416,26),(3618,'Balikuda',416,26),(3619,'Narasinghpur',411,26),(3620,'Kanpur',411,26),(3621,'Badamba',411,26),(3622,'Baidyeswar',411,26),(3623,'Banki',411,26),(3624,'Tigiria',411,26),(3625,'Athagad',411,26),(3626,'Barang',411,26),(3627,'Gurudijhatia',411,26),(3628,'Khuntuni',411,26),(3629,'Choudwar',411,26),(3630,'Tangi',411,26),(3631,'Mahanga',411,26),(3632,'Salepur',411,26),(3633,'Nischintakoili',411,26),(3634,'Nemalo',411,26),(3635,'Kishannagar',411,26),(3636,'Jagatpur',411,26),(3637,'Cuttack Sadar',411,26),(3638,'Kandarpur',411,26),(3639,'C.R.R.I.',411,26),(3640,'Gobindpur',411,26),(3641,'Olatapur',411,26),(3642,'Niali',411,26),(3643,'Cuttack (M.Corp.) P.S',411,26),(3644,'Sukinda',417,26),(3645,'Tomka',417,26),(3646,'Kaliapani',417,26),(3647,'Kalinganagar',417,26),(3648,'Jakhapura',417,26),(3649,'Jajapur Road',417,26),(3650,'Korai',417,26),(3651,'Panikoili',417,26),(3652,'Jajapur',417,26),(3653,'Jajpur Sadar',417,26),(3654,'Dharmasala',417,26),(3655,'Jenapur',417,26),(3656,'Kuakhia',417,26),(3657,'Badachana',417,26),(3658,'Balichandrapur',417,26),(3659,'Binjharpur',417,26),(3660,'Bari - Ramachandrapur',417,26),(3661,'Mangalpur',417,26),(3662,'Parajang',413,26),(3663,'Kamakshyanagar',413,26),(3664,'Kankadahad',413,26),(3665,'Bhuban',413,26),(3666,'Gandia',413,26),(3667,'Nihalprasad',413,26),(3668,'Tumusingha',413,26),(3669,'Motunga',413,26),(3670,'Bhusan Steel Limited',413,26),(3671,'Balimi',413,26),(3672,'Hindol',413,26),(3673,'Rasol',413,26),(3674,'Dhenkanal Sadar',413,26),(3675,'Palalahada',405,26),(3676,'Khamar',405,26),(3677,'Rengali Damsite',405,26),(3678,'Kaniha',405,26),(3679,'N.T.P.C.',405,26),(3680,'Samal Barrage',405,26),(3681,'Talcher Sadar',405,26),(3682,'Colliery',405,26),(3683,'Bikrampur',405,26),(3684,'Nalco',405,26),(3685,'Banarpal',405,26),(3686,'Anugul',405,26),(3687,'Jarapada',405,26),(3688,'Industrial',405,26),(3689,'Chhendipada',405,26),(3690,'Handapa',405,26),(3691,'Kishorenagar',405,26),(3692,'Athmallik',405,26),(3693,'Kiakata',405,26),(3694,'Thakurgarh',405,26),(3695,'Purunakot',405,26),(3696,'Bantala',405,26),(3697,'Gania',428,26),(3698,'Dasapalla',428,26),(3699,'Banigochha',428,26),(3700,'Nuagaon',428,26),(3701,'Khandapada',428,26),(3702,'Fategarh',428,26),(3703,'Nayagarh',428,26),(3704,'Itamati',428,26),(3705,'Nayagarh Sadar',428,26),(3706,'Odagaon',428,26),(3707,'Sarankul',428,26),(3708,'Ranapur',428,26),(3709,'Bolagad',423,26),(3710,'Begunia',423,26),(3711,'Khordha',423,26),(3712,'Khordha Sadar',423,26),(3713,'Chandaka',423,26),(3714,'Nandankanan',423,26),(3715,'Saheednagar',423,26),(3716,'Mancheswar',423,26),(3717,'Balianta',423,26),(3718,'Balipatna',423,26),(3719,'Lingaraj',423,26),(3720,'Airfield (Kapila Prasad)',423,26),(3721,'Uttara P.S',423,26),(3722,'Khandagiri',423,26),(3723,'Tamando',423,26),(3724,'Jatani',423,26),(3725,'Jankia',423,26),(3726,'Nirakarpur',423,26),(3727,'Tangi',423,26),(3728,'Balugaon',423,26),(3729,'Banapur',423,26),(3730,'Bhubaneswar (M.Corp.)',423,26),(3731,'Delanga',430,26),(3732,'Pipili',430,26),(3733,'Nimapada',430,26),(3734,'Kakatpur',430,26),(3735,'Astaranga',430,26),(3736,'Konark',430,26),(3737,'Gop',430,26),(3738,'Ramachandi',430,26),(3739,'Satyabadi',430,26),(3740,'Chandanpur',430,26),(3741,'Sadar',430,26),(3742,'Brahmagiri',430,26),(3743,'Gadisagada',430,26),(3744,'Krushna Prasad',430,26),(3745,'Puri (M)',430,26),(3746,'Tarasingi',415,26),(3747,'Buguda',415,26),(3748,'Jagannath Prasad',415,26),(3749,'Bhanjanagar',415,26),(3750,'Gangapur',415,26),(3751,'Surada',415,26),(3752,'Badagada',415,26),(3753,'Asika',415,26),(3754,'Dharakote',415,26),(3755,'Kabisuryanagar',415,26),(3756,'Polasara',415,26),(3757,'Kodala',415,26),(3758,'Khalikote',415,26),(3759,'Rambha',415,26),(3760,'Chhatrapur',415,26),(3761,'Ganjam',415,26),(3762,'Chamakhandi',415,26),(3763,'Arjyapalli Marine',415,26),(3764,'Purusottampur',415,26),(3765,'Hinjili',415,26),(3766,'Patapur',415,26),(3767,'Seragad',415,26),(3768,'Brahmapur Sadar',415,26),(3769,'Gopalpur',415,26),(3770,'Golanthara',415,26),(3771,'Digapahandi',415,26),(3772,'Nuagaon',415,26),(3773,'Jarada',415,26),(3774,'Brahmapur (M.Corp.)',415,26),(3775,'Ramagiri',415,26),(3776,'Adva',414,26),(3777,'Mohana',414,26),(3778,'R.Udaygiri',414,26),(3779,'Serango',414,26),(3780,'Kashinagara',414,26),(3781,'Parlakhemundi',414,26),(3782,'Gurandi',414,26),(3783,'Rayagada',414,26),(3784,'Garabandha',414,26),(3785,'Gochhapada',420,26),(3786,'Phulabani',420,26),(3787,'Phulabani Town',420,26),(3788,'Khajuripada',420,26),(3789,'G.Udayagiri',420,26),(3790,'Tikabali',420,26),(3791,'Chakapada',420,26),(3792,'Sarangagarh',420,26),(3793,'Phiringia',420,26),(3794,'Baliguda',420,26),(3795,'Nuagaon',420,26),(3796,'Tumudibandha',420,26),(3797,'Belaghar',420,26),(3798,'Kotagarh',420,26),(3799,'Brahmanigaon',420,26),(3800,'Daringbadi',420,26),(3801,'Raikia',420,26),(3802,'Kantamal',410,26),(3803,'Manamunda',410,26),(3804,'Baunsuni',410,26),(3805,'Baudh Sadar',410,26),(3806,'Puruna Katak',410,26),(3807,'Harbhanga',410,26),(3808,'Dunguripali',433,26),(3809,'Rampur',433,26),(3810,'Binika',433,26),(3811,'Ulunda',433,26),(3812,'Biramaharajpur',433,26),(3813,'Subalaya',433,26),(3814,'Sonapur',433,26),(3815,'Tarbha',433,26),(3816,'Loisinga',406,26),(3817,'Balangir',406,26),(3818,'Tushura',406,26),(3819,'Patnagarh',406,26),(3820,'Khaprakhol',406,26),(3821,'Turekela',406,26),(3822,'Belpara',406,26),(3823,'Saintala',406,26),(3824,'Kantabanji',406,26),(3825,'Bangomunda',406,26),(3826,'Sindhekela',406,26),(3827,'Titlagarh',406,26),(3828,'Jonk',429,26),(3829,'Nuapada',429,26),(3830,'Komna',429,26),(3831,'Khariar',429,26),(3832,'Boden',429,26),(3833,'Sinapali',429,26),(3834,'Kesinga',419,26),(3835,'Madanpur Rampur',419,26),(3836,'Narala',419,26),(3837,'Lanjigarh',419,26),(3838,'Biswanathpur',419,26),(3839,'Sadar',419,26),(3840,'Kegaon',419,26),(3841,'Junagarh',419,26),(3842,'Golamunda',419,26),(3843,'Dharamgarh',419,26),(3844,'Kokasara',419,26),(3845,'Jayapatna',419,26),(3846,'Thuamul Rampur',419,26),(3847,'Ambadala',431,26),(3848,'Muniguda',431,26),(3849,'Chandrapur',431,26),(3850,'Bishamakatak',431,26),(3851,'Kalyanasingpur',431,26),(3852,'Kashipur',431,26),(3853,'Andirakanch',431,26),(3854,'Tikiri',431,26),(3855,'Doraguda',431,26),(3856,'Rayagada',431,26),(3857,'Seskhal',431,26),(3858,'Gunupur',431,26),(3859,'Gudari',431,26),(3860,'Padmapur',431,26),(3861,'Puttasing',431,26),(3862,'Raighar',427,26),(3863,'Kundei',427,26),(3864,'Umarkote',427,26),(3865,'Chandahandi',427,26),(3866,'Jharigan',427,26),(3867,'Dabugan',427,26),(3868,'Paparahandi',427,26),(3869,'Kodinga',427,26),(3870,'Kosagumuda',427,26),(3871,'Nabarangapur P.S',427,26),(3872,'Tentulikhunti',427,26),(3873,'Khatiguda',427,26),(3874,'Kotpad',424,26),(3875,'Boriguma',424,26),(3876,'Bhairabsingipur',424,26),(3877,'Dasamantapur',424,26),(3878,'Lakshmipur',424,26),(3879,'Narayanpatana',424,26),(3880,'Bandhugaon',424,26),(3881,'Kakiriguma',424,26),(3882,'Koraput',424,26),(3883,'Koraput Town',424,26),(3884,'Jeypore',424,26),(3885,'Kundura',424,26),(3886,'Boipariguda',424,26),(3887,'Machh Kund',424,26),(3888,'Padua',424,26),(3889,'Nandapur',424,26),(3890,'Similiguda',424,26),(3891,'Sunabeda',424,26),(3892,'Damonjodi',424,26),(3893,'Pottangi',424,26),(3894,'Kotiya',424,26),(3895,'Malkangiri',425,26),(3896,'Mathili',425,26),(3897,'Mudulipada',425,26),(3898,'Chitrakonda',425,26),(3899,'Paparmetla',425,26),(3900,'Jodamba',425,26),(3901,'Orkel',425,26),(3902,'Kalimela',425,26),(3903,'Podia',425,26),(3904,'M.V. 79',425,26),(3905,'Motu',425,26),(3906,'Bharatpur',445,7),(3907,'Baikunthpur',445,7),(3908,'Sonhat',445,7),(3909,'Manendragarh',445,7),(3910,'Khadganva',445,7),(3911,'Ramanujganj',451,7),(3912,'Balrampur',451,7),(3913,'Wadrafnagar',451,7),(3914,'Pratappur',451,7),(3915,'Samri(Kusmi)',451,7),(3916,'Shankargarh',451,7),(3917,'Surajpur',451,7),(3918,'Oudgi',451,7),(3919,'Bhaiyathan',451,7),(3920,'Ramanujnagar',451,7),(3921,'Premnagar',451,7),(3922,'Ambikapur',451,7),(3923,'Lakhanpur',451,7),(3924,'Udaypur',451,7),(3925,'Rajpur',451,7),(3926,'Lundra',451,7),(3927,'Sitapur',451,7),(3928,'Batouli',451,7),(3929,'Mainpat',451,7),(3930,'Bagicha',442,7),(3931,'Kansabel',442,7),(3932,'Jashpur',442,7),(3933,'Manora',442,7),(3934,'Kunkuri',442,7),(3935,'Duldula',442,7),(3936,'Farsabahar',442,7),(3937,'Pathalgaon',442,7),(3938,'Udaipur (Dharamjaigarh)',448,7),(3939,'Lailunga',448,7),(3940,'Gharghoda',448,7),(3941,'Tamnar',448,7),(3942,'Raigarh',448,7),(3943,'Pusour',448,7),(3944,'Kharsia',448,7),(3945,'Sarangarh',448,7),(3946,'Baramkela',448,7),(3947,'Katghora',444,7),(3948,'Poundi-Uproda',444,7),(3949,'Pali',444,7),(3950,'Korba',444,7),(3951,'Kartala',444,7),(3952,'Janjgir',441,7),(3953,'Akaltara',441,7),(3954,'Baloda',441,7),(3955,'Nawagarh',441,7),(3956,'Champa',441,7),(3957,'Sakti',441,7),(3958,'Pamgarh',441,7),(3959,'Dabhra',441,7),(3960,'Malkharoda',441,7),(3961,'Jaijaipur',441,7),(3962,'Pendra Road Gorella',437,7),(3963,'Marwahi',437,7),(3964,'Pendra',437,7),(3965,'Lormi',437,7),(3966,'Kota',437,7),(3967,'Mungeli',437,7),(3968,'Pathariya',437,7),(3969,'Takhatpur',437,7),(3970,'Bilaspur',437,7),(3971,'Masturi',437,7),(3972,'Bilha',437,7),(3973,'Kawardha',443,7),(3974,'Bodla',443,7),(3975,'Sahaspur Lohara',443,7),(3976,'Pandariya',443,7),(3977,'Chhuikhadan',450,7),(3978,'Khairagarh',450,7),(3979,'Dongargarh',450,7),(3980,'Rajnandgaon',450,7),(3981,'Chhuriya',450,7),(3982,'Dongargaon',450,7),(3983,'Mohla',450,7),(3984,'Manpur',450,7),(3985,'Ambagarh',450,7),(3986,'Nawagarh',440,7),(3987,'Bemetara',440,7),(3988,'Saja',440,7),(3989,'Thanakhamria',440,7),(3990,'Berla',440,7),(3991,'Dhamdha',440,7),(3992,'Durg',440,7),(3993,'Patan',440,7),(3994,'Gunderdehi',440,7),(3995,'Dondi Luhara',440,7),(3996,'Balod',440,7),(3997,'Dondi',440,7),(3998,'Gurur',440,7),(3999,'Simga',449,7),(4000,'Bhatapara',449,7),(4001,'Baloda Bazar',449,7),(4002,'Palari',449,7),(4003,'Kasdol',449,7),(4004,'Bilaigarh',449,7),(4005,'Arang',449,7),(4006,'Abhanpur',449,7),(4007,'Raipur',449,7),(4008,'Rajim',449,7),(4009,'Tilda',449,7),(4010,'Bindranavagarh(Gariyaband)',449,7),(4011,'Chhura',449,7),(4012,'Mainpur',449,7),(4013,'Deobhog',449,7),(4014,'Basna',446,7),(4015,'Saraipali',446,7),(4016,'Mahasamund',446,7),(4017,'Pithora',446,7),(4018,'Bagbahra',446,7),(4019,'Kurud',439,7),(4020,'Magarlod',439,7),(4021,'Dhamtari',439,7),(4022,'Nagri',439,7),(4023,'Charama',452,7),(4024,'Bhanupratappur',452,7),(4025,'Durgkondal',452,7),(4026,'Kanker',452,7),(4027,'Narharpur',452,7),(4028,'Antagarh',452,7),(4029,'Pakhanjur',452,7),(4030,'Keskal',435,7),(4031,'Bade Rajpur',435,7),(4032,'Kondagaon',435,7),(4033,'Makdi',435,7),(4034,'Farasgaon',435,7),(4035,'Jagdalpur',435,7),(4036,'Lohandiguda',435,7),(4037,'Bastanar',435,7),(4038,'Bastar',435,7),(4039,'Bakavand',435,7),(4040,'Tokapal',435,7),(4041,'Darbha',435,7),(4042,'Narayanpur',447,7),(4043,'Orchha',447,7),(4044,'Dantewada',438,7),(4045,'Gidam',438,7),(4046,'Katekalyan',438,7),(4047,'Kuakonda',438,7),(4048,'Konta',438,7),(4049,'Chhindgarh',438,7),(4050,'Sukma',438,7),(4051,'Bhopalpattnam',436,7),(4052,'Usur',436,7),(4053,'Bijapur',436,7),(4054,'Bhairamgarh',436,7),(4055,'Vijaypur',495,20),(4056,'Beerpur',495,20),(4057,'Sheopur',495,20),(4058,'Badoda',495,20),(4059,'Karahal',495,20),(4060,'Ambah',481,20),(4061,'Porsa',481,20),(4062,'Morena',481,20),(4063,'Joura',481,20),(4064,'Kailaras',481,20),(4065,'Sabalgarh',481,20),(4066,'Ater',459,20),(4067,'Bhind',459,20),(4068,'Mehgaon',459,20),(4069,'Gormi',459,20),(4070,'Gohad',459,20),(4071,'Ron',459,20),(4072,'Mihona',459,20),(4073,'Lahar',459,20),(4074,'Gwalior (Gird)',470,20),(4075,'Dabra (Pichhore)',470,20),(4076,'Bhitarwar',470,20),(4077,'Chinour',470,20),(4078,'Seondha',465,20),(4079,'Indergarh',465,20),(4080,'Datia',465,20),(4081,'Bhander',465,20),(4082,'Pohri',496,20),(4083,'Shivpuri',496,20),(4084,'Narwar',496,20),(4085,'Karera',496,20),(4086,'Kolaras',496,20),(4087,'Badarwas',496,20),(4088,'Pichhore',496,20),(4089,'Khaniyadhana',496,20),(4090,'Niwari',499,20),(4091,'Orchha',499,20),(4092,'Prithvipur',499,20),(4093,'Jatara',499,20),(4094,'Mohangarh',499,20),(4095,'Palera',499,20),(4096,'Baldeogarh',499,20),(4097,'Khargapur',499,20),(4098,'Tikamgarh',499,20),(4099,'Gaurihar',462,20),(4100,'Laundi',462,20),(4101,'Chandla',462,20),(4102,'Nowgong',462,20),(4103,'Maharajpur',462,20),(4104,'Chhatarpur',462,20),(4105,'Rajnagar',462,20),(4106,'Bada Malhera',462,20),(4107,'Ghuwara',462,20),(4108,'Bijawar',462,20),(4109,'Buxwaha',462,20),(4110,'Ajaigarh',484,20),(4111,'Panna',484,20),(4112,'Devendranagar',484,20),(4113,'Gunnor',484,20),(4114,'Amanganj',484,20),(4115,'Pawai',484,20),(4116,'Shahnagar',484,20),(4117,'Raipura',484,20),(4118,'Bina',489,20),(4119,'Khurai',489,20),(4120,'Malthon',489,20),(4121,'Banda',489,20),(4122,'Shahgarh',489,20),(4123,'Rahatgarh',489,20),(4124,'Sagar',489,20),(4125,'Garhakota',489,20),(4126,'Rehli',489,20),(4127,'Kesli',489,20),(4128,'Deori',489,20),(4129,'Hatta',464,20),(4130,'Patera',464,20),(4131,'Batiyagarh',464,20),(4132,'Patharia',464,20),(4133,'Damoh',464,20),(4134,'Jabera',464,20),(4135,'Tendukheda',464,20),(4136,'Raghurajnagar',490,20),(4137,'Majhgawan',490,20),(4138,'Birsinghpur',490,20),(4139,'Nagod',490,20),(4140,'Unchahara',490,20),(4141,'Rampur Baghelan',490,20),(4142,'Kotar',490,20),(4143,'Amarpatan',490,20),(4144,'Ramnagar',490,20),(4145,'Maihar',490,20),(4146,'Teonthar',488,20),(4147,'Jawa',488,20),(4148,'Sirmour',488,20),(4149,'Mangawan',488,20),(4150,'Semaria',488,20),(4151,'Hanumana',488,20),(4152,'Mauganj',488,20),(4153,'Naigarhi',488,20),(4154,'Huzur',488,20),(4155,'Raipur - Karchuliyan',488,20),(4156,'Gurh',488,20),(4157,'Bandhogarh',501,20),(4158,'Chandia',501,20),(4159,'Manpur',501,20),(4160,'Pali',501,20),(4161,'Nowrozabad',501,20),(4162,'Jawad',483,20),(4163,'Singoli',483,20),(4164,'Neemuch',483,20),(4165,'Jiran',483,20),(4166,'Manasa',483,20),(4167,'Bhanpura',480,20),(4168,'Malhargarh',480,20),(4169,'Garoth',480,20),(4170,'Shamgarh',480,20),(4171,'Mandsaur',480,20),(4172,'Daloda',480,20),(4173,'Sitamau',480,20),(4174,'Suwasara',480,20),(4175,'Piploda',487,20),(4176,'Jaora',487,20),(4177,'Alot',487,20),(4178,'Tal',487,20),(4179,'Sailana',487,20),(4180,'Bajna',487,20),(4181,'Rawti',487,20),(4182,'Ratlam',487,20),(4183,'Khacharod',500,20),(4184,'Nagda',500,20),(4185,'Mahidpur',500,20),(4186,'Ghatiya',500,20),(4187,'Tarana',500,20),(4188,'Ujjain',500,20),(4189,'Badnagar',500,20),(4190,'Susner',494,20),(4191,'Nalkheda',494,20),(4192,'Badod',494,20),(4193,'Agar',494,20),(4194,'Shajapur',494,20),(4195,'Gulana',494,20),(4196,'Moman Badodiya',494,20),(4197,'Shujalpur',494,20),(4198,'Kalapipal',494,20),(4199,'Tonk Khurd',466,20),(4200,'Sonkatch',466,20),(4201,'Dewas',466,20),(4202,'Kannod',466,20),(4203,'Satwas',466,20),(4204,'Bagli',466,20),(4205,'Hatpiplya',466,20),(4206,'Khategaon',466,20),(4207,'Badnawar',467,20),(4208,'Sardarpur',467,20),(4209,'Dhar',467,20),(4210,'Gandhwani',467,20),(4211,'Kukshi',467,20),(4212,'Dahi',467,20),(4213,'Manawar',467,20),(4214,'Dharampuri',467,20),(4215,'Depalpur',473,20),(4216,'Hatod',473,20),(4217,'Sawer',473,20),(4218,'Indore',473,20),(4219,'Mhow',473,20),(4220,'Barwaha',478,20),(4221,'Maheshwar',478,20),(4222,'Kasrawad',478,20),(4223,'Segaon',478,20),(4224,'Bhikangaon',478,20),(4225,'Khargone',478,20),(4226,'Gogaon',478,20),(4227,'Bhagwanpura',478,20),(4228,'Jhiranya',478,20),(4229,'Barwani',457,20),(4230,'Pati',457,20),(4231,'Thikri',457,20),(4232,'Anjad',457,20),(4233,'Rajpur',457,20),(4234,'Pansemal',457,20),(4235,'Niwali',457,20),(4236,'Sendhwa',457,20),(4237,'Varla',457,20),(4238,'Jirapur',486,20),(4239,'Khilchipur',486,20),(4240,'Rajgarh',486,20),(4241,'Biaora',486,20),(4242,'Sarangpur',486,20),(4243,'Narsinghgarh',486,20),(4244,'Pachore',486,20),(4245,'Lateri',502,20),(4246,'Sironj',502,20),(4247,'Kurwai',502,20),(4248,'Basoda',502,20),(4249,'Tyonda',502,20),(4250,'Nateran',502,20),(4251,'Shamshabad',502,20),(4252,'Gyaraspur',502,20),(4253,'Gulabganj',502,20),(4254,'Vidisha',502,20),(4255,'Berasia',460,20),(4256,'Huzur',460,20),(4257,'Sehore',491,20),(4258,'Shyampur',491,20),(4259,'Ashta',491,20),(4260,'Jawar',491,20),(4261,'Ichhawar',491,20),(4262,'Nasrullaganj',491,20),(4263,'Budni',491,20),(4264,'Rehti',491,20),(4265,'Raisen',485,20),(4266,'Gairatganj',485,20),(4267,'Begamganj',485,20),(4268,'Goharganj',485,20),(4269,'Baraily',485,20),(4270,'Badi',485,20),(4271,'Silwani',485,20),(4272,'Udaipura',485,20),(4273,'Bhainsdehi',458,20),(4274,'Athner',458,20),(4275,'Betul',458,20),(4276,'Chicholi',458,20),(4277,'Ghoda Dongri',458,20),(4278,'Shahpur',458,20),(4279,'Multai',458,20),(4280,'Amla',458,20),(4281,'Khirkiya',471,20),(4282,'Sirali',471,20),(4283,'Harda',471,20),(4284,'Handiya',471,20),(4285,'Timarni',471,20),(4286,'Rehatgaon',471,20),(4287,'Seoni-Malwa',472,20),(4288,'Itarsi',472,20),(4289,'Hoshangabad',472,20),(4290,'Dolariya',472,20),(4291,'Babai',472,20),(4292,'Sohagpur',472,20),(4293,'Pipariya',472,20),(4294,'Bankhedi',472,20),(4295,'Murwara',476,20),(4296,'Rithi',476,20),(4297,'Barhi',476,20),(4298,'Badwara',476,20),(4299,'Vijayraghavgarh',476,20),(4300,'Bahoriband',476,20),(4301,'Dhimarkheda',476,20),(4302,'Sihora',474,20),(4303,'Majholi',474,20),(4304,'Patan',474,20),(4305,'Shahpura',474,20),(4306,'Jabalpur',474,20),(4307,'Panagar',474,20),(4308,'Kundam',474,20),(4309,'Gotegaon',482,20),(4310,'Gadarwara',482,20),(4311,'Narsimhapur',482,20),(4312,'Kareli',482,20),(4313,'Tendukheda',482,20),(4314,'Shahpura',468,20),(4315,'Dindori',468,20),(4316,'Niwas',479,20),(4317,'Narayanganj',479,20),(4318,'Mandla',479,20),(4319,'Ghughari',479,20),(4320,'Bichhiya',479,20),(4321,'Nainpur',479,20),(4322,'Tamia',463,20),(4323,'Amarwara',463,20),(4324,'Harrai',463,20),(4325,'Chaurai',463,20),(4326,'Jamai',463,20),(4327,'Parasia',463,20),(4328,'Umreth',463,20),(4329,'Chhindwara',463,20),(4330,'Mohkhed',463,20),(4331,'Sausar',463,20),(4332,'Bichhua',463,20),(4333,'Pandhurna',463,20),(4334,'Lakhnadon',492,20),(4335,'Chhapara',492,20),(4336,'Ghansaur',492,20),(4337,'Dhanora',492,20),(4338,'Keolari',492,20),(4339,'Seoni',492,20),(4340,'Barghat',492,20),(4341,'Kurai',492,20),(4342,'Katangi',456,20),(4343,'Tirodi',456,20),(4344,'Waraseoni',456,20),(4345,'Khairlanji',456,20),(4346,'Lalbarra',456,20),(4347,'Balaghat',456,20),(4348,'Kirnapur',456,20),(4349,'Baihar',456,20),(4350,'Paraswada',456,20),(4351,'Lanji',456,20),(4352,'Guna',469,20),(4353,'Bamori',469,20),(4354,'Raghogarh',469,20),(4355,'Maksoodangarh',469,20),(4356,'Kumbhraj',469,20),(4357,'Aron',469,20),(4358,'Chachaura',469,20),(4359,'Isagarh',455,20),(4360,'Chanderi',455,20),(4361,'Ashoknagar',455,20),(4362,'Shadhora',455,20),(4363,'Mungaoli',455,20),(4364,'Beohari',493,20),(4365,'Jaisinghnagar',493,20),(4366,'Sohagpur',493,20),(4367,'Jaitpur',493,20),(4368,'Kotma',454,20),(4369,'Anuppur',454,20),(4370,'Jaithari',454,20),(4371,'Pushparajgarh',454,20),(4372,'Rampur Naikin',497,20),(4373,'Churhat',497,20),(4374,'Gopadbanas',497,20),(4375,'Sihawal',497,20),(4376,'Majhauli',497,20),(4377,'Kusmi',497,20),(4378,'Chitrangi',498,20),(4379,'Deosar',498,20),(4380,'Singrauli',498,20),(4381,'Thandla',475,20),(4382,'Petlawad',475,20),(4383,'Meghnagar',475,20),(4384,'Jhabua',475,20),(4385,'Ranapur',475,20),(4386,'Bhavra',453,20),(4387,'Jobat',453,20),(4388,'Alirajpur',453,20),(4389,'Harsud',477,20),(4390,'Khalwa',477,20),(4391,'Khandwa',477,20),(4392,'Punasa',477,20),(4393,'Pandhana',477,20),(4394,'Burhanpur',461,20),(4395,'Khaknar',461,20),(4396,'Nepanagar',461,20),(4397,'Lakhpat',513,12),(4398,'Rapar',513,12),(4399,'Bhachau',513,12),(4400,'Anjar',513,12),(4401,'Bhuj',513,12),(4402,'Nakhatrana',513,12),(4403,'Abdasa',513,12),(4404,'Mandvi',513,12),(4405,'Mundra',513,12),(4406,'Gandhidham',513,12),(4407,'Vav',506,12),(4408,'Tharad',506,12),(4409,'Dhanera',506,12),(4410,'Dantiwada',506,12),(4411,'Amirgadh',506,12),(4412,'Danta',506,12),(4413,'Vadgam',506,12),(4414,'Palanpur',506,12),(4415,'Deesa',506,12),(4416,'Deodar',506,12),(4417,'Bhabhar',506,12),(4418,'Kankrej',506,12),(4419,'Santalpur',519,12),(4420,'Radhanpur',519,12),(4421,'Sidhpur',519,12),(4422,'Patan',519,12),(4423,'Harij',519,12),(4424,'Sami',519,12),(4425,'Chanasma',519,12),(4426,'Satlasana',515,12),(4427,'Kheralu',515,12),(4428,'Unjha',515,12),(4429,'Visnagar',515,12),(4430,'Vadnagar',515,12),(4431,'Vijapur',515,12),(4432,'Mahesana',515,12),(4433,'Becharaji',515,12),(4434,'Kadi',515,12),(4435,'Khedbrahma',522,12),(4436,'Vijaynagar',522,12),(4437,'Vadali',522,12),(4438,'Idar',522,12),(4439,'Bhiloda',522,12),(4440,'Meghraj',522,12),(4441,'Himatnagar',522,12),(4442,'Prantij',522,12),(4443,'Talod',522,12),(4444,'Modasa',522,12),(4445,'Dhansura',522,12),(4446,'Malpur',522,12),(4447,'Bayad',522,12),(4448,'Kalol',510,12),(4449,'Mansa',510,12),(4450,'Gandhinagar',510,12),(4451,'Dehgam',510,12),(4452,'Mandal',503,12),(4453,'Detroj-Rampura',503,12),(4454,'Viramgam',503,12),(4455,'Sanand',503,12),(4456,'Ahmadabad City',503,12),(4457,'Daskroi',503,12),(4458,'Dholka',503,12),(4459,'Bavla',503,12),(4460,'Ranpur',503,12),(4461,'Barwala',503,12),(4462,'Dhandhuka',503,12),(4463,'Halvad',524,12),(4464,'Dhrangadhra',524,12),(4465,'Dasada',524,12),(4466,'Lakhtar',524,12),(4467,'Wadhwan',524,12),(4468,'Muli',524,12),(4469,'Chotila',524,12),(4470,'Sayla',524,12),(4471,'Chuda',524,12),(4472,'Limbdi',524,12),(4473,'Maliya',521,12),(4474,'Morvi',521,12),(4475,'Tankara',521,12),(4476,'Wankaner',521,12),(4477,'Paddhari',521,12),(4478,'Rajkot',521,12),(4479,'Lodhika',521,12),(4480,'Kotda Sangani',521,12),(4481,'Jasdan',521,12),(4482,'Gondal',521,12),(4483,'Jamkandorna',521,12),(4484,'Upleta',521,12),(4485,'Dhoraji',521,12),(4486,'Jetpur',521,12),(4487,'Okhamandal',511,12),(4488,'Khambhalia',511,12),(4489,'Jamnagar',511,12),(4490,'Jodiya',511,12),(4491,'Dhrol',511,12),(4492,'Kalavad',511,12),(4493,'Lalpur',511,12),(4494,'Kalyanpur',511,12),(4495,'Bhanvad',511,12),(4496,'Jamjodhpur',511,12),(4497,'Porbandar',520,12),(4498,'Ranavav',520,12),(4499,'Kutiyana',520,12),(4500,'Manavadar',512,12),(4501,'Vanthali',512,12),(4502,'Junagadh',512,12),(4503,'Bhesan',512,12),(4504,'Visavadar',512,12),(4505,'Mendarda',512,12),(4506,'Keshod',512,12),(4507,'Mangrol',512,12),(4508,'Malia',512,12),(4509,'Talala',512,12),(4510,'Patan-Veraval',512,12),(4511,'Sutrapada',512,12),(4512,'Kodinar',512,12),(4513,'Una',512,12),(4514,'Kunkavav Vadia',504,12),(4515,'Babra',504,12),(4516,'Lathi',504,12),(4517,'Lilia',504,12),(4518,'Amreli',504,12),(4519,'Bagasara',504,12),(4520,'Dhari',504,12),(4521,'Savar Kundla',504,12),(4522,'Khambha',504,12),(4523,'Jafrabad',504,12),(4524,'Rajula',504,12),(4525,'Botad',508,12),(4526,'Vallabhipur',508,12),(4527,'Gadhada',508,12),(4528,'Umrala',508,12),(4529,'Bhavnagar',508,12),(4530,'Ghogha',508,12),(4531,'Sihor',508,12),(4532,'Gariadhar',508,12),(4533,'Palitana',508,12),(4534,'Talaja',508,12),(4535,'Mahuva',508,12),(4536,'Tarapur',505,12),(4537,'Sojitra',505,12),(4538,'Umreth',505,12),(4539,'Anand',505,12),(4540,'Petlad',505,12),(4541,'Khambhat',505,12),(4542,'Borsad',505,12),(4543,'Anklav',505,12),(4544,'Kapadvanj',514,12),(4545,'Virpur',514,12),(4546,'Balasinor',514,12),(4547,'Kathlal',514,12),(4548,'Mehmedabad',514,12),(4549,'Kheda',514,12),(4550,'Matar',514,12),(4551,'Nadiad',514,12),(4552,'Mahudha',514,12),(4553,'Thasra',514,12),(4554,'Khanpur',518,12),(4555,'Kadana',518,12),(4556,'Santrampur',518,12),(4557,'Lunawada',518,12),(4558,'Shehera',518,12),(4559,'Morwa (Hadaf)',518,12),(4560,'Godhra',518,12),(4561,'Kalol',518,12),(4562,'Ghoghamba',518,12),(4563,'Halol',518,12),(4564,'Jambughoda',518,12),(4565,'Fatepura',509,12),(4566,'Jhalod',509,12),(4567,'Limkheda',509,12),(4568,'Dohad',509,12),(4569,'Garbada',509,12),(4570,'Devgadbaria',509,12),(4571,'Dhanpur',509,12),(4572,'Savli',527,12),(4573,'Vadodara',527,12),(4574,'Vaghodia',527,12),(4575,'Jetpur Pavi',527,12),(4576,'Chhota Udaipur',527,12),(4577,'Kavant',527,12),(4578,'Nasvadi',527,12),(4579,'Sankheda',527,12),(4580,'Dabhoi',527,12),(4581,'Padra',527,12),(4582,'Karjan',527,12),(4583,'Sinor',527,12),(4584,'Tilakwada',516,12),(4585,'Nandod',516,12),(4586,'Dediapada',516,12),(4587,'Sagbara',516,12),(4588,'Jambusar',507,12),(4589,'Amod',507,12),(4590,'Vagra',507,12),(4591,'Bharuch',507,12),(4592,'Jhagadia',507,12),(4593,'Anklesvar',507,12),(4594,'Hansot',507,12),(4595,'Valia',507,12),(4596,'The Dangs',526,12),(4597,'Navsari',517,12),(4598,'Jalalpore',517,12),(4599,'Gandevi',517,12),(4600,'Chikhli',517,12),(4601,'Bansda',517,12),(4602,'Valsad',528,12),(4603,'Dharampur',528,12),(4604,'Pardi',528,12),(4605,'Kaprada',528,12),(4606,'Umbergaon',528,12),(4607,'Olpad',523,12),(4608,'Mangrol',523,12),(4609,'Umarpada',523,12),(4610,'Mandvi',523,12),(4611,'Kamrej',523,12),(4612,'Surat City',523,12),(4613,'Chorasi',523,12),(4614,'Palsana',523,12),(4615,'Bardoli',523,12),(4616,'Mahuva',523,12),(4617,'Nizar',525,12),(4618,'Uchchhal',525,12),(4619,'Songadh',525,12),(4620,'Vyara',525,12),(4621,'Valod',525,12),(4622,'Diu',530,9),(4623,'Daman',529,9),(4624,'Dadra & Nagar Haveli',531,8),(4625,'Akkalkuwa',552,21),(4626,'Akrani',552,21),(4627,'Talode',552,21),(4628,'Shahade',552,21),(4629,'Nandurbar',552,21),(4630,'Nawapur',552,21),(4631,'Shirpur',540,21),(4632,'Sindkhede',540,21),(4633,'Sakri',540,21),(4634,'Dhule',540,21),(4635,'Chopda',544,21),(4636,'Yawal',544,21),(4637,'Raver',544,21),(4638,'Muktainagar',544,21),(4639,'Bodvad',544,21),(4640,'Bhusawal',544,21),(4641,'Jalgaon',544,21),(4642,'Erandol',544,21),(4643,'Dharangaon',544,21),(4644,'Amalner',544,21),(4645,'Parola',544,21),(4646,'Bhadgaon',544,21),(4647,'Chalisgaon',544,21),(4648,'Pachora',544,21),(4649,'Jamner',544,21),(4650,'Jalgaon (Jamod)',538,21),(4651,'Sangrampur',538,21),(4652,'Shegaon',538,21),(4653,'Nandura',538,21),(4654,'Malkapur',538,21),(4655,'Motala',538,21),(4656,'Khamgaon',538,21),(4657,'Mehkar',538,21),(4658,'Chikhli',538,21),(4659,'Buldana',538,21),(4660,'Deolgaon Raja',538,21),(4661,'Sindkhed Raja',538,21),(4662,'Lonar',538,21),(4663,'Telhara',533,21),(4664,'Akot',533,21),(4665,'Balapur',533,21),(4666,'Akola',533,21),(4667,'Murtijapur',533,21),(4668,'Patur',533,21),(4669,'Barshitakli',533,21),(4670,'Malegaon',565,21),(4671,'Mangrulpir',565,21),(4672,'Karanja',565,21),(4673,'Manora',565,21),(4674,'Washim',565,21),(4675,'Risod',565,21),(4676,'Dharni',534,21),(4677,'Chikhaldara',534,21),(4678,'Anjangaon Surji',534,21),(4679,'Achalpur',534,21),(4680,'Chandurbazar',534,21),(4681,'Morshi',534,21),(4682,'Warud',534,21),(4683,'Teosa',534,21),(4684,'Amravati',534,21),(4685,'Bhatkuli',534,21),(4686,'Daryapur',534,21),(4687,'Nandgaon-Khandeshwar',534,21),(4688,'Chandur Railway',534,21),(4689,'Dhamangaon Railway',534,21),(4690,'Ashti',564,21),(4691,'Karanja',564,21),(4692,'Arvi',564,21),(4693,'Seloo',564,21),(4694,'Wardha',564,21),(4695,'Deoli',564,21),(4696,'Hinganghat',564,21),(4697,'Samudrapur',564,21),(4698,'Narkhed',550,21),(4699,'Katol',550,21),(4700,'Kalameshwar',550,21),(4701,'Savner',550,21),(4702,'Parseoni',550,21),(4703,'Ramtek',550,21),(4704,'Mauda',550,21),(4705,'Kamptee',550,21),(4706,'Nagpur (Rural)',550,21),(4707,'Nagpur (Urban)',550,21),(4708,'Hingna',550,21),(4709,'Umred',550,21),(4710,'Kuhi',550,21),(4711,'Bhiwapur',550,21),(4712,'Tumsar',537,21),(4713,'Mohadi',537,21),(4714,'Bhandara',537,21),(4715,'Sakoli',537,21),(4716,'Lakhani',537,21),(4717,'Pauni',537,21),(4718,'Lakhandur',537,21),(4719,'Tirora',542,21),(4720,'Goregaon',542,21),(4721,'Gondiya',542,21),(4722,'Amgaon',542,21),(4723,'Salekasa',542,21),(4724,'Sadak-Arjuni',542,21),(4725,'Arjuni Morgaon',542,21),(4726,'Deori',542,21),(4727,'Desaiganj (Vadasa)',541,21),(4728,'Armori',541,21),(4729,'Kurkheda',541,21),(4730,'Korchi',541,21),(4731,'Dhanora',541,21),(4732,'Gadchiroli',541,21),(4733,'Chamorshi',541,21),(4734,'Mulchera',541,21),(4735,'Etapalli',541,21),(4736,'Bhamragad',541,21),(4737,'Aheri',541,21),(4738,'Sironcha',541,21),(4739,'Warora',539,21),(4740,'Chimur',539,21),(4741,'Nagbhir',539,21),(4742,'Brahmapuri',539,21),(4743,'Sawali',539,21),(4744,'Sindewahi',539,21),(4745,'Bhadravati',539,21),(4746,'Chandrapur',539,21),(4747,'Mul',539,21),(4748,'Pombhurna',539,21),(4749,'Ballarpur',539,21),(4750,'Korpana',539,21),(4751,'Jiwati',539,21),(4752,'Rajura',539,21),(4753,'Gondpipri',539,21),(4754,'Ner',566,21),(4755,'Babulgaon',566,21),(4756,'Kalamb',566,21),(4757,'Yavatmal',566,21),(4758,'Darwha',566,21),(4759,'Digras',566,21),(4760,'Pusad',566,21),(4761,'Umarkhed',566,21),(4762,'Mahagaon',566,21),(4763,'Arni',566,21),(4764,'Ghatanji',566,21),(4765,'Kelapur',566,21),(4766,'Ralegaon',566,21),(4767,'Maregaon',566,21),(4768,'Zari-Jamani',566,21),(4769,'Wani',566,21),(4770,'Mahoor',551,21),(4771,'Kinwat',551,21),(4772,'Himayatnagar',551,21),(4773,'Hadgaon',551,21),(4774,'Ardhapur',551,21),(4775,'Nanded',551,21),(4776,'Mudkhed',551,21),(4777,'Bhokar',551,21),(4778,'Umri',551,21),(4779,'Dharmabad',551,21),(4780,'Biloli',551,21),(4781,'Naigaon (Khairgaon)',551,21),(4782,'Loha',551,21),(4783,'Kandhar',551,21),(4784,'Mukhed',551,21),(4785,'Deglur',551,21),(4786,'Sengaon',543,21),(4787,'Hingoli',543,21),(4788,'Aundha (Nagnath)',543,21),(4789,'Kalamnuri',543,21),(4790,'Basmath',543,21),(4791,'Sailu',555,21),(4792,'Jintur',555,21),(4793,'Parbhani',555,21),(4794,'Manwath',555,21),(4795,'Pathri',555,21),(4796,'Sonpeth',555,21),(4797,'Gangakhed',555,21),(4798,'Palam',555,21),(4799,'Purna',555,21),(4800,'Bhokardan',545,21),(4801,'Jafferabad',545,21),(4802,'Jalna',545,21),(4803,'Badnapur',545,21),(4804,'Ambad',545,21),(4805,'Ghansawangi',545,21),(4806,'Partur',545,21),(4807,'Mantha',545,21),(4808,'Kannad',535,21),(4809,'Soegaon',535,21),(4810,'Sillod',535,21),(4811,'Phulambri',535,21),(4812,'Aurangabad',535,21),(4813,'Khuldabad',535,21),(4814,'Vaijapur',535,21),(4815,'Gangapur',535,21),(4816,'Paithan',535,21),(4817,'Surgana',553,21),(4818,'Kalwan',553,21),(4819,'Deola',553,21),(4820,'Baglan',553,21),(4821,'Malegaon',553,21),(4822,'Nandgaon',553,21),(4823,'Chandvad',553,21),(4824,'Dindori',553,21),(4825,'Peint',553,21),(4826,'Trimbakeshwar',553,21),(4827,'Nashik',553,21),(4828,'Igatpuri',553,21),(4829,'Sinnar',553,21),(4830,'Niphad',553,21),(4831,'Yevla',553,21),(4832,'Talasari',563,21),(4833,'Dahanu',563,21),(4834,'Vikramgad',563,21),(4835,'Jawhar',563,21),(4836,'Mokhada',563,21),(4837,'Vada',563,21),(4838,'Palghar',563,21),(4839,'Vasai',563,21),(4840,'Thane',563,21),(4841,'Bhiwandi',563,21),(4842,'Shahapur',563,21),(4843,'Kalyan',563,21),(4844,'Ulhasnagar',563,21),(4845,'Ambarnath',563,21),(4846,'Murbad',563,21),(4847,'Uran',557,21),(4848,'Panvel',557,21),(4849,'Karjat',557,21),(4850,'Khalapur',557,21),(4851,'Pen',557,21),(4852,'Alibag',557,21),(4853,'Murud',557,21),(4854,'Roha',557,21),(4855,'Sudhagad',557,21),(4856,'Mangaon',557,21),(4857,'Tala',557,21),(4858,'Shrivardhan',557,21),(4859,'Mhasla',557,21),(4860,'Mahad',557,21),(4861,'Poladpur',557,21),(4862,'Junnar',556,21),(4863,'Ambegaon',556,21),(4864,'Shirur',556,21),(4865,'Khed',556,21),(4866,'Mawal',556,21),(4867,'Mulshi',556,21),(4868,'Haveli',556,21),(4869,'Pune City',556,21),(4870,'Daund',556,21),(4871,'Purandhar',556,21),(4872,'Velhe',556,21),(4873,'Bhor',556,21),(4874,'Baramati',556,21),(4875,'Indapur',556,21),(4876,'Akola',532,21),(4877,'Sangamner',532,21),(4878,'Kopargaon',532,21),(4879,'Rahta',532,21),(4880,'Shrirampur',532,21),(4881,'Nevasa',532,21),(4882,'Shevgaon',532,21),(4883,'Pathardi',532,21),(4884,'Nagar',532,21),(4885,'Rahuri',532,21),(4886,'Parner',532,21),(4887,'Shrigonda',532,21),(4888,'Karjat',532,21),(4889,'Jamkhed',532,21),(4890,'Ashti',536,21),(4891,'Patoda',536,21),(4892,'Shirur (Kasar)',536,21),(4893,'Georai',536,21),(4894,'Manjlegaon',536,21),(4895,'Wadwani',536,21),(4896,'Bid',536,21),(4897,'Kaij',536,21),(4898,'Dharur',536,21),(4899,'Parli',536,21),(4900,'Ambejogai',536,21),(4901,'Latur',547,21),(4902,'Renapur',547,21),(4903,'Ahmadpur',547,21),(4904,'Jalkot',547,21),(4905,'Chakur',547,21),(4906,'Shirur-Anantpal',547,21),(4907,'Ausa',547,21),(4908,'Nilanga',547,21),(4909,'Deoni',547,21),(4910,'Udgir',547,21),(4911,'Paranda',554,21),(4912,'Bhum',554,21),(4913,'Washi',554,21),(4914,'Kalamb',554,21),(4915,'Osmanabad',554,21),(4916,'Tuljapur',554,21),(4917,'Lohara',554,21),(4918,'Umarga',554,21),(4919,'Karmala',562,21),(4920,'Madha',562,21),(4921,'Barshi',562,21),(4922,'Solapur North',562,21),(4923,'Mohol',562,21),(4924,'Pandharpur',562,21),(4925,'Malshiras',562,21),(4926,'Sangole',562,21),(4927,'Mangalvedhe',562,21),(4928,'Solapur South',562,21),(4929,'Akkalkot',562,21),(4930,'Mahabaleshwar',560,21),(4931,'Wai',560,21),(4932,'Khandala',560,21),(4933,'Phaltan',560,21),(4934,'Man',560,21),(4935,'Khatav',560,21),(4936,'Koregaon',560,21),(4937,'Satara',560,21),(4938,'Jaoli',560,21),(4939,'Patan',560,21),(4940,'Karad',560,21),(4941,'Mandangad',558,21),(4942,'Dapoli',558,21),(4943,'Khed',558,21),(4944,'Chiplun',558,21),(4945,'Guhagar',558,21),(4946,'Ratnagiri',558,21),(4947,'Sangameshwar',558,21),(4948,'Lanja',558,21),(4949,'Rajapur',558,21),(4950,'Devgad',561,21),(4951,'Vaibhavvadi',561,21),(4952,'Kankavli',561,21),(4953,'Malwan',561,21),(4954,'Vengurla',561,21),(4955,'Kudal',561,21),(4956,'Sawantwadi',561,21),(4957,'Dodamarg',561,21),(4958,'Shahuwadi',546,21),(4959,'Panhala',546,21),(4960,'Hatkanangle',546,21),(4961,'Shirol',546,21),(4962,'Karvir',546,21),(4963,'Bavda',546,21),(4964,'Radhanagari',546,21),(4965,'Kagal',546,21),(4966,'Bhudargad',546,21),(4967,'Ajra',546,21),(4968,'Gadhinglaj',546,21),(4969,'Chandgad',546,21),(4970,'Shirala',559,21),(4971,'Walwa',559,21),(4972,'Palus',559,21),(4973,'Kadegaon',559,21),(4974,'Khanapur (Vita)',559,21),(4975,'Atpadi',559,21),(4976,'Tasgaon',559,21),(4977,'Miraj',559,21),(4978,'Kavathemahankal',559,21),(4979,'Jat',559,21),(4980,'Tamsi',567,2),(4981,'Adilabad',567,2),(4982,'Jainad',567,2),(4983,'Bela',567,2),(4984,'Talamadugu',567,2),(4985,'Gudihathnoor',567,2),(4986,'Inderavelly',567,2),(4987,'Narnoor',567,2),(4988,'Kerameri',567,2),(4989,'Wankdi',567,2),(4990,'Sirpur (T)',567,2),(4991,'Kouthala',567,2),(4992,'Bejjur',567,2),(4993,'Kagaznagar',567,2),(4994,'Asifabad',567,2),(4995,'Jainoor',567,2),(4996,'Utnoor',567,2),(4997,'Ichoda',567,2),(4998,'Bazarhathnoor',567,2),(4999,'Boath',567,2),(5000,'Neradigonda',567,2),(5001,'Sirpur',567,2),(5002,'Rebbana',567,2),(5003,'Bhimini',567,2),(5004,'Dahegaon',567,2),(5005,'Vemanpalle',567,2),(5006,'Nennal',567,2),(5007,'Tandur',567,2),(5008,'Tiryani',567,2),(5009,'Jannaram',567,2),(5010,'Kaddam (Peddur)',567,2),(5011,'Sarangapur',567,2),(5012,'Kuntala',567,2),(5013,'Kubeer',567,2),(5014,'Bhainsa',567,2),(5015,'Tanoor',567,2),(5016,'Mudhole',567,2),(5017,'Lokeswaram',567,2),(5018,'Dilawarpur',567,2),(5019,'Nirmal',567,2),(5020,'Laxmanchanda',567,2),(5021,'Mamda',567,2),(5022,'Khanapur',567,2),(5023,'Dandepalle',567,2),(5024,'Kasipet',567,2),(5025,'Bellampalle',567,2),(5026,'Kotapalle',567,2),(5027,'Mandamarri',567,2),(5028,'Luxettipet',567,2),(5029,'Mancherial',567,2),(5030,'Jaipur',567,2),(5031,'Chennur',567,2),(5032,'Ranjal',582,2),(5033,'Navipet',582,2),(5034,'Nandipet',582,2),(5035,'Armur',582,2),(5036,'Balkonda',582,2),(5037,'Mortad',582,2),(5038,'Kammarpalle',582,2),(5039,'Bheemgal',582,2),(5040,'Velpur',582,2),(5041,'Jakranpalle',582,2),(5042,'Makloor',582,2),(5043,'Nizamabad',582,2),(5044,'Yedpalle',582,2),(5045,'Bodhan',582,2),(5046,'Kotgiri',582,2),(5047,'Madnoor',582,2),(5048,'Jukkal',582,2),(5049,'Bichkunda',582,2),(5050,'Birkoor',582,2),(5051,'Varni',582,2),(5052,'Dichpalle',582,2),(5053,'Dharpalle',582,2),(5054,'Sirkonda',582,2),(5055,'Machareddy',582,2),(5056,'Sadasivanagar',582,2),(5057,'Gandhari',582,2),(5058,'Banswada',582,2),(5059,'Pitlam',582,2),(5060,'Nizamsagar',582,2),(5061,'Yellareddy',582,2),(5062,'Nagareddipet',582,2),(5063,'Lingampet',582,2),(5064,'Tadwai',582,2),(5065,'Kamareddy',582,2),(5066,'Bhiknoor',582,2),(5067,'Domakonda',582,2),(5068,'Ibrahimpatnam',574,2),(5069,'Mallapur',574,2),(5070,'Raikal',574,2),(5071,'Sarangapur',574,2),(5072,'Dharmapuri',574,2),(5073,'Velgatoor',574,2),(5074,'Ramagundam',574,2),(5075,'Kamanpur',574,2),(5076,'Manthani',574,2),(5077,'Kataram',574,2),(5078,'Mahadevpur',574,2),(5079,'Mutharam (Mahadevpur)',574,2),(5080,'Malharrao',574,2),(5081,'Mutharam (Manthani)',574,2),(5082,'Srirampur',574,2),(5083,'Peddapalle',574,2),(5084,'Julapalle',574,2),(5085,'Elgaid',574,2),(5086,'Dharmaram',574,2),(5087,'Gollapalle',574,2),(5088,'Mallial',574,2),(5089,'Jagtial',574,2),(5090,'Medipalle',574,2),(5091,'Koratla',574,2),(5092,'Metpalle',574,2),(5093,'Kathlapur',574,2),(5094,'Chandurthi',574,2),(5095,'Kodimial',574,2),(5096,'Pegadapalle',574,2),(5097,'Gangadhara',574,2),(5098,'Ramadugu',574,2),(5099,'Choppadandi',574,2),(5100,'Sultanabad',574,2),(5101,'Odela',574,2),(5102,'Manakondur',574,2),(5103,'Karimnagar',574,2),(5104,'Boinpalle',574,2),(5105,'Vemulawada',574,2),(5106,'Konaraopeta',574,2),(5107,'Yellareddipet',574,2),(5108,'Gambhiraopet',574,2),(5109,'Mustabad',574,2),(5110,'Sircilla',574,2),(5111,'Ellanthakunta',574,2),(5112,'Bejjanki',574,2),(5113,'Timmapur (Lmd Colony)',574,2),(5114,'Veenavanka',574,2),(5115,'Jammikunta',574,2),(5116,'Shankarapatnam',574,2),(5117,'Chigurumamidi',574,2),(5118,'Koheda',574,2),(5119,'Husnabad',574,2),(5120,'Saidapur',574,2),(5121,'Huzurabad',574,2),(5122,'Kamalapur',574,2),(5123,'Bheemadevarpalle',574,2),(5124,'Elkathurthi',574,2),(5125,'Kangti',579,2),(5126,'Manoor',579,2),(5127,'Narayankhed',579,2),(5128,'Kalher',579,2),(5129,'Shankarampet (A)',579,2),(5130,'Papannapet',579,2),(5131,'Medak',579,2),(5132,'Ramayampet',579,2),(5133,'Dubbak',579,2),(5134,'Siddipet',579,2),(5135,'Chinnakodur',579,2),(5136,'Nangnoor',579,2),(5137,'Kondapak',579,2),(5138,'Thoguta',579,2),(5139,'Mirdoddi',579,2),(5140,'Doultabad',579,2),(5141,'Chegunta',579,2),(5142,'Shankarampet (R)',579,2),(5143,'Kulcharam',579,2),(5144,'Tekmal',579,2),(5145,'Alladurg',579,2),(5146,'Regode',579,2),(5147,'Raikode',579,2),(5148,'Nyalkal',579,2),(5149,'Zahirabad',579,2),(5150,'Kohir',579,2),(5151,'Jharasangam',579,2),(5152,'Munpalle',579,2),(5153,'Pulkal',579,2),(5154,'Andole',579,2),(5155,'Kowdipalle',579,2),(5156,'Yeldurthy',579,2),(5157,'Tupran',579,2),(5158,'Gajwel',579,2),(5159,'Jagdevpur',579,2),(5160,'Wargal',579,2),(5161,'Mulug',579,2),(5162,'Shivampet',579,2),(5163,'Narsapur',579,2),(5164,'Hathnoora',579,2),(5165,'Sadasivpet',579,2),(5166,'Kondapur',579,2),(5167,'Sangareddy',579,2),(5168,'Jinnaram',579,2),(5169,'Patancheru',579,2),(5170,'Ramachandrapuram',579,2),(5171,'Shaikpet',572,2),(5172,'Ameerpet',572,2),(5173,'Secunderabad',572,2),(5174,'Tirumalagiri',572,2),(5175,'Maredpalle',572,2),(5176,'Musheerabad',572,2),(5177,'Amberpet',572,2),(5178,'Himayathnagar',572,2),(5179,'Nampally',572,2),(5180,'Khairatabad',572,2),(5181,'Asifnagar',572,2),(5182,'Golconda',572,2),(5183,'Bahadurpura',572,2),(5184,'Bandlaguda',572,2),(5185,'Charminar',572,2),(5186,'Saidabad',572,2),(5187,'Marpalle',584,2),(5188,'Mominpet',584,2),(5189,'Nawabpet',584,2),(5190,'Shankarpalle',584,2),(5191,'Serilingampally',584,2),(5192,'Balanagar',584,2),(5193,'Qutubullapur',584,2),(5194,'Medchal',584,2),(5195,'Shamirpet',584,2),(5196,'Malkajgiri',584,2),(5197,'Keesara',584,2),(5198,'Ghatkesar',584,2),(5199,'Uppal',584,2),(5200,'Hayathnagar',584,2),(5201,'Saroornagar',584,2),(5202,'Rajendranagar',584,2),(5203,'Moinabad',584,2),(5204,'Chevella',584,2),(5205,'Vicarabad',584,2),(5206,'Dharur',584,2),(5207,'Bantwaram',584,2),(5208,'Peddemul',584,2),(5209,'Tandur',584,2),(5210,'Basheerabad',584,2),(5211,'Yelal',584,2),(5212,'Doma',584,2),(5213,'Gandeed',584,2),(5214,'Kulkacharla',584,2),(5215,'Pargi',584,2),(5216,'Pudur',584,2),(5217,'Shabad',584,2),(5218,'Shamshabad',584,2),(5219,'Maheswaram',584,2),(5220,'Kandukur',584,2),(5221,'Ibrahimpatnam',584,2),(5222,'Manchal',584,2),(5223,'Yacharam',584,2),(5224,'Kodangal',578,2),(5225,'Bomraspet',578,2),(5226,'Kosgi',578,2),(5227,'Doulathabad',578,2),(5228,'Damaragidda',578,2),(5229,'Maddur',578,2),(5230,'Hanwada',578,2),(5231,'Nawabpet',578,2),(5232,'Balanagar',578,2),(5233,'Kondurg',578,2),(5234,'Farooqnagar',578,2),(5235,'Kothur',578,2),(5236,'Keshampet',578,2),(5237,'Talakondapalle',578,2),(5238,'Amangal',578,2),(5239,'Madgul',578,2),(5240,'Veldanda',578,2),(5241,'Midjil',578,2),(5242,'Jadcherla',578,2),(5243,'Mahbubnagar',578,2),(5244,'Koilkonda',578,2),(5245,'Narayanpet',578,2),(5246,'Utkoor',578,2),(5247,'Dhanwada',578,2),(5248,'Devarkadra',578,2),(5249,'Bhoothpur',578,2),(5250,'Thimmajipet',578,2),(5251,'Kalwakurthy',578,2),(5252,'Vangoor',578,2),(5253,'Amrabad',578,2),(5254,'Achampet',578,2),(5255,'Uppununthala',578,2),(5256,'Telkapalle',578,2),(5257,'Tadoor',578,2),(5258,'Nagarkurnool',578,2),(5259,'Bijinapalle',578,2),(5260,'Ghanpur',578,2),(5261,'Addakal',578,2),(5262,'Chinnachintakunta',578,2),(5263,'Narva',578,2),(5264,'Makthal',578,2),(5265,'Maganoor',578,2),(5266,'Dharur',578,2),(5267,'Atmakur',578,2),(5268,'Kothakota',578,2),(5269,'Peddamandadi',578,2),(5270,'Wanaparthy',578,2),(5271,'Gopalpeta',578,2),(5272,'Balmoor',578,2),(5273,'Lingal',578,2),(5274,'Peddakothapalle',578,2),(5275,'Kodair',578,2),(5276,'Pangal',578,2),(5277,'Pebbair',578,2),(5278,'Gadwal',578,2),(5279,'Maldakal',578,2),(5280,'Ghattu',578,2),(5281,'Ieej',578,2),(5282,'Itikyal',578,2),(5283,'Veepangandla',578,2),(5284,'Kollapur',578,2),(5285,'Waddepalle',578,2),(5286,'Manopad',578,2),(5287,'Alampur',578,2),(5288,'Bommalaramaram',580,2),(5289,'M.Turkapalle',580,2),(5290,'Rajapet',580,2),(5291,'Yadagirigutta',580,2),(5292,'Alair',580,2),(5293,'Gundala',580,2),(5294,'Thirumalgiri',580,2),(5295,'Thungathurthi',580,2),(5296,'Nuthankal',580,2),(5297,'Atmakur (S)',580,2),(5298,'Jaji Reddi Gudem',580,2),(5299,'Sali Gouraram',580,2),(5300,'Mothkur',580,2),(5301,'Atmakur (M)',580,2),(5302,'Valigonda',580,2),(5303,'Bhongir',580,2),(5304,'Bibinagar',580,2),(5305,'Pochampalle',580,2),(5306,'Choutuppal',580,2),(5307,'Ramannapeta',580,2),(5308,'Chityala',580,2),(5309,'Narketpalle',580,2),(5310,'Kattangoor',580,2),(5311,'Nakrekal',580,2),(5312,'Kethe Palle',580,2),(5313,'Suryapet',580,2),(5314,'Chivvemla',580,2),(5315,'Mothey',580,2),(5316,'Nadigudem',580,2),(5317,'Munagala',580,2),(5318,'Penpahad',580,2),(5319,'Vemulapalle',580,2),(5320,'Thipparthi',580,2),(5321,'Nalgonda',580,2),(5322,'Munugode',580,2),(5323,'Narayanapur',580,2),(5324,'Marriguda',580,2),(5325,'Chintha Palle',580,2),(5326,'Gundla Palle',580,2),(5327,'Chandam Pet',580,2),(5328,'Devarakonda',580,2),(5329,'Nampalle',580,2),(5330,'Chandur',580,2),(5331,'Kangal',580,2),(5332,'Gurrampode',580,2),(5333,'Pedda Adiserla Palle',580,2),(5334,'Peddavoora',580,2),(5335,'Anumula',580,2),(5336,'Nidamanur',580,2),(5337,'Thripuraram',580,2),(5338,'Dameracherla',580,2),(5339,'Miryalaguda',580,2),(5340,'Neredcherla',580,2),(5341,'Garide Palle',580,2),(5342,'Chilkur',580,2),(5343,'Kodad',580,2),(5344,'Huzurnagar',580,2),(5345,'Mattam Palle',580,2),(5346,'Mella Cheruvu',580,2),(5347,'Cherial',588,2),(5348,'Maddur',588,2),(5349,'Bachannapet',588,2),(5350,'Narmetta',588,2),(5351,'Ghanpur (Station)',588,2),(5352,'Dharmasagar',588,2),(5353,'Hasanparthy',588,2),(5354,'Parkal',588,2),(5355,'Mogullapalle',588,2),(5356,'Chityal',588,2),(5357,'Bhupalpalle',588,2),(5358,'Ghanpur (Mulug)',588,2),(5359,'Venkatapur',588,2),(5360,'Eturnagaram',588,2),(5361,'Mangapet',588,2),(5362,'Tadvai',588,2),(5363,'Govindaraopet',588,2),(5364,'Mulug',588,2),(5365,'Regonda',588,2),(5366,'Shayampet',588,2),(5367,'Nallabelly',588,2),(5368,'Duggondi',588,2),(5369,'Atmakur',588,2),(5370,'Hanamkonda',588,2),(5371,'Zaffergadh',588,2),(5372,'Palakurthi',588,2),(5373,'Raghunathpalle',588,2),(5374,'Jangaon',588,2),(5375,'Lingalaghanpur',588,2),(5376,'Devaruppula',588,2),(5377,'Kodakandla',588,2),(5378,'Raiparthy',588,2),(5379,'Wardhannapet',588,2),(5380,'Sangam',588,2),(5381,'Warangal',588,2),(5382,'Geesugonda',588,2),(5383,'Narsampet',588,2),(5384,'Khanapur',588,2),(5385,'Kothagudem',588,2),(5386,'Gudur',588,2),(5387,'Chennaraopet',588,2),(5388,'Nekkonda',588,2),(5389,'Parvathagiri',588,2),(5390,'Thorrur',588,2),(5391,'Nellikudur',588,2),(5392,'Kesamudram',588,2),(5393,'Mahabubabad',588,2),(5394,'Narsimhulapet',588,2),(5395,'Maripeda',588,2),(5396,'Kuravi',588,2),(5397,'Dornakal',588,2),(5398,'Wazeed',575,2),(5399,'Venkatapuram',575,2),(5400,'Pinapaka',575,2),(5401,'Cherla',575,2),(5402,'Manuguru',575,2),(5403,'Aswapuram',575,2),(5404,'Dummugudem',575,2),(5405,'Bhadrachalam',575,2),(5406,'Kunavaram',575,2),(5407,'Chintur',575,2),(5408,'Vararamachandrapuram',575,2),(5409,'Velairpadu',575,2),(5410,'Kukunoor',575,2),(5411,'Burgampahad',575,2),(5412,'Palwancha',575,2),(5413,'Kothagudem',575,2),(5414,'Tekulapalle',575,2),(5415,'Yellandu',575,2),(5416,'Gundala',575,2),(5417,'Bayyaram',575,2),(5418,'Garla',575,2),(5419,'Singareni',575,2),(5420,'Kamepalle',575,2),(5421,'Julurpad',575,2),(5422,'Chandrugonda',575,2),(5423,'Mulkalapalle',575,2),(5424,'Aswaraopeta',575,2),(5425,'Dammapeta',575,2),(5426,'Sathupalle',575,2),(5427,'Penuballi',575,2),(5428,'Enkuru',575,2),(5429,'Thirumalayapalem',575,2),(5430,'Kusumanchi',575,2),(5431,'Khammam (Rural)',575,2),(5432,'Khammam (Urban)',575,2),(5433,'Mudigonda',575,2),(5434,'Nelakondapalle',575,2),(5435,'Chinthakani',575,2),(5436,'Konijerla',575,2),(5437,'Tallada',575,2),(5438,'Kallur',575,2),(5439,'Wyra',575,2),(5440,'Bonakal',575,2),(5441,'Madhira',575,2),(5442,'Yerrupalem',575,2),(5443,'Vemsoor',575,2),(5444,'Veeraghattam',585,2),(5445,'Seethampeta',585,2),(5446,'Bhamini',585,2),(5447,'Kothuru',585,2),(5448,'Pathapatnam',585,2),(5449,'Meliaputti',585,2),(5450,'Palasa',585,2),(5451,'Mandasa',585,2),(5452,'Kanchili',585,2),(5453,'Ichchapuram',585,2),(5454,'Kaviti',585,2),(5455,'Sompeta',585,2),(5456,'Vajrapukothuru',585,2),(5457,'Nandigam',585,2),(5458,'Hiramandalam',585,2),(5459,'Palakonda',585,2),(5460,'Vangara',585,2),(5461,'Regidi Amadalavalasa',585,2),(5462,'Lakshminarsupeta',585,2),(5463,'Saravakota',585,2),(5464,'Tekkali',585,2),(5465,'Santhabommali',585,2),(5466,'Kotabommali',585,2),(5467,'Jalumuru',585,2),(5468,'Sarubujjili',585,2),(5469,'Burja',585,2),(5470,'Santhakaviti',585,2),(5471,'Rajam',585,2),(5472,'Ganguvarisigadam',585,2),(5473,'Amadalavalasa',585,2),(5474,'Narasannapeta',585,2),(5475,'Polaki',585,2),(5476,'Gara',585,2),(5477,'Srikakulam',585,2),(5478,'Ponduru',585,2),(5479,'Laveru',585,2),(5480,'Ranastalam',585,2),(5481,'Etcherla',585,2),(5482,'Komarada',587,2),(5483,'Gummalakshmipuram',587,2),(5484,'Kurupam',587,2),(5485,'Jiyyammavalasa',587,2),(5486,'Garugubilli',587,2),(5487,'Parvathipuram',587,2),(5488,'Makkuva',587,2),(5489,'Seethanagaram',587,2),(5490,'Balijipeta',587,2),(5491,'Bobbili',587,2),(5492,'Salur',587,2),(5493,'Pachipenta',587,2),(5494,'Ramabhadrapuram',587,2),(5495,'Badangi',587,2),(5496,'Therlam',587,2),(5497,'Merakamudidam',587,2),(5498,'Dattirajeru',587,2),(5499,'Mentada',587,2),(5500,'Gajapathinagaram',587,2),(5501,'Garividi',587,2),(5502,'Cheepurupalle',587,2),(5503,'Gurla',587,2),(5504,'Bondapalle',587,2),(5505,'Gantyada',587,2),(5506,'Srungavarapukota',587,2),(5507,'Vepada',587,2),(5508,'Lakkavarapukota',587,2),(5509,'Kothavalasa',587,2),(5510,'Jami',587,2),(5511,'Vizianagaram',587,2),(5512,'Nellimarla',587,2),(5513,'Pusapatirega',587,2),(5514,'Denkada',587,2),(5515,'Bhogapuram',587,2),(5516,'Munchingi Puttu',586,2),(5517,'Peda Bayalu',586,2),(5518,'Dumbriguda',586,2),(5519,'Araku Valley',586,2),(5520,'Ananthagiri',586,2),(5521,'Hukumpeta',586,2),(5522,'Paderu',586,2),(5523,'G.Madugula',586,2),(5524,'Chintapalle',586,2),(5525,'Gudem Kotha Veedhi',586,2),(5526,'Koyyuru',586,2),(5527,'Nathavaram',586,2),(5528,'Golugonda',586,2),(5529,'Narsipatnam',586,2),(5530,'Rolugunta',586,2),(5531,'Ravikamatham',586,2),(5532,'Madugula',586,2),(5533,'Cheedikada',586,2),(5534,'Devarapalle',586,2),(5535,'K.Kotapadu',586,2),(5536,'Sabbavaram',586,2),(5537,'Pendurthi',586,2),(5538,'Anandapuram',586,2),(5539,'Padmanabham',586,2),(5540,'Bheemunipatnam',586,2),(5541,'Visakhapatnam (Rural)',586,2),(5542,'Visakhapatnam (Urban)',586,2),(5543,'Pedagantyada',586,2),(5544,'Gajuwaka',586,2),(5545,'Paravada',586,2),(5546,'Anakapalle',586,2),(5547,'Chodavaram',586,2),(5548,'Butchayyapeta',586,2),(5549,'Kotauratla',586,2),(5550,'Makavarapalem',586,2),(5551,'Kasimkota',586,2),(5552,'Munagapaka',586,2),(5553,'Atchutapuram',586,2),(5554,'Yelamanchili',586,2),(5555,'Nakkapalle',586,2),(5556,'Payakaraopeta',586,2),(5557,'S.Rayavaram',586,2),(5558,'Rambilli',586,2),(5559,'Maredumilli',570,2),(5560,'Devipatnam',570,2),(5561,'Y. Ramavaram',570,2),(5562,'Addateegala',570,2),(5563,'Rajavommangi',570,2),(5564,'Kotananduru',570,2),(5565,'Tuni',570,2),(5566,'Rowthulapudi',570,2),(5567,'Sankhavaram',570,2),(5568,'Yeleswaram',570,2),(5569,'Gangavaram',570,2),(5570,'Rampachodavaram',570,2),(5571,'Seethanagaram',570,2),(5572,'Gokavaram',570,2),(5573,'Jaggampeta',570,2),(5574,'Kirlampudi',570,2),(5575,'Prathipadu',570,2),(5576,'Thondangi',570,2),(5577,'Gollaprolu',570,2),(5578,'Peddapuram',570,2),(5579,'Gandepalle',570,2),(5580,'Korukonda',570,2),(5581,'Rajahmundry (Urban)',570,2),(5582,'Rajahmundry Rural',570,2),(5583,'Rajanagaram',570,2),(5584,'Rangampeta',570,2),(5585,'Samalkota',570,2),(5586,'Pithapuram',570,2),(5587,'Kothapalle',570,2),(5588,'Kakinada (Rural)',570,2),(5589,'Kakinada (Urban)',570,2),(5590,'Pedapudi',570,2),(5591,'Biccavolu',570,2),(5592,'Anaparthy',570,2),(5593,'Kadiam',570,2),(5594,'Atreyapuram',570,2),(5595,'Mandapeta',570,2),(5596,'Rayavaram',570,2),(5597,'Karapa',570,2),(5598,'Kajuluru',570,2),(5599,'Ramachandrapuram',570,2),(5600,'Alamuru',570,2),(5601,'Ravulapalem',570,2),(5602,'Kothapeta',570,2),(5603,'Kapileswarapuram',570,2),(5604,'Pamarru',570,2),(5605,'Thallarevu',570,2),(5606,'I. Polavaram',570,2),(5607,'Mummidivaram',570,2),(5608,'Ainavilli',570,2),(5609,'P.Gannavaram',570,2),(5610,'Ambajipeta',570,2),(5611,'Mamidikuduru',570,2),(5612,'Razole',570,2),(5613,'Malikipuram',570,2),(5614,'Sakhinetipalle',570,2),(5615,'Allavaram',570,2),(5616,'Amalapuram',570,2),(5617,'Uppalaguptam',570,2),(5618,'Katrenikona',570,2),(5619,'Chintalapudi',589,2),(5620,'Lingapalem',589,2),(5621,'T.Narasapuram',589,2),(5622,'Jeelugu Milli',589,2),(5623,'Buttayagudem',589,2),(5624,'Polavaram',589,2),(5625,'Tallapudi',589,2),(5626,'Gopalapuram',589,2),(5627,'Koyyalagudem',589,2),(5628,'Jangareddigudem',589,2),(5629,'Kamavarapukota',589,2),(5630,'Dwarakatirumala',589,2),(5631,'Nallajerla',589,2),(5632,'Devarapalle',589,2),(5633,'Kovvur',589,2),(5634,'Chagallu',589,2),(5635,'Nidadavole',589,2),(5636,'Tadepalligudem',589,2),(5637,'Unguturu',589,2),(5638,'Bhimadole',589,2),(5639,'Pedavegi',589,2),(5640,'Pedapadu',589,2),(5641,'Eluru',589,2),(5642,'Denduluru',589,2),(5643,'Nidamarru',589,2),(5644,'Pentapadu',589,2),(5645,'Undrajavaram',589,2),(5646,'Peravali',589,2),(5647,'Tanuku',589,2),(5648,'Attili',589,2),(5649,'Ganapavaram',589,2),(5650,'Akividu',589,2),(5651,'Undi',589,2),(5652,'Palacoderu',589,2),(5653,'Penumantra',589,2),(5654,'Iragavaram',589,2),(5655,'Penugonda',589,2),(5656,'Achanta',589,2),(5657,'Poduru',589,2),(5658,'Veeravasaram',589,2),(5659,'Bhimavaram',589,2),(5660,'Kalla',589,2),(5661,'Mogalthur',589,2),(5662,'Narasapuram',589,2),(5663,'Palacole',589,2),(5664,'Yelamanchili',589,2),(5665,'Vatsavai',576,2),(5666,'Jaggayyapeta',576,2),(5667,'Penuganchiprolu',576,2),(5668,'Nandigama',576,2),(5669,'Veerullapadu',576,2),(5670,'Mylavaram',576,2),(5671,'Gampalagudem',576,2),(5672,'Tiruvuru',576,2),(5673,'A.Konduru',576,2),(5674,'Reddigudem',576,2),(5675,'Vissannapet',576,2),(5676,'Chatrai',576,2),(5677,'Musunuru',576,2),(5678,'Nuzvid',576,2),(5679,'Bapulapadu',576,2),(5680,'Agiripalle',576,2),(5681,'G.Konduru',576,2),(5682,'Kanchikacherla',576,2),(5683,'Chandarlapadu',576,2),(5684,'Ibrahimpatnam',576,2),(5685,'Vijayawada (Urban)',576,2),(5686,'Vijayawada (Rural)',576,2),(5687,'Gannavaram',576,2),(5688,'Unguturu',576,2),(5689,'Nandivada',576,2),(5690,'Mandavalli',576,2),(5691,'Kaikalur',576,2),(5692,'Kalidindi',576,2),(5693,'Kruthivennu',576,2),(5694,'Bantumilli',576,2),(5695,'Mudinepalle',576,2),(5696,'Gudivada',576,2),(5697,'Pedaparupudi',576,2),(5698,'Kankipadu',576,2),(5699,'Penamaluru',576,2),(5700,'Thotlavalluru',576,2),(5701,'Pamidimukkala',576,2),(5702,'Vuyyuru',576,2),(5703,'Pamarru',576,2),(5704,'Gudlavalleru',576,2),(5705,'Pedana',576,2),(5706,'Guduru',576,2),(5707,'Movva',576,2),(5708,'Ghantasala',576,2),(5709,'Machilipatnam',576,2),(5710,'Challapalle',576,2),(5711,'Mopidevi',576,2),(5712,'Avanigadda',576,2),(5713,'Nagayalanka',576,2),(5714,'Koduru',576,2),(5715,'Macherla',571,2),(5716,'Veldurthi',571,2),(5717,'Durgi',571,2),(5718,'Rentachintala',571,2),(5719,'Gurazala',571,2),(5720,'Dachepalle',571,2),(5721,'Karempudi',571,2),(5722,'Piduguralla',571,2),(5723,'Machavaram',571,2),(5724,'Bellamkonda',571,2),(5725,'Atchampet',571,2),(5726,'Krosuru',571,2),(5727,'Amaravathi',571,2),(5728,'Thullur',571,2),(5729,'Tadepalle',571,2),(5730,'Mangalagiri',571,2),(5731,'Tadikonda',571,2),(5732,'Pedakurapadu',571,2),(5733,'Sattenapalle',571,2),(5734,'Rajupalem',571,2),(5735,'Nekarikallu',571,2),(5736,'Bollapalle',571,2),(5737,'Vinukonda',571,2),(5738,'Nuzendla',571,2),(5739,'Savalyapuram H/O Kanamarlapudi',571,2),(5740,'Ipur',571,2),(5741,'Rompicherla',571,2),(5742,'Narasaraopet',571,2),(5743,'Muppalla',571,2),(5744,'Nadendla',571,2),(5745,'Chilakaluripet',571,2),(5746,'Edlapadu',571,2),(5747,'Phirangipuram',571,2),(5748,'Medikonduru',571,2),(5749,'Guntur',571,2),(5750,'Pedakakani',571,2),(5751,'Duggirala',571,2),(5752,'Kollipara',571,2),(5753,'Tenali',571,2),(5754,'Chebrolu',571,2),(5755,'Vatticherukuru',571,2),(5756,'Prathipadu',571,2),(5757,'Pedanandipadu',571,2),(5758,'Kakumanu',571,2),(5759,'Ponnur',571,2),(5760,'Tsundur',571,2),(5761,'Amruthalur',571,2),(5762,'Vemuru',571,2),(5763,'Kollur',571,2),(5764,'Bhattiprolu',571,2),(5765,'Cherukupalle H/O Arumbaka',571,2),(5766,'Pittalavanipalem',571,2),(5767,'Karlapalem',571,2),(5768,'Bapatla',571,2),(5769,'Nizampatnam',571,2),(5770,'Nagaram',571,2),(5771,'Repalle',571,2),(5772,'Yerragondapalem',583,2),(5773,'Pullalacheruvu',583,2),(5774,'Tripuranthakam',583,2),(5775,'Dornala',583,2),(5776,'Peda  Araveedu',583,2),(5777,'Donakonda',583,2),(5778,'Kurichedu',583,2),(5779,'Santhamaguluru',583,2),(5780,'Ballikurava',583,2),(5781,'Martur',583,2),(5782,'Yeddana Pudi',583,2),(5783,'Parchur',583,2),(5784,'Karamchedu',583,2),(5785,'Inkollu',583,2),(5786,'Janakavarampanguluru',583,2),(5787,'Addanki',583,2),(5788,'Mundlamuru',583,2),(5789,'Darsi',583,2),(5790,'Markapur',583,2),(5791,'Ardhaveedu',583,2),(5792,'Cumbum',583,2),(5793,'Tarlupadu',583,2),(5794,'Konakanamitla',583,2),(5795,'Podili',583,2),(5796,'Thallur',583,2),(5797,'Korisapadu',583,2),(5798,'Chirala',583,2),(5799,'Vetapalem',583,2),(5800,'Chinaganjam',583,2),(5801,'Naguluppala Padu',583,2),(5802,'Maddipadu',583,2),(5803,'Chimakurthi',583,2),(5804,'Marripudi',583,2),(5805,'Hanumanthuni Padu',583,2),(5806,'Bestawaripeta',583,2),(5807,'Racherla',583,2),(5808,'Giddalur',583,2),(5809,'Komarolu',583,2),(5810,'Veligandla',583,2),(5811,'Kanigiri',583,2),(5812,'Kondapi',583,2),(5813,'Santhanuthala Padu',583,2),(5814,'Ongole',583,2),(5815,'Kotha Patnam',583,2),(5816,'Tangutur',583,2),(5817,'Zarugumilli',583,2),(5818,'Ponnaluru',583,2),(5819,'Pedacherlo Palle',583,2),(5820,'Chandra Sekhara Puram',583,2),(5821,'Pamur',583,2),(5822,'Voletivaripalem',583,2),(5823,'Kandukur',583,2),(5824,'Singarayakonda',583,2),(5825,'Lingasamudram',583,2),(5826,'Gudluru',583,2),(5827,'Ulavapadu',583,2),(5828,'Seetharamapuram',581,2),(5829,'Udayagiri',581,2),(5830,'Varikuntapadu',581,2),(5831,'Kondapuram',581,2),(5832,'Jaladanki',581,2),(5833,'Kavali',581,2),(5834,'Bogole',581,2),(5835,'Kaligiri',581,2),(5836,'Vinjamur',581,2),(5837,'Duttalur',581,2),(5838,'Marripadu',581,2),(5839,'Atmakur',581,2),(5840,'Anumasamudrampeta',581,2),(5841,'Dagadarthi',581,2),(5842,'Allur',581,2),(5843,'Vidavalur',581,2),(5844,'Kodavalur',581,2),(5845,'Buchireddipalem',581,2),(5846,'Sangam',581,2),(5847,'Chejerla',581,2),(5848,'Ananthasagaram',581,2),(5849,'Kaluvoya',581,2),(5850,'Rapur',581,2),(5851,'Podalakur',581,2),(5852,'Nellore',581,2),(5853,'Kovur',581,2),(5854,'Indukurpet',581,2),(5855,'Thotapalligudur',581,2),(5856,'Muthukur',581,2),(5857,'Venkatachalam',581,2),(5858,'Manubolu',581,2),(5859,'Gudur',581,2),(5860,'Sydapuram',581,2),(5861,'Dakkili',581,2),(5862,'Venkatagiri',581,2),(5863,'Balayapalle',581,2),(5864,'Ojili',581,2),(5865,'Chillakur',581,2),(5866,'Kota',581,2),(5867,'Vakadu',581,2),(5868,'Chittamur',581,2),(5869,'Naidupet',581,2),(5870,'Pellakur',581,2),(5871,'Doravarisatram',581,2),(5872,'Sullurpeta',581,2),(5873,'Tada',581,2),(5874,'Kondapuram',573,2),(5875,'Mylavaram',573,2),(5876,'Peddamudium',573,2),(5877,'Rajupalem',573,2),(5878,'Duvvur',573,2),(5879,'S.Mydukur',573,2),(5880,'Brahmamgarimattam',573,2),(5881,'Sri Avadhutha Kasinayana',573,2),(5882,'Kalasapadu',573,2),(5883,'Porumamilla',573,2),(5884,'B.Kodur',573,2),(5885,'Badvel',573,2),(5886,'Gopavaram',573,2),(5887,'Khajipet',573,2),(5888,'Chapad',573,2),(5889,'Proddatur',573,2),(5890,'Jammalamadugu',573,2),(5891,'Muddanur',573,2),(5892,'Simhadripuram',573,2),(5893,'Lingala',573,2),(5894,'Pulivendla',573,2),(5895,'Vemula',573,2),(5896,'Thondur',573,2),(5897,'Veerapunayunipalle',573,2),(5898,'Yerraguntla',573,2),(5899,'Kamalapuram',573,2),(5900,'Vallur',573,2),(5901,'Chennur',573,2),(5902,'Atlur',573,2),(5903,'Vontimitta',573,2),(5904,'Sidhout',573,2),(5905,'Kadapa',573,2),(5906,'Chinthakommadinne',573,2),(5907,'Pendlimarri',573,2),(5908,'Vempalle',573,2),(5909,'Chakrayapet',573,2),(5910,'Galiveedu',573,2),(5911,'Chinnamandem',573,2),(5912,'Sambepalle',573,2),(5913,'T Sundupalle',573,2),(5914,'Rayachoti',573,2),(5915,'Lakkireddipalle',573,2),(5916,'Ramapuram',573,2),(5917,'Veeraballe',573,2),(5918,'Nandalur',573,2),(5919,'Penagalur',573,2),(5920,'Chitvel',573,2),(5921,'Rajampet',573,2),(5922,'Pullampeta',573,2),(5923,'Obulavaripalle',573,2),(5924,'Kodur',573,2),(5925,'Mantralayam',577,2),(5926,'Kosigi',577,2),(5927,'Kowthalam',577,2),(5928,'Pedda Kadubur',577,2),(5929,'Yemmiganur',577,2),(5930,'Nandavaram',577,2),(5931,'C.Belagal',577,2),(5932,'Gudur',577,2),(5933,'Kallur',577,2),(5934,'Kurnool',577,2),(5935,'Nandikotkur',577,2),(5936,'Pagidyala',577,2),(5937,'Jupadu Bungalow',577,2),(5938,'Kothapalle',577,2),(5939,'Srisailam',577,2),(5940,'Atmakur',577,2),(5941,'Pamulapadu',577,2),(5942,'Midthur',577,2),(5943,'Orvakal',577,2),(5944,'Kodumur',577,2),(5945,'Gonegandla',577,2),(5946,'Adoni',577,2),(5947,'Holagunda',577,2),(5948,'Halaharvi',577,2),(5949,'Alur',577,2),(5950,'Aspari',577,2),(5951,'Devanakonda',577,2),(5952,'Krishnagiri',577,2),(5953,'Veldurthi',577,2),(5954,'Bethamcherla',577,2),(5955,'Panyam',577,2),(5956,'Gadivemula',577,2),(5957,'Velgode',577,2),(5958,'Bandi Atmakur',577,2),(5959,'Nandyal',577,2),(5960,'Mahanandi',577,2),(5961,'Sirvel',577,2),(5962,'Gospadu',577,2),(5963,'Banaganapalle',577,2),(5964,'Dhone',577,2),(5965,'Pattikonda',577,2),(5966,'Chippagiri',577,2),(5967,'Maddikera (East)',577,2),(5968,'Tuggali',577,2),(5969,'Peapally',577,2),(5970,'Owk',577,2),(5971,'Koilkuntla',577,2),(5972,'Rudravaram',577,2),(5973,'Allagadda',577,2),(5974,'Dornipadu',577,2),(5975,'Sanjamala',577,2),(5976,'Kolimigundla',577,2),(5977,'Uyyalawada',577,2),(5978,'Chagalamarri',577,2),(5979,'D.Hirehal',568,2),(5980,'Rayadurg',568,2),(5981,'Kanekal',568,2),(5982,'Bommanahal',568,2),(5983,'Vidapanakal',568,2),(5984,'Guntakal',568,2),(5985,'Gooty',568,2),(5986,'Peddavadugur',568,2),(5987,'Yadiki',568,2),(5988,'Tadpatri',568,2),(5989,'Peddapappur',568,2),(5990,'Pamidi',568,2),(5991,'Vajrakarur',568,2),(5992,'Uravakonda',568,2),(5993,'Beluguppa',568,2),(5994,'Gummagatta',568,2),(5995,'Brahmasamudram',568,2),(5996,'Kalyandurg',568,2),(5997,'Atmakur',568,2),(5998,'Kudair',568,2),(5999,'Garladinne',568,2),(6000,'Singanamala',568,2),(6001,'Putlur',568,2),(6002,'Yellanur',568,2),(6003,'Narpala',568,2),(6004,'Bukkaraya Samudram',568,2),(6005,'Anantapur',568,2),(6006,'Raptadu',568,2),(6007,'Settur',568,2),(6008,'Kundurpi',568,2),(6009,'Kambadur',568,2),(6010,'Kanaganapalle',568,2),(6011,'Dharmavaram',568,2),(6012,'Bathalapalle',568,2),(6013,'Tadimarri',568,2),(6014,'Mudigubba',568,2),(6015,'Talupula',568,2),(6016,'Nambulipulikunta',568,2),(6017,'Gandlapenta',568,2),(6018,'Kadiri',568,2),(6019,'Nallamada',568,2),(6020,'Bukkapatnam',568,2),(6021,'Kothacheruvu',568,2),(6022,'Chennekothapalle',568,2),(6023,'Ramagiri',568,2),(6024,'Roddam',568,2),(6025,'Madakasira',568,2),(6026,'Amarapuram',568,2),(6027,'Gudibanda',568,2),(6028,'Rolla',568,2),(6029,'Agali',568,2),(6030,'Parigi',568,2),(6031,'Penukonda',568,2),(6032,'Puttaparthi',568,2),(6033,'Obuladevaracheruvu',568,2),(6034,'Nallacheruvu',568,2),(6035,'Tanakal',568,2),(6036,'Amadagur',568,2),(6037,'Gorantla',568,2),(6038,'Somandepalle',568,2),(6039,'Hindupur',568,2),(6040,'Lepakshi',568,2),(6041,'Chilamathur',568,2),(6042,'Mulakalacheruvu',569,2),(6043,'Thamballapalle',569,2),(6044,'Peddamandyam',569,2),(6045,'Gurramkonda',569,2),(6046,'Kalakada',569,2),(6047,'Kambhamvaripalle',569,2),(6048,'Rompicherla',569,2),(6049,'Yerravaripalem',569,2),(6050,'Tirupati (Rural)',569,2),(6051,'Renigunta',569,2),(6052,'Yerpedu',569,2),(6053,'Srikalahasti',569,2),(6054,'Thottambedu',569,2),(6055,'Buchinaidu Kandriga',569,2),(6056,'Varadaiahpalem',569,2),(6057,'K.V.B.Puram',569,2),(6058,'Tirupati (Urban)',569,2),(6059,'Chandragiri',569,2),(6060,'Chinnagottigallu',569,2),(6061,'Pileru',569,2),(6062,'Kalikiri',569,2),(6063,'Valmikipuram',569,2),(6064,'Kurabalakota',569,2),(6065,'Pedda Thippasamudram',569,2),(6066,'B.Kothakota',569,2),(6067,'Madanapalle',569,2),(6068,'Nimmanapalle',569,2),(6069,'Sodam',569,2),(6070,'Pulicherla',569,2),(6071,'Pakala',569,2),(6072,'Vedurukuppam',569,2),(6073,'Ramachandrapuram',569,2),(6074,'Vadamalapeta',569,2),(6075,'Narayanavanam',569,2),(6076,'Pichatur',569,2),(6077,'Satyavedu',569,2),(6078,'Nagalapuram',569,2),(6079,'Nindra',569,2),(6080,'Vijayapuram',569,2),(6081,'Nagari',569,2),(6082,'Puttur',569,2),(6083,'Karvetinagar',569,2),(6084,'Penumuru',569,2),(6085,'Puthalapattu',569,2),(6086,'Irala',569,2),(6087,'Somala',569,2),(6088,'Chowdepalle',569,2),(6089,'Ramasamudram',569,2),(6090,'Punganur',569,2),(6091,'Peddapanjani',569,2),(6092,'Gangavaram',569,2),(6093,'Thavanampalle',569,2),(6094,'Srirangarajapuram',569,2),(6095,'Gangadhara Nellore',569,2),(6096,'Chittoor',569,2),(6097,'Palamaner',569,2),(6098,'Baireddipalle',569,2),(6099,'Venkatagirikota',569,2),(6100,'Santhipuram',569,2),(6101,'Gudupalle',569,2),(6102,'Kuppam',569,2),(6103,'Ramakuppam',569,2),(6104,'Bangarupalem',569,2),(6105,'Yadamarri',569,2),(6106,'Gudipala',569,2),(6107,'Palasamudram',569,2),(6108,'Chikodi',593,17),(6109,'Athni',593,17),(6110,'Raybag',593,17),(6111,'Gokak',593,17),(6112,'Hukeri',593,17),(6113,'Belgaum',593,17),(6114,'Khanapur',593,17),(6115,'Sampgaon',593,17),(6116,'Parasgad',593,17),(6117,'Ramdurg',593,17),(6118,'Jamkhandi',590,17),(6119,'Bilgi',590,17),(6120,'Mudhol',590,17),(6121,'Badami',590,17),(6122,'Bagalkot',590,17),(6123,'Hungund',590,17),(6124,'Bijapur',596,17),(6125,'Indi',596,17),(6126,'Sindgi',596,17),(6127,'Basavana Bagevadi',596,17),(6128,'Muddebihal',596,17),(6129,'Basavakalyan',595,17),(6130,'Bhalki',595,17),(6131,'Aurad',595,17),(6132,'Bidar',595,17),(6133,'Homnabad',595,17),(6134,'Lingsugur',613,17),(6135,'Devadurga',613,17),(6136,'Raichur',613,17),(6137,'Manvi',613,17),(6138,'Sindhnur',613,17),(6139,'Yelbarga',610,17),(6140,'Kushtagi',610,17),(6141,'Gangawati',610,17),(6142,'Koppal',610,17),(6143,'Nargund',604,17),(6144,'Ron',604,17),(6145,'Gadag',604,17),(6146,'Shirhatti',604,17),(6147,'Mundargi',604,17),(6148,'Dharwad',603,17),(6149,'Navalgund',603,17),(6150,'Hubli',603,17),(6151,'Kalghatgi',603,17),(6152,'Kundgol',603,17),(6153,'Karwar',618,17),(6154,'Supa',618,17),(6155,'Haliyal',618,17),(6156,'Yellapur',618,17),(6157,'Mundgod',618,17),(6158,'Sirsi',618,17),(6159,'Ankola',618,17),(6160,'Kumta',618,17),(6161,'Siddapur',618,17),(6162,'Honavar',618,17),(6163,'Bhatkal',618,17),(6164,'Shiggaon',607,17),(6165,'Savanur',607,17),(6166,'Hangal',607,17),(6167,'Haveri',607,17),(6168,'Byadgi',607,17),(6169,'Hirekerur',607,17),(6170,'Ranibennur',607,17),(6171,'Hadagalli',594,17),(6172,'Hagaribommanahalli',594,17),(6173,'Hospet',594,17),(6174,'Siruguppa',594,17),(6175,'Bellary',594,17),(6176,'Sandur',594,17),(6177,'Kudligi',594,17),(6178,'Molakalmuru',600,17),(6179,'Challakere',600,17),(6180,'Chitradurga',600,17),(6181,'Holalkere',600,17),(6182,'Hosdurga',600,17),(6183,'Hiriyur',600,17),(6184,'Harihar',602,17),(6185,'Harapanahalli',602,17),(6186,'Jagalur',602,17),(6187,'Davanagere',602,17),(6188,'Honnali',602,17),(6189,'Channagiri',602,17),(6190,'Sagar',615,17),(6191,'Sorab',615,17),(6192,'Shikarpur',615,17),(6193,'Hosanagara',615,17),(6194,'Tirthahalli',615,17),(6195,'Shimoga',615,17),(6196,'Bhadravati',615,17),(6197,'Kundapura',617,17),(6198,'Udupi',617,17),(6199,'Karkal',617,17),(6200,'Sringeri',598,17),(6201,'Koppa',598,17),(6202,'Narasimharajapura',598,17),(6203,'Tarikere',598,17),(6204,'Kadur',598,17),(6205,'Chikmagalur',598,17),(6206,'Mudigere',598,17),(6207,'Chiknayakanhalli',616,17),(6208,'Sira',616,17),(6209,'Pavagada',616,17),(6210,'Madhugiri',616,17),(6211,'Koratagere',616,17),(6212,'Tumkur',616,17),(6213,'Gubbi',616,17),(6214,'Tiptur',616,17),(6215,'Turuvekere',616,17),(6216,'Kunigal',616,17),(6217,'Bangalore North',591,17),(6218,'Bangalore South',591,17),(6219,'Bangalore East',591,17),(6220,'Anekal',591,17),(6221,'Krishnarajpet',611,17),(6222,'Nagamangala',611,17),(6223,'Pandavapura',611,17),(6224,'Shrirangapattana',611,17),(6225,'Mandya',611,17),(6226,'Maddur',611,17),(6227,'Malavalli',611,17),(6228,'Sakleshpur',606,17),(6229,'Belur',606,17),(6230,'Arsikere',606,17),(6231,'Hassan',606,17),(6232,'Alur',606,17),(6233,'Arkalgud',606,17),(6234,'Hole Narsipur',606,17),(6235,'Channarayapatna',606,17),(6236,'Mangalore',601,17),(6237,'Bantval',601,17),(6238,'Beltangadi',601,17),(6239,'Puttur',601,17),(6240,'Sulya',601,17),(6241,'Madikeri',608,17),(6242,'Somvarpet',608,17),(6243,'Virajpet',608,17),(6244,'Piriyapatna',612,17),(6245,'Hunsur',612,17),(6246,'Krishnarajanagara',612,17),(6247,'Mysore',612,17),(6248,'Heggadadevankote',612,17),(6249,'Nanjangud',612,17),(6250,'Tirumakudal - Narsipur',612,17),(6251,'Gundlupet',597,17),(6252,'Chamarajanagar',597,17),(6253,'Yelandur',597,17),(6254,'Kollegal',597,17),(6255,'Aland',605,17),(6256,'Afzalpur',605,17),(6257,'Gulbarga',605,17),(6258,'Chincholi',605,17),(6259,'Sedam',605,17),(6260,'Chitapur',605,17),(6261,'Jevargi',605,17),(6262,'Shorapur',619,17),(6263,'Shahpur',619,17),(6264,'Yadgir',619,17),(6265,'Srinivaspur',609,17),(6266,'Kolar',609,17),(6267,'Malur',609,17),(6268,'Bangarapet',609,17),(6269,'Mulbagal',609,17),(6270,'Gauribidanur',599,17),(6271,'Chikkaballapura',599,17),(6272,'Gudibanda',599,17),(6273,'Bagepalli',599,17),(6274,'Sidlaghatta',599,17),(6275,'Chintamani',599,17),(6276,'Nelamangala',592,17),(6277,'Dod Ballapur',592,17),(6278,'Devanahalli',592,17),(6279,'Hosakote',592,17),(6280,'Magadi',614,17),(6281,'Ramanagara',614,17),(6282,'Channapatna',614,17),(6283,'Kanakapura',614,17),(6284,'Pernem',620,11),(6285,'Bardez',620,11),(6286,'Tiswadi',620,11),(6287,'Bicholim',620,11),(6288,'Satari',620,11),(6289,'Ponda',620,11),(6290,'Mormugao',621,11),(6291,'Salcete',621,11),(6292,'Quepem',621,11),(6293,'Sanguem',621,11),(6294,'Canacona',621,11),(6295,'Amini',622,19),(6296,'Bitra',622,19),(6297,'Chetlat',622,19),(6298,'Kiltan',622,19),(6299,'Kadmat',622,19),(6300,'Kavaratti',622,19),(6301,'Agatti',622,19),(6302,'Andrott',622,19),(6303,'Kalpeni',622,19),(6304,'Minicoy',622,19),(6305,'Kasaragod',627,18),(6306,'Hosdurg',627,18),(6307,'Taliparamba',626,18),(6308,'Kannur',626,18),(6309,'Thalassery',626,18),(6310,'Mananthavady',636,18),(6311,'Sulthanbathery',636,18),(6312,'Vythiri',636,18),(6313,'Vadakara',630,18),(6314,'Quilandy',630,18),(6315,'Kozhikode',630,18),(6316,'Ernad',631,18),(6317,'Nilambur',631,18),(6318,'Perinthalmanna',631,18),(6319,'Tirur',631,18),(6320,'Tirurangadi',631,18),(6321,'Ponnani',631,18),(6322,'Ottappalam',632,18),(6323,'Mannarkad',632,18),(6324,'Palakkad',632,18),(6325,'Chittur',632,18),(6326,'Alathur',632,18),(6327,'Talappilly',635,18),(6328,'Chavakkad',635,18),(6329,'Thrissur',635,18),(6330,'Kodungallur',635,18),(6331,'Mukundapuram',635,18),(6332,'Kunnathunad',624,18),(6333,'Aluva',624,18),(6334,'Paravur',624,18),(6335,'Kochi',624,18),(6336,'Kanayannur',624,18),(6337,'Muvattupuzha',624,18),(6338,'Kothamangalam',624,18),(6339,'Devikulam',625,18),(6340,'Udumbanchola',625,18),(6341,'Thodupuzha',625,18),(6342,'Peerumade',625,18),(6343,'Meenachil',629,18),(6344,'Vaikom',629,18),(6345,'Kottayam',629,18),(6346,'Changanassery',629,18),(6347,'Kanjirappally',629,18),(6348,'Cherthala',623,18),(6349,'Ambalappuzha',623,18),(6350,'Kuttanad',623,18),(6351,'Karthikappally',623,18),(6352,'Chengannur',623,18),(6353,'Mavelikkara',623,18),(6354,'Thiruvalla',633,18),(6355,'Mallappally',633,18),(6356,'Ranni',633,18),(6357,'Kozhenchery',633,18),(6358,'Adoor',633,18),(6359,'Karunagappally',628,18),(6360,'Kunnathur',628,18),(6361,'Pathanapuram',628,18),(6362,'Kottarakkara',628,18),(6363,'Kollam',628,18),(6364,'Chirayinkeezhu',634,18),(6365,'Nedumangad',634,18),(6366,'Thiruvananthapuram',634,18),(6367,'Neyyattinkara',634,18),(6368,'Gummidipoondi',663,31),(6369,'Ponneri',663,31),(6370,'Uthukkottai',663,31),(6371,'Tiruttani',663,31),(6372,'Pallipattu',663,31),(6373,'Thiruvallur',663,31),(6374,'Poonamallee',663,31),(6375,'Ambattur',663,31),(6376,'Mathavaram',663,31),(6377,'Sriperumbudur',644,31),(6378,'Tambaram',644,31),(6379,'Alandur',644,31),(6380,'Sholinganallur',644,31),(6381,'Chengalpattu',644,31),(6382,'Kancheepuram',644,31),(6383,'Uthiramerur',644,31),(6384,'Tirukalukundram',644,31),(6385,'Maduranthakam',644,31),(6386,'Cheyyur',644,31),(6387,'Gudiyatham',666,31),(6388,'Katpadi',666,31),(6389,'Wallajah',666,31),(6390,'Arakonam',666,31),(6391,'Arcot',666,31),(6392,'Vellore',666,31),(6393,'Vaniyambadi',666,31),(6394,'Ambur',666,31),(6395,'Tirupathur',666,31),(6396,'Arani',664,31),(6397,'Cheyyar',664,31),(6398,'Vandavasi',664,31),(6399,'Polur',664,31),(6400,'Chengam',664,31),(6401,'Thandrampet',664,31),(6402,'Tiruvannamalai',664,31),(6403,'Gingee',667,31),(6404,'Tindivanam',667,31),(6405,'Vanur',667,31),(6406,'Viluppuram',667,31),(6407,'Tirukkoyilur',667,31),(6408,'Sankarapuram',667,31),(6409,'Kallakkurichi',667,31),(6410,'Ulundurpettai',667,31),(6411,'Mettur',655,31),(6412,'Omalur',655,31),(6413,'Edappadi',655,31),(6414,'Sankari',655,31),(6415,'Salem',655,31),(6416,'Yercaud',655,31),(6417,'Vazhapadi',655,31),(6418,'Attur',655,31),(6419,'Gangavalli',655,31),(6420,'Tiruchengode',650,31),(6421,'Rasipuram',650,31),(6422,'Namakkal',650,31),(6423,'Paramathi-Velur',650,31),(6424,'Sathyamangalam',643,31),(6425,'Bhavani',643,31),(6426,'Gobichettipalayam',643,31),(6427,'Perundurai',643,31),(6428,'Erode',643,31),(6429,'Panthalur',651,31),(6430,'Gudalur',651,31),(6431,'Udhagamandalam',651,31),(6432,'Kotagiri',651,31),(6433,'Coonoor',651,31),(6434,'Kundah',651,31),(6435,'Palani',642,31),(6436,'Oddanchatram',642,31),(6437,'Vedasandur',642,31),(6438,'Natham',642,31),(6439,'Dindigul',642,31),(6440,'Attur',642,31),(6441,'Kodaikanal',642,31),(6442,'Nilakkottai',642,31),(6443,'Aravakurichi',646,31),(6444,'Karur',646,31),(6445,'Krishnarayapuram',646,31),(6446,'Kulithalai',646,31),(6447,'Kadavur',646,31),(6448,'Thottiyam',660,31),(6449,'Musiri',660,31),(6450,'Thuraiyur',660,31),(6451,'Manachanallur',660,31),(6452,'Lalgudi',660,31),(6453,'Srirangam',660,31),(6454,'Tiruchirappalli',660,31),(6455,'Thiruverumbur',660,31),(6456,'Manapparai',660,31),(6457,'Veppanthattai',652,31),(6458,'Perambalur',652,31),(6459,'Kunnam',652,31),(6460,'Sendurai',637,31),(6461,'Udayarpalayam',637,31),(6462,'Ariyalur',637,31),(6463,'Panruti',640,31),(6464,'Cuddalore',640,31),(6465,'Kurinjipadi',640,31),(6466,'Chidambaram',640,31),(6467,'Kattumannarkoil',640,31),(6468,'Virudhachalam',640,31),(6469,'Tittakudi',640,31),(6470,'Sirkali',649,31),(6471,'Mayiladuthurai',649,31),(6472,'Kuthalam',649,31),(6473,'Tharangambadi',649,31),(6474,'Nagapattinam',649,31),(6475,'Kilvelur',649,31),(6476,'Thirukkuvalai',649,31),(6477,'Vedaranyam',649,31),(6478,'Valangaiman',665,31),(6479,'Kodavasal',665,31),(6480,'Nannilam',665,31),(6481,'Thiruvarur',665,31),(6482,'Needamangalam',665,31),(6483,'Mannargudi',665,31),(6484,'Thiruthuraipoondi',665,31),(6485,'Thiruvidaimarudur',657,31),(6486,'Kumbakonam',657,31),(6487,'Papanasam',657,31),(6488,'Thiruvaiyaru',657,31),(6489,'Thanjavur',657,31),(6490,'Orathanadu',657,31),(6491,'Pattukkottai',657,31),(6492,'Peravurani',657,31),(6493,'Iluppur',653,31),(6494,'Kulathur',653,31),(6495,'Gandarvakkottai',653,31),(6496,'Pudukkottai',653,31),(6497,'Thirumayam',653,31),(6498,'Ponnamaravathi',653,31),(6499,'Alangudi',653,31),(6500,'Karambakudi',653,31),(6501,'Aranthangi',653,31),(6502,'Manamelkudi',653,31),(6503,'Avudayarkoil',653,31),(6504,'Tirupathur',656,31),(6505,'Karaikkudi',656,31),(6506,'Devakottai',656,31),(6507,'Sivaganga',656,31),(6508,'Manamadurai',656,31),(6509,'Ilayangudi',656,31),(6510,'Melur',648,31),(6511,'Madurai North',648,31),(6512,'Vadipatti',648,31),(6513,'Usilampatti',648,31),(6514,'Peraiyur',648,31),(6515,'Thirumangalam',648,31),(6516,'Madurai South',648,31),(6517,'Bodinayakanur',658,31),(6518,'Periyakulam',658,31),(6519,'Theni',658,31),(6520,'Uthamapalayam',658,31),(6521,'Andipatti',658,31),(6522,'Rajapalayam',668,31),(6523,'Srivilliputhur',668,31),(6524,'Sivakasi',668,31),(6525,'Virudhunagar',668,31),(6526,'Kariapatti',668,31),(6527,'Tiruchuli',668,31),(6528,'Aruppukkottai',668,31),(6529,'Sattur',668,31),(6530,'Tiruvadanai',654,31),(6531,'Paramakudi',654,31),(6532,'Mudukulathur',654,31),(6533,'Kamuthi',654,31),(6534,'Kadaladi',654,31),(6535,'Ramanathapuram',654,31),(6536,'Rameswaram',654,31),(6537,'Kovilpatti',659,31),(6538,'Ettayapuram',659,31),(6539,'Vilathikulam',659,31),(6540,'Ottapidaram',659,31),(6541,'Thoothukkudi',659,31),(6542,'Srivaikuntam',659,31),(6543,'Tiruchendur',659,31),(6544,'Sathankulam',659,31),(6545,'Sivagiri',661,31),(6546,'Sankarankoil',661,31),(6547,'Veerakeralamputhur',661,31),(6548,'Tenkasi',661,31),(6549,'Shenkottai',661,31),(6550,'Alangulam',661,31),(6551,'Tirunelveli',661,31),(6552,'Palayamkottai',661,31),(6553,'Ambasamudram',661,31),(6554,'Nanguneri',661,31),(6555,'Radhapuram',661,31),(6556,'Vilavancode',645,31),(6557,'Kalkulam',645,31),(6558,'Thovala',645,31),(6559,'Agastheeswaram',645,31),(6560,'Palakkodu',641,31),(6561,'Harur',641,31),(6562,'Pappireddipatti',641,31),(6563,'Dharmapuri',641,31),(6564,'Pennagaram',641,31),(6565,'Hosur',647,31),(6566,'Krishnagiri',647,31),(6567,'Denkanikottai',647,31),(6568,'Pochampalli',647,31),(6569,'Uthangarai',647,31),(6570,'Mettupalayam',639,31),(6571,'Sulur',639,31),(6572,'Coimbatore North',639,31),(6573,'Coimbatore South',639,31),(6574,'Pollachi',639,31),(6575,'Valparai',639,31),(6576,'Kangeyam',662,31),(6577,'Dharapuram',662,31),(6578,'Avanashi',662,31),(6579,'Tiruppur',662,31),(6580,'Palladam',662,31),(6581,'Udumalaipettai',662,31),(6582,'Madathukulam',662,31),(6583,'Yanam Taluk',672,27),(6584,'Puducherry Taluk',671,27),(6585,'Ozhukarai Taluk',671,27),(6586,'Villianur Taluk',671,27),(6587,'Bahour Taluk',671,27),(6588,'Mahe Taluk',670,27),(6589,'Karaikal Taluk',669,27),(6590,'Thirunallar Taluk',669,27),(6591,'Car Nicobar',673,1),(6592,'Nancowry',673,1),(6593,'Great Nicobar',673,1),(6594,'Diglipur',674,1),(6595,'Mayabunder',674,1),(6596,'Rangat',674,1),(6597,'Ferrargunj',675,1),(6598,'Port Blair',675,1),(6599,'Little Andaman',675,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (1,'Gurmukh','gurmukh@yopmail.com','My Subject','My Message'),(2,'Sulabh','sulabh@yopmail.com','My Sub','My Messag'),(3,'Ashima','ashima@yopmail.com','hi','Hw r u');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealership_distribution`
--

DROP TABLE IF EXISTS `dealership_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealership_distribution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealership_distribution`
--

LOCK TABLES `dealership_distribution` WRITE;
/*!40000 ALTER TABLE `dealership_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealership_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor_user_commission`
--

DROP TABLE IF EXISTS `distributor_user_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor_user_commission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sale_commission` double NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `distributor_user_commission_user_id_f3a1bbb1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `distributor_user_commission_user_id_f3a1bbb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_user_commission`
--

LOCK TABLES `distributor_user_commission` WRITE;
/*!40000 ALTER TABLE `distributor_user_commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributor_user_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district_state_id_74d1b4aa_fk_state_id` (`state_id`),
  CONSTRAINT `district_state_id_74d1b4aa_fk_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (36,'Anantnag',15),(37,'Bandipore',15),(38,'Baramulla',15),(39,'Budgam',15),(40,'Doda',15),(41,'Ganderbal',15),(42,'Jammu',15),(43,'Kargil',15),(44,'Kathua',15),(45,'Kishtwar',15),(46,'Kulgam',15),(47,'Kupwara',15),(48,'Leh (Ladakh)',15),(49,'Poonch',15),(50,'Pulwama',15),(51,'Rajouri',15),(52,'Ramban',15),(53,'Reasi',15),(54,'Samba',15),(55,'Shopian',15),(56,'Srinagar',15),(57,'Udhampur',15),(58,'Bilaspur (Himachal Pradesh)',14),(59,'Chamba',14),(60,'Hamirpur (Himachal Pradesh)',14),(61,'Kangra',14),(62,'Kinnaur',14),(63,'Kullu',14),(64,'Lahul & Spiti',14),(65,'Mandi',14),(66,'Shimla',14),(67,'Sirmaur',14),(68,'Solan',14),(69,'Una',14),(70,'Amritsar',28),(71,'Barnala',28),(72,'Bathinda',28),(73,'Faridkot',28),(74,'Fatehgarh Sahib',28),(75,'Firozpur',28),(76,'Gurdaspur',28),(77,'Hoshiarpur',28),(78,'Jalandhar',28),(79,'Kapurthala',28),(80,'Ludhiana',28),(81,'Mansa',28),(82,'Moga',28),(83,'Muktsar',28),(84,'Patiala',28),(85,'Rupnagar (Ropar)',28),(86,'Sahibzada Ajit Singh Nagar (Mohali)',28),(87,'Sangrur',28),(88,'Shahid Bhagat Singh Nagar (Nawanshahr)',28),(89,'Tarn Taran',28),(90,'Chandigarh',6),(91,'Almora',34),(92,'Bageshwar',34),(93,'Chamoli',34),(94,'Champawat',34),(95,'Dehradun',34),(96,'Haridwar',34),(97,'Nainital',34),(98,'Pauri Garhwal',34),(99,'Pithoragarh',34),(100,'Rudraprayag',34),(101,'Tehri Garhwal',34),(102,'Udham Singh Nagar',34),(103,'Uttarkashi',34),(104,'Ambala',13),(105,'Bhiwani',13),(106,'Faridabad',13),(107,'Fatehabad',13),(108,'Gurgaon',13),(109,'Hisar',13),(110,'Jhajjar',13),(111,'Jind',13),(112,'Kaithal',13),(113,'Karnal',13),(114,'Kurukshetra',13),(115,'Mahendragarh',13),(116,'Mewat',13),(117,'Palwal',13),(118,'Panchkula',13),(119,'Panipat',13),(120,'Rewari',13),(121,'Rohtak',13),(122,'Sirsa',13),(123,'Sonipat',13),(124,'Yamuna Nagar',13),(125,'Central Delhi',10),(126,'East Delhi',10),(127,'New Delhi',10),(128,'North Delhi',10),(129,'North East Delhi',10),(130,'North West Delhi',10),(131,'South Delhi',10),(132,'South West Delhi',10),(133,'West Delhi',10),(134,'Ajmer',29),(135,'Alwar',29),(136,'Banswara',29),(137,'Baran',29),(138,'Barmer',29),(139,'Bharatpur',29),(140,'Bhilwara',29),(141,'Bikaner',29),(142,'Bundi',29),(143,'Chittorgarh',29),(144,'Churu',29),(145,'Dausa',29),(146,'Dholpur',29),(147,'Dungarpur',29),(148,'Ganganagar',29),(149,'Hanumangarh',29),(150,'Jaipur',29),(151,'Jaisalmer',29),(152,'Jalor',29),(153,'Jhalawar',29),(154,'Jhunjhunu',29),(155,'Jodhpur',29),(156,'Karauli',29),(157,'Kota',29),(158,'Nagaur',29),(159,'Pali',29),(160,'Pratapgarh (Rajasthan)',29),(161,'Rajsamand',29),(162,'Sawai Madhopur',29),(163,'Sikar',29),(164,'Sirohi',29),(165,'Tonk',29),(166,'Udaipur',29),(167,'Agra',33),(168,'Aligarh',33),(169,'Allahabad',33),(170,'Ambedkar Nagar',33),(171,'Auraiya',33),(172,'Azamgarh',33),(173,'Bagpat',33),(174,'Bahraich',33),(175,'Ballia',33),(176,'Balrampur',33),(177,'Banda',33),(178,'Barabanki',33),(179,'Bareilly',33),(180,'Basti',33),(181,'Bijnor',33),(182,'Budaun',33),(183,'Bulandshahr',33),(184,'Chandauli',33),(185,'Chitrakoot',33),(186,'Deoria',33),(187,'Etah',33),(188,'Etawah',33),(189,'Faizabad',33),(190,'Farrukhabad',33),(191,'Fatehpur',33),(192,'Firozabad',33),(193,'Gautam Buddha Nagar',33),(194,'Ghaziabad',33),(195,'Ghazipur',33),(196,'Gonda',33),(197,'Gorakhpur',33),(198,'Hamirpur',33),(199,'Hardoi',33),(200,'Hathras',33),(201,'Jalaun',33),(202,'Jaunpur',33),(203,'Jhansi',33),(204,'Jyotiba Phule Nagar',33),(205,'Kannauj',33),(206,'Kanpur Dehat',33),(207,'Kanpur Nagar',33),(208,'Kanshiram Nagar',33),(209,'Kaushambi',33),(210,'Kheri',33),(211,'Kushinagar',33),(212,'Lalitpur',33),(213,'Lucknow',33),(214,'Maharajganj',33),(215,'Mahoba',33),(216,'Mainpuri',33),(217,'Mathura',33),(218,'Mau',33),(219,'Meerut',33),(220,'Mirzapur',33),(221,'Moradabad',33),(222,'Muzaffarnagar',33),(223,'Pilibhit',33),(224,'Pratapgarh',33),(225,'Rae Bareli',33),(226,'Rampur',33),(227,'Saharanpur',33),(228,'Sant Kabir Nagar',33),(229,'Sant Ravidas Nagar (Bhadohi)',33),(230,'Shahjahanpur',33),(231,'Shrawasti',33),(232,'Siddharthnagar',33),(233,'Sitapur',33),(234,'Sonbhadra',33),(235,'Sultanpur',33),(236,'Unnao',33),(237,'Varanasi',33),(238,'Araria',5),(239,'Arwal',5),(240,'Aurangabad (Bihar)',5),(241,'Banka',5),(242,'Begusarai',5),(243,'Bhagalpur',5),(244,'Bhojpur',5),(245,'Buxar',5),(246,'Darbhanga',5),(247,'East Champaran',5),(248,'Gaya',5),(249,'Gopalganj',5),(250,'Jamui',5),(251,'Jehanabad',5),(252,'Kaimur (Bhabua)',5),(253,'Katihar',5),(254,'Khagaria',5),(255,'Kishanganj',5),(256,'Lakhisarai',5),(257,'Madhepura',5),(258,'Madhubani',5),(259,'Munger',5),(260,'Muzaffarpur',5),(261,'Nalanda',5),(262,'Nawada',5),(263,'Patna',5),(264,'Purnia',5),(265,'Rohtas',5),(266,'Saharsa',5),(267,'Samastipur',5),(268,'Saran',5),(269,'Sheikhpura',5),(270,'Sheohar',5),(271,'Sitamarhi',5),(272,'Siwan',5),(273,'Supaul',5),(274,'Vaishali',5),(275,'West Champaran',5),(276,'East Sikkim',30),(277,'North Sikkim',30),(278,'South Sikkim',30),(279,'West Sikkim',30),(280,'Anjaw',3),(281,'Changlang',3),(282,'Dibang Valley',3),(283,'East Kameng',3),(284,'East Siang',3),(285,'Kurung Kumey',3),(286,'Lohit',3),(287,'Lower Dibang Valley',3),(288,'Lower Subansiri',3),(289,'Papum Pare',3),(290,'Tawang',3),(291,'Tirap',3),(292,'Upper Siang',3),(293,'Upper Subansiri',3),(294,'West Kameng',3),(295,'West Siang',3),(296,'Dimapur',25),(297,'Kiphire',25),(298,'Kohima',25),(299,'Longleng',25),(300,'Mokokchung',25),(301,'Mon',25),(302,'Peren',25),(303,'Phek',25),(304,'Tuensang',25),(305,'Wokha',25),(306,'Zunheboto',25),(307,'Bishnupur',22),(308,'Chandel',22),(309,'Churachandpur',22),(310,'Imphal East',22),(311,'Imphal West',22),(312,'Senapati',22),(313,'Tamenglong',22),(314,'Thoubal',22),(315,'Ukhrul',22),(316,'Aizawl',24),(317,'Champhai',24),(318,'Kolasib',24),(319,'Lawngtlai',24),(320,'Lunglei',24),(321,'Mamit',24),(322,'Saiha',24),(323,'Serchhip',24),(324,'Dhalai',32),(325,'North Tripura',32),(326,'South Tripura',32),(327,'West Tripura',32),(328,'East Garo Hills',23),(329,'East Khasi Hills',23),(330,'Jaintia Hills',23),(331,'Ri Bhoi',23),(332,'South Garo Hills',23),(333,'West Garo Hills',23),(334,'West Khasi Hills',23),(335,'Baksa',4),(336,'Barpeta',4),(337,'Bongaigaon',4),(338,'Cachar',4),(339,'Chirang',4),(340,'Darrang',4),(341,'Dhemaji',4),(342,'Dhubri',4),(343,'Dibrugarh',4),(344,'Dima Hasao (North Cachar Hills)',4),(345,'Goalpara',4),(346,'Golaghat',4),(347,'Hailakandi',4),(348,'Jorhat',4),(349,'Kamrup',4),(350,'Kamrup Metropolitan',4),(351,'Karbi Anglong',4),(352,'Karimganj',4),(353,'Kokrajhar',4),(354,'Lakhimpur',4),(355,'Morigaon',4),(356,'Nagaon',4),(357,'Nalbari',4),(358,'Sivasagar',4),(359,'Sonitpur',4),(360,'Tinsukia',4),(361,'Udalguri',4),(362,'Bankura',35),(363,'Bardhaman',35),(364,'Birbhum',35),(365,'Cooch Behar',35),(366,'Dakshin Dinajpur (South Dinajpur)',35),(367,'Darjiling',35),(368,'Hooghly',35),(369,'Howrah',35),(370,'Jalpaiguri',35),(371,'Kolkata',35),(372,'Maldah',35),(373,'Murshidabad',35),(374,'Nadia',35),(375,'North 24 Parganas',35),(376,'Paschim Medinipur (West Midnapore)',35),(377,'Purba Medinipur (East Midnapore)',35),(378,'Puruliya',35),(379,'South 24 Parganas',35),(380,'Uttar Dinajpur (North Dinajpur)',35),(381,'Bokaro',16),(382,'Chatra',16),(383,'Deoghar',16),(384,'Dhanbad',16),(385,'Dumka',16),(386,'East Singhbhum',16),(387,'Garhwa',16),(388,'Giridih',16),(389,'Godda',16),(390,'Gumla',16),(391,'Hazaribagh',16),(392,'Jamtara',16),(393,'Khunti',16),(394,'Koderma',16),(395,'Latehar',16),(396,'Lohardaga',16),(397,'Pakur',16),(398,'Palamu',16),(399,'Ramgarh',16),(400,'Ranchi',16),(401,'Sahibganj',16),(402,'Seraikela-Kharsawan',16),(403,'Simdega',16),(404,'West Singhbhum',16),(405,'Angul',26),(406,'Balangir',26),(407,'Baleswar',26),(408,'Bargarh',26),(409,'Bhadrak',26),(410,'Boudh',26),(411,'Cuttack',26),(412,'Debagarh',26),(413,'Dhenkanal',26),(414,'Gajapati',26),(415,'Ganjam',26),(416,'Jagatsinghapur',26),(417,'Jajapur',26),(418,'Jharsuguda',26),(419,'Kalahandi',26),(420,'Kandhamal',26),(421,'Kendrapara',26),(422,'Kendujhar',26),(423,'Khordha',26),(424,'Koraput',26),(425,'Malkangiri',26),(426,'Mayurbhanj',26),(427,'Nabarangapur',26),(428,'Nayagarh',26),(429,'Nuapada',26),(430,'Puri',26),(431,'Rayagada',26),(432,'Sambalpur',26),(433,'Subarnapur (Sonapur)',26),(434,'Sundergarh',26),(435,'Bastar',7),(436,'Bijapur (Chhattisgarh)',7),(437,'Bilaspur (Chhattisgarh)',7),(438,'Dakshin Bastar Dantewada',7),(439,'Dhamtari',7),(440,'Durg',7),(441,'Janjgir-Champa',7),(442,'Jashpur',7),(443,'Kabirdham (Kawardha)',7),(444,'Korba',7),(445,'Koriya',7),(446,'Mahasamund',7),(447,'Narayanpur',7),(448,'Raigarh (Chhattisgarh)',7),(449,'Raipur',7),(450,'Rajnandgaon',7),(451,'Surguja',7),(452,'Uttar Bastar Kanker',7),(453,'Alirajpur',20),(454,'Anuppur',20),(455,'Ashok Nagar',20),(456,'Balaghat',20),(457,'Barwani',20),(458,'Betul',20),(459,'Bhind',20),(460,'Bhopal',20),(461,'Burhanpur',20),(462,'Chhatarpur',20),(463,'Chhindwara',20),(464,'Damoh',20),(465,'Datia',20),(466,'Dewas',20),(467,'Dhar',20),(468,'Dindori',20),(469,'Guna',20),(470,'Gwalior',20),(471,'Harda',20),(472,'Hoshangabad',20),(473,'Indore',20),(474,'Jabalpur',20),(475,'Jhabua',20),(476,'Katni',20),(477,'Khandwa (East Nimar)',20),(478,'Khargone (West Nimar)',20),(479,'Mandla',20),(480,'Mandsaur',20),(481,'Morena',20),(482,'Narsinghpur',20),(483,'Neemuch',20),(484,'Panna',20),(485,'Raisen',20),(486,'Rajgarh',20),(487,'Ratlam',20),(488,'Rewa',20),(489,'Sagar',20),(490,'Satna',20),(491,'Sehore',20),(492,'Seoni',20),(493,'Shahdol',20),(494,'Shajapur',20),(495,'Sheopur',20),(496,'Shivpuri',20),(497,'Sidhi',20),(498,'Singrauli',20),(499,'Tikamgarh',20),(500,'Ujjain',20),(501,'Umaria',20),(502,'Vidisha',20),(503,'Ahmedabad',12),(504,'Amreli',12),(505,'Anand',12),(506,'Banaskantha',12),(507,'Bharuch',12),(508,'Bhavnagar',12),(509,'Dahod',12),(510,'Gandhi Nagar',12),(511,'Jamnagar',12),(512,'Junagadh',12),(513,'Kachchh',12),(514,'Kheda',12),(515,'Mahesana',12),(516,'Narmada',12),(517,'Navsari',12),(518,'Panch Mahals',12),(519,'Patan',12),(520,'Porbandar',12),(521,'Rajkot',12),(522,'Sabarkantha',12),(523,'Surat',12),(524,'Surendra Nagar',12),(525,'Tapi',12),(526,'The Dangs',12),(527,'Vadodara',12),(528,'Valsad',12),(529,'Daman',9),(530,'Diu',9),(531,'Dadra & Nagar Haveli',8),(532,'Ahmed Nagar',21),(533,'Akola',21),(534,'Amravati',21),(535,'Aurangabad',21),(536,'Beed',21),(537,'Bhandara',21),(538,'Buldhana',21),(539,'Chandrapur',21),(540,'Dhule',21),(541,'Gadchiroli',21),(542,'Gondia',21),(543,'Hingoli',21),(544,'Jalgaon',21),(545,'Jalna',21),(546,'Kolhapur',21),(547,'Latur',21),(548,'Mumbai',21),(549,'Mumbai Suburban',21),(550,'Nagpur',21),(551,'Nanded',21),(552,'Nandurbar',21),(553,'Nashik',21),(554,'Osmanabad',21),(555,'Parbhani',21),(556,'Pune',21),(557,'Raigarh (Maharashtra)',21),(558,'Ratnagiri',21),(559,'Sangli',21),(560,'Satara',21),(561,'Sindhudurg',21),(562,'Solapur',21),(563,'Thane',21),(564,'Wardha',21),(565,'Washim',21),(566,'Yavatmal',21),(567,'Adilabad',2),(568,'Anantapur',2),(569,'Chittoor',2),(570,'East Godavari',2),(571,'Guntur',2),(572,'Hyderabad',2),(573,'Kadapa (Cuddapah)',2),(574,'Karim Nagar',2),(575,'Khammam',2),(576,'Krishna',2),(577,'Kurnool',2),(578,'Mahbubnagar',2),(579,'Medak',2),(580,'Nalgonda',2),(581,'Nellore',2),(582,'Nizamabad',2),(583,'Prakasam',2),(584,'Rangareddy',2),(585,'Srikakulam',2),(586,'Visakhapatnam',2),(587,'Vizianagaram',2),(588,'Warangal',2),(589,'West Godavari',2),(590,'Bagalkot',17),(591,'Bangalore',17),(592,'Bangalore Rural',17),(593,'Belgaum',17),(594,'Bellary',17),(595,'Bidar',17),(596,'Bijapur (Karnataka)',17),(597,'Chamrajnagar',17),(598,'Chickmagalur',17),(599,'Chikkaballapur',17),(600,'Chitradurga',17),(601,'Dakshina Kannada',17),(602,'Davanagere',17),(603,'Dharwad',17),(604,'Gadag',17),(605,'Gulbarga',17),(606,'Hassan',17),(607,'Haveri',17),(608,'Kodagu',17),(609,'Kolar',17),(610,'Koppal',17),(611,'Mandya',17),(612,'Mysore',17),(613,'Raichur',17),(614,'Ramanagara',17),(615,'Shimoga',17),(616,'Tumkur',17),(617,'Udupi',17),(618,'Uttara Kannada',17),(619,'Yadgir',17),(620,'North Goa',11),(621,'South Goa',11),(622,'Lakshadweep',19),(623,'Alappuzha',18),(624,'Ernakulam',18),(625,'Idukki',18),(626,'Kannur',18),(627,'Kasaragod',18),(628,'Kollam',18),(629,'Kottayam',18),(630,'Kozhikode',18),(631,'Malappuram',18),(632,'Palakkad',18),(633,'Pathanamthitta',18),(634,'Thiruvananthapuram',18),(635,'Thrissur',18),(636,'Wayanad',18),(637,'Ariyalur',31),(638,'Chennai',31),(639,'Coimbatore',31),(640,'Cuddalore',31),(641,'Dharmapuri',31),(642,'Dindigul',31),(643,'Erode',31),(644,'Kanchipuram',31),(645,'Kanyakumari',31),(646,'Karur',31),(647,'Krishnagiri',31),(648,'Madurai',31),(649,'Nagapattinam',31),(650,'Namakkal',31),(651,'Nilgiris',31),(652,'Perambalur',31),(653,'Pudukkottai',31),(654,'Ramanathapuram',31),(655,'Salem',31),(656,'Sivaganga',31),(657,'Thanjavur',31),(658,'Theni',31),(659,'Thoothukudi (Tuticorin)',31),(660,'Tiruchirappalli',31),(661,'Tirunelveli',31),(662,'Tiruppur',31),(663,'Tiruvallur',31),(664,'Tiruvannamalai',31),(665,'Tiruvarur',31),(666,'Vellore',31),(667,'Viluppuram',31),(668,'Virudhunagar',31),(669,'Karaikal',27),(670,'Mahe',27),(671,'Puducherry (Pondicherry)',27),(672,'Yanam',27),(673,'Nicobar',1),(674,'North And Middle Andaman',1),(675,'South Andaman',1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (51,'2021-11-12 08:27:23.260623','fe1b9895-c877-4953-9b95-174f54692b2d','ForgetPasswordLog object (fe1b9895-c877-4953-9b95-174f54692b2d)',3,'',51,109),(52,'2021-11-12 08:27:23.366658','f780dca2-c9bd-4ec6-a75c-739eb79ab105','ForgetPasswordLog object (f780dca2-c9bd-4ec6-a75c-739eb79ab105)',3,'',51,109),(53,'2021-11-12 08:27:23.474570','f18f6455-399f-4e90-ae96-4c449037257e','ForgetPasswordLog object (f18f6455-399f-4e90-ae96-4c449037257e)',3,'',51,109),(54,'2021-11-12 08:27:23.639901','eda0791a-52ab-4ca7-9ed0-7afd120ca1d8','ForgetPasswordLog object (eda0791a-52ab-4ca7-9ed0-7afd120ca1d8)',3,'',51,109),(55,'2021-11-12 08:27:24.108039','ecf75166-ddc6-4a45-8f30-107a5550903a','ForgetPasswordLog object (ecf75166-ddc6-4a45-8f30-107a5550903a)',3,'',51,109),(56,'2021-11-12 08:27:24.191450','eaff1200-e2f3-4e55-85a9-0221ff4a8a62','ForgetPasswordLog object (eaff1200-e2f3-4e55-85a9-0221ff4a8a62)',3,'',51,109),(57,'2021-11-12 08:27:24.266868','e561de2b-4704-45a6-8f11-83353b09e8de','ForgetPasswordLog object (e561de2b-4704-45a6-8f11-83353b09e8de)',3,'',51,109),(58,'2021-11-12 08:27:24.358550','e46a85fd-6d6f-4833-b499-546dca850c1e','ForgetPasswordLog object (e46a85fd-6d6f-4833-b499-546dca850c1e)',3,'',51,109),(59,'2021-11-12 08:27:24.475246','df10ee59-d7cf-4ce1-8bd4-db89f30bd08c','ForgetPasswordLog object (df10ee59-d7cf-4ce1-8bd4-db89f30bd08c)',3,'',51,109),(60,'2021-11-12 08:27:24.592122','de7c89c4-d4b9-495b-a95e-3767405af249','ForgetPasswordLog object (de7c89c4-d4b9-495b-a95e-3767405af249)',3,'',51,109),(61,'2021-11-12 08:27:24.683924','cba283f6-a60a-418c-ae70-2e477f5524af','ForgetPasswordLog object (cba283f6-a60a-418c-ae70-2e477f5524af)',3,'',51,109),(62,'2021-11-12 08:27:24.775717','c25505dd-e3da-49dc-a453-5747bf46a1a4','ForgetPasswordLog object (c25505dd-e3da-49dc-a453-5747bf46a1a4)',3,'',51,109),(63,'2021-11-12 08:27:24.892698','bcafcc52-413a-480a-ba6b-b33de69efd2c','ForgetPasswordLog object (bcafcc52-413a-480a-ba6b-b33de69efd2c)',3,'',51,109),(64,'2021-11-12 08:27:24.967938','b63f2906-1159-4036-a17a-e739de6b077d','ForgetPasswordLog object (b63f2906-1159-4036-a17a-e739de6b077d)',3,'',51,109),(65,'2021-11-12 08:27:25.076222','b60e8b21-4e83-4208-b308-6907e4e64c9d','ForgetPasswordLog object (b60e8b21-4e83-4208-b308-6907e4e64c9d)',3,'',51,109),(66,'2021-11-12 08:27:25.176457','b2aec239-ee6b-4d7e-81fa-f84d8369522f','ForgetPasswordLog object (b2aec239-ee6b-4d7e-81fa-f84d8369522f)',3,'',51,109),(67,'2021-11-12 08:27:25.276723','af9968d0-d577-4a3a-a7ff-e42d03a93b01','ForgetPasswordLog object (af9968d0-d577-4a3a-a7ff-e42d03a93b01)',3,'',51,109),(68,'2021-11-12 08:27:25.360353','a98c9c09-957e-4e4a-bbc3-88d73b5a3b1c','ForgetPasswordLog object (a98c9c09-957e-4e4a-bbc3-88d73b5a3b1c)',3,'',51,109),(69,'2021-11-12 08:27:25.443580','a8f9a61d-baf5-4f0b-9f29-5b14cb0da25b','ForgetPasswordLog object (a8f9a61d-baf5-4f0b-9f29-5b14cb0da25b)',3,'',51,109),(70,'2021-11-12 08:27:25.532891','a70f847e-1fa0-44df-a021-4cd515a0ec5d','ForgetPasswordLog object (a70f847e-1fa0-44df-a021-4cd515a0ec5d)',3,'',51,109),(71,'2021-11-12 08:27:25.641565','a61cb4a5-febb-460d-97c2-cfdbdd92d6cf','ForgetPasswordLog object (a61cb4a5-febb-460d-97c2-cfdbdd92d6cf)',3,'',51,109),(72,'2021-11-12 08:27:25.750011','a5a0ac6d-3bfd-4564-b731-bbb312378cec','ForgetPasswordLog object (a5a0ac6d-3bfd-4564-b731-bbb312378cec)',3,'',51,109),(73,'2021-11-12 08:27:25.860997','a3d52248-5242-4e54-9d5a-8ee297f6bbe7','ForgetPasswordLog object (a3d52248-5242-4e54-9d5a-8ee297f6bbe7)',3,'',51,109),(74,'2021-11-12 08:27:25.952782','a3ced69e-c30e-4743-b181-01fcb671e9f9','ForgetPasswordLog object (a3ced69e-c30e-4743-b181-01fcb671e9f9)',3,'',51,109),(75,'2021-11-12 08:27:26.041559','9ac26e77-a6ce-4f33-a274-508c1ecc86c8','ForgetPasswordLog object (9ac26e77-a6ce-4f33-a274-508c1ecc86c8)',3,'',51,109),(76,'2021-11-12 08:27:26.149955','9abcec91-87f9-4cb7-831c-b2db6f32be9c','ForgetPasswordLog object (9abcec91-87f9-4cb7-831c-b2db6f32be9c)',3,'',51,109),(77,'2021-11-12 08:27:26.261694','97af62ea-1c65-4374-bfb5-dc74d5011272','ForgetPasswordLog object (97af62ea-1c65-4374-bfb5-dc74d5011272)',3,'',51,109),(78,'2021-11-12 08:27:26.353579','96dc4cef-1c5a-4f82-8b38-906a6cf80379','ForgetPasswordLog object (96dc4cef-1c5a-4f82-8b38-906a6cf80379)',3,'',51,109),(79,'2021-11-12 08:27:26.441514','92c1786c-231f-4e3d-a9aa-9f8136683097','ForgetPasswordLog object (92c1786c-231f-4e3d-a9aa-9f8136683097)',3,'',51,109),(80,'2021-11-12 08:27:26.549905','91807ccc-b2ad-4192-89fd-843a529040eb','ForgetPasswordLog object (91807ccc-b2ad-4192-89fd-843a529040eb)',3,'',51,109),(81,'2021-11-12 08:27:26.662357','8d148bb8-b8f7-46fb-b124-676ec2f71f24','ForgetPasswordLog object (8d148bb8-b8f7-46fb-b124-676ec2f71f24)',3,'',51,109),(82,'2021-11-12 08:27:26.754233','8943dddf-9341-469f-ac2f-6a3f5dac3b56','ForgetPasswordLog object (8943dddf-9341-469f-ac2f-6a3f5dac3b56)',3,'',51,109),(83,'2021-11-12 08:27:26.849907','7b215f3c-030c-4e50-8da0-7e8b9b8193c9','ForgetPasswordLog object (7b215f3c-030c-4e50-8da0-7e8b9b8193c9)',3,'',51,109),(84,'2021-11-12 08:27:26.954569','797bf407-7e4b-4a8d-9e7e-d8fd35768a4c','ForgetPasswordLog object (797bf407-7e4b-4a8d-9e7e-d8fd35768a4c)',3,'',51,109),(85,'2021-11-12 08:27:27.047677','7870b05e-f271-4c0e-84e7-fddba547276b','ForgetPasswordLog object (7870b05e-f271-4c0e-84e7-fddba547276b)',3,'',51,109),(86,'2021-11-12 08:27:27.141518','782a5a40-4bd1-4441-a14b-490e9b6c47ac','ForgetPasswordLog object (782a5a40-4bd1-4441-a14b-490e9b6c47ac)',3,'',51,109),(87,'2021-11-12 08:27:27.247733','773d49b3-5d61-4860-a5e9-0976de807f66','ForgetPasswordLog object (773d49b3-5d61-4860-a5e9-0976de807f66)',3,'',51,109),(88,'2021-11-12 08:27:27.372935','6d403397-fcc3-4092-b416-e83fdab12b22','ForgetPasswordLog object (6d403397-fcc3-4092-b416-e83fdab12b22)',3,'',51,109),(89,'2021-11-12 08:27:27.481552','66d169ce-dc5e-40f6-8ef7-4656e039d5e7','ForgetPasswordLog object (66d169ce-dc5e-40f6-8ef7-4656e039d5e7)',3,'',51,109),(90,'2021-11-12 08:27:27.581506','5f50dcc4-8a0e-47ad-99e8-143283fe78ba','ForgetPasswordLog object (5f50dcc4-8a0e-47ad-99e8-143283fe78ba)',3,'',51,109),(91,'2021-11-12 08:27:27.673416','5a80e938-671a-4061-8c23-7427a846a6d7','ForgetPasswordLog object (5a80e938-671a-4061-8c23-7427a846a6d7)',3,'',51,109),(92,'2021-11-12 08:27:27.765301','53933eed-0a54-4655-8c38-1101f3161528','ForgetPasswordLog object (53933eed-0a54-4655-8c38-1101f3161528)',3,'',51,109),(93,'2021-11-12 08:27:27.857127','52ffacc9-10de-4cec-8b6d-3a37078ca367','ForgetPasswordLog object (52ffacc9-10de-4cec-8b6d-3a37078ca367)',3,'',51,109),(94,'2021-11-12 08:27:27.973887','3eb2ca5a-8237-4f91-9a2f-03cb122d38e5','ForgetPasswordLog object (3eb2ca5a-8237-4f91-9a2f-03cb122d38e5)',3,'',51,109),(95,'2021-11-12 08:27:28.090912','391cd93b-0538-4d56-82be-0c3ab6e714f3','ForgetPasswordLog object (391cd93b-0538-4d56-82be-0c3ab6e714f3)',3,'',51,109),(96,'2021-11-12 08:27:28.182700','34518e05-6af0-4b1f-8fd2-a9f4b17ca9af','ForgetPasswordLog object (34518e05-6af0-4b1f-8fd2-a9f4b17ca9af)',3,'',51,109),(97,'2021-11-12 08:27:28.274335','3022f734-127f-4e97-89cd-db22f742be89','ForgetPasswordLog object (3022f734-127f-4e97-89cd-db22f742be89)',3,'',51,109),(98,'2021-11-12 08:27:28.366295','3000a46b-d48b-48f7-b614-62b385400722','ForgetPasswordLog object (3000a46b-d48b-48f7-b614-62b385400722)',3,'',51,109),(99,'2021-11-12 08:27:28.474649','2e0711bd-bef9-4b39-a496-3c13d2fd7a3b','ForgetPasswordLog object (2e0711bd-bef9-4b39-a496-3c13d2fd7a3b)',3,'',51,109),(100,'2021-11-12 08:27:28.591627','2dc26f85-001e-402c-8564-0b4a7dec6bc2','ForgetPasswordLog object (2dc26f85-001e-402c-8564-0b4a7dec6bc2)',3,'',51,109),(101,'2021-11-12 08:27:28.683550','2da87eb2-6777-45e6-abb9-b4d7e7f5fe4f','ForgetPasswordLog object (2da87eb2-6777-45e6-abb9-b4d7e7f5fe4f)',3,'',51,109),(102,'2021-11-12 08:27:28.775130','2b1dcafb-8215-4ee7-ba20-128f3f4e57af','ForgetPasswordLog object (2b1dcafb-8215-4ee7-ba20-128f3f4e57af)',3,'',51,109),(103,'2021-11-12 08:27:28.892080','1bd2e48b-0ea2-461a-8431-b266dc7cf9d5','ForgetPasswordLog object (1bd2e48b-0ea2-461a-8431-b266dc7cf9d5)',3,'',51,109),(104,'2021-11-12 08:27:28.983824','1baa53d0-8401-46b8-9e29-ee0c53fc33a3','ForgetPasswordLog object (1baa53d0-8401-46b8-9e29-ee0c53fc33a3)',3,'',51,109),(105,'2021-11-12 08:27:29.075711','18d3e020-6417-4cba-b756-232804632341','ForgetPasswordLog object (18d3e020-6417-4cba-b756-232804632341)',3,'',51,109),(106,'2021-11-12 08:27:49.318751','108','111111@yopmail.com',3,'',4,109),(107,'2021-11-12 08:27:49.408884','107','1111@yopmail.com',3,'',4,109),(108,'2021-11-12 08:27:49.517362','106','111@yopmail.com',3,'',4,109),(109,'2021-11-12 08:27:49.634237','105','ab@gmail.com',3,'',4,109),(110,'2021-11-12 08:27:49.717694','104','ash123@yopmail.com',3,'',4,109),(111,'2021-11-12 08:27:49.809153','103','ashabc@yopmail.com',3,'',4,109),(112,'2021-11-12 08:27:49.901325','102','max001@yopmail.com',3,'',4,109),(113,'2021-11-12 08:27:49.993177','101','max003@yopmail.com',3,'',4,109),(114,'2021-11-12 08:27:50.185108','100','max00@yopmail.com',3,'',4,109),(115,'2021-11-12 08:27:50.443721','99','samo@yopmail.com',3,'',4,109),(116,'2021-11-12 08:27:50.593726','98','sam11@yopmail.com',3,'',4,109),(117,'2021-11-12 08:27:50.708291','97','max00711111@yopmail.com',3,'',4,109),(118,'2021-11-12 08:27:50.819768','96','max00711@yopmail.com',3,'',4,109),(119,'2021-11-12 08:27:50.902937','95','admin2@gmail.com',3,'',4,109),(120,'2021-11-12 08:27:50.986737','94','abc@yopmail.com',3,'',4,109),(121,'2021-11-12 08:27:51.078459','93','ajmal@yopmail.com',3,'',4,109),(122,'2021-11-12 08:27:51.173517','92','anil@yopmail.com',3,'',4,109),(123,'2021-11-12 08:27:51.278902','91','ankit@yopmail.com',3,'',4,109),(124,'2021-11-12 08:27:51.373543','90','gurmukh11@yopmail.com',3,'',4,109),(125,'2021-11-12 08:27:51.479121','89','naruto@yopmail.com',3,'',4,109),(126,'2021-11-12 08:27:51.579338','88','immtest@yopmail.com',3,'',4,109),(127,'2021-11-12 08:27:51.679111','87','aman12@yopmail.com',3,'',4,109),(128,'2021-11-12 08:27:51.773470','86','aman1@yopmail.com',3,'',4,109),(129,'2021-11-12 08:27:51.879509','85','aman@yopmail.com',3,'',4,109),(130,'2021-11-12 08:27:51.997708','84','ashh@yopmail.com',3,'',4,109),(131,'2021-11-12 08:27:52.089685','83','tester@yopmail.com',3,'',4,109),(132,'2021-11-12 08:27:52.181396','82','juh@yopmail.com',3,'',4,109),(133,'2021-11-12 08:27:52.273644','81','gurmukhsinghs@yopmail.com',3,'',4,109),(134,'2021-11-12 08:27:52.390023','80','max007@yopmail.com',3,'',4,109),(135,'2021-11-12 08:27:52.481863','79','dico@yopmail.com',3,'',4,109),(136,'2021-11-12 08:27:52.573637','78','cus@yopmail.com',3,'',4,109),(137,'2021-11-12 08:27:52.690075','77','jh@yopmail.com',3,'',4,109),(138,'2021-11-12 08:27:52.807396','76','fdfddffd@g.com',3,'',4,109),(139,'2021-11-12 08:27:52.899238','75','dfsf@yopmail.com',3,'',4,109),(140,'2021-11-12 08:27:53.002877','74','ash@yopmail.com',3,'',4,109),(141,'2021-11-12 08:27:53.108097','73','gurmukhssss@yopmail.com',3,'',4,109),(142,'2021-11-12 08:27:53.208333','72','gurmukhsss@yopmail.com',3,'',4,109),(143,'2021-11-12 08:27:53.291788','71','gurmukhss@yopmail.com',3,'',4,109),(144,'2021-11-12 08:27:53.381822','70','gurmukhs@yopmail.com',3,'',4,109),(145,'2021-11-12 08:27:53.483748','69','max888@yopmail.com',3,'',4,109),(146,'2021-11-12 08:27:53.598214','68','max123@yopmail.com',3,'',4,109),(147,'2021-11-12 08:27:53.701151','67','loki@yopmail.com',3,'',4,109),(148,'2021-11-12 08:27:53.893080','66','jing@yopmail.com',3,'',4,109),(149,'2021-11-12 08:27:53.981816','65','testdemo@yopmail.com',3,'',4,109),(150,'2021-11-12 08:27:54.093371','64','thor@yopmail.com',3,'',4,109),(151,'2021-11-12 08:27:54.181705','63','jennie@gmail.com',3,'',4,109),(152,'2021-11-12 08:27:54.335452','62','max15@yopmail.com',3,'',4,109),(153,'2021-11-12 08:27:54.410533','61','maxx@yopmail.com',3,'',4,109),(154,'2021-11-12 08:27:54.502438','60','demo123@yopmail.com',3,'',4,109),(155,'2021-11-12 08:27:54.610949','59','demo1@yopmail.com',3,'',4,109),(156,'2021-11-12 08:27:54.719459','58','demo@yopmail.com',3,'',4,109),(157,'2021-11-12 08:27:54.836330','57','test1@yopmail.com',3,'',4,109),(158,'2021-11-12 08:27:54.919851','56','test@yopmail.com',3,'',4,109),(159,'2021-11-12 08:27:55.021832','55','max1@yopmail.com',3,'',4,109),(160,'2021-11-12 08:27:55.253725','54','max@yopmail.com',3,'',4,109),(161,'2021-11-12 08:27:55.337180','53','jenifer@yopmail.com',3,'',4,109),(162,'2021-11-12 08:27:55.456850','52','city@yomail.com',3,'',4,109),(163,'2021-11-12 08:27:55.565329','51','j@yopmail.com',3,'',4,109),(164,'2021-11-12 08:27:55.673607','50','jk@yopmail.com',3,'',4,109),(165,'2021-11-12 08:27:55.779636','49','ashima@yopmail.com',3,'',4,109),(166,'2021-11-12 08:27:55.904852','48','gurmukh22@yopmail.com',3,'',4,109),(167,'2021-11-12 08:27:55.996725','47','GURMUKH21@YOPMAIL.COM',3,'',4,109),(168,'2021-11-12 08:27:56.205324','46','gurmukh8@yopmail.com',3,'',4,109),(169,'2021-11-12 08:27:56.322191','45','gurmukh7@yopmail.com',3,'',4,109),(170,'2021-11-12 08:27:56.413982','44','gurmukh6@yopmail.com',3,'',4,109),(171,'2021-11-12 08:27:56.506873','43','gurmukh5@yopmail.com',3,'',4,109),(172,'2021-11-12 08:27:56.598618','42','gurmukh4@yopmail.com',3,'',4,109),(173,'2021-11-12 08:27:56.707051','41','gurmukh3@yopmail.com',3,'',4,109),(174,'2021-11-12 08:27:56.824048','40','sumit@yopmail.com',3,'',4,109),(175,'2021-11-12 08:27:56.915472','39','sulabh@yopmail.com',3,'',4,109),(176,'2021-11-12 08:27:57.040905','38','jinnie@yopmail.com',3,'',4,109),(177,'2021-11-12 08:27:57.266702','1','superadmin@gmail.com',3,'',4,109);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (35,'admin','logentry'),(34,'apis','address'),(5,'apis','adminmodule'),(33,'apis','adminmodulepermission'),(6,'apis','careers'),(7,'apis','category'),(41,'apis','categorycolor'),(49,'apis','certificationtype'),(32,'apis','city'),(8,'apis','contactus'),(9,'apis','dealershipdistribution'),(55,'apis','distributorusercommission'),(31,'apis','district'),(51,'apis','forgetpasswordlog'),(10,'apis','gem'),(30,'apis','gemimage'),(29,'apis','gemvideo'),(11,'apis','homepageinthenews'),(12,'apis','homepagevideo'),(13,'apis','homepagewhyus'),(46,'apis','jewellery'),(45,'apis','jewellerydesign'),(47,'apis','jewelleryimage'),(43,'apis','jewellerytype'),(48,'apis','jewelleryvideo'),(44,'apis','metaltype'),(28,'apis','mystock'),(27,'apis','notification'),(14,'apis','offer'),(26,'apis','offerretailer'),(15,'apis','offertype'),(16,'apis','orderstatus'),(50,'apis','origin'),(42,'apis','otpverification'),(17,'apis','paymentmethod'),(18,'apis','shape'),(54,'apis','staffusertarget'),(19,'apis','state'),(39,'apis','stonecut'),(40,'apis','stonequality'),(52,'apis','targetincentive'),(53,'apis','universaltargetandcommission'),(4,'apis','user'),(25,'apis','usercart'),(24,'apis','userlog'),(20,'apis','userorder'),(23,'apis','userorderitem'),(22,'apis','userwishlist'),(21,'apis','weightunit'),(2,'auth','group'),(1,'auth','permission'),(37,'authtoken','token'),(38,'authtoken','tokenproxy'),(3,'contenttypes','contenttype'),(36,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-23 13:36:15.548187'),(2,'contenttypes','0002_remove_content_type_name','2021-09-23 13:36:18.296933'),(3,'auth','0001_initial','2021-09-23 13:36:25.581412'),(4,'auth','0002_alter_permission_name_max_length','2021-09-23 13:36:26.992494'),(5,'auth','0003_alter_user_email_max_length','2021-09-23 13:36:27.095046'),(6,'auth','0004_alter_user_username_opts','2021-09-23 13:36:27.209759'),(7,'auth','0005_alter_user_last_login_null','2021-09-23 13:36:27.334574'),(8,'auth','0006_require_contenttypes_0002','2021-09-23 13:36:27.444117'),(9,'auth','0007_alter_validators_add_error_messages','2021-09-23 13:36:27.564017'),(10,'auth','0008_alter_user_username_max_length','2021-09-23 13:36:27.675447'),(11,'auth','0009_alter_user_last_name_max_length','2021-09-23 13:36:27.784597'),(12,'auth','0010_alter_group_name_max_length','2021-09-23 13:36:28.015440'),(13,'auth','0011_update_proxy_permissions','2021-09-23 13:36:28.142663'),(14,'auth','0012_alter_user_first_name_max_length','2021-09-23 13:36:28.266947'),(15,'apis','0001_initial','2021-09-23 13:38:21.577004'),(16,'admin','0001_initial','2021-09-24 02:51:22.768310'),(17,'admin','0002_logentry_remove_auto_add','2021-09-24 02:51:22.944195'),(18,'admin','0003_logentry_add_action_flag_choices','2021-09-24 02:51:23.077316'),(19,'authtoken','0001_initial','2021-09-24 02:51:25.191413'),(20,'authtoken','0002_auto_20160226_1747','2021-09-24 02:51:25.361782'),(21,'authtoken','0003_tokenproxy','2021-09-24 02:51:25.449072'),(22,'sessions','0001_initial','2021-09-24 02:51:26.436006'),(23,'apis','0002_user_district','2021-09-30 12:35:26.124537'),(24,'apis','0003_auto_20211005_0527','2021-10-05 05:28:04.180513'),(25,'apis','0004_auto_20211005_1148','2021-10-05 11:48:56.871218'),(26,'apis','0005_auto_20211006_0944','2021-10-06 09:45:27.214066'),(27,'apis','0006_auto_20211007_1039','2021-10-07 10:39:23.459565'),(28,'apis','0007_auto_20211009_0909','2021-10-09 09:09:07.264795'),(29,'apis','0008_auto_20211018_0436','2021-10-18 04:36:12.606383'),(30,'apis','0009_auto_20211018_0718','2021-10-18 07:19:09.164718'),(31,'apis','0010_auto_20211018_1116','2021-10-18 11:16:45.068794'),(32,'apis','0011_auto_20211018_1336','2021-10-18 13:36:35.883750'),(33,'apis','0012_auto_20211019_1213','2021-10-19 12:13:58.961082'),(34,'apis','0013_auto_20211020_1233','2021-10-20 12:34:00.876063'),(35,'apis','0014_auto_20211021_0744','2021-10-21 07:45:09.717741'),(36,'apis','0015_auto_20211021_0745','2021-10-21 07:47:00.213044'),(37,'apis','0016_auto_20211021_0746','2021-10-21 07:47:00.409981'),(38,'apis','0017_auto_20211022_0844','2021-10-22 08:44:19.126971'),(39,'apis','0018_auto_20211022_1240','2021-10-22 12:40:45.007012'),(40,'apis','0019_auto_20211026_0545','2021-10-26 05:45:52.385226'),(41,'apis','0020_auto_20211027_0710','2021-10-27 07:10:31.140112'),(42,'apis','0021_auto_20211027_1131','2021-10-27 11:31:20.905487'),(43,'apis','0022_auto_20211027_1157','2021-10-27 11:57:25.808611'),(44,'apis','0023_auto_20211027_1207','2021-10-27 12:08:00.151974'),(45,'apis','0024_auto_20211027_1403','2021-10-27 14:03:32.854548'),(46,'apis','0025_auto_20211027_1452','2021-10-27 14:52:24.663138'),(47,'apis','0026_auto_20211028_0857','2021-10-28 08:57:53.457374'),(48,'apis','0027_auto_20211028_1147','2021-10-28 11:47:57.718839'),(49,'apis','0028_auto_20211029_1101','2021-10-29 11:01:23.102371'),(50,'apis','0029_auto_20211029_1259','2021-10-29 12:59:27.955063'),(51,'apis','0030_auto_20211029_1259','2021-10-29 12:59:36.397243'),(52,'apis','0031_auto_20211112_0759','2021-11-12 08:00:02.196079'),(53,'apis','0032_auto_20211112_0800','2021-11-12 08:00:24.832576'),(54,'apis','0033_auto_20211117_1042','2021-11-17 10:43:02.363403'),(55,'apis','0034_auto_20211117_1219','2021-11-17 12:20:06.121456'),(56,'apis','0035_auto_20211122_0622','2021-11-22 06:23:55.507351'),(57,'apis','0036_auto_20211122_0726','2021-11-22 07:26:41.685721');
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
INSERT INTO `django_session` VALUES ('hhlv1wcjwnsh8tivf188vtelwrvi900h','.eJxVjDkOwjAUBe_iGlm2FC-hpOcM1t-MA8iW4qSKuDuJlALamXlvUwnWpaS1y5wmVlc1OnX5hQj0knoYfkJ9NE2tLvOE-kj0abu-N5b37Wz_Dgr0sq8dDXEIRAiZA5rAHBzEGL0PPhKBZPAiECIhs3i7YxkRs7UZjWFSny9CFznS:1ml4Zk:40AnSZfuq6gxpfIEBaouIWl6z1HI3olGwlbVu5urrYg','2021-11-25 07:32:48.363721'),('jyizfo53lq9x5cxvpo86oxu8q84d0qdm','.eJxVjDsOwyAQRO9CHSEwH0PK9D4D2oUlOImwZOwqyt2DJRdJOW_ezJsF2LcS9kZrmBO7Mik8u_xShPikelTpAfW-8LjUbZ2RHwo_28anJdHrdrp_BwVa6WtESGLIUhuMzgpDOCjj0WSnrOzZOp0idCydAKVM1kikYgadYXR-ZJ8vNg04lQ:1mlRrQ:bKVnox8_Jf7Pge1xdZXCKg4eUKDDP9-ApuD0dssmAc4','2021-11-26 08:24:36.610171'),('og4qi5nqhzz7d8phgk1807q4gath96tv','.eJxVjMsOgjAQRf-la9OU1j5w6Z5vaKYzF0ENJBRWxn9XEha6veec-1KZtnXIW8WSR1EX1ajT71aIH5h2IHeabrPmeVqXsehd0QetupsFz-vh_h0MVIdvDXAyQmKbmCCA7YWC9zG4CN8YGzidBZGCNc72JQAgbtu-uMIumaTeHwrXOMo:1maZBi:dElE91xlgQrutMTNUrOCI3M9q15QMVN7p_hWxqhjIXA','2021-10-27 08:00:34.783770'),('z0vir7b2b9h7569gjb3t46xi8xqt69o5','.eJxVjMsOgjAQRf-la9OU1j5w6Z5vaKYzF0ENJBRWxn9XEha6veec-1KZtnXIW8WSR1EX1ajT71aIH5h2IHeabrPmeVqXsehd0QetupsFz-vh_h0MVIdvDXAyQmKbmCCA7YWC9zG4CN8YGzidBZGCNc72JQAgbtu-uMIumaTeHwrXOMo:1mTbuO:Q4ONIbhxAW9YvOFXjTMInrtR9V98CTMHB03VNCokTg4','2021-10-08 03:29:56.783398');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forget_password_log`
--

DROP TABLE IF EXISTS `forget_password_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forget_password_log` (
  `id` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `code_used` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forget_password_log_user_id_9aa8b2e6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `forget_password_log_user_id_9aa8b2e6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forget_password_log`
--

LOCK TABLES `forget_password_log` WRITE;
/*!40000 ALTER TABLE `forget_password_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `forget_password_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gem`
--

DROP TABLE IF EXISTS `gem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(64,2) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `shape_id` bigint DEFAULT NULL,
  `comment` longtext,
  `dimension_height` double NOT NULL,
  `dimension_length` double NOT NULL,
  `dimension_width` double NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL,
  `weight_unit_id` bigint DEFAULT NULL,
  `category_color_id` bigint DEFAULT NULL,
  `stone_cut_id` bigint DEFAULT NULL,
  `stone_quality_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `certification_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `gem_shape_id_1d36f3bf_fk_shape_id` (`shape_id`),
  KEY `gem_category_id_c8f128e4_fk_category_id` (`category_id`),
  KEY `gem_weight_unit_id_aecf9533_fk_weight_unit_id` (`weight_unit_id`),
  KEY `gem_category_color_id_16e7c999_fk_category_color_id` (`category_color_id`),
  KEY `gem_stone_cut_id_264fc27a_fk_stone_cut_id` (`stone_cut_id`),
  KEY `gem_stone_quality_id_5b7a755b_fk_stone_quality_id` (`stone_quality_id`),
  KEY `gem_origin_id_136b78d1_fk_origin_id` (`origin_id`),
  KEY `gem_certification_type_id_e03d0ba4_fk_certification_type_id` (`certification_type_id`),
  CONSTRAINT `gem_category_color_id_16e7c999_fk_category_color_id` FOREIGN KEY (`category_color_id`) REFERENCES `category_color` (`id`),
  CONSTRAINT `gem_category_id_c8f128e4_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `gem_certification_type_id_e03d0ba4_fk_certification_type_id` FOREIGN KEY (`certification_type_id`) REFERENCES `certification_type` (`id`),
  CONSTRAINT `gem_origin_id_136b78d1_fk_origin_id` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`),
  CONSTRAINT `gem_shape_id_1d36f3bf_fk_shape_id` FOREIGN KEY (`shape_id`) REFERENCES `shape` (`id`),
  CONSTRAINT `gem_stone_cut_id_264fc27a_fk_stone_cut_id` FOREIGN KEY (`stone_cut_id`) REFERENCES `stone_cut` (`id`),
  CONSTRAINT `gem_stone_quality_id_5b7a755b_fk_stone_quality_id` FOREIGN KEY (`stone_quality_id`) REFERENCES `stone_quality` (`id`),
  CONSTRAINT `gem_weight_unit_id_aecf9533_fk_weight_unit_id` FOREIGN KEY (`weight_unit_id`) REFERENCES `weight_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gem`
--

LOCK TABLES `gem` WRITE;
/*!40000 ALTER TABLE `gem` DISABLE KEYS */;
INSERT INTO `gem` VALUES (8,5000.00,4,1,'hii',2,1,6,'',22,1,15,2,3,'Gem Three',1,'1',1),(20,1000.00,5,7,'cc',23,33,44,'',4,1,9,1,4,'testing',1,'4ddds',2),(21,2000.00,6,1,'dddddddddddddddddddd',3,4,2,'',33,2,10,2,3,'Natural Emerald A',1,'xs44',5),(22,3000.00,7,1,'dffrresedggggggggggg',6,5,6,'',5,1,11,2,3,'Garnet',1,'df45',5),(23,2500.00,8,1,'hgfghfv',5,4,6,'',5,3,12,2,3,'Cat\'s eye',1,'bgfyt6',4),(24,2000.00,9,1,'bgghcg bncgdcgvb bv   gh',4,6,3,'',22,2,13,2,4,'Natural coral',1,'ghf444',5),(25,4000.00,10,2,'hgfdgcghv',8,5,5,'',66,2,14,1,2,'Natural pearl',1,'jhghj5',2),(33,622.20,26,13,'yhufdsgc',2.39,2.5,2.6,'',33,2,38,1,2,'Gem one',1,'gdfg65',6),(34,622.20,26,13,'hygyg',0.69,0.99,0.85,'',54,1,38,1,2,'Gem two',1,'ghfg56',3);
/*!40000 ALTER TABLE `gem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gem_image`
--

DROP TABLE IF EXISTS `gem_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gem_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_path` varchar(100) DEFAULT NULL,
  `gem_id` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gem_image_gem_id_b98e3806_fk_gem_id` (`gem_id`),
  CONSTRAINT `gem_image_gem_id_b98e3806_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gem_image`
--

LOCK TABLES `gem_image` WRITE;
/*!40000 ALTER TABLE `gem_image` DISABLE KEYS */;
INSERT INTO `gem_image` VALUES (277,'gem_images/4dd3b364-4e5c-47ce-a1b6-a7be2dc4cbe2/img5.png',8,1),(290,'gem_images/6500217e-2c0e-456c-a045-1227ee24955f/img1.png',8,1),(320,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519408957.jpeg',20,1),(321,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519413520.jpeg',20,0),(322,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519472767.jpeg',20,1),(323,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519478830.jpeg',20,1),(324,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519537392.jpeg',21,1),(325,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519549157.jpeg',21,1),(326,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519614926.jpeg',22,1),(327,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519699040.jpeg',23,1),(328,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519722467.jpeg',24,1),(329,'gem_images/5fc7d32c-c3e0-4f16-bf7d-5840e103f876/1636519781539.jpeg',25,1),(345,'gem_images/5b58193f-efbf-46d8-baff-f74792ddcacc/1636958387085.jpeg',33,1),(346,'gem_images/5b58193f-efbf-46d8-baff-f74792ddcacc/1636958409323.jpeg',33,1),(347,'gem_images/5b58193f-efbf-46d8-baff-f74792ddcacc/1636958510251.jpeg',34,1);
/*!40000 ALTER TABLE `gem_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gem_video`
--

DROP TABLE IF EXISTS `gem_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gem_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video_path` varchar(100) DEFAULT NULL,
  `gem_id` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gem_video_gem_id_b5850f6e_fk_gem_id` (`gem_id`),
  CONSTRAINT `gem_video_gem_id_b5850f6e_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gem_video`
--

LOCK TABLES `gem_video` WRITE;
/*!40000 ALTER TABLE `gem_video` DISABLE KEYS */;
INSERT INTO `gem_video` VALUES (323,'gem_videos/6f61d081-81a9-41da-9a8b-0eca0c210c42/big_buck_bunny_720p_1mb.mp4',8,1),(336,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/file_example_MP4_480_1_5MG.mp4',20,1),(337,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/21-10-25-22-51-07.mp4',20,1),(338,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/file_example_MP4_640_3MG.mp4',21,1),(339,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/file_example_MP4_480_1_5MG_WRw3Ffl.mp4',22,1),(340,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/file_example_MP4_480_1_5MG_XGr62vF.mp4',23,1),(341,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/file_example_MP4_640_3MG_36UYA5y.mp4',24,1),(342,'gem_videos/66eb8a13-5a5a-4382-b043-bbeb6ce0da5a/big_buck_bunny_720p_1mb.mp4',25,1),(353,'gem_videos/b59a7a5d-956d-4f30-8ff9-0e59f9bf4627/file_example_MP4_480_1_5MG.mp4',33,1),(354,'gem_videos/b59a7a5d-956d-4f30-8ff9-0e59f9bf4627/big_buck_bunny_720p_1mb.mp4',34,1);
/*!40000 ALTER TABLE `gem_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_in_the_news`
--

DROP TABLE IF EXISTS `home_page_in_the_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_page_in_the_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_in_the_news`
--

LOCK TABLES `home_page_in_the_news` WRITE;
/*!40000 ALTER TABLE `home_page_in_the_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_page_in_the_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_video`
--

DROP TABLE IF EXISTS `home_page_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_page_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video_path` varchar(100) DEFAULT NULL,
  `video_of_month` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_video`
--

LOCK TABLES `home_page_video` WRITE;
/*!40000 ALTER TABLE `home_page_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_page_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_page_why_us`
--

DROP TABLE IF EXISTS `home_page_why_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_page_why_us` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_page_why_us`
--

LOCK TABLES `home_page_why_us` WRITE;
/*!40000 ALTER TABLE `home_page_why_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_page_why_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery`
--

DROP TABLE IF EXISTS `jewellery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewellery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `weight` double NOT NULL,
  `comment` longtext,
  `category_id` bigint DEFAULT NULL,
  `category_color_id` bigint DEFAULT NULL,
  `jewellery_type_id` bigint DEFAULT NULL,
  `metal_type_id` bigint DEFAULT NULL,
  `weight_unit_id` bigint DEFAULT NULL,
  `shape_id` bigint DEFAULT NULL,
  `stone_cut_id` bigint DEFAULT NULL,
  `stone_quality_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jewellery_category_id_454e754f_fk_category_id` (`category_id`),
  KEY `jewellery_category_color_id_2bfdca59_fk_category_color_id` (`category_color_id`),
  KEY `jewellery_jewellery_type_id_033dfafb_fk_jewellery_type_id` (`jewellery_type_id`),
  KEY `jewellery_metal_type_id_906f1577_fk_metal_type_id` (`metal_type_id`),
  KEY `jewellery_weight_unit_id_269f3330_fk_weight_unit_id` (`weight_unit_id`),
  KEY `jewellery_shape_id_92b2deca_fk_shape_id` (`shape_id`),
  KEY `jewellery_stone_cut_id_74bd0dfe_fk_stone_cut_id` (`stone_cut_id`),
  KEY `jewellery_stone_quality_id_ad99dac4_fk_stone_quality_id` (`stone_quality_id`),
  CONSTRAINT `jewellery_category_color_id_2bfdca59_fk_category_color_id` FOREIGN KEY (`category_color_id`) REFERENCES `category_color` (`id`),
  CONSTRAINT `jewellery_category_id_454e754f_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `jewellery_jewellery_type_id_033dfafb_fk_jewellery_type_id` FOREIGN KEY (`jewellery_type_id`) REFERENCES `jewellery_type` (`id`),
  CONSTRAINT `jewellery_metal_type_id_906f1577_fk_metal_type_id` FOREIGN KEY (`metal_type_id`) REFERENCES `metal_type` (`id`),
  CONSTRAINT `jewellery_shape_id_92b2deca_fk_shape_id` FOREIGN KEY (`shape_id`) REFERENCES `shape` (`id`),
  CONSTRAINT `jewellery_stone_cut_id_74bd0dfe_fk_stone_cut_id` FOREIGN KEY (`stone_cut_id`) REFERENCES `stone_cut` (`id`),
  CONSTRAINT `jewellery_stone_quality_id_ad99dac4_fk_stone_quality_id` FOREIGN KEY (`stone_quality_id`) REFERENCES `stone_quality` (`id`),
  CONSTRAINT `jewellery_weight_unit_id_269f3330_fk_weight_unit_id` FOREIGN KEY (`weight_unit_id`) REFERENCES `weight_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery`
--

LOCK TABLES `jewellery` WRITE;
/*!40000 ALTER TABLE `jewellery` DISABLE KEYS */;
INSERT INTO `jewellery` VALUES (3,'J Three',5000.00,22,'cdvd',4,15,2,2,1,1,2,3),(4,'RIng of King',5000.00,24,'ji',4,15,1,2,1,1,2,3);
/*!40000 ALTER TABLE `jewellery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery_image`
--

DROP TABLE IF EXISTS `jewellery_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewellery_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_path` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `jewellery_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jewellery_image_jewellery_id_ccfaef8d_fk_jewellery_id` (`jewellery_id`),
  CONSTRAINT `jewellery_image_jewellery_id_ccfaef8d_fk_jewellery_id` FOREIGN KEY (`jewellery_id`) REFERENCES `jewellery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery_image`
--

LOCK TABLES `jewellery_image` WRITE;
/*!40000 ALTER TABLE `jewellery_image` DISABLE KEYS */;
INSERT INTO `jewellery_image` VALUES (9,'jewellery_images/ef2a8ba6-c164-413d-883a-ff484023bcb5/tree-736885_960_720.png',1,3),(10,'jewellery_images/61b77257-a82d-4f3b-9dab-5a6543268b29/jewelry.png',1,4);
/*!40000 ALTER TABLE `jewellery_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery_type`
--

DROP TABLE IF EXISTS `jewellery_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewellery_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery_type`
--

LOCK TABLES `jewellery_type` WRITE;
/*!40000 ALTER TABLE `jewellery_type` DISABLE KEYS */;
INSERT INTO `jewellery_type` VALUES (1,'Rings','jewellery/e55de694-9e35-48ec-b4c4-b9c3086dc1b6/tree-736885_960_720.png'),(2,'Pendant','jewellery/525462f8-bc99-4284-b561-b61db2d1cbdb/tree-736885_960_720.png'),(3,'Bracelets','jewellery/d3f8a278-38c3-4265-9eb2-8ab556d495eb/tree-736885_960_720.png');
/*!40000 ALTER TABLE `jewellery_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery_video`
--

DROP TABLE IF EXISTS `jewellery_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewellery_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video_path` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `jewellery_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jewellery_video_jewellery_id_4733ed72_fk_jewellery_id` (`jewellery_id`),
  CONSTRAINT `jewellery_video_jewellery_id_4733ed72_fk_jewellery_id` FOREIGN KEY (`jewellery_id`) REFERENCES `jewellery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery_video`
--

LOCK TABLES `jewellery_video` WRITE;
/*!40000 ALTER TABLE `jewellery_video` DISABLE KEYS */;
INSERT INTO `jewellery_video` VALUES (5,'jewellery_videos/cbda03f4-3d2d-4de3-b67b-b0cad5195493/big_buck_bunny_720p_1mb.mp4',1,3),(6,'jewellery_videos/6bad6968-6434-4233-b93c-9a2021bd6292/file_example_MP4_640_3MG.mp4',1,4);
/*!40000 ALTER TABLE `jewellery_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metal_type`
--

DROP TABLE IF EXISTS `metal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metal_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metal_type`
--

LOCK TABLES `metal_type` WRITE;
/*!40000 ALTER TABLE `metal_type` DISABLE KEYS */;
INSERT INTO `metal_type` VALUES (1,'Silver'),(2,'Brass');
/*!40000 ALTER TABLE `metal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_stock`
--

DROP TABLE IF EXISTS `my_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gem_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `my_stock_gem_id_903dd53e_fk_gem_id` (`gem_id`),
  KEY `my_stock_user_id_e793769a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `my_stock_gem_id_903dd53e_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`),
  CONSTRAINT `my_stock_user_id_e793769a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_stock`
--

LOCK TABLES `my_stock` WRITE;
/*!40000 ALTER TABLE `my_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `message` longtext,
  `table_id` varchar(255) DEFAULT NULL,
  `sent_by_id` bigint DEFAULT NULL,
  `sent_to_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_sent_by_id_4fd4a191_fk_auth_user_id` (`sent_by_id`),
  KEY `notification_sent_to_id_123f517a_fk_auth_user_id` (`sent_to_id`),
  CONSTRAINT `notification_sent_by_id_4fd4a191_fk_auth_user_id` FOREIGN KEY (`sent_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `notification_sent_to_id_123f517a_fk_auth_user_id` FOREIGN KEY (`sent_to_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `percentage_discount` double NOT NULL,
  `min_amount` decimal(64,2) DEFAULT NULL,
  `custom_gift` varchar(255) DEFAULT NULL,
  `custom_off_amount` decimal(64,2) DEFAULT NULL,
  `custom_order_amount` decimal(64,2) DEFAULT NULL,
  `admin_module_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `gem_id` bigint DEFAULT NULL,
  `offer_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offer_type_id_d6f9ea84_fk_offer_type_id` (`offer_type_id`),
  KEY `offer_admin_module_id_15b2de60_fk_admin_module_id` (`admin_module_id`),
  KEY `offer_category_id_c942d3b9_fk_category_id` (`category_id`),
  KEY `offer_gem_id_e82dc3fe_fk_gem_id` (`gem_id`),
  CONSTRAINT `offer_admin_module_id_15b2de60_fk_admin_module_id` FOREIGN KEY (`admin_module_id`) REFERENCES `admin_module` (`id`),
  CONSTRAINT `offer_category_id_c942d3b9_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `offer_gem_id_e82dc3fe_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`),
  CONSTRAINT `offer_offer_type_id_d6f9ea84_fk_offer_type_id` FOREIGN KEY (`offer_type_id`) REFERENCES `offer_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_retailer`
--

DROP TABLE IF EXISTS `offer_retailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_retailer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `offer_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_retailer_offer_id_7d591d59_fk_offer_id` (`offer_id`),
  KEY `offer_retailer_user_id_809c353b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `offer_retailer_offer_id_7d591d59_fk_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  CONSTRAINT `offer_retailer_user_id_809c353b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_retailer`
--

LOCK TABLES `offer_retailer` WRITE;
/*!40000 ALTER TABLE `offer_retailer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_retailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_type`
--

DROP TABLE IF EXISTS `offer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_type`
--

LOCK TABLES `offer_type` WRITE;
/*!40000 ALTER TABLE `offer_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origin`
--

DROP TABLE IF EXISTS `origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origin`
--

LOCK TABLES `origin` WRITE;
/*!40000 ALTER TABLE `origin` DISABLE KEYS */;
INSERT INTO `origin` VALUES (1,'India');
/*!40000 ALTER TABLE `origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verification`
--

DROP TABLE IF EXISTS `otp_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `otp` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verification`
--

LOCK TABLES `otp_verification` WRITE;
/*!40000 ALTER TABLE `otp_verification` DISABLE KEYS */;
INSERT INTO `otp_verification` VALUES (1,'sulabh@yopmail.com',1384),(2,'sulabh@yopmail.com',6822),(3,'sulabh@yopmail.com',5353),(4,'sulabh@yopmail.com',2096),(5,'sulabh@yopmail.com',6220),(6,'sulabh@yopmail.com',8580),(7,'sulabh@yopmail.com',8067),(8,'sulabh@yopmail.com',2515),(9,'sulabh@yopmail.com',4037),(10,'sulabh@yopmail.com',3827),(11,'sulabh@yopmail.com',5031),(12,'sulabh@yopmail.com',5687),(13,'sulabh@yopmail.com',5091),(14,'sulabh@yopmail.com',1622),(15,'sulabh@yopmail.com',3015),(16,'sulabh@yopmail.com',4409),(17,'sulabh@yopmail.com',2699),(18,'sulabh@yopmail.com',6442),(19,'sulabh@yopmail.com',2617),(20,'sulabh@yopmail.com',5025),(21,'sulabh@yopmail.com',7416),(22,'sulabh@yopmail.com',2701),(23,'sulabh@yopmail.com',8455),(24,'sulabh@yopmail.com',5356),(25,'sulabh@yopmail.com',7943),(26,'sulabh@yopmail.com',8821),(27,'sulabh@yopmail.com',3130),(28,'sulabh@yopmail.com',6430),(29,'sulabh@yopmail.com',7334),(30,'sulabh@yopmail.com',4672),(31,'sulabh@yopmail.com',7655),(32,'sulabh@yopmail.com',7119),(33,'sulabh@yopmail.com',8286),(34,'sulabh@yopmail.com',4148),(35,'sulabh@yopmail.com',1391),(36,'sulabh@yopmail.com',3805),(37,'sulabh@yopmail.com',6463),(38,'sulabh@yopmail.com',4023),(39,'sulabh@yopmail.com',2573),(40,'sulabh@yopmail.com',1537),(41,'sulabh@yopmail.com',8403),(42,'sulabh@yopmail.com',8392),(43,'sulabh@yopmail.com',2369),(44,'sulabh@yopmail.com',9740),(45,'sulabh@yopmail.com',1253),(46,'sulabh@yopmail.com',3674),(47,'sulabh@yopmail.com',5096),(50,'ashima@yopmail.com',5709),(51,'ashima@yopmail.com',8927),(52,'ashima@yopmail.com',8422),(53,'ashima@yopmail.com',7759),(54,'ashima@yopmail.com',2150),(57,'ashima@yopmail.com',4254),(80,'ashima@yopmail.com',7174),(81,'ashima@yopmail.com',9873),(110,'jenifer@yopmail.com',8286),(197,'staff1@yopmail.com',5633),(207,'gurmukh@yopmail.com',7252);
/*!40000 ALTER TABLE `otp_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shape`
--

DROP TABLE IF EXISTS `shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shape` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shape`
--

LOCK TABLES `shape` WRITE;
/*!40000 ALTER TABLE `shape` DISABLE KEYS */;
INSERT INTO `shape` VALUES (1,'Oval'),(2,'Round'),(3,'Shapeless'),(4,'Triangle'),(5,'Square'),(6,'Rounded Pillow'),(7,'Curving oblong'),(8,'Pear'),(9,'Heart'),(10,'Rec'),(11,'Cushion'),(12,'Asscher'),(13,'Emerald'),(14,'Octagon'),(15,'Ceylon');
/*!40000 ALTER TABLE `shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_user_target`
--

DROP TABLE IF EXISTS `staff_user_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_user_target` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sale_target` decimal(64,2) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_user_target_user_id_1d7a6b7d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `staff_user_target_user_id_1d7a6b7d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_user_target`
--

LOCK TABLES `staff_user_target` WRITE;
/*!40000 ALTER TABLE `staff_user_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_user_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Andaman & Nicobar Islands'),(2,'Andhra Pradesh'),(3,'Arunachal Pradesh\''),(4,'Assam'),(5,'Bihar'),(6,'Chandigarh'),(7,'Chhattisgarh'),(8,'Dadra & Nagar Haveli'),(9,'Daman & Diu'),(10,'Delhi'),(11,'Goa'),(12,'Gujarat'),(13,'Haryana'),(14,'Himachal Pradesh'),(15,'Jammu & Kashmir'),(16,'Jharkhand'),(17,'Karnataka'),(18,'Kerala'),(19,'Lakshadweep'),(20,'Madhya Pradesh'),(21,'Maharashtra'),(22,'Manipur'),(23,'Meghalaya'),(24,'Mizoram'),(25,'Nagaland'),(26,'Odisha'),(27,'Puducherry'),(28,'Punjab'),(29,'Rajasthan'),(30,'Sikkim'),(31,'Tamil Nadu'),(32,'Tripura'),(33,'Uttar Pradesh'),(34,'Uttarakhand'),(35,'West Bengal');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stone_cut`
--

DROP TABLE IF EXISTS `stone_cut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stone_cut` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stone_cut`
--

LOCK TABLES `stone_cut` WRITE;
/*!40000 ALTER TABLE `stone_cut` DISABLE KEYS */;
INSERT INTO `stone_cut` VALUES (1,'None'),(2,'Mix');
/*!40000 ALTER TABLE `stone_cut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stone_quality`
--

DROP TABLE IF EXISTS `stone_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stone_quality` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stone_quality`
--

LOCK TABLES `stone_quality` WRITE;
/*!40000 ALTER TABLE `stone_quality` DISABLE KEYS */;
INSERT INTO `stone_quality` VALUES (1,'Normal'),(2,'Fine'),(3,'Premium'),(4,'Unique');
/*!40000 ALTER TABLE `stone_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_incentive`
--

DROP TABLE IF EXISTS `target_incentive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_incentive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_target_amount` decimal(64,2) DEFAULT NULL,
  `end_target_amount` decimal(64,2) DEFAULT NULL,
  `incentive_percentage` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_incentive`
--

LOCK TABLES `target_incentive` WRITE;
/*!40000 ALTER TABLE `target_incentive` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_incentive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universal_target_and_commission`
--

DROP TABLE IF EXISTS `universal_target_and_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universal_target_and_commission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `monthly_staff_target` decimal(64,2) DEFAULT NULL,
  `state_distributor_commission` double NOT NULL,
  `district_distributor_commission` double NOT NULL,
  `city_distributor_commission` double NOT NULL,
  `jeweller_commission` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universal_target_and_commission`
--

LOCK TABLES `universal_target_and_commission` WRITE;
/*!40000 ALTER TABLE `universal_target_and_commission` DISABLE KEYS */;
INSERT INTO `universal_target_and_commission` VALUES (1,5000.00,200,300,400,100);
/*!40000 ALTER TABLE `universal_target_and_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cart`
--

DROP TABLE IF EXISTS `user_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gem_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `certification_type_id` bigint DEFAULT NULL,
  `jewellery_type_id` bigint DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_cart_gem_id_57ab5fc2_fk_gem_id` (`gem_id`),
  KEY `user_cart_user_id_6e18b40e_fk_auth_user_id` (`user_id`),
  KEY `user_cart_certification_type_i_a1a67ae8_fk_certifica` (`certification_type_id`),
  KEY `user_cart_jewellery_type_id_1b3f7b72_fk_jewellery_type_id` (`jewellery_type_id`),
  CONSTRAINT `user_cart_certification_type_i_a1a67ae8_fk_certifica` FOREIGN KEY (`certification_type_id`) REFERENCES `certification_type` (`id`),
  CONSTRAINT `user_cart_gem_id_57ab5fc2_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`),
  CONSTRAINT `user_cart_jewellery_type_id_1b3f7b72_fk_jewellery_type_id` FOREIGN KEY (`jewellery_type_id`) REFERENCES `jewellery_type` (`id`),
  CONSTRAINT `user_cart_user_id_6e18b40e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cart`
--

LOCK TABLES `user_cart` WRITE;
/*!40000 ALTER TABLE `user_cart` DISABLE KEYS */;
INSERT INTO `user_cart` VALUES (284,23,113,4,NULL,'2021-11-23 04:08:34.731235'),(285,20,113,2,NULL,'2021-11-23 04:08:35.669862');
/*!40000 ALTER TABLE `user_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity` longtext,
  `activity_time` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_log_user_id_28ed894a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_log_user_id_28ed894a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_time` datetime(6) NOT NULL,
  `expected_delivery_time` datetime(6) NOT NULL,
  `from_user_id` bigint DEFAULT NULL,
  `order_status_id` bigint DEFAULT NULL,
  `payment_method_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_order_from_user_id_afa02d38_fk_auth_user_id` (`from_user_id`),
  KEY `user_order_order_status_id_5fcc18fe_fk_order_status_id` (`order_status_id`),
  KEY `user_order_payment_method_id_e32967e1_fk_payment_method_id` (`payment_method_id`),
  KEY `user_order_user_id_1247599d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_order_from_user_id_afa02d38_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_order_order_status_id_5fcc18fe_fk_order_status_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `user_order_payment_method_id_e32967e1_fk_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `user_order_user_id_1247599d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order`
--

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order_item`
--

DROP TABLE IF EXISTS `user_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gem_id` bigint DEFAULT NULL,
  `user_order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_order_item_gem_id_0c08867f_fk_gem_id` (`gem_id`),
  KEY `user_order_item_user_order_id_79969de0_fk_user_order_id` (`user_order_id`),
  CONSTRAINT `user_order_item_gem_id_0c08867f_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`),
  CONSTRAINT `user_order_item_user_order_id_79969de0_fk_user_order_id` FOREIGN KEY (`user_order_id`) REFERENCES `user_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order_item`
--

LOCK TABLES `user_order_item` WRITE;
/*!40000 ALTER TABLE `user_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wishlist`
--

DROP TABLE IF EXISTS `user_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gem_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `certification_type_id` bigint DEFAULT NULL,
  `jewellery_type_id` bigint DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wishlist_gem_id_5872cd8d_fk_gem_id` (`gem_id`),
  KEY `user_wishlist_user_id_2e0f342f_fk_auth_user_id` (`user_id`),
  KEY `user_wishlist_certification_type_i_1e51f05c_fk_certifica` (`certification_type_id`),
  KEY `user_wishlist_jewellery_type_id_581b7d6c_fk_jewellery_type_id` (`jewellery_type_id`),
  CONSTRAINT `user_wishlist_certification_type_i_1e51f05c_fk_certifica` FOREIGN KEY (`certification_type_id`) REFERENCES `certification_type` (`id`),
  CONSTRAINT `user_wishlist_gem_id_5872cd8d_fk_gem_id` FOREIGN KEY (`gem_id`) REFERENCES `gem` (`id`),
  CONSTRAINT `user_wishlist_jewellery_type_id_581b7d6c_fk_jewellery_type_id` FOREIGN KEY (`jewellery_type_id`) REFERENCES `jewellery_type` (`id`),
  CONSTRAINT `user_wishlist_user_id_2e0f342f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wishlist`
--

LOCK TABLES `user_wishlist` WRITE;
/*!40000 ALTER TABLE `user_wishlist` DISABLE KEYS */;
INSERT INTO `user_wishlist` VALUES (151,20,112,NULL,NULL,'2021-11-22 06:23:54.780346'),(168,8,112,NULL,NULL,'2021-11-22 06:23:54.780346'),(203,23,113,NULL,NULL,'2021-11-22 08:40:37.314401'),(204,20,113,NULL,NULL,'2021-11-22 11:02:27.633990');
/*!40000 ALTER TABLE `user_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight_unit`
--

DROP TABLE IF EXISTS `weight_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight_unit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight_unit`
--

LOCK TABLES `weight_unit` WRITE;
/*!40000 ALTER TABLE `weight_unit` DISABLE KEYS */;
INSERT INTO `weight_unit` VALUES (1,'Carat'),(2,'Ratti Small'),(3,'Ratti Big');
/*!40000 ALTER TABLE `weight_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 12:19:02
