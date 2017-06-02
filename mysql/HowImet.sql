-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: howimet.ctj6cgqbzmqo.us-west-2.rds.amazonaws.com    Database: HowImet
-- ------------------------------------------------------
-- Server version	5.6.27-log
use howimet;login

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_name` varchar(30) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('adminUsername','adminPassword',0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answerer_info`
--

DROP TABLE IF EXISTS `answerer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answerer_info` (
  `answerer_ID` int(11) NOT NULL,
  `questionnary_ID` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `age` varchar(20) NOT NULL,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`answerer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answerer_info`
--

LOCK TABLES `answerer_info` WRITE;
/*!40000 ALTER TABLE `answerer_info` DISABLE KEYS */;
INSERT INTO `answerer_info` VALUES (1,2,'Male','18-24','Louisiana'),(2,2,'Male','18-24','Illinois'),(3,2,'Male','18-24','Alabama'),(4,2,'Female','35-44','Alaska'),(5,2,'Male','25-34','Arizona'),(6,2,'Female','45-54','Delaware'),(7,2,'Female','45-54','Arkansas'),(8,2,'Undefined',' 75','California'),(9,2,'Female','18-24','Connecticut'),(10,2,'Undefined','55-64','Connecticut'),(11,2,'Undefined','65-74','Delaware'),(12,2,'Female','65-74','Delaware'),(13,2,'Male','45-54','Idaho'),(14,2,'Male','25-34','District of Columbia'),(15,2,'Female','65-74','Federated States of Micronesia'),(16,2,'Female','35-44','Federated States of Micronesia'),(17,2,'Undefined','35-44','Georgia'),(18,2,'Female','18-24','Hawaii'),(19,2,'Male','25-34','Indiana'),(20,2,'Female','45-54','Maine'),(21,2,'Female','65-74','Maryland'),(22,2,'Undefined',' 75','Marshall Islands'),(23,2,'Female','65-74','District of Columbia'),(24,2,'Male','35-44','New Jersey'),(25,2,'Male',' 75','Nevada'),(26,2,'Female','35-44','California'),(27,2,'Male','45-54','Oregon'),(28,2,'Male','25-34','Guam'),(29,2,'Male','55-64','Washington'),(30,2,'Male','65-74','Puerto Rico'),(31,2,'Male','18-24','Hawaii'),(32,2,'Female','25-34','Washington'),(33,2,'Undefined','65-74','Vermont'),(34,2,'Male','18-24','Alabama'),(35,3,'Male','18-24','Alabama');
/*!40000 ALTER TABLE `answerer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answerer_position`
--

DROP TABLE IF EXISTS `answerer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answerer_position` (
  `answerer_ID` int(11) NOT NULL,
  `proposition_ID` int(11) NOT NULL,
  `position` varchar(20) NOT NULL,
  PRIMARY KEY (`answerer_ID`,`proposition_ID`),
  KEY `proposition_ID_fk4_idx` (`proposition_ID`),
  CONSTRAINT `answerer_ID_fk` FOREIGN KEY (`answerer_ID`) REFERENCES `answerer_info` (`answerer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proposition_ID_fk4` FOREIGN KEY (`proposition_ID`) REFERENCES `proposition_info` (`proposition_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answerer_position`
--

LOCK TABLES `answerer_position` WRITE;
/*!40000 ALTER TABLE `answerer_position` DISABLE KEYS */;
INSERT INTO `answerer_position` VALUES (1,6,'Clinton'),(1,7,'Clinton'),(1,8,'Clinton'),(1,9,'Trump'),(1,10,'Trump'),(1,11,'Trump'),(1,12,'Clinton'),(1,13,'Trump'),(1,14,'Clinton'),(1,15,'Trump'),(1,16,'Clinton'),(1,17,'Clinton'),(1,18,'Clinton'),(1,19,'Trump'),(1,20,'Trump'),(1,21,'Trump'),(1,24,'Trump'),(1,25,'Clinton'),(1,26,'Trump'),(1,27,'Trump'),(1,28,'Clinton'),(2,6,'Trump'),(2,7,'Clinton'),(2,8,'Trump'),(2,9,'Clinton'),(2,10,'Clinton'),(2,11,'Clinton'),(2,12,'Trump'),(2,13,'Clinton'),(2,14,'Clinton'),(2,15,'Clinton'),(2,16,'Clinton'),(2,17,'Clinton'),(2,18,'Clinton'),(2,19,'Clinton'),(2,20,'Clinton'),(2,21,'Clinton'),(2,24,'Clinton'),(2,25,'Clinton'),(2,26,'Trump'),(2,27,'Clinton'),(2,28,'Clinton'),(3,6,'Trump'),(3,7,'Clinton'),(3,8,'Trump'),(3,9,'Trump'),(3,10,'Clinton'),(3,11,'Clinton'),(3,12,'Trump'),(3,13,'Trump'),(3,14,'Clinton'),(3,15,'Trump'),(3,16,'Trump'),(3,17,'Clinton'),(3,18,'Trump'),(3,19,'Trump'),(3,20,'Clinton'),(3,21,'Trump'),(3,24,'Trump'),(3,25,'Trump'),(3,26,'Clinton'),(3,27,'Clinton'),(3,28,'Trump'),(4,6,'Trump'),(4,7,'Clinton'),(4,8,'Trump'),(4,9,'Trump'),(4,10,'Trump'),(4,11,'Trump'),(4,12,'Trump'),(4,13,'Trump'),(4,14,'Clinton'),(4,15,'Clinton'),(4,16,'Clinton'),(4,17,'Trump'),(4,18,'Trump'),(4,19,'Trump'),(4,20,'Clinton'),(4,21,'Clinton'),(4,24,'Clinton'),(4,25,'Clinton'),(4,26,'Clinton'),(4,27,'Trump'),(4,28,'Clinton'),(5,6,'Trump'),(5,7,'Clinton'),(5,8,'Trump'),(5,9,'Trump'),(5,10,'Trump'),(5,11,'Clinton'),(5,12,'Clinton'),(5,13,'Clinton'),(5,14,'Clinton'),(5,15,'Trump'),(5,16,'Trump'),(5,17,'Clinton'),(5,18,'Clinton'),(5,19,'Clinton'),(5,20,'Trump'),(5,21,'Trump'),(5,24,'Trump'),(5,25,'Clinton'),(5,26,'Trump'),(5,27,'Clinton'),(5,28,'Clinton'),(6,6,'Clinton'),(6,7,'Trump'),(6,8,'Trump'),(6,9,'Clinton'),(6,10,'Clinton'),(6,11,'Trump'),(6,12,'Clinton'),(6,13,'Trump'),(6,14,'Clinton'),(6,15,'Trump'),(6,16,'Trump'),(6,17,'Trump'),(6,18,'Trump'),(6,19,'Clinton'),(6,20,'Clinton'),(6,21,'Clinton'),(6,24,'Trump'),(6,25,'Clinton'),(6,26,'Clinton'),(6,27,'Trump'),(6,28,'Clinton'),(7,6,'Clinton'),(7,7,'Clinton'),(7,8,'Clinton'),(7,9,'Clinton'),(7,10,'Trump'),(7,11,'Trump'),(7,12,'Trump'),(7,13,'Clinton'),(7,14,'Clinton'),(7,15,'Trump'),(7,16,'Trump'),(7,17,'Trump'),(7,18,'Clinton'),(7,19,'Clinton'),(7,20,'Trump'),(7,21,'Clinton'),(7,24,'Clinton'),(7,25,'Clinton'),(7,26,'Clinton'),(7,27,'Clinton'),(7,28,'Clinton'),(8,6,'Trump'),(8,7,'Clinton'),(8,8,'Clinton'),(8,9,'Trump'),(8,10,'Trump'),(8,11,'Trump'),(8,12,'Trump'),(8,13,'Trump'),(8,14,'Clinton'),(8,15,'Clinton'),(8,16,'Clinton'),(8,17,'Clinton'),(8,18,'Clinton'),(8,19,'Trump'),(8,20,'Clinton'),(8,21,'Clinton'),(8,24,'Clinton'),(8,25,'Clinton'),(8,26,'Clinton'),(8,27,'Trump'),(8,28,'Trump'),(9,6,'Trump'),(9,7,'Trump'),(9,8,'Trump'),(9,9,'Clinton'),(9,10,'Clinton'),(9,11,'Clinton'),(9,12,'Trump'),(9,13,'Clinton'),(9,14,'Trump'),(9,15,'Trump'),(9,16,'Clinton'),(9,17,'Trump'),(9,18,'Trump'),(9,19,'Trump'),(9,20,'Trump'),(9,21,'Trump'),(9,24,'Trump'),(9,25,'Trump'),(9,26,'Trump'),(9,27,'Trump'),(9,28,'Trump'),(10,6,'Trump'),(10,7,'Clinton'),(10,8,'Clinton'),(10,9,'Clinton'),(10,10,'Trump'),(10,11,'Clinton'),(10,12,'Trump'),(10,13,'Clinton'),(10,14,'Clinton'),(10,15,'Clinton'),(10,16,'Trump'),(10,17,'Clinton'),(10,18,'Clinton'),(10,19,'Clinton'),(10,20,'Trump'),(10,21,'Trump'),(10,24,'Trump'),(10,25,'Clinton'),(10,26,'Trump'),(10,27,'Trump'),(10,28,'Trump'),(11,6,'Trump'),(11,7,'Clinton'),(11,8,'Trump'),(11,9,'Trump'),(11,10,'Trump'),(11,11,'Clinton'),(11,12,'Clinton'),(11,13,'Trump'),(11,14,'Clinton'),(11,15,'Trump'),(11,16,'Trump'),(11,17,'Clinton'),(11,18,'Trump'),(11,19,'Trump'),(11,20,'Clinton'),(11,21,'Trump'),(11,24,'Trump'),(11,25,'Trump'),(11,26,'Trump'),(11,27,'Clinton'),(11,28,'Trump'),(12,6,'Trump'),(12,7,'Clinton'),(12,8,'Trump'),(12,9,'Clinton'),(12,10,'Trump'),(12,11,'Clinton'),(12,12,'Trump'),(12,13,'Trump'),(12,14,'Trump'),(12,15,'Trump'),(12,16,'Trump'),(12,17,'Trump'),(12,18,'Clinton'),(12,19,'Clinton'),(12,20,'Trump'),(12,21,'Clinton'),(12,24,'Trump'),(12,25,'Trump'),(12,26,'Clinton'),(12,27,'Clinton'),(12,28,'Trump'),(13,6,'Clinton'),(13,7,'Clinton'),(13,8,'Clinton'),(13,9,'Trump'),(13,10,'Clinton'),(13,11,'Clinton'),(13,12,'Trump'),(13,13,'Trump'),(13,14,'Clinton'),(13,15,'Clinton'),(13,16,'Trump'),(13,17,'Clinton'),(13,18,'Clinton'),(13,19,'Clinton'),(13,20,'Clinton'),(13,21,'Trump'),(13,24,'Clinton'),(13,25,'Clinton'),(13,26,'Clinton'),(13,27,'Trump'),(13,28,'Trump'),(14,6,'Trump'),(14,7,'Trump'),(14,8,'Trump'),(14,9,'Clinton'),(14,10,'Trump'),(14,11,'Clinton'),(14,12,'Trump'),(14,13,'Clinton'),(14,14,'Clinton'),(14,15,'Trump'),(14,16,'Clinton'),(14,17,'Trump'),(14,18,'Trump'),(14,19,'Trump'),(14,20,'Clinton'),(14,21,'Clinton'),(14,24,'Trump'),(14,25,'Clinton'),(14,26,'Clinton'),(14,27,'Trump'),(14,28,'Trump'),(15,6,'Trump'),(15,7,'Trump'),(15,8,'Trump'),(15,9,'Trump'),(15,10,'Trump'),(15,11,'Clinton'),(15,12,'Clinton'),(15,13,'Clinton'),(15,14,'Clinton'),(15,15,'Trump'),(15,16,'Trump'),(15,17,'Trump'),(15,18,'Trump'),(15,19,'Clinton'),(15,20,'Trump'),(15,21,'Trump'),(15,24,'Trump'),(15,25,'Clinton'),(15,26,'Clinton'),(15,27,'Clinton'),(15,28,'Trump'),(16,6,'Clinton'),(16,7,'Clinton'),(16,8,'Trump'),(16,9,'Trump'),(16,10,'Trump'),(16,11,'Trump'),(16,12,'Trump'),(16,13,'Clinton'),(16,14,'Clinton'),(16,15,'Trump'),(16,16,'Clinton'),(16,17,'Clinton'),(16,18,'Trump'),(16,19,'Trump'),(16,20,'Clinton'),(16,21,'Trump'),(16,24,'Trump'),(16,25,'Trump'),(16,26,'Trump'),(16,27,'Clinton'),(16,28,'Clinton'),(17,6,'Trump'),(17,7,'Clinton'),(17,8,'Clinton'),(17,9,'Trump'),(17,10,'Trump'),(17,11,'Trump'),(17,12,'Trump'),(17,13,'Trump'),(17,14,'Trump'),(17,15,'Trump'),(17,16,'Trump'),(17,17,'Clinton'),(17,18,'Trump'),(17,19,'Clinton'),(17,20,'Trump'),(17,21,'Trump'),(17,24,'Trump'),(17,25,'Clinton'),(17,26,'Clinton'),(17,27,'Trump'),(17,28,'Trump'),(18,6,'Clinton'),(18,7,'Trump'),(18,8,'Trump'),(18,9,'Clinton'),(18,10,'Trump'),(18,11,'Clinton'),(18,12,'Trump'),(18,13,'Clinton'),(18,14,'Clinton'),(18,15,'Trump'),(18,16,'Trump'),(18,17,'Clinton'),(18,18,'Trump'),(18,19,'Trump'),(18,20,'Clinton'),(18,21,'Trump'),(18,24,'Trump'),(18,25,'Clinton'),(18,26,'Trump'),(18,27,'Clinton'),(18,28,'Trump'),(19,6,'Trump'),(19,7,'Clinton'),(19,8,'Trump'),(19,9,'Trump'),(19,10,'Clinton'),(19,11,'Trump'),(19,12,'Trump'),(19,13,'Clinton'),(19,14,'Trump'),(19,15,'Clinton'),(19,16,'Trump'),(19,17,'Trump'),(19,18,'Clinton'),(19,19,'Trump'),(19,20,'Clinton'),(19,21,'Clinton'),(19,24,'Clinton'),(19,25,'Clinton'),(19,26,'Trump'),(19,27,'Clinton'),(19,28,'Trump'),(20,6,'Trump'),(20,7,'Trump'),(20,8,'Clinton'),(20,9,'Trump'),(20,10,'Clinton'),(20,11,'Trump'),(20,12,'Trump'),(20,13,'Clinton'),(20,14,'Clinton'),(20,15,'Trump'),(20,16,'Trump'),(20,17,'Trump'),(20,18,'Trump'),(20,19,'Trump'),(20,20,'Trump'),(20,21,'Clinton'),(20,24,'Clinton'),(20,25,'Trump'),(20,26,'Clinton'),(20,27,'Trump'),(20,28,'Trump'),(21,6,'Trump'),(21,7,'Trump'),(21,8,'Trump'),(21,9,'Clinton'),(21,10,'Clinton'),(21,11,'Trump'),(21,12,'Trump'),(21,13,'Clinton'),(21,14,'Trump'),(21,15,'Clinton'),(21,16,'Trump'),(21,17,'Trump'),(21,18,'Trump'),(21,19,'Clinton'),(21,20,'Trump'),(21,21,'Clinton'),(21,24,'Clinton'),(21,25,'Clinton'),(21,26,'Clinton'),(21,27,'Clinton'),(21,28,'Clinton'),(22,6,'Clinton'),(22,7,'Trump'),(22,8,'Trump'),(22,9,'Trump'),(22,10,'Clinton'),(22,11,'Clinton'),(22,12,'Clinton'),(22,13,'Clinton'),(22,14,'Trump'),(22,15,'Clinton'),(22,16,'Trump'),(22,17,'Trump'),(22,18,'Trump'),(22,19,'Trump'),(22,20,'Trump'),(22,21,'Clinton'),(22,24,'Trump'),(22,25,'Clinton'),(22,26,'Clinton'),(22,27,'Trump'),(22,28,'Clinton'),(23,6,'Clinton'),(23,7,'Clinton'),(23,8,'Clinton'),(23,9,'Clinton'),(23,10,'Clinton'),(23,11,'Trump'),(23,12,'Clinton'),(23,13,'Clinton'),(23,14,'Trump'),(23,15,'Trump'),(23,16,'Clinton'),(23,17,'Clinton'),(23,18,'Trump'),(23,19,'Trump'),(23,20,'Trump'),(23,21,'Trump'),(23,24,'Trump'),(23,25,'Trump'),(23,26,'Trump'),(23,27,'Trump'),(23,28,'Trump'),(24,6,'Trump'),(24,7,'Trump'),(24,8,'Clinton'),(24,9,'Trump'),(24,10,'Trump'),(24,11,'Trump'),(24,12,'Trump'),(24,13,'Clinton'),(24,14,'Clinton'),(24,15,'Clinton'),(24,16,'Trump'),(24,17,'Clinton'),(24,18,'Clinton'),(24,19,'Clinton'),(24,20,'Trump'),(24,21,'Clinton'),(24,24,'Clinton'),(24,25,'Trump'),(24,26,'Clinton'),(24,27,'Clinton'),(24,28,'Clinton'),(25,6,'Trump'),(25,7,'Trump'),(25,8,'Clinton'),(25,9,'Clinton'),(25,10,'Clinton'),(25,11,'Trump'),(25,12,'Trump'),(25,13,'Trump'),(25,14,'Clinton'),(25,15,'Trump'),(25,16,'Trump'),(25,17,'Trump'),(25,18,'Clinton'),(25,19,'Trump'),(25,20,'Clinton'),(25,21,'Trump'),(25,24,'Trump'),(25,25,'Trump'),(25,26,'Trump'),(25,27,'Clinton'),(25,28,'Clinton'),(26,6,'Clinton'),(26,7,'Clinton'),(26,8,'Clinton'),(26,9,'Clinton'),(26,10,'Clinton'),(26,11,'Trump'),(26,12,'Clinton'),(26,13,'Clinton'),(26,14,'Trump'),(26,15,'Trump'),(26,16,'Trump'),(26,17,'Trump'),(26,18,'Trump'),(26,19,'Clinton'),(26,20,'Trump'),(26,21,'Trump'),(26,24,'Trump'),(26,25,'Clinton'),(26,26,'Trump'),(26,27,'Trump'),(26,28,'Clinton'),(27,6,'Trump'),(27,7,'Clinton'),(27,8,'Trump'),(27,9,'Trump'),(27,10,'Clinton'),(27,11,'Clinton'),(27,12,'Trump'),(27,13,'Trump'),(27,14,'Trump'),(27,15,'Trump'),(27,16,'Trump'),(27,17,'Clinton'),(27,18,'Clinton'),(27,19,'Trump'),(27,20,'Clinton'),(27,21,'Trump'),(27,24,'Trump'),(27,25,'Trump'),(27,26,'Clinton'),(27,27,'Clinton'),(27,28,'Trump'),(28,6,'Trump'),(28,7,'Clinton'),(28,8,'Clinton'),(28,9,'Trump'),(28,10,'Clinton'),(28,11,'Clinton'),(28,12,'Trump'),(28,13,'Trump'),(28,14,'Clinton'),(28,15,'Clinton'),(28,16,'Trump'),(28,17,'Clinton'),(28,18,'Trump'),(28,19,'Trump'),(28,20,'Clinton'),(28,21,'Trump'),(28,24,'Clinton'),(28,25,'Clinton'),(28,26,'Trump'),(28,27,'Trump'),(28,28,'Trump'),(29,6,'Trump'),(29,7,'Clinton'),(29,8,'Trump'),(29,9,'Clinton'),(29,10,'Trump'),(29,11,'Trump'),(29,12,'Clinton'),(29,13,'Trump'),(29,14,'Clinton'),(29,15,'Trump'),(29,16,'Trump'),(29,17,'Clinton'),(29,18,'Trump'),(29,19,'Clinton'),(29,20,'Trump'),(29,21,'Trump'),(29,24,'Trump'),(29,25,'Trump'),(29,26,'Clinton'),(29,27,'Trump'),(29,28,'Clinton'),(30,6,'Clinton'),(30,7,'Clinton'),(30,8,'Trump'),(30,9,'Clinton'),(30,10,'Clinton'),(30,11,'Trump'),(30,12,'Trump'),(30,13,'Trump'),(30,14,'Trump'),(30,15,'Clinton'),(30,16,'Clinton'),(30,17,'Clinton'),(30,18,'Trump'),(30,19,'Clinton'),(30,20,'Clinton'),(30,21,'Trump'),(30,24,'Clinton'),(30,25,'Clinton'),(30,26,'Clinton'),(30,27,'Trump'),(30,28,'Clinton'),(31,6,'Clinton'),(31,7,'Clinton'),(31,8,'Trump'),(31,9,'Trump'),(31,10,'Trump'),(31,11,'Clinton'),(31,12,'Trump'),(31,13,'Clinton'),(31,14,'Trump'),(31,15,'Trump'),(31,16,'Clinton'),(31,17,'Trump'),(31,18,'Trump'),(31,19,'Clinton'),(31,20,'Clinton'),(31,21,'Clinton'),(31,24,'Trump'),(31,25,'Clinton'),(31,26,'Clinton'),(31,27,'Clinton'),(31,28,'Trump'),(32,6,'Trump'),(32,7,'Clinton'),(32,8,'Clinton'),(32,9,'Clinton'),(32,10,'Clinton'),(32,11,'Trump'),(32,12,'Trump'),(32,13,'Clinton'),(32,14,'Clinton'),(32,15,'Clinton'),(32,16,'Clinton'),(32,17,'Clinton'),(32,18,'Trump'),(32,19,'Trump'),(32,20,'Clinton'),(32,21,'Clinton'),(32,24,'Clinton'),(32,25,'Trump'),(32,26,'Clinton'),(32,27,'Trump'),(32,28,'Clinton'),(33,6,'Trump'),(33,7,'Clinton'),(33,8,'Clinton'),(33,9,'Clinton'),(33,10,'Trump'),(33,11,'Clinton'),(33,12,'Clinton'),(33,13,'Clinton'),(33,14,'Clinton'),(33,15,'Clinton'),(33,16,'Clinton'),(33,17,'Trump'),(33,18,'Clinton'),(33,19,'Trump'),(33,20,'Trump'),(33,21,'Trump'),(33,24,'Clinton'),(33,25,'Trump'),(33,26,'Clinton'),(33,27,'Trump'),(33,28,'Clinton'),(34,6,'Clinton'),(34,7,'Trump'),(34,8,'Clinton'),(34,9,'Trump'),(34,10,'Trump'),(34,11,'Clinton'),(34,12,'Clinton'),(34,13,'Trump'),(34,14,'Trump'),(34,15,'Trump'),(34,16,'Trump'),(34,17,'Trump'),(34,18,'Clinton'),(34,19,'Clinton'),(34,20,'Trump'),(34,21,'Clinton'),(34,24,'Clinton'),(34,25,'Clinton'),(34,26,'Trump'),(34,27,'Trump'),(34,28,'Trump'),(35,29,'USA'),(35,30,'USA'),(35,31,'USA'),(35,32,'France');
/*!40000 ALTER TABLE `answerer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_info`
--

DROP TABLE IF EXISTS `candidate_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_info` (
  `candidate_ID` int(11) NOT NULL,
  `candidate_name` varchar(45) NOT NULL,
  PRIMARY KEY (`candidate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_info`
--

LOCK TABLES `candidate_info` WRITE;
/*!40000 ALTER TABLE `candidate_info` DISABLE KEYS */;
INSERT INTO `candidate_info` VALUES (1,'Mike'),(2,'Ip Man'),(3,'Clinton'),(4,'Trump'),(5,'USA'),(6,'France');
/*!40000 ALTER TABLE `candidate_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_position`
--

DROP TABLE IF EXISTS `candidate_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_position` (
  `candidate_ID` int(11) NOT NULL,
  `proposition_ID` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  PRIMARY KEY (`candidate_ID`,`proposition_ID`),
  KEY `proposition_ID_fk2_idx` (`proposition_ID`),
  CONSTRAINT `candidate_ID_fk1` FOREIGN KEY (`candidate_ID`) REFERENCES `candidate_info` (`candidate_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proposition_ID_fk2` FOREIGN KEY (`proposition_ID`) REFERENCES `proposition_info` (`proposition_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_position`
--

LOCK TABLES `candidate_position` WRITE;
/*!40000 ALTER TABLE `candidate_position` DISABLE KEYS */;
INSERT INTO `candidate_position` VALUES (1,1,1),(1,2,0),(1,3,1),(1,4,1),(1,5,0),(2,1,0),(2,2,1),(2,3,0),(2,4,0),(2,5,1),(3,6,1),(3,7,0),(3,8,1),(3,9,1),(3,10,0),(3,11,1),(3,12,1),(3,13,1),(3,14,1),(3,15,1),(3,16,1),(3,17,0),(3,18,1),(3,19,1),(3,20,0),(3,21,1),(3,24,1),(3,25,1),(3,26,0),(3,27,1),(3,28,1),(4,6,0),(4,7,1),(4,8,0),(4,9,0),(4,10,1),(4,11,0),(4,12,0),(4,13,0),(4,14,0),(4,15,0),(4,16,0),(4,17,1),(4,18,0),(4,19,0),(4,20,1),(4,21,0),(4,24,0),(4,25,0),(4,26,1),(4,27,0),(4,28,0),(5,29,1),(5,30,0),(5,31,1),(5,32,0),(6,29,0),(6,30,1),(6,31,0),(6,32,1);
/*!40000 ALTER TABLE `candidate_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposition_info`
--

DROP TABLE IF EXISTS `proposition_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposition_info` (
  `proposition_ID` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`proposition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposition_info`
--

LOCK TABLES `proposition_info` WRITE;
/*!40000 ALTER TABLE `proposition_info` DISABLE KEYS */;
INSERT INTO `proposition_info` VALUES (1,'1er prop'),(2,'2eme prop'),(3,'3eme prop'),(4,'4eme prop'),(5,'5eme prop'),(6,'Should Private Prisons Be Allowed in the United States?'),(7,'Should Law Enforcement Be Allowed to Use Racial Profiling?'),(8,'Should Supreme Court Justice Scalia\'s Replacement Be Chosen by President Obama?'),(9,'Should Any Federal Taxes Be Increased?'),(10,'Should Glass-Steagall Be Reinstated?'),(11,'Should Any Public Colleges or Universities Be Tuition-Free?'),(12,'Is the Nuclear Arms Deal with Iran Good for America?'),(13,'Should More Gun Control Laws Be Enacted?'),(14,'Should Abortion Be Legal?'),(15,'Is Obamacare Good for America?'),(16,'Should Planned Parenthood Receive Federal Funding?'),(17,'Should the Federal Government Use Raids to Enforce Immigration Laws?'),(18,'Should Undocumented Immigrants in the United States Be Allowed to Become Legal Residents?'),(19,'Should the United States Allow Syrian Refugees into the Country?'),(20,'Should the United States Send Ground Troops to Fight ISIS?'),(21,'Should the United States Close the Guantanamo Bay Detention Camp?'),(22,'Should the National Security Agency (NSA) Continue to Collect Phone and Email Metadata on US Citizens?'),(23,'Should Interrogation Techniques That Some Consider Torture, Such as Waterboarding, Be a Legal Option?'),(24,'Is Human Activity Primarily Responsible for Global Climate Change?'),(25,'Should Genetically Modified (GMO) Foods Have Mandatory Labeling?'),(26,'Should the United States Authorize the Keystone XL Pipeline to Import Tar Sand Oil from Canada?'),(27,'Should the United States Transition Away from Fossil Fuels and Towards Renewable Energy?'),(28,'Was the US Supreme Court Decision Legalizing Same-Sex Marriage a Good Decision?'),(29,'1)	Should caring weapons be authorized for every citizen ?'),(30,'2)	Should hamburgers be replaced by French baguette?'),(31,'3)	Should people be allowed to drive at 16 years old?'),(32,'4)	Should abortion be legalized in every state ?');
/*!40000 ALTER TABLE `proposition_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnary`
--

DROP TABLE IF EXISTS `questionnary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnary` (
  `proposition_ID` int(11) NOT NULL,
  `questionnary_ID` int(11) NOT NULL,
  PRIMARY KEY (`proposition_ID`,`questionnary_ID`),
  KEY `questionnary_ID_fk1_idx` (`questionnary_ID`),
  KEY `proposition_ID_fk2_idx` (`proposition_ID`),
  KEY `proposition_ID_fk3_idx` (`proposition_ID`),
  CONSTRAINT `proposition_ID_fk3` FOREIGN KEY (`proposition_ID`) REFERENCES `proposition_info` (`proposition_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questionnary_ID_fk1` FOREIGN KEY (`questionnary_ID`) REFERENCES `questionnary_info` (`questionnary_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnary`
--

LOCK TABLES `questionnary` WRITE;
/*!40000 ALTER TABLE `questionnary` DISABLE KEYS */;
INSERT INTO `questionnary` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,3),(30,3),(31,3),(32,3);
/*!40000 ALTER TABLE `questionnary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnary_info`
--

DROP TABLE IF EXISTS `questionnary_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnary_info` (
  `questionnary_ID` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `displayed` int(11) NOT NULL,
  PRIMARY KEY (`questionnary_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnary_info`
--

LOCK TABLES `questionnary_info` WRITE;
/*!40000 ALTER TABLE `questionnary_info` DISABLE KEYS */;
INSERT INTO `questionnary_info` VALUES (1,'premier questionnaire',0),(2,'Clinton vs Trump',0),(3,'USA vs France',1);
/*!40000 ALTER TABLE `questionnary_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 19:16:46
