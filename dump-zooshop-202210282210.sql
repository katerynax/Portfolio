-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: zooshop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'acana'),(2,'orjen'),(3,'advance'),(4,'brit'),(5,'farmina'),(6,'k9'),(7,'optimeal'),(8,'amity'),(9,'bosh'),(10,'canina'),(11,'canvit'),(12,'vetamax'),(13,'vetlaine'),(14,'beaphar'),(15,'bolfo'),(16,'spree'),(17,'croci'),(18,'animAll'),(19,'bronzedog'),(20,'trixie'),(21,'coulour'),(22,'allo'),(23,'DrClauders'),(24,'RoyalCanin');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_breed` varchar(100) NOT NULL,
  `Pet_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breed_FK` (`Pet_type_id`),
  CONSTRAINT `breed_FK` FOREIGN KEY (`Pet_type_id`) REFERENCES `pet_type` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (1,'siam',1),(2,'pers',1),(3,'pitbull',2),(4,'mix',2),(5,'bully',2),(6,'sfinx',1),(7,'british',1),(8,'colbasa',1),(9,'chihuhua',2),(10,'spaniel',2),(11,'poodle',2);
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Country_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cities_FK` (`Country_id`),
  CONSTRAINT `Cities_FK` FOREIGN KEY (`Country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Narva',8),(2,'Saloniki',9),(3,'Riga',5),(4,'Kaunas',6),(5,'Brest',7),(6,'Grodno',7),(7,'Keln',4),(8,'Dortmund',4),(9,'Tylysa',3),(10,'Madrid',2),(11,'Barselona',2),(12,'Vatra',1),(13,'Lion',3),(14,'Tiraspol',1),(15,'Rodos',7),(16,NULL,NULL),(17,NULL,NULL),(18,NULL,NULL),(19,NULL,NULL),(20,NULL,NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_pets`
--

DROP TABLE IF EXISTS `client_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_pets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint NOT NULL,
  `pet_id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Client_pets_un` (`client_id`,`pet_id`),
  KEY `Client_pets_FK_1` (`pet_id`),
  CONSTRAINT `Client_pets_FK` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `Client_pets_FK_1` FOREIGN KEY (`pet_id`) REFERENCES `breed` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_pets`
--

LOCK TABLES `client_pets` WRITE;
/*!40000 ALTER TABLE `client_pets` DISABLE KEYS */;
INSERT INTO `client_pets` VALUES (1,1,3,1),(2,6,9,2),(3,1,7,1),(4,14,3,1),(5,13,5,1),(6,12,1,2),(7,14,8,1);
/*!40000 ALTER TABLE `client_pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_FK` (`city_id`),
  CONSTRAINT `clients_FK` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Huan Pablo','hupa@asdasd.com',11),(2,'Hans Fisher','CC@gem.com',7),(3,'Zoya Kovaleva','zoka@udfd.com',5),(4,'Geralt Reviisky','Gera@plotva.com',15),(5,'Yinifer Vengerbergnaya','Yenexy@uuu.com',2),(6,'Sasha Grey','grey@com.com',8),(7,'John Shepard','cita@earth.com',13),(8,'Mr Smith','vftr@bfjhww.rururu',9),(9,'2B','nier@forever.com',14),(10,'Zevran Arronay','Zev@dranage.com',9),(11,'Djaina Proudmoore','wow@dead.com',3),(12,'Andrey Chikatilo','Detki@love.com',5),(13,'Jesus Christ','paradise@hell.com',8),(14,'Alan Wake','all@all.com',12),(15,'Ada Wong','AD@sadas.com',6);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Moldova'),(2,'Spaine'),(3,'France'),(4,'Germany'),(5,'Latvia'),(6,'Litva'),(7,'Belorus'),(8,'Estonia'),(9,'Greese');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_type`
--

DROP TABLE IF EXISTS `pet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_type` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_type`
--

LOCK TABLES `pet_type` WRITE;
/*!40000 ALTER TABLE `pet_type` DISABLE KEYS */;
INSERT INTO `pet_type` VALUES (1,'cat'),(2,'dog');
/*!40000 ALTER TABLE `pet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `products` varchar(100) DEFAULT NULL,
  `Brand_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`Brand_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`Brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'food',1),(2,'toys',2),(3,'leash',3),(4,'collar',11),(5,'vitamins',15),(6,'delicasy',11),(7,'food',6),(8,'toys',17),(9,'collar',18),(10,'food',13),(11,'delic',20),(12,'leash',5),(13,'toys',23),(14,'vitamin',24),(15,'toy',19),(16,'food',13),(17,'leash',17);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress_id` bigint DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Shop_FK` (`adress_id`),
  CONSTRAINT `Shop_FK` FOREIGN KEY (`adress_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,2,'str gord 15'),(2,9,'str puskina 10'),(3,8,'strkjnhiwgh 13'),(4,14,'str kjgskeu 12'),(5,10,'str jkfskj17'),(6,1,'str 1jkskgvsk 12'),(7,3,'str nbfbfb90'),(8,4,'str jhbjew 12'),(9,15,'str hfhf13'),(10,13,'str hghgh45');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL,
  `Product_id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Stock_un` (`shop_id`,`Product_id`),
  KEY `stock_FK` (`Product_id`),
  CONSTRAINT `stock_FK` FOREIGN KEY (`Product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `stock_FK_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,2,2,10),(2,2,5,6),(3,6,12,5),(4,9,14,23),(5,8,3,77);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'zooshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 22:10:18
