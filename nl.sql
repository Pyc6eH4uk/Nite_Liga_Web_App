-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: nl
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `tbgame`
--

DROP TABLE IF EXISTS `tbgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbgame` (
  `noteId` int(11) NOT NULL,
  `taskId` int(11) DEFAULT NULL,
  `teamId` int(11) DEFAULT NULL,
  `tsTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`noteId`),
  KEY `taskId` (`taskId`),
  KEY `teamId` (`teamId`),
  CONSTRAINT `tbgame_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `tbteam` (`teamId`),
  CONSTRAINT `tbgame_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tbtask` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgame`
--

LOCK TABLES `tbgame` WRITE;
/*!40000 ALTER TABLE `tbgame` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbgamer`
--

DROP TABLE IF EXISTS `tbgamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbgamer` (
  `gamer_id` int(11) NOT NULL,
  `strName` varchar(60) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`gamer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgamer`
--

LOCK TABLES `tbgamer` WRITE;
/*!40000 ALTER TABLE `tbgamer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbgamer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtask`
--

DROP TABLE IF EXISTS `tbtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbtask` (
  `taskId` int(11) NOT NULL,
  `txtask` text,
  `txthint_1` text,
  `txthint_2` text,
  PRIMARY KEY (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtask`
--

LOCK TABLES `tbtask` WRITE;
/*!40000 ALTER TABLE `tbtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbteam`
--

DROP TABLE IF EXISTS `tbteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbteam` (
  `teamId` int(11) NOT NULL,
  `strTeam` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbteam`
--

LOCK TABLES `tbteam` WRITE;
/*!40000 ALTER TABLE `tbteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbteam` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27 17:08:11
