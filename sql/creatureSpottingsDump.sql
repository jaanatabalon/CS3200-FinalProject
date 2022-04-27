CREATE DATABASE  IF NOT EXISTS `creature_spottings` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `creature_spottings`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: creature_spottings
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `fauna_fish`
--

DROP TABLE IF EXISTS `fauna_fish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fauna_fish` (
  `fiid` int NOT NULL AUTO_INCREMENT,
  `size` int NOT NULL,
  `seasonFound` varchar(25) DEFAULT NULL,
  `faunaLivingCreatureFK` int NOT NULL,
  PRIMARY KEY (`fiid`),
  UNIQUE KEY `fiid` (`fiid`),
  KEY `faunaLivingCreatureFK` (`faunaLivingCreatureFK`),
  CONSTRAINT `fauna_fish_ibfk_1` FOREIGN KEY (`faunaLivingCreatureFK`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fauna_fish`
--

LOCK TABLES `fauna_fish` WRITE;
/*!40000 ALTER TABLE `fauna_fish` DISABLE KEYS */;
INSERT INTO `fauna_fish` VALUES (1,6,'summer',5),(2,18,'summer',6),(3,3,'fall',7),(4,10,'summer',8);
/*!40000 ALTER TABLE `fauna_fish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fauna_frog`
--

DROP TABLE IF EXISTS `fauna_frog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fauna_frog` (
  `frid` int NOT NULL AUTO_INCREMENT,
  `size` int NOT NULL,
  `seasonFound` varchar(25) DEFAULT NULL,
  `faunaLivingCreatureFK` int NOT NULL,
  PRIMARY KEY (`frid`),
  UNIQUE KEY `frid` (`frid`),
  KEY `faunaLivingCreatureFK` (`faunaLivingCreatureFK`),
  CONSTRAINT `fauna_frog_ibfk_1` FOREIGN KEY (`faunaLivingCreatureFK`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fauna_frog`
--

LOCK TABLES `fauna_frog` WRITE;
/*!40000 ALTER TABLE `fauna_frog` DISABLE KEYS */;
INSERT INTO `fauna_frog` VALUES (1,2,'spring',1),(2,2,'summer',2),(3,5,'summer',3),(4,3,'summer',4);
/*!40000 ALTER TABLE `fauna_frog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flora_flower`
--

DROP TABLE IF EXISTS `flora_flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flora_flower` (
  `flid` int NOT NULL AUTO_INCREMENT,
  `numberOfPetals` int DEFAULT NULL,
  `seasonFound` varchar(25) DEFAULT NULL,
  `floraLivingCreatureFK` int NOT NULL,
  PRIMARY KEY (`flid`),
  UNIQUE KEY `flid` (`flid`),
  KEY `floraLivingCreatureFK` (`floraLivingCreatureFK`),
  CONSTRAINT `flora_flower_ibfk_1` FOREIGN KEY (`floraLivingCreatureFK`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flora_flower`
--

LOCK TABLES `flora_flower` WRITE;
/*!40000 ALTER TABLE `flora_flower` DISABLE KEYS */;
INSERT INTO `flora_flower` VALUES (1,5,'spring',18),(2,4,'spring',19),(3,5,'summer',20),(4,5,'summer',21);
/*!40000 ALTER TABLE `flora_flower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flora_mushroom`
--

DROP TABLE IF EXISTS `flora_mushroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flora_mushroom` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `height` int NOT NULL,
  `seasonFound` varchar(25) DEFAULT NULL,
  `floraLivingCreatureFK` int NOT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `mid` (`mid`),
  KEY `floraLivingCreatureFK` (`floraLivingCreatureFK`),
  CONSTRAINT `flora_mushroom_ibfk_1` FOREIGN KEY (`floraLivingCreatureFK`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flora_mushroom`
--

LOCK TABLES `flora_mushroom` WRITE;
/*!40000 ALTER TABLE `flora_mushroom` DISABLE KEYS */;
INSERT INTO `flora_mushroom` VALUES (1,1,'fall',9),(2,1,'fall',10),(3,1,'winter',11),(4,1,'summer',12);
/*!40000 ALTER TABLE `flora_mushroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flora_tree`
--

DROP TABLE IF EXISTS `flora_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flora_tree` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `height` int NOT NULL,
  `seasonFound` varchar(25) DEFAULT NULL,
  `floraLivingCreatureFK` int NOT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tid` (`tid`),
  KEY `floraLivingCreatureFK` (`floraLivingCreatureFK`),
  CONSTRAINT `flora_tree_ibfk_1` FOREIGN KEY (`floraLivingCreatureFK`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flora_tree`
--

LOCK TABLES `flora_tree` WRITE;
/*!40000 ALTER TABLE `flora_tree` DISABLE KEYS */;
INSERT INTO `flora_tree` VALUES (1,20,'spring',13),(2,26,'spring',14),(3,18,'summer',15),(4,20,'summer',16),(5,11,'spring',17);
/*!40000 ALTER TABLE `flora_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `found_in`
--

DROP TABLE IF EXISTS `found_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `found_in` (
  `lcid` int NOT NULL,
  `stateProvince` varchar(30) NOT NULL,
  `countryCode` varchar(2) NOT NULL,
  `locality` varchar(64) NOT NULL,
  PRIMARY KEY (`lcid`,`stateProvince`,`countryCode`,`locality`),
  KEY `stateProvince` (`stateProvince`,`countryCode`,`locality`),
  CONSTRAINT `found_in_ibfk_1` FOREIGN KEY (`lcid`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `found_in_ibfk_2` FOREIGN KEY (`stateProvince`, `countryCode`, `locality`) REFERENCES `location` (`stateProvince`, `countryCode`, `locality`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `found_in`
--

LOCK TABLES `found_in` WRITE;
/*!40000 ALTER TABLE `found_in` DISABLE KEYS */;
INSERT INTO `found_in` VALUES (10,'','PH','Baguio, Mt. Santa Tomas'),(1,'Agusan del Norte','PH',''),(9,'Antique','PH',''),(20,'Camarines Sur','PH',''),(21,'Camarines Sur','PH',''),(3,'Davao del Sur','PH',''),(18,'Laguna','PH',''),(15,'Metropolitan Manila','PH','Manila and vicinity, Luzon.'),(11,'Misamis Oriental','PH',''),(16,'Misamis Oriental','PH',''),(14,'Negros Occidental','PH',''),(17,'Negros Occidental','PH',''),(12,'Occidental Mindoro','PH',''),(19,'Quezon','PH',''),(13,'Rizal','PH',''),(2,'South Cotabato','PH',''),(5,'Tawi-Tawi','PH',''),(6,'Tawi-Tawi','PH',''),(7,'Tawi-Tawi','PH',''),(8,'Tawi-Tawi','PH',''),(4,'Tawi-Tawi','PH','Lapid-Lapid');
/*!40000 ALTER TABLE `found_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pre_update_location` BEFORE UPDATE ON `found_in` FOR EACH ROW BEGIN
	CALL insert_location(NEW.stateProvince, NEW.countryCode, NEW.locality);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `institutionCode` varchar(30) NOT NULL,
  PRIMARY KEY (`institutionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (''),('BR'),('CANB'),('CHR'),('CS3200'),('E'),('F'),('GA'),('iNaturalist'),('KU'),('MEL'),('NCU'),('NHMUK');
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `living_creature`
--

DROP TABLE IF EXISTS `living_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `living_creature` (
  `lcid` int NOT NULL AUTO_INCREMENT,
  `pictureUrl` varchar(255) NOT NULL,
  `speciesKey` int DEFAULT NULL,
  PRIMARY KEY (`lcid`),
  UNIQUE KEY `pictureUrl` (`pictureUrl`),
  UNIQUE KEY `lcid` (`lcid`),
  KEY `speciesKey` (`speciesKey`),
  CONSTRAINT `living_creature_ibfk_1` FOREIGN KEY (`speciesKey`) REFERENCES `species` (`speciesKey`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `living_creature`
--

LOCK TABLES `living_creature` WRITE;
/*!40000 ALTER TABLE `living_creature` DISABLE KEYS */;
INSERT INTO `living_creature` VALUES (1,'https://inaturalist-open-data.s3.amazonaws.com/photos/172273306/large.jpeg',351),(2,'https://inaturalist-open-data.s3.amazonaws.com/photos/132360612/large.jpeg',351),(3,'https://inaturalist-open-data.s3.amazonaws.com/photos/60405805/large.jpg',322),(4,'https://inaturalist-open-data.s3.amazonaws.com/photos/97893684/large.jpg',323),(5,'https://fishesofaustralia.net.au/Images/Image/ThalassHardwickeAnthonyPearson.jpg',187),(6,'https://media.australian.museum/media/dd/images/Moon_Wrasse_Thalassoma_lunare.width-800.b7e2f5f.jpg',188),(7,'https://cdn2.reefapp.net/large/upeneus-tragula-b8755d72f26f46e6aa7d11f3c1563f96.jpg',189),(8,'https://fishesofaustralia.net.au/Images/Image/ScolopsisBilineatusRLS.jpg',190),(9,'https://www.mykoweb.com/CAF/photos/large/Nidula_candida%28mgw-01%29.jpg',155),(10,'https://lichenportal.org/imglib/lichens/CDS_Lichens/00036/DX_1709_print_1509659809.jpg',156),(11,'https://ultimate-mushroom.com/uploads/posts/2020-12/1607290222_schizophyllum-commune-1.jpg',157),(12,'https://www.mushroom.pro/c_galleries/a_1k/images/Agaricus_trisulphuratus-d.jpg',162),(13,'http://tropical.theferns.info/plantimages/sized/7/8/788250bddcec74d6b78e83a4955cfc23d925f4bd_480px.jpg',90),(14,'https://www.nparks.gov.sg/-/media/ffw/migrated/round2/flora/3156/ee14f9ec01534932a20eeea5e0ccc0bc.ashx',91),(15,'https://www.toothmountainnursery.com/wp-content/uploads/2020/02/Queen-Crape-Myrtle.jpg',98),(16,'https://www.researchgate.net/profile/Ashraf-Ahmed-Ali-Abdusalam/publication/317416182/figure/fig5/AS:503116923916289@1496963830780/Psidium-guajava-plants-a-flower-b-fruit-c-leaves-and-d-tree-Finca-Tropical.png',90),(17,'https://s3-us-west-2.amazonaws.com/ntbgmeettheplants/images/600h/MalpigGlabraAll02Aug05-0003.jpg',365),(18,'https://toptropicals.com/pics/garden/m1/EleNZ5/Mussaenda_philippica_DonaLuz006_EleNZ.jpg',1),(19,'https://upload.wikimedia.org/wikipedia/commons/8/80/Oldenlandia_herbacea_%284944223496%29.jpg',36),(20,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Mussaenda_frondosa.jpg/440px-Mussaenda_frondosa.jpg',46),(21,'https://live.staticflickr.com/139/349226292_03b68e2c0d_b.jpg',82);
/*!40000 ALTER TABLE `living_creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `stateProvince` varchar(30) NOT NULL,
  `countryCode` varchar(2) NOT NULL,
  `locality` varchar(64) NOT NULL,
  PRIMARY KEY (`stateProvince`,`countryCode`,`locality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('','PH',''),('','PH','Baguio, Mt. Santa Tomas'),('','PH','cult. at Flecker BG, Qld, Australia'),('','PH','Luzon'),('','PH','Manila, University of Santo Tomas'),('','PH','Mt. Duraragan Apayao subprovince Luzon.'),('','PH','Philippine Isl. [=Philippine Islands, the Philipines.]'),('','PH','Rizal Park, Manila, Luzon.'),('Agusan del Norte','PH',''),('Antique','PH',''),('Batangas','PH',''),('Benguet','PH',''),('Bohol','PH',''),('Bukidnon','PH',''),('Bulacan','PH',''),('Camarines Sur','PH',''),('Capiz','PH',''),('Cavite','PH',''),('Cebu','PH',''),('Davao del Norte','PH',''),('Davao del Sur','PH',''),('Davao Oriental','PH',''),('Guimaras','PH',''),('Ilocos Norte','PH',''),('Laguna','PH',''),('Leyte','PH','Hubasan, VISCA, Baybay. Trail on VISCA forest reserve.'),('Leyte','PH','Sitio Mahiao, Kananga, Ormoc. Road to PNOC well 405.'),('Luzon','PH',''),('Luzon','PH','Bicol National Park.'),('Luzon','PH','Diguyo.'),('Luzon','PH','Guinayangan.'),('Luzon','PH','Mt. Nagapatan.'),('Luzon','PH','Mt. Pulog.'),('Metropolitan Manila','PH',''),('Metropolitan Manila','PH','Manila and vicinity, Luzon.'),('Mindanao','PH','Coronon Valley near Santa Cruz.'),('Mindanao','PH','Mount Apo; about 6km west of Todaya.'),('Mindoro','PH','Mt. Yagaw, Mansalay.'),('Misamis Occidental','PH',''),('Misamis Oriental','PH',''),('Mountain Province','PH',''),('Negros Occidental','PH',''),('Negros Oriental','PH',''),('Occidental Mindoro','PH',''),('Palawan','PH',''),('Palawan','PH','Municip. Roxas, Langugan Zigzag, 85 km from Puerto Princesa.'),('Palawan','PH','On path from base camp towards Thumb peak.'),('Palawan','PH','Sidanao Is.'),('Quezon','PH',''),('Rizal','PH',''),('Samar','PH','Brgy. Cambayan, Basey.'),('Sibuyan','PH','Magallanes (Mt. Giting-Giting), Province of Capiz.'),('Sorsogon','PH',''),('Sorsogon','PH','Irosin, Mt. Bulusan'),('Sorsogon','PH','Mt. Bulusan'),('South Cotabato','PH',''),('Tawi-Tawi','PH',''),('Tawi-Tawi','PH','Lapid-Lapid'),('Tawi-Tawi','PH','Luk Pandan'),('Tawi-Tawi','PH','Pababag'),('Tawi-Tawi','PH','Pasiagan'),('Tawi-Tawi','PH','Tubig Indangan'),('Zamboanga','PH',''),('Zamboanga del Sur','PH','');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observer`
--

DROP TABLE IF EXISTS `observer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observer` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `institution` varchar(30) DEFAULT NULL,
  `rgid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `name` (`name`),
  KEY `institution` (`institution`),
  KEY `rgid` (`rgid`),
  CONSTRAINT `observer_ibfk_1` FOREIGN KEY (`institution`) REFERENCES `institution` (`institutionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `observer_ibfk_2` FOREIGN KEY (`rgid`) REFERENCES `research_group` (`rgid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observer`
--

LOCK TABLES `observer` WRITE;
/*!40000 ALTER TABLE `observer` DISABLE KEYS */;
INSERT INTO `observer` VALUES (1,'Taylor Hsu','CS3200',373),(2,'Florenz Blancaflor','CS3200',373),(3,'Jaana Tabalon','CS3200',373),(4,'Test Test','CS3200',373),(5,'Tom Kirschey','iNaturalist',335),(6,'Joan Evangelista','CANB',340),(7,'Mara Tagoon','iNaturalist',342),(8,'Greg III Espera','iNaturalist',93),(9,'Forest Jarvis','CHR',93),(10,'Erik Delaquis','GA',322),(11,'Ritchie C Basilio','NCU',338),(12,'Beah Vega','iNaturalist',185),(13,'Ryan Patrick','iNaturalist',117),(14,'Aniruddha Chatterjee','GA',108);
/*!40000 ALTER TABLE `observer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observes`
--

DROP TABLE IF EXISTS `observes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observes` (
  `ocid` int NOT NULL,
  `oid` int NOT NULL,
  `lcid` int NOT NULL,
  PRIMARY KEY (`ocid`,`oid`,`lcid`),
  KEY `oid` (`oid`),
  KEY `lcid` (`lcid`),
  CONSTRAINT `observes_ibfk_1` FOREIGN KEY (`ocid`) REFERENCES `occurrence_record` (`ocid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `observes_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `observer` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `observes_ibfk_3` FOREIGN KEY (`lcid`) REFERENCES `living_creature` (`lcid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observes`
--

LOCK TABLES `observes` WRITE;
/*!40000 ALTER TABLE `observes` DISABLE KEYS */;
INSERT INTO `observes` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,5,13),(14,5,14),(15,6,15),(16,7,16),(17,8,17),(18,9,18),(19,10,19),(20,10,20),(21,11,21);
/*!40000 ALTER TABLE `observes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occurrence_record`
--

DROP TABLE IF EXISTS `occurrence_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occurrence_record` (
  `ocid` int NOT NULL AUTO_INCREMENT,
  `basisOfRecord` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `confirmCode` varchar(10) NOT NULL,
  PRIMARY KEY (`ocid`),
  UNIQUE KEY `confirmCode` (`confirmCode`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occurrence_record`
--

LOCK TABLES `occurrence_record` WRITE;
/*!40000 ALTER TABLE `occurrence_record` DISABLE KEYS */;
INSERT INTO `occurrence_record` VALUES (1,'frog','2018-05-14','AAAAAAAAAA'),(2,'frog','2018-06-22','BBBBBBBBBB'),(3,'frog','2019-07-04','CCCCCCCCCC'),(4,'frog','2018-06-22','DDDDDDDDDD'),(5,'fish','2018-06-22','EEEEEEEEEE'),(6,'fish','2019-08-02','FFFFFFFFFF'),(7,'fish','2019-10-02','GGGGGGGGGG'),(8,'fish','2020-06-12','HHHHHHHHHH'),(9,'mushroom','2020-09-10','IIIIIIIIII'),(10,'mushroom','2020-11-10','JJJJJJJJJJ'),(11,'mushroom','2019-12-24','KKKKKKKKKK'),(12,'mushroom','2020-08-24','LLLLLLLLLL'),(13,'tree','2019-04-22','MMMMMMMMMM'),(14,'tree','2021-04-12','NNNNNNNNNN'),(15,'tree','2020-07-15','OOOOOOOOOO'),(16,'tree','2021-08-01','PPPPPPPPPP'),(17,'tree','2020-04-23','QQQQQQQQQQ'),(18,'flower','2021-03-10','RRRRRRRRRR'),(19,'flower','2021-04-07','SSSSSSSSSS'),(20,'flower','2021-07-24','TTTTTTTTTT'),(21,'flower','2020-08-18','UUUUUUUUUU');
/*!40000 ALTER TABLE `occurrence_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pre_delete_record` BEFORE DELETE ON `occurrence_record` FOR EACH ROW BEGIN
		DECLARE old_lcid INT;
		DECLARE old_url VARCHAR(255);
		SELECT lcid INTO old_lcid FROM observes WHERE ocid = OLD.ocid;

		-- DELETE found_in
		DELETE FROM found_in WHERE lcid = old_lcid;

		-- DELETE subclasses
		DELETE FROM fauna_frog WHERE faunaLivingCreatureFK = old_lcid;
		DELETE FROM fauna_fish WHERE faunaLivingCreatureFK = old_lcid;
		DELETE FROM flora_flower WHERE floraLivingCreatureFK = old_lcid;
		DELETE FROM flora_mushroom WHERE floraLivingCreatureFK = old_lcid;
		DELETE FROM flora_tree WHERE floraLivingCreatureFK = old_lcid;

		-- DELETE observes
		SELECT pictureURL INTO old_url FROM living_creature WHERE lcid = old_lcid;
		DELETE FROM observes WHERE lcid = old_lcid;

		-- DELETE living_creature (this does not work)
		DELETE FROM living_creature WHERE NOT EXISTS (SELECT * FROM observes WHERE lcid = old_lcid) AND lcid = old_lcid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `research_group`
--

DROP TABLE IF EXISTS `research_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_group` (
  `rgid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`rgid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_group`
--

LOCK TABLES `research_group` WRITE;
/*!40000 ALTER TABLE `research_group` DISABLE KEYS */;
INSERT INTO `research_group` VALUES (85,''),(173,'A. D. E. Elmer'),(81,'A.T. Blancaver'),(60,'Alejandro Gamboa'),(91,'alvaran_kim'),(108,'Aniruddha Chatterjee'),(156,'Aptroot A.'),(146,'Argent, G. & Reynoso, E.J.'),(148,'Argent, G. & Romero, E.M.'),(147,'Argent, G.C.G. & Gaerlan F.J.M.'),(118,'Arvin Rabago'),(59,'B.F. Hernaez & M.A.O. Cajano'),(131,'Balay Ni Charing'),(90,'barasphis_jv_gonzales_grade9'),(119,'barasshs-jebsus-co-grade11'),(355,'Barbon EB; Alvarez RJ; Garcia HG'),(366,'Barbon EB; Garcia HG; Sagcal E'),(185,'Beah Vega'),(56,'Blas F. Hernaez'),(41,'Blas F. Hernaez & Mary Ann O. Cajano'),(123,'bpesannexphase2-odheza-pastor-grade6'),(1,'C. Mendoza, R. Pagcaliwagan, & J. Maranan'),(133,'Carlos G Velazco-Macias'),(117,'Casey Clark Sumalinog'),(354,'Christenhusz MJM'),(171,'cnid_arianne'),(373,'CS3200'),(87,'Cuming, H.'),(151,'Cuming, Hugh'),(370,'Curran HM; Merritt ML; Zschokke TC'),(125,'Daniel Fabellon'),(54,'Danny S. Balete'),(322,'delimaelsa'),(83,'Edano, G.E.'),(95,'edipelmarcellones_umbsed'),(369,'Elmer ADE'),(150,'Elmer, Adolf Daniel Edward'),(348,'EMERY LOTAYCO'),(64,'Emiliano Guanzon'),(356,'Flora Forestal'),(93,'Forest Jarvis'),(346,'Forester Jan'),(127,'FPRI'),(5,'G.C. Lugod'),(2,'G.R. Price'),(352,'Gaerlan FJM; Sagcal E; Romero EM'),(345,'garretdychiao'),(116,'Greg III Espera'),(44,'IPAS Team'),(36,'J.C. Regalado Jr.'),(39,'J.N. Esperanza'),(37,'J.V. Pancho'),(42,'J.V. Pancho & B.F. Hernaez'),(371,'Jacobs, M.'),(112,'Jean Louise D. Palomar'),(153,'JIE ARRO'),(340,'Joan Evangelista'),(43,'Joel C. Siopongco'),(89,'Jose Marfori'),(92,'julesvern_garcia'),(114,'Justin Andrei Tanilon'),(334,'kay_angelie_busano'),(120,'kelwinadonis'),(94,'keshen'),(372,'kessad12'),(186,'lenisutcliffe'),(132,'leonmateo'),(336,'limhongyao'),(4,'M.A.O. Cajano & F.H. Mandia'),(349,'mabelsunga'),(342,'Mara Tagoon'),(86,'Maximo Ramos'),(84,'Merrill, E.D.'),(122,'Michaela S. Webb'),(157,'mira152215'),(45,'N. Catalan'),(109,'nez'),(105,'Nielbert Raner'),(159,'nikocat'),(101,'Novem Dawn Manzano'),(335,'Ohk.gep'),(48,'Ramirez & Odona'),(361,'Ramos M'),(323,'Realubit, Nikki'),(154,'Regin Carl Dellosa'),(337,'reginaalexafiguerasbravo'),(359,'Reynoso EJ'),(158,'rica_rocero18'),(365,'Ridsdale CE; Dejan V; Baquiran N'),(338,'Ritchie C Basilio'),(126,'riza_rivera'),(145,'Robinson, C.B.'),(35,'Rosario R. Capanzana'),(96,'rujeanromyguisando'),(141,'Sands MJS'),(104,'Soejarto DD; et al.'),(358,'Soejarto DD; Madulid DA'),(97,'sorryallorie_'),(364,'Sulit MD'),(362,'Sulit MD; Conklin HC'),(98,'syfelise'),(40,'TBAR'),(88,'Tenison-Woods, J.E.'),(121,'tina1950'),(102,'umyeast-alexisodeloncabanlit'),(357,'Unknown'),(353,'Vanoverbergh MFJPM'),(142,'Warburg, O.'),(106,'Whitaker, AH; Whitaker, V;'),(155,'Williams, R. S.');
/*!40000 ALTER TABLE `research_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `speciesKey` int NOT NULL AUTO_INCREMENT,
  `kingdom` varchar(30) NOT NULL,
  `phylum` varchar(30) NOT NULL,
  `class` varchar(30) NOT NULL,
  `speciesOrder` varchar(30) NOT NULL,
  `family` varchar(30) NOT NULL,
  `genus` varchar(30) NOT NULL,
  `species` varchar(30) NOT NULL,
  PRIMARY KEY (`speciesKey`),
  UNIQUE KEY `species` (`species`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (1,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Mussaenda','Mussaenda philippica'),(3,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Mussaenda',''),(4,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Neonauclea','Neonauclea calycina'),(5,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Adina','Adina multifolia'),(36,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Oldenlandia','Oldenlandia banksii'),(41,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Diplospora','Diplospora dubia'),(46,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Mussaenda','Mussaenda multibracteata'),(54,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Diplospora','Diplospora fasciculiflora'),(61,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Hydnophytum','Hydnophytum formicarum'),(63,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Paracarphalea','Paracarphalea kirondron'),(75,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Villaria','Villaria glomerata'),(76,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Timonius','Timonius auriculatus'),(78,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Uncaria','Uncaria lanosa'),(82,'Plantae','Tracheophyta','Magnoliopsida','Gentianales','Rubiaceae','Mussaenda','Mussaenda anisophylla'),(85,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Decaspermum','Decaspermum parviflorum'),(86,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Syzygium','Syzygium mainitense'),(89,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Lythraceae','Pemphis','Pemphis acidula'),(90,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Psidium','Psidium guajava'),(91,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Syzygium','Syzygium myrtifolium'),(93,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Lythraceae','Cuphea','Cuphea hyssopifolia'),(95,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Combretaceae','Combretum','Combretum indicum'),(96,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Syzygium','Syzygium samarangense'),(98,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Lythraceae','Lagerstroemia','Lagerstroemia speciosa'),(100,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Combretaceae','Terminalia','Terminalia catappa'),(103,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Metrosideros','Metrosideros halconensis'),(104,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Tristaniopsis','Tristaniopsis oblongifolia'),(105,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Melastomataceae','Medinilla','Medinilla pendula'),(127,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Combretaceae','Terminalia','Terminalia citrina'),(129,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Eucalyptus','Eucalyptus deglupta'),(133,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Lythraceae','Cuphea','Cuphea carthagenensis'),(141,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Leptospermum','Leptospermum polygalifolium'),(144,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Melastomataceae','Melastoma','Melastoma crinitum'),(150,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Myrtaceae','Syzygium','Syzygium polyanthum'),(151,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Melastomataceae','Medinilla','Medinilla astronioides'),(152,'Plantae','Tracheophyta','Magnoliopsida','Myrtales','Lythraceae','Lagerstroemia','Lagerstroemia indica'),(155,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Agaricaceae','Nidula','Nidula candida'),(156,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Hygrophoraceae','Dictyonema','Dictyonema thelephora'),(157,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Schizophyllaceae','Schizophyllum','Schizophyllum commune'),(159,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Pluteaceae','Volvariella','Volvariella volvacea'),(162,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Agaricaceae','Agaricus','Agaricus trisulphuratus'),(169,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Hygrophoraceae','Cyphellostereum','Cyphellostereum phyllogenum'),(171,'Fungi','Basidiomycota','Agaricomycetes','Agaricales','Psathyrellaceae','Coprinellus','Coprinellus aureogranulatus'),(187,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Thalassoma','Thalassoma hardwicke'),(188,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Thalassoma','Thalassoma lunare'),(189,'Animalia','Chordata','Actinopterygii','Perciformes','Mullidae','Upeneus','Upeneus tragula'),(190,'Animalia','Chordata','Actinopterygii','Perciformes','Nemipteridae','Scolopsis','Scolopsis bilineata'),(191,'Animalia','Chordata','Actinopterygii','Perciformes','Scaridae','Scarus','Scarus niger'),(192,'Animalia','Chordata','Actinopterygii','Perciformes','Nemipteridae','Scolopsis','Scolopsis lineata'),(193,'Animalia','Chordata','Actinopterygii','Perciformes','Siganidae','Siganus','Siganus puellus'),(194,'Animalia','Chordata','Actinopterygii','Perciformes','Carangidae','Selaroides','Selaroides leptolepis'),(195,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Dascyllus','Dascyllus reticulatus'),(196,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Stethojulis','Stethojulis bandanensis'),(197,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Dascyllus','Dascyllus trimaculatus'),(198,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Neoglyphidodon','Neoglyphidodon melas'),(199,'Animalia','Chordata','Actinopterygii','Perciformes','Caesionidae','Pterocaesio','Pterocaesio tile'),(201,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Chromis','Chromis viridis'),(202,'Animalia','Chordata','Actinopterygii','Perciformes','Scaridae','Scarus','Scarus flavipectoralis'),(203,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Pseudanthias','Pseudanthias tuka'),(204,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Dischistodus','Dischistodus perspicillatus'),(205,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Pomacentrus','Pomacentrus coelestis'),(206,'Animalia','Chordata','Actinopterygii','Perciformes','Scaridae','Scarus','Scarus ghobban'),(207,'Animalia','Chordata','Actinopterygii','Perciformes','Nemipteridae','Pentapodus','Pentapodus emeryii'),(208,'Animalia','Chordata','Actinopterygii','Perciformes','Pinguipedidae','Parapercis','Parapercis cylindrica'),(209,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Chrysiptera','Chrysiptera tricincta'),(210,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Epinephelus','Epinephelus fuscoguttatus'),(211,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Dascyllus','Dascyllus aruanus'),(212,'Animalia','Chordata','Actinopterygii','Perciformes','Acanthuridae','Ctenochaetus','Ctenochaetus striatus'),(213,'Animalia','Chordata','Actinopterygii','Perciformes','Blenniidae','Meiacanthus','Meiacanthus grammistes'),(214,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Epinephelus','Epinephelus coeruleopunctatus'),(215,'Animalia','Chordata','Actinopterygii','Perciformes','Lutjanidae','Lutjanus','Lutjanus carponotatus'),(216,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Pseudanthias','Pseudanthias huchtii'),(217,'Animalia','Chordata','Actinopterygii','Perciformes','Lutjanidae','Lutjanus','Lutjanus lutjanus'),(218,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Dascyllus','Dascyllus melanurus'),(219,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Taeniamia','Taeniamia zosterophora'),(220,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Amblyglyphidodon','Amblyglyphidodon curacao'),(221,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Thalassoma','Thalassoma jansenii'),(222,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Cheilodipterus','Cheilodipterus quinquelineatus'),(223,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Amblyglyphidodon','Amblyglyphidodon aureus'),(225,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacanthidae','Chaetodontoplus','Chaetodontoplus conspicillatus'),(226,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chelmon','Chelmon rostratus'),(227,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Cephalopholis','Cephalopholis microprion'),(228,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Choerodon','Choerodon anchorago'),(230,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon kleinii'),(231,'Animalia','Chordata','Actinopterygii','Perciformes','Nemipteridae','Pentapodus','Pentapodus caninus'),(233,'Animalia','Chordata','Actinopterygii','Perciformes','Caesionidae','Caesio','Caesio cuning'),(234,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Amphiprion','Amphiprion clarkii'),(235,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Abudefduf','Abudefduf vaigiensis'),(237,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Amblyglyphidodon','Amblyglyphidodon leucogaster'),(238,'Animalia','Chordata','Actinopterygii','Perciformes','Acanthuridae','Zebrasoma','Zebrasoma scopas'),(239,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon ornatissimus'),(240,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Ostorhinchus','Ostorhinchus angustatus'),(241,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Pristicon','Pristicon trimaculatus'),(242,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Ostorhinchus','Ostorhinchus cookii'),(243,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Aethaloperca','Aethaloperca rogaa'),(244,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Chromis','Chromis atripectoralis'),(245,'Animalia','Chordata','Actinopterygii','Perciformes','Siganidae','Siganus','Siganus guttatus'),(246,'Animalia','Chordata','Actinopterygii','Perciformes','Scaridae','Chlorurus','Chlorurus bleekeri'),(247,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Pristiapogon','Pristiapogon kallopterus'),(250,'Animalia','Chordata','Actinopterygii','Perciformes','Siganidae','Siganus','Siganus argenteus'),(251,'Animalia','Chordata','Actinopterygii','Tetraodontiformes','Tetraodontidae','Canthigaster','Canthigaster valentini'),(253,'Animalia','Chordata','Actinopterygii','Perciformes','Sphyraenidae','Sphyraena','Sphyraena flavicauda'),(254,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Pomacentrus','Pomacentrus moluccensis'),(256,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon melannotus'),(257,'Animalia','Chordata','Actinopterygii','Perciformes','Haemulidae','Plectorhinchus','Plectorhinchus pictus'),(260,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon oxycephalus'),(261,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon auriga'),(267,'Animalia','Chordata','Actinopterygii','Perciformes','Lutjanidae','Lutjanus','Lutjanus kasmira'),(270,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Abudefduf','Abudefduf whitleyi'),(272,'Animalia','Chordata','Actinopterygii','Perciformes','Mullidae','Parupeneus','Parupeneus barberinus'),(277,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Zoramia','Zoramia fragilis'),(278,'Animalia','Chordata','Actinopterygii','Perciformes','Zanclidae','Zanclus','Zanclus cornutus'),(279,'Animalia','Chordata','Actinopterygii','Siluriformes','Plotosidae','Plotosus','Plotosus lineatus'),(288,'Animalia','Chordata','Actinopterygii','Perciformes','Haemulidae','Plectorhinchus','Plectorhinchus diagrammus'),(290,'Animalia','Chordata','Actinopterygii','Perciformes','Acanthuridae','Acanthurus','Acanthurus olivaceus'),(292,'Animalia','Chordata','Actinopterygii','Perciformes','Siganidae','Siganus','Siganus corallinus'),(293,'Animalia','Chordata','Actinopterygii','Clupeiformes','Engraulidae','Stolephorus','Stolephorus commersonnii'),(295,'Animalia','Chordata','Actinopterygii','Perciformes','Acanthuridae','Acanthurus','Acanthurus nigroris'),(296,'Animalia','Chordata','Actinopterygii','Perciformes','Pinguipedidae','Parapercis','Parapercis nebulosa'),(298,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Ostorhinchus','Ostorhinchus apogonoides'),(300,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Cirrhilabrus','Cirrhilabrus cyanopleura'),(304,'Animalia','Chordata','Actinopterygii','Perciformes','Acanthuridae','Acanthurus','Acanthurus mata'),(305,'Animalia','Chordata','Actinopterygii','Perciformes','Pomacentridae','Abudefduf','Abudefduf sexfasciatus'),(307,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Ostorhinchus','Ostorhinchus aureus'),(308,'Animalia','Chordata','Actinopterygii','Perciformes','Chaetodontidae','Chaetodon','Chaetodon rafflesii'),(309,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Hemigymnus','Hemigymnus melapterus'),(310,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Halichoeres','Halichoeres hortulanus'),(311,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Labrichthys','Labrichthys unilineatus'),(313,'Animalia','Chordata','Actinopterygii','Perciformes','Apogonidae','Cheilodipterus','Cheilodipterus artus'),(315,'Animalia','Chordata','Actinopterygii','Perciformes','Serranidae','Epinephelus','Epinephelus merra'),(320,'Animalia','Chordata','Actinopterygii','Perciformes','Labridae','Cheilinus','Cheilinus trilobatus'),(322,'Animalia','Chordata','Amphibia','Anura','Rhacophoridae','Philautus','Philautus surdus'),(323,'Animalia','Chordata','Amphibia','Anura','Rhacophoridae','Polypedates','Polypedates macrotis'),(351,'Animalia','Chordata','Amphibia','Anura','Rhacophoridae','Polypedates','Polypedates leucomystax'),(365,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Malpighiaceae','Malpighia','Malpighia emarginata'),(367,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Euphorbiaceae','Euphorbia','Euphorbia milii'),(368,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Rhizophoraceae','Rhizophora','Rhizophora apiculata'),(371,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Phyllanthaceae','Breynia','Breynia cernua'),(372,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Euphorbiaceae','Euphorbia','Euphorbia hypericifolia'),(375,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Phyllanthaceae','Breynia','Breynia vitis-idaea'),(385,'Plantae','Tracheophyta','Magnoliopsida','Malpighiales','Euphorbiaceae','Euphorbia','Euphorbia heterophylla');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'creature_spottings'
--

--
-- Dumping routines for database 'creature_spottings'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_occurrence_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_occurrence_record`(ocid_n int)
BEGIN
	DELETE FROM occurrence_record WHERE ocid = ocid_n;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_fish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_fish`(size int, seasonFound varchar(25), faunaLivingCreatureFK int)
BEGIN
	INSERT INTO fauna_fish (size, seasonFound, faunaLivingCreatureFK)
	VALUES (size, seasonFound, faunaLivingCreatureFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_flower` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_flower`(numberOfPetals int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_flower (numberOfPetals, seasonFound, floraLivingCreatureFK) 
	VALUES (numberOfPetals, seasonFound, floraLivingCreatureFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_found_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_found_in`(lcid_n int, sp_n VARCHAR(30), c_n VARCHAR(2), l_n VARCHAR(64))
BEGIN
	INSERT INTO found_in (lcid, stateProvince, countryCode, locality) VALUES (lcid_n, sp_n, c_n, l_n);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_frog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_frog`(size int, seasonFound varchar(25), faunaLivingCreatureFK int)
BEGIN
	INSERT INTO fauna_frog (size, seasonFound, faunaLivingCreatureFK)
	VALUES (size, seasonFound, faunaLivingCreatureFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_living_creature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_living_creature`(pictureURL VARCHAR(255), speciesKey INT)
BEGIN
	INSERT INTO living_creature (pictureURL, speciesKey) VALUES (pictureURL, speciesKey);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_location`(stateProvince_new VARCHAR(30), countryCode_new VARCHAR(2), locality_new VARCHAR(64))
BEGIN

	-- If the given location does not exist in location table yet, insert a record
    IF NOT EXISTS (SELECT * FROM location WHERE location.stateProvince = stateProvince_new 
					AND location.countryCode = countryCode_new
					AND location.locality = locality_new) THEN
 		INSERT INTO location (stateProvince, countryCode, locality) VALUES (stateProvince_new, countryCode_new, locality_new);
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_mushroom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_mushroom`(height int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_mushroom (height, seasonFound, floraLivingCreatureFK)
	VALUES (height, seasonFound, floraLivingCreatureFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_observer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_observer`(name VARCHAR(64), institution VARCHAR(30), rgid INT)
BEGIN
	INSERT INTO observer (name, institution, rgid) VALUES (name, institution, rgid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_observes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_observes`(ocid_n int, oid_n int, lcid_n int)
BEGIN
	INSERT INTO observes (ocid, oid, lcid) VALUES (ocid_n, oid_n, lcid_n);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_occurrence_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_occurrence_record`(basisOfRecord varchar(100), date date, confirmCode varchar(10))
BEGIN
	INSERT INTO occurrence_record(basisOfRecord, date, confirmCode) 
	VALUES (basisOfRecord, date, confirmCode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tree`(height int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_tree (height, seasonFound, floraLivingCreatureFK)
	VALUES (height, seasonFound, floraLivingCreatureFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_date`(d date, code VARCHAR(10))
BEGIN
	UPDATE occurrence_record
	SET date = d
	WHERE confirmCode = code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_fishLength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_fishLength`(l INT, code VARCHAR(10))
BEGIN
	UPDATE fauna_fish
	SET size = l
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_fishSzn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_fishSzn`(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE fauna_fish
	SET seasonFound = szn
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_flowerPetals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_flowerPetals`(p INT, code VARCHAR(10))
BEGIN
	UPDATE flora_flower
	SET numberOfPetals = p
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_flowerSzn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_flowerSzn`(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_flower
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_frogLength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_frogLength`(l INT, code VARCHAR(10))
BEGIN
	UPDATE fauna_frog
	SET size = l
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_frogSzn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_frogSzn`(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE fauna_frog
	SET seasonFound = szn
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_location`(sp VARCHAR(30), c VARCHAR(2), l VARCHAR(64), code VARCHAR(10))
BEGIN
	UPDATE found_in
	SET stateProvince = sp, countryCode = c, locality = l
	WHERE lcid = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_mushroomHeight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mushroomHeight`(h INT, code VARCHAR(10))
BEGIN
	UPDATE flora_mushroom
	SET height = h
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_mushroomSzn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mushroomSzn`(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_mushroom
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_treeHeight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_treeHeight`(h INT, code VARCHAR(10))
BEGIN
	UPDATE flora_tree
	SET height = h
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_treeSzn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_treeSzn`(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_tree
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_url` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_url`(url VARCHAR(255), code VARCHAR(10))
BEGIN
	UPDATE living_creature
	SET pictureURL = url
	WHERE lcid = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 22:13:16
