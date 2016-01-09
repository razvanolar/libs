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
  `enrolment_key` varchar(255) NOT NULL DEFAULT '',
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
INSERT INTO `cursuri` VALUES (1,'FP',2,''),(2,'Disciplina2',2,'');
/*!40000 ALTER TABLE `cursuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_teme`
--

DROP TABLE IF EXISTS `note_teme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_teme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_tema` int(11) DEFAULT NULL,
  `ref_student` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_tema` (`ref_tema`),
  KEY `ref_student` (`ref_student`),
  CONSTRAINT `note_teme_ibfk_1` FOREIGN KEY (`ref_tema`) REFERENCES `teme` (`id`),
  CONSTRAINT `note_teme_ibfk_2` FOREIGN KEY (`ref_student`) REFERENCES `utilizatori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_teme`
--

LOCK TABLES `note_teme` WRITE;
/*!40000 ALTER TABLE `note_teme` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_teme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_teste`
--

DROP TABLE IF EXISTS `note_teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_teste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_test` int(11) DEFAULT NULL,
  `ref_student` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_test` (`ref_test`),
  KEY `ref_student` (`ref_student`),
  CONSTRAINT `note_teste_ibfk_1` FOREIGN KEY (`ref_test`) REFERENCES `teste` (`id`),
  CONSTRAINT `note_teste_ibfk_2` FOREIGN KEY (`ref_student`) REFERENCES `utilizatori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_teste`
--

LOCK TABLES `note_teste` WRITE;
/*!40000 ALTER TABLE `note_teste` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_teste` ENABLE KEYS */;
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
-- Table structure for table `roluri`
--

DROP TABLE IF EXISTS `roluri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roluri` (
  `id` int(11) NOT NULL,
  `nume` varchar(127) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roluri`
--

LOCK TABLES `roluri` WRITE;
/*!40000 ALTER TABLE `roluri` DISABLE KEYS */;
INSERT INTO `roluri` VALUES (1,'admin'),(2,'professor'),(3,'user');
/*!40000 ALTER TABLE `roluri` ENABLE KEYS */;
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
  UNIQUE KEY `ref_student` (`ref_student`,`ref_curs`),
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
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  KEY `rol` (`rol`),
  CONSTRAINT `utilizatori_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `roluri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizatori`
--

LOCK TABLES `utilizatori` WRITE;
/*!40000 ALTER TABLE `utilizatori` DISABLE KEYS */;
INSERT INTO `utilizatori` VALUES (1,'admin','admin','admin','admin','admin@admin.admin',1),(2,'prof','prof','prof','prof','prof@cs.ubbcluj.ro',2),(3,'abir1234','student','Ana','Barbu','abir1234@scs.ubbcluj.ro',3),(4,'paie5678','student','Petru','Ana','paie5678@scs.ubblcuj.ro',3),(5,'tkir1000','tkir1000','Tonette','Kallbach','tkir1000@scs.ubbcluj.ro',3),(6,'rdir1001','rdir1001','Rocio','Dunsay','rdir1001@scs.ubbcluj.ro',3),(7,'atir1002','atir1002','Auremily','Tag','atir1002@scs.ubbcluj.ro',3),(8,'bkir1003','bkir1003','Bimalendu','Kacerovsky','bkir1003@scs.ubbcluj.ro',3),(9,'muir1004','muir1004','Milu','Umashankar','muir1004@scs.ubbcluj.ro',3),(10,'dsir1005','dsir1005','Dunja','Siring','dsir1005@scs.ubbcluj.ro',3),(11,'bsir1006','bsir1006','Brendha','Seabrook','bsir1006@scs.ubbcluj.ro',3),(12,'twir1007','twir1007','Tamekichi','Wagrowska','twir1007@scs.ubbcluj.ro',3),(13,'roir1008','roir1008','Rayke','Olatunji','roir1008@scs.ubbcluj.ro',3),(14,'rrir1009','rrir1009','Reera','Roode','rrir1009@scs.ubbcluj.ro',3),(15,'asir1010','asir1010','Atefeh','Shehorn','asir1010@scs.ubbcluj.ro',3),(16,'roir1011','roir1011','Rosalie','Ochipinti','roir1011@scs.ubbcluj.ro',3),(17,'leir1012','leir1012','Lorand','Ebow','leir1012@scs.ubbcluj.ro',3),(18,'llir1013','llir1013','Lance','Lamounier','llir1013@scs.ubbcluj.ro',3),(19,'tmir1014','tmir1014','Tharwat','Mellando','tmir1014@scs.ubbcluj.ro',3),(20,'utir1015','utir1015','Utvick','Tadaki','utir1015@scs.ubbcluj.ro',3),(21,'ylir1016','ylir1016','Yvanne','Lubaggi','ylir1016@scs.ubbcluj.ro',3),(22,'mdir1017','mdir1017','Margareth','Dunduza','mdir1017@scs.ubbcluj.ro',3),(23,'awir1018','awir1018','Aman','Wolszt','awir1018@scs.ubbcluj.ro',3),(24,'slir1019','slir1019','Saidmurad','Lupovitz','slir1019@scs.ubbcluj.ro',3),(25,'bgir1020','bgir1020','Beniko','Gooberman','bgir1020@scs.ubbcluj.ro',3),(26,'vkir1021','vkir1021','Vashti','Kazyk','vkir1021@scs.ubbcluj.ro',3),(27,'jhir1022','jhir1022','Janet','Huse','jhir1022@scs.ubbcluj.ro',3),(28,'kfir1023','kfir1023','Ken','Folnegovic','kfir1023@scs.ubbcluj.ro',3),(29,'sair1024','sair1024','Sabrinah','Akolkar','sair1024@scs.ubbcluj.ro',3),(30,'jdir1025','jdir1025','Jaz','Dzula','jdir1025@scs.ubbcluj.ro',3),(31,'hlir1026','hlir1026','Hasy','Litoff','hlir1026@scs.ubbcluj.ro',3),(32,'tcir1027','tcir1027','Taniqua','Cusanelli','tcir1027@scs.ubbcluj.ro',3),(33,'rair1028','rair1028','Rogez','Aerni','rair1028@scs.ubbcluj.ro',3),(34,'lhir1029','lhir1029','Loviis','Hauben','lhir1029@scs.ubbcluj.ro',3),(35,'vdir1030','vdir1030','Victorina','Didelot','vdir1030@scs.ubbcluj.ro',3),(36,'thir1031','thir1031','Tiernan','Hammoudi','thir1031@scs.ubbcluj.ro',3),(37,'psir1032','psir1032','Pocho','Saller','psir1032@scs.ubbcluj.ro',3),(38,'lmir1033','lmir1033','Lei','Messana','lmir1033@scs.ubbcluj.ro',3),(39,'rwir1034','rwir1034','Rongcai','Widjaya','rwir1034@scs.ubbcluj.ro',3),(40,'shir1035','shir1035','Sundaresan','Hertlova','shir1035@scs.ubbcluj.ro',3),(41,'ssir1036','ssir1036','Seira','Sulley','ssir1036@scs.ubbcluj.ro',3),(42,'tsir1037','tsir1037','Tetris','Sigley','tsir1037@scs.ubbcluj.ro',3),(43,'csir1038','csir1038','Cecila','Staltari','csir1038@scs.ubbcluj.ro',3),(44,'scir1039','scir1039','Sadanand','Coverdale','scir1039@scs.ubbcluj.ro',3),(45,'mhir1040','mhir1040','Monzaemon','Hestor','mhir1040@scs.ubbcluj.ro',3),(46,'anir1041','anir1041','Andor','Noad','anir1041@scs.ubbcluj.ro',3),(47,'nhir1042','nhir1042','Nosrat','Harrie','nhir1042@scs.ubbcluj.ro',3),(48,'lsir1043','lsir1043','Layhoma','Schmich','lsir1043@scs.ubbcluj.ro',3),(49,'dbir1044','dbir1044','Dindo','Bazzell','dbir1044@scs.ubbcluj.ro',3),(50,'cfir1045','cfir1045','Callan','Finnern','cfir1045@scs.ubbcluj.ro',3),(51,'ohir1046','ohir1046','Octavio','Hotmer','ohir1046@scs.ubbcluj.ro',3),(52,'amir1047','amir1047','Abdolali','Matsumaru','amir1047@scs.ubbcluj.ro',3),(53,'etir1048','etir1048','Elektra','Tokmanian','etir1048@scs.ubbcluj.ro',3),(54,'lsir1049','lsir1049','Labelly','Sima','lsir1049@scs.ubbcluj.ro',3),(55,'icir1050','icir1050','Ilieva','Coyault','icir1050@scs.ubbcluj.ro',3),(56,'drir1051','drir1051','Daddy','Rassier','drir1051@scs.ubbcluj.ro',3),(57,'mdir1052','mdir1052','Mirkka','Daluz','mdir1052@scs.ubbcluj.ro',3),(58,'cair1053','cair1053','Cecilley','Anner','cair1053@scs.ubbcluj.ro',3),(59,'kkir1054','kkir1054','Kelci','Kolár','kkir1054@scs.ubbcluj.ro',3),(60,'xmir1055','xmir1055','Xiane','Morineau','xmir1055@scs.ubbcluj.ro',3),(61,'lbir1056','lbir1056','Luddu','Brgman','lbir1056@scs.ubbcluj.ro',3),(62,'svir1057','svir1057','Satine','Veck','svir1057@scs.ubbcluj.ro',3),(63,'akir1058','akir1058','Alush','Konder','akir1058@scs.ubbcluj.ro',3),(64,'dkir1059','dkir1059','Dhan','Kolozsi','dkir1059@scs.ubbcluj.ro',3),(65,'fpir1060','fpir1060','Fengxia','Penley','fpir1060@scs.ubbcluj.ro',3),(66,'vzir1061','vzir1061','Ville','Zaharov','vzir1061@scs.ubbcluj.ro',3),(67,'abir1062','abir1062','Anab','Bovaira','abir1062@scs.ubbcluj.ro',3),(68,'tair1063','tair1063','Tadeh','Adds','tair1063@scs.ubbcluj.ro',3),(69,'ykir1064','ykir1064','Yasuo','Kotaki','ykir1064@scs.ubbcluj.ro',3),(70,'meir1065','meir1065','Melissandre','Enoksen','meir1065@scs.ubbcluj.ro',3),(71,'loir1066','loir1066','Luciavio','Osterop','loir1066@scs.ubbcluj.ro',3),(72,'tvir1067','tvir1067','Tennile','Vesuvio','tvir1067@scs.ubbcluj.ro',3),(73,'mbir1068','mbir1068','Meneca','Brükner','mbir1068@scs.ubbcluj.ro',3),(74,'hsir1069','hsir1069','Helyn','Schnitter','hsir1069@scs.ubbcluj.ro',3),(75,'vmir1070','vmir1070','Viktoriya','Mooijman','vmir1070@scs.ubbcluj.ro',3),(76,'bkir1071','bkir1071','Brody','Kouma','bkir1071@scs.ubbcluj.ro',3),(77,'gcir1072','gcir1072','Gilles','Chandila','gcir1072@scs.ubbcluj.ro',3),(78,'mkir1073','mkir1073','Memo','Kozelov','mkir1073@scs.ubbcluj.ro',3),(79,'kbir1074','kbir1074','Kaitana','Becquelin','kbir1074@scs.ubbcluj.ro',3),(80,'kkir1075','kkir1075','Kibzian','Källén','kkir1075@scs.ubbcluj.ro',3),(81,'mcir1076','mcir1076','Milun','Carriero','mcir1076@scs.ubbcluj.ro',3),(82,'kcir1077','kcir1077','Kutluk','Cattaneo','kcir1077@scs.ubbcluj.ro',3),(83,'bfir1078','bfir1078','Barane','Frattali','bfir1078@scs.ubbcluj.ro',3),(84,'dpir1079','dpir1079','Dey','Parlier','dpir1079@scs.ubbcluj.ro',3),(85,'czir1080','czir1080','Carre','Zwaneveld','czir1080@scs.ubbcluj.ro',3),(86,'mmir1081','mmir1081','Mirte','Medem','mmir1081@scs.ubbcluj.ro',3),(87,'ooir1082','ooir1082','Oles','Orieda','ooir1082@scs.ubbcluj.ro',3),(88,'dwir1083','dwir1083','Drasko','Wajeel','dwir1083@scs.ubbcluj.ro',3),(89,'zbir1084','zbir1084','Zandria','Baadraan','zbir1084@scs.ubbcluj.ro',3),(90,'tfir1085','tfir1085','Toyotake','Frytz','tfir1085@scs.ubbcluj.ro',3),(91,'jbir1086','jbir1086','Jeason','Brazee','jbir1086@scs.ubbcluj.ro',3),(92,'bmir1087','bmir1087','Bhilli','Malmros','bmir1087@scs.ubbcluj.ro',3),(93,'rpir1088','rpir1088','Ranganath','Pelligrino','rpir1088@scs.ubbcluj.ro',3),(94,'tbir1089','tbir1089','Tariq','Balbale','tbir1089@scs.ubbcluj.ro',3),(95,'ecir1090','ecir1090','Erengo','Chipping','ecir1090@scs.ubbcluj.ro',3),(96,'dgir1091','dgir1091','Dylene','Gouvêa','dgir1091@scs.ubbcluj.ro',3),(97,'wgir1092','wgir1092','Wenzhu','Graunke','wgir1092@scs.ubbcluj.ro',3),(98,'skir1093','skir1093','Sahkir','Kiteke','skir1093@scs.ubbcluj.ro',3),(99,'clir1094','clir1094','Col','Linsangan','clir1094@scs.ubbcluj.ro',3),(100,'ssir1095','ssir1095','Shamekqua','Sabanova','ssir1095@scs.ubbcluj.ro',3),(101,'xqir1096','xqir1096','Xi','Qaqish','xqir1096@scs.ubbcluj.ro',3),(102,'jmir1097','jmir1097','Javan','Moutardier','jmir1097@scs.ubbcluj.ro',3),(103,'mnir1098','mnir1098','Miakoda','Novell','mnir1098@scs.ubbcluj.ro',3),(105,'piie1513',NULL,'Paul','Iosif','piie1513@scs.ubbcluj.ro',3);
/*!40000 ALTER TABLE `utilizatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_link`
--

DROP TABLE IF EXISTS `video_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titlu` varchar(100) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `descriere` varchar(1000) DEFAULT NULL,
  `ref_curs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_curs` (`ref_curs`),
  CONSTRAINT `video_link_ibfk_1` FOREIGN KEY (`ref_curs`) REFERENCES `cursuri` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_link`
--

LOCK TABLES `video_link` WRITE;
/*!40000 ALTER TABLE `video_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-30 21:44:06
