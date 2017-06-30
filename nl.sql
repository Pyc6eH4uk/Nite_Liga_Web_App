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
  `gameId` int(11) NOT NULL,
  `strName` varchar(30) DEFAULT NULL,
  `dtBegin` datetime NOT NULL,
  PRIMARY KEY (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgame`
--

LOCK TABLES `tbgame` WRITE;
/*!40000 ALTER TABLE `tbgame` DISABLE KEYS */;
INSERT INTO `tbgame` VALUES (1,'Start season 9','2017-06-30 19:00:00'),(2,'first tour','2017-07-06 19:00:00');
/*!40000 ALTER TABLE `tbgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbgameact`
--

DROP TABLE IF EXISTS `tbgameact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbgameact` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `teamId` int(11) NOT NULL,
  `tsTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gameId` int(11) NOT NULL,
  PRIMARY KEY (`noteId`),
  KEY `tbgameact_ibfk_1` (`teamId`),
  KEY `tbgameact_ibfk_2` (`taskId`),
  KEY `tbgameact_ibfk_4` (`gameId`),
  CONSTRAINT `tbgameact_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `tbteam` (`teamId`),
  CONSTRAINT `tbgameact_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tbtask` (`taskId`),
  CONSTRAINT `tbgameact_ibfk_3` FOREIGN KEY (`gameId`) REFERENCES `tbgame` (`gameId`),
  CONSTRAINT `tbgameact_ibfk_4` FOREIGN KEY (`gameId`) REFERENCES `tbgame` (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgameact`
--

LOCK TABLES `tbgameact` WRITE;
/*!40000 ALTER TABLE `tbgameact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbgameact` ENABLE KEYS */;
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
  `txtcode` varchar(10) NOT NULL,
  `gameId` int(11) NOT NULL,
  PRIMARY KEY (`taskId`),
  KEY `tbtask_ibfk_1` (`gameId`),
  CONSTRAINT `tbtask_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `tbgame` (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtask`
--

LOCK TABLES `tbtask` WRITE;
/*!40000 ALTER TABLE `tbtask` DISABLE KEYS */;
INSERT INTO `tbtask` VALUES (1,'task_1','hint_1_1','hint_1_2','NL17903X',1),(2,'task_2','hint_2_1','hint_2_2','NL1786P2',1),(3,'task_3','hint_3_1','hint_3_2','NL171Y43',1),(4,'task_4','hint_4_1','hint_4_2','NL17D423',1),(5,'task_5','hint_5_1','hint_5_2','NL176J10',1);
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
INSERT INTO `tbteam` VALUES (1,'team_1'),(2,'team_2'),(3,'team_3');
/*!40000 ALTER TABLE `tbteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuser`
--

DROP TABLE IF EXISTS `tbuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuser` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(60) DEFAULT NULL,
  `teamId` int(11) NOT NULL,
  `strStat` varchar(10) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuser`
--

LOCK TABLES `tbuser` WRITE;
/*!40000 ALTER TABLE `tbuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-30 13:00:36
