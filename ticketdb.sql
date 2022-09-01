-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ticketdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalseat` int NOT NULL,
  `license_plates` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Phương Trang',40,'XE01'),(2,'Thành Bưởi',40,'XE02');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `id_trip` int NOT NULL,
  `rate` int DEFAULT NULL,
  `comment` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_FEEDBACK_CUSTOMER_idx` (`id_customer`),
  KEY `FK_FEEDBACK_TRIP_idx` (`id_trip`),
  CONSTRAINT `FK_FEEDBACK_CUSTOMER` FOREIGN KEY (`id_customer`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_FEEDBACK_TRIP` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,4,1,5,'Good','2022-09-01 09:45:46');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Hồ Chí Minh','Đà Lạt'),(2,'Hà Nội','Hồ Chí Minh');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_coach` int NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_COACH_idx` (`id_coach`),
  CONSTRAINT `FK_COACH` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'A01',NULL),(2,1,'A02',NULL),(3,1,'A03',NULL),(4,1,'A04',NULL),(5,2,'A01',NULL),(6,2,'A02',NULL),(7,2,'B01',NULL),(8,2,'B02',NULL);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_employee` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_trip` int NOT NULL,
  `book_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_money` decimal(10,0) DEFAULT NULL,
  `payment_method` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_content` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TICKET_EMPLOYEE_idx` (`id_employee`),
  KEY `FK_TICKET_CUSTOMER_idx` (`id_customer`),
  KEY `FK_TICKET_TRIP_idx` (`id_trip`),
  CONSTRAINT `FK_TICKET_CUSTOMER` FOREIGN KEY (`id_customer`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TICKET_EMPLOYEE` FOREIGN KEY (`id_employee`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TICKET_TRIP` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'HCM-DL',2,4,1,'2022-09-01 09:41:38',600000,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_detail`
--

DROP TABLE IF EXISTS `ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_seat` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_seat_UNIQUE` (`id_seat`),
  KEY `FK_TICKET_idx` (`id_ticket`),
  KEY `FK_TICKET_SEAT_idx` (`id_seat`),
  CONSTRAINT `FK_TICKET` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`),
  CONSTRAINT `FK_TICKET_SEAT` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_detail`
--

LOCK TABLES `ticket_detail` WRITE;
/*!40000 ALTER TABLE `ticket_detail` DISABLE KEYS */;
INSERT INTO `ticket_detail` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `ticket_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_driver` int NOT NULL,
  `id_coach` int NOT NULL,
  `id_route` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TRIP_USER_idx` (`id_driver`),
  KEY `FK_TRIP_COACH_idx` (`id_coach`),
  KEY `FK_TRIP_ROUTE_idx` (`id_route`),
  CONSTRAINT `FK_TRIP_COACH` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id`),
  CONSTRAINT `FK_TRIP_ROUTE` FOREIGN KEY (`id_route`) REFERENCES `route` (`id`),
  CONSTRAINT `FK_TRIP_USER` FOREIGN KEY (`id_driver`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'Hồ Chí Minh - Đà Lạt','https://res.cloudinary.com/doe6rzwse/image/upload/v1661425068/busApp/hcm-dalat_qncrqy.jpg','2022-09-01 10:30:00',300000,3,1,1),(2,'Hà Nội - Hồ Chí Minh','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-09-02 09:30:00',500000,3,2,2);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ADMIN','Nam','2022-09-01','BL','012345678','admin@gmail.com','admin','$2a$10$LAY192m..3/a//XJ0f6uHuGlFgOH2dMlnmvlD5gnAshBU/mL3FnAW','https://res.cloudinary.com/doe6rzwse/image/upload/v1661998778/dcxpl1mmkd5gc9irwei0.jpg',NULL,'ROLE_ADMIN'),(2,'Ken','Nam','2022-09-01','HCM','012345678','ken@gmail.com','ken','$2a$10$ZSREOOfn1rq1jR8o3ULYWeKnKmmIoGCxsir3AeyYMi9dOIN6wpHLK','https://res.cloudinary.com/doe6rzwse/image/upload/v1661998928/oalplbnegwo9owd90ltd.jpg',NULL,'ROLE_EMPLOYEE'),(3,'Lisa','Nu','2022-09-01','Korea','012345678','lisa@gmail.com','lisa','$2a$10$yHSKwFytbW5VTe/T/ovvQeHJ9RqxGoa1oOj43qxEWojn6gydiK2Li','https://res.cloudinary.com/doe6rzwse/image/upload/v1661999049/iucymtohuk4eetk08h1c.jpg',NULL,'ROLE_DRIVER'),(4,'Doraemon','Nam','2022-09-01','Japan','012345678','doraemon@gmail.com','doraemon','$2a$10$8FGV7vlPNJy0CsZ3HK5hqu8Qxr4gytuEpneenLT5Jiv4fBhBXJytC','https://res.cloudinary.com/doe6rzwse/image/upload/v1661999229/ah2shyg10bnpm4loob8w.jpg',NULL,'ROLE_CUSTOMER'),(5,'Shizuka','Nu','2022-09-01','Japan','012345678','shizuka@gmail.com','shizuka','$2a$10$xTSrCNQSIbQrq9Cw5bwat.k/.CkLw1YFSGQrSRe0fuuzQ9K3P.Jfu','https://res.cloudinary.com/doe6rzwse/image/upload/v1662000773/bjd6vhulljlpgpyy2kpk.jpg',NULL,'ROLE_CUSTOMER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-01 10:04:04
