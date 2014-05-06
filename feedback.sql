-- MySQL dump 10.13  Distrib 5.5.24, for Win32 (x86)
--
-- Host: localhost    Database: feedback
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fno` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `peer1` int(11) DEFAULT NULL,
  `peer2` int(11) DEFAULT NULL,
  `subcode` varchar(10) DEFAULT NULL,
  `sem1` int(11) DEFAULT NULL,
  `sec1` char(1) DEFAULT NULL,
  `sem2` int(11) DEFAULT NULL,
  `sec2` char(1) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `Title` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`fno`),
  KEY `peer1` (`peer1`),
  KEY `peer2` (`peer2`),
  KEY `subcode` (`subcode`),
  KEY `sem1` (`sem1`,`sec1`),
  KEY `sem2` (`sem2`,`sec2`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`peer1`) REFERENCES `faculty` (`fno`),
  CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`peer2`) REFERENCES `faculty` (`fno`),
  CONSTRAINT `faculty_ibfk_3` FOREIGN KEY (`subcode`) REFERENCES `subject` (`subcode`),
  CONSTRAINT `faculty_ibfk_4` FOREIGN KEY (`sem1`, `sec1`) REFERENCES `section` (`sem_no`, `sec`),
  CONSTRAINT `faculty_ibfk_5` FOREIGN KEY (`sem2`, `sec2`) REFERENCES `section` (`sem_no`, `sec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Shuba Rao V',2,3,'USP',5,'A',NULL,NULL,'1','Mrs.'),(2,'Preetha S',1,3,'DBMS',5,'A',NULL,NULL,'2','Ms.'),(3,'Anita HS',4,5,'OS',5,'A',NULL,NULL,'3','Mrs.'),(4,'Nalini V',3,5,'DC',5,'A',NULL,NULL,'4','Ms.'),(5,'Ashok ',1,4,'JAVA',5,'A',NULL,NULL,'5','Mr.');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `sem_no` int(11) NOT NULL DEFAULT '0',
  `sec` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`sem_no`,`sec`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`sem_no`) REFERENCES `sem` (`sem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (5,'A'),(5,'B');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sem`
--

DROP TABLE IF EXISTS `sem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sem` (
  `sem_no` int(11) NOT NULL,
  PRIMARY KEY (`sem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sem`
--

LOCK TABLES `sem` WRITE;
/*!40000 ALTER TABLE `sem` DISABLE KEYS */;
INSERT INTO `sem` VALUES (5);
/*!40000 ALTER TABLE `sem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `USN` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Sem` int(11) NOT NULL,
  `Sec` char(1) NOT NULL,
  `Y_N` tinyint(1) DEFAULT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`USN`),
  KEY `Sem` (`Sem`,`Sec`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Sem`, `Sec`) REFERENCES `section` (`sem_no`, `sec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1bm11is051','Kiran C',5,'A',0,'1bm11is051'),('1bm11is054','Manish G',5,'A',0,'1bm11is054'),('1bm11is055','Mayur Muralidhar',5,'A',0,'1bm11is055'),('1bm12is411','Pragathi Rani',5,'A',0,'1bm12is411');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subcode` varchar(10) NOT NULL,
  `sname` varchar(10) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  PRIMARY KEY (`subcode`),
  KEY `sem` (`sem`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`sem`) REFERENCES `sem` (`sem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('DBMS','database',5),('DC','data comm',5),('JAVA','java prg',5),('OS','opr sys',5),('USP','unix prg',5);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `tyear` int(11) NOT NULL DEFAULT '0',
  `fno` int(11) NOT NULL DEFAULT '0',
  `subcode` varchar(10) NOT NULL DEFAULT '',
  `sf1` float DEFAULT NULL,
  `sf2` float DEFAULT NULL,
  `sf3` float DEFAULT NULL,
  `pf1` float DEFAULT NULL,
  `pf2` float DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tyear`,`fno`,`subcode`),
  KEY `fno` (`fno`),
  KEY `subcode` (`subcode`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`fno`) REFERENCES `faculty` (`fno`),
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `subject` (`subcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES (2013,1,'USP',39,0,0,0,0,NULL),(2013,2,'DBMS',0,0,0,0,0,NULL),(2013,3,'OS',0,0,0,0,0,NULL),(2013,4,'DC',0,0,0,0,0,NULL),(2013,5,'JAVA',0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-06 18:00:50
