-- MySQL dump 10.13  Distrib 5.1.39, for Win32 (ia32)
--
-- Host: localhost    Database: itrs
-- ------------------------------------------------------
-- Server version	5.1.39-community

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
-- Table structure for table `comprequest`
--
DROP DATABASE IF EXISTS itrs;
CREATE DATABASE ITRS;
USE ITRS;

DROP TABLE IF EXISTS `comprequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprequest` (
  `COMP_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ACCTNUM` int(6) NOT NULL,
  `DEP_NUM` int(11) NOT NULL,
  `GAME_NUM` int(11) NOT NULL,
  `SEC_NUM` int(11) NOT NULL,
  `COMP_REQ_SEATS` int(11) NOT NULL,
  `COMP_RECIPIENT` varchar(30) NOT NULL,
  `COMP_PURPOSE` text,
  `COMP_ACT_SEATS` int(11) DEFAULT NULL,
  `COMP_LOC_NA` tinyint(1) NOT NULL DEFAULT '0',
  `COMP_TOI` tinyint(1) NOT NULL DEFAULT '0',
  `COMP_STATUS` tinyint(4) NOT NULL DEFAULT '0',
  `COMP_SUBMIT_DATE` date NOT NULL,
  `COMP_APPROVAL_DATE` date DEFAULT NULL,
  `COMP_PURCHASE_DATE` date DEFAULT NULL,
  `COMP_DENY_REASON` text,
  PRIMARY KEY (`COMP_NUM`),
  UNIQUE KEY `COMP_NUM` (`COMP_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprequest`
--

LOCK TABLES `comprequest` WRITE;
/*!40000 ALTER TABLE `comprequest` DISABLE KEYS */;
INSERT INTO `comprequest` VALUES 
(1,100004,5,16,3,2,'Jimmy Dean','sausages',0,0,0,0,'2009-10-01',NULL,NULL,NULL),(2,100002,2,61,10,1,'Paula Deen','butter',1,0,0,6,'2009-10-02','2009-10-03','2009-10-04',NULL),(3,100001,1,37,1,5,'James Dean','without a cause',4,0,0,5,'2009-10-03','2009-10-04','2009-10-05',NULL),(4,100003,4,51,12,2,'Dean Martin','music',0,0,0,1,'2009-10-05','2009-10-06',NULL,'he died');
/*!40000 ALTER TABLE `comprequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DEP_NUM` int(11) NOT NULL,
  `DEP_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`DEP_NUM`),
  UNIQUE KEY `DEP_NUM` (`DEP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Accounting'),(2,'Finance'),(3,'Baseball Operations'),(4,'Public Relations'),(5,'Housekeeping'),(6,'Maintenance'),(7,'Players');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EMP_ACCTNUM` int(6) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_LNAME` varchar(25) NOT NULL,
  `EMP_PSWD` varchar(20) NOT NULL,
  `EMP_TP` tinyint(1) NOT NULL,
  `EMP_VPOA` tinyint(1) NOT NULL,
  `EMP_ADMIN` tinyint(1) NOT NULL,
  PRIMARY KEY (`EMP_ACCTNUM`),
  UNIQUE KEY `EMP_ACCTNUM` (`EMP_ACCTNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100000,'Admin','Admin','adminpass',0,0,1),(100001,'John','Doe','password',0,0,0),(100002,'Bill','Test','pass2',1,0,0),(100003,'Don','Quixote','windmill',0,1,0),(100004,'Roger','Moore','bond007',1,1,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `GAME_NUM` int(11) NOT NULL,
  `GAME_DATE` date NOT NULL,
  `GAME_OPPONENT` varchar(15) NOT NULL,
  `GAME_SOLDOUT` tinyint(1) NOT NULL,
  PRIMARY KEY (`GAME_NUM`),
  UNIQUE KEY `GAME_NUM` (`GAME_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'2010-04-12','Astros',0),(2,'2010-04-14','Astros',0),(3,'2010-04-15','Astros',0),(4,'2010-04-16','Mets',0),(5,'2010-04-17','Mets',0),(6,'2010-04-18','Mets',0),(7,'2010-04-26','Braves',0),(8,'2010-04-27','Braves',0),(9,'2010-04-28','Braves',0),(10,'2010-04-29','Braves',0),(11,'2010-04-30','Reds',0),(12,'2010-05-01','Reds',0),(13,'2010-05-02','Reds',0),(14,'2010-05-11','Astros',0),(15,'2010-05-12','Astros',0),(16,'2010-05-13','Astros',0),(17,'2010-05-17','Nationals',0),(18,'2010-05-18','Nationals',0),(19,'2010-05-19','Marlins',0),(20,'2010-05-20','Marlins',0),(21,'2010-05-21','Angels',0),(22,'2010-05-22','Angels',0),(23,'2010-05-23','Angels',0),(24,'2010-05-31','Reds',0),(25,'2010-06-01','Reds',0),(26,'2010-06-02','Reds',0),(27,'2010-06-04','Brewers',0),(28,'2010-06-05','Brewers',0),(29,'2010-06-06','Brewers',0),(30,'2010-06-15','Mariners',0),(31,'2010-06-16','Mariners',0),(32,'2010-06-17','Mariners',0),(33,'2010-06-18','Athletics',0),(34,'2010-06-19','Athletics',0),(35,'2010-06-20','Athletics',0),(36,'2010-06-28','Diamondbacks',0),(37,'2010-06-29','Diamondbacks',0),(38,'2010-06-30','Diamondbacks',0),(39,'2010-07-01','Brewers',0),(40,'2010-07-02','Brewers',0),(41,'2010-07-03','Brewers',0),(42,'2010-07-04','Brewers',0),(43,'2010-07-15','Dodgers',0),(44,'2010-07-16','Dodgers',0),(45,'2010-07-17','Dodgers',0),(46,'2010-07-18','Dodgers',0),(47,'2010-07-19','Phillies',0),(48,'2010-07-20','Phillies',0),(49,'2010-07-21','Phillies',0),(50,'2010-07-22','Phillies',0),(51,'2010-07-30','Pirates',0),(52,'2010-07-31','Pirates',0),(53,'2010-08-01','Pirates',0),(54,'2010-08-02','Astros',0),(55,'2010-08-03','Astros',0),(56,'2010-08-04','Astros',0),(57,'2010-08-13','Cubs',0),(58,'2010-08-14','Cubs',0),(59,'2010-08-15','Cubs',0),(60,'2010-08-17','Brewers',0),(61,'2010-08-18','Brewers',0),(62,'2010-08-20','Giants',0),(63,'2010-08-21','Giants',0),(64,'2010-08-22','Giants',0),(65,'2010-09-03','Reds',0),(66,'2010-09-04','Reds',0),(67,'2010-09-05','Reds',0),(68,'2010-09-13','Cubs',0),(69,'2010-09-14','Cubs',0),(70,'2010-09-15','Cubs',0),(71,'2010-09-16','Padres',0),(72,'2010-09-17','Padres',0),(73,'2010-09-18','Padres',0),(74,'2010-09-19','Padres',0),(75,'2010-09-27','Pirates',0),(76,'2009-09-28','Pirates',0),(77,'2009-09-29','Pirates',0),(78,'2009-09-30','Rockies',0),(79,'2010-10-01','Rockies',0),(80,'2010-10-02','Rockies',0),(81,'2010-10-03','Rockies',0);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paidrequest`
--

DROP TABLE IF EXISTS `paidrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paidrequest` (
  `PAID_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ACCTNUM` int(6) NOT NULL,
  `DEP_NUM` int(11) NOT NULL,
  `GAME_NUM` int(11) NOT NULL,
  `SEC_NUM` int(11) NOT NULL,
  `PAID_REQ_SEATS` int(11) NOT NULL,
  `PAID_ACT_SEATS` int(11) DEFAULT NULL,
  `PAID_AMTDUE` int(11) NOT NULL,
  `PAID_LOC_NA` tinyint(1) NOT NULL DEFAULT '0',
  `PAID_TOI` tinyint(1) NOT NULL DEFAULT '0',
  `PAID_CC_TYPE` enum('American Express','Master Card','Visa','Discover') NOT NULL,
  `PAID_CC_NUM` varchar(16) NOT NULL,
  `PAID_CC_SECNUM` varchar(4) NOT NULL,
  `PAID_CC_EXPIR` varchar(4) NOT NULL,
  `PAID_RECIPIENT` varchar(25),
  `PAID_STATUS` tinyint(4) NOT NULL DEFAULT '0',
  `PAID_SUBMIT_DATE` date NOT NULL,
  `PAID_PURCHASE_DATE` date DEFAULT NULL,
  `PAID_DENY_REASON` text,
  PRIMARY KEY (`PAID_NUM`),
  UNIQUE KEY `PAID_NUM` (`PAID_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paidrequest`
--

LOCK TABLES `paidrequest` WRITE;
/*!40000 ALTER TABLE `paidrequest` DISABLE KEYS */;
INSERT INTO `paidrequest` VALUES 
(1,100004,3,20,1,3,3,72,0,0,'Master Card','4443132122224444','315','1011',NULL,4,'2009-08-03','2010-10-01',NULL),
(2,100002,1,21,3,1,NULL,0,0,0,'American Express','4423154832564521','215','1112',NULL,0,'2009-10-04',NULL,NULL),
(3,100001,5,70,16,2,NULL,0,0,0,'American Express','9514823475198523','147','1211',NULL,0,'2009-09-03',NULL,NULL),
(4,100002,5,71,16,2,NULL,0,0,0,'American Express','9514823475198523','147','1211',NULL,0,'2009-09-03',NULL,NULL),
(5,100003,5,72,16,2,NULL,0,0,0,'American Express','9514823475198523','147','1211',NULL,0,'2009-09-03',NULL,NULL);
/*!40000 ALTER TABLE `paidrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seating`
--

DROP TABLE IF EXISTS `seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seating` (
  `SEC_NUM` int(11) NOT NULL,
  `SEC_NAME` varchar(30) NOT NULL,
  `SEC_PRICE` int(11) NOT NULL,
  `SEC_PRICE_PREM` int(11) NOT NULL,
  PRIMARY KEY (`SEC_NUM`),
  UNIQUE KEY `SEC_NUM` (`SEC_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating`
--

LOCK TABLES `seating` WRITE;
/*!40000 ALTER TABLE `seating` DISABLE KEYS */;
INSERT INTO `seating` VALUES (1,'Outfield Terrace Reserved',16,21),(2,'Standing Room',16,21),(3,'Pavillion Reserved',20,25),(4,'Bleachers',22,27),(5,'Infield Terrace Reserved',25,30),(6,'Outfield Terrace Box',27,32),(7,'Pavillion Box',27,32),(8,'Infield Terrace Box',32,37),(9,'Outfield Loge Box',34,39),(10,'1st & 3rd Base Loge Box',38,43),(11,'Outfield Field Box',39,44),(12,'Casino Queen Porch',42,47),(13,'Infield Redbird Club',55,65),(14,'Home Redbird Club',60,70),(15,'1st & 3rd Base Field Box',60,70),(16,'Homer\'s Landing',69,89),(17,'Leftfield Landing',69,89),(18,'Dugout Box',80,90),(19,'Coca-Cola Areas',88,108),(20,'Infield Box',89,99),(21,'Legends Club',98,118),(22,'Bank of America Club',98,118),(23,'Diamond Box',105,115),(24,'Champions Club',125,145),(25,'Commisioner\'s Box',200,200),(26,'Cardinal\'s Club',250,250);
/*!40000 ALTER TABLE `seating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-22 20:52:33
