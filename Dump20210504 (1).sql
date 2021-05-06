-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: hsp
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billings` (
  `uid` int DEFAULT NULL,
  `billing_day` date DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `billings_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bptests`
--

DROP TABLE IF EXISTS `bptests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bptests` (
  `uid` int DEFAULT NULL,
  `testid` int NOT NULL,
  `systolic_pressure` decimal(10,0) DEFAULT NULL,
  `diastolic_pressure` decimal(10,0) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `bptests_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bptests`
--

LOCK TABLES `bptests` WRITE;
/*!40000 ALTER TABLE `bptests` DISABLE KEYS */;
INSERT INTO `bptests` VALUES (2,1,70,110,'2021-05-04');
/*!40000 ALTER TABLE `bptests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorappointments`
--

DROP TABLE IF EXISTS `doctorappointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctorappointments` (
  `uid` int DEFAULT NULL,
  `docid` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  KEY `docid` (`docid`),
  CONSTRAINT `doctorappointments_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`),
  CONSTRAINT `doctorappointments_ibfk_2` FOREIGN KEY (`docid`) REFERENCES `doctors` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorappointments`
--

LOCK TABLES `doctorappointments` WRITE;
/*!40000 ALTER TABLE `doctorappointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorappointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `did` int NOT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `specialisation` varchar(50) DEFAULT NULL,
  `available_from` time DEFAULT NULL,
  `available_till` time DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `medicine_name` varchar(50) DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `stock_left` int DEFAULT NULL,
  `last_updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription` varchar(200) DEFAULT NULL,
  `docname` varchar(50) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `Day` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `uid` int DEFAULT NULL,
  `request_message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugartests`
--

DROP TABLE IF EXISTS `sugartests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugartests` (
  `uid` int DEFAULT NULL,
  `testid` int NOT NULL,
  `sugar_level` decimal(10,0) DEFAULT NULL,
  `ppsl` decimal(10,0) DEFAULT NULL,
  `insulin_level` decimal(10,0) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `sugartests_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugartests`
--

LOCK TABLES `sugartests` WRITE;
/*!40000 ALTER TABLE `sugartests` DISABLE KEYS */;
INSERT INTO `sugartests` VALUES (1,1,94,120,30,'2021-05-04');
/*!40000 ALTER TABLE `sugartests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testappointments`
--

DROP TABLE IF EXISTS `testappointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testappointments` (
  `uid` int DEFAULT NULL,
  `testname` varchar(50) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `testappointments_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testappointments`
--

LOCK TABLES `testappointments` WRITE;
/*!40000 ALTER TABLE `testappointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `testappointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `mobilenum` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mounika','2344980123','banglore','patient','2345','mounika@gmail.com'),(2,'likitha','9755257611','hyderabad','patient','757635','likitha@gmail.com'),(3,'poojaa','9755752627','andhrapradesh','patient','13245','pooja@gmail.com'),(4,'bhuvana','6328752584','andhrapradesh','patient','9985','bhuvanaa@gmail.com'),(5,'keren','9002132584','gujarat','patient','112234','keren@gmail.com'),(6,'admin','9876543210','indore','admin','admin1234','admin@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine` (
  `uid` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine`
--

LOCK TABLES `vaccine` WRITE;
/*!40000 ALTER TABLE `vaccine` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hsp'
--

--
-- Dumping routines for database 'hsp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-04 15:32:21
