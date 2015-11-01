-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `cursuri`
--

DROP TABLE IF EXISTS `cursuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursuri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(100) DEFAULT NULL,
  `ref_profesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_profesor` (`ref_profesor`),
  CONSTRAINT `cursuri_ibfk_1` FOREIGN KEY (`ref_profesor`) REFERENCES `utilizatori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursuri`
--

LOCK TABLES `cursuri` WRITE;
/*!40000 ALTER TABLE `cursuri` DISABLE KEYS */;
INSERT INTO `cursuri` VALUES (1,'curs1',2),(2,'curs2',2);
/*!40000 ALTER TABLE `cursuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numere_matricole`
--

DROP TABLE IF EXISTS `numere_matricole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numere_matricole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_student` int(11) DEFAULT NULL,
  `nr_matricol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nr_matricol` (`nr_matricol`),
  KEY `ref_student` (`ref_student`),
  CONSTRAINT `numere_matricole_ibfk_1` FOREIGN KEY (`ref_student`) REFERENCES `utilizatori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numere_matricole`
--

LOCK TABLES `numere_matricole` WRITE;
/*!40000 ALTER TABLE `numere_matricole` DISABLE KEYS */;
INSERT INTO `numere_matricole` VALUES (1,3,1234),(2,4,5678);
/*!40000 ALTER TABLE `numere_matricole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenti_inscrisi`
--

DROP TABLE IF EXISTS `studenti_inscrisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studenti_inscrisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_student` int(11) DEFAULT NULL,
  `ref_curs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_student` (`ref_student`),
  KEY `ref_curs` (`ref_curs`),
  CONSTRAINT `studenti_inscrisi_ibfk_1` FOREIGN KEY (`ref_student`) REFERENCES `utilizatori` (`id`),
  CONSTRAINT `studenti_inscrisi_ibfk_2` FOREIGN KEY (`ref_curs`) REFERENCES `cursuri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenti_inscrisi`
--

LOCK TABLES `studenti_inscrisi` WRITE;
/*!40000 ALTER TABLE `studenti_inscrisi` DISABLE KEYS */;
INSERT INTO `studenti_inscrisi` VALUES (1,3,1),(2,4,2);
/*!40000 ALTER TABLE `studenti_inscrisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teme`
--

DROP TABLE IF EXISTS `teme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(100) DEFAULT NULL,
  `timp_start` datetime DEFAULT NULL,
  `timp_sfarsit` datetime DEFAULT NULL,
  `ref_curs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_curs` (`ref_curs`),
  CONSTRAINT `teme_ibfk_1` FOREIGN KEY (`ref_curs`) REFERENCES `cursuri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teme`
--

LOCK TABLES `teme` WRITE;
/*!40000 ALTER TABLE `teme` DISABLE KEYS */;
INSERT INTO `teme` VALUES (3,'tema_1','2015-11-01 20:18:26','2015-11-08 20:18:26',1),(4,'tema_2','2015-11-01 20:18:26','2015-11-08 20:18:26',2);
/*!40000 ALTER TABLE `teme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teste`
--

DROP TABLE IF EXISTS `teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(100) DEFAULT NULL,
  `timp_start` datetime DEFAULT NULL,
  `timp_sfarsit` datetime DEFAULT NULL,
  `ref_curs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_curs` (`ref_curs`),
  CONSTRAINT `teste_ibfk_1` FOREIGN KEY (`ref_curs`) REFERENCES `cursuri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teste`
--

LOCK TABLES `teste` WRITE;
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT INTO `teste` VALUES (3,'test_1','2015-11-01 20:18:26','2015-11-08 20:18:26',1),(4,'test_2','2015-11-01 20:18:26','2015-11-08 20:18:26',2);
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizatori`
--

DROP TABLE IF EXISTS `utilizatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilizatori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `parola` varchar(100) DEFAULT NULL,
  `nume` varchar(100) DEFAULT NULL,
  `prenume` varchar(100) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `rol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizatori`
--

LOCK TABLES `utilizatori` WRITE;
/*!40000 ALTER TABLE `utilizatori` DISABLE KEYS */;
INSERT INTO `utilizatori` VALUES (1,'admin','admin','admin','admin','admin@admin.admin','admin'),(2,'prof','prof','prof','prof','prof@cs.ubbcluj.ro','profesor'),(3,'abir1234','student','Ana','Barbu','abir1234@scs.ubbcluj.ro','student'),(4,'paie5678','student','Petru','Ana','paie5678@scs.ubblcuj.ro','student');
/*!40000 ALTER TABLE `utilizatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-01 20:21:58
