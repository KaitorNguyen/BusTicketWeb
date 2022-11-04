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
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plates_UNIQUE` (`license_plates`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Phương Trang',4,'XE01'),(2,'Thành Bưởi',4,'XE02'),(5,'Nhat Doan',45,'XE03');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,4,1,5,'Good','2022-09-01 09:45:46'),(2,4,4,NULL,'Chất lượng phục vụ tốt','2022-10-11 01:36:54'),(3,4,1,NULL,'Chuyến xe đầy đủ tiện nghi','2022-10-11 01:37:03'),(4,4,3,5,'Giá cả hợp lý','2022-10-11 09:49:02'),(5,4,1,NULL,'Chất lượng phục vụ tốt','2022-10-11 09:49:08'),(6,5,2,NULL,'Chuyến đi vui vẻ','2022-10-11 09:49:16'),(7,4,1,NULL,'Tài xế thân thiện','2022-10-11 09:49:27'),(8,5,2,NULL,'Chuyến xe đầy đủ tiện nghi','2022-10-11 09:49:30'),(9,4,1,NULL,'Chuyến đi vui vẻ','2022-10-11 09:50:01'),(10,4,2,NULL,'Thú vị','2022-10-11 09:50:11'),(11,4,1,NULL,'Tuyệt vời','2022-10-12 15:57:32'),(12,5,2,NULL,'Good','2022-10-12 22:23:31'),(13,4,1,NULL,'Giá cả hợp lý','2022-10-13 01:02:13'),(14,4,3,NULL,'Trải nghiệm tốt','2022-10-13 01:02:17'),(15,5,1,NULL,'Like','2022-10-13 01:40:25'),(17,2,12,NULL,'Chuyến xe an toàn','2022-10-28 15:17:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Hồ Chí Minh','Đà Lạt'),(2,'Hà Nội','Hồ Chí Minh'),(3,'Cần Thơ ','Hồ Chí Minh'),(4,'Hồ Chí Minh','Vũng Tàu'),(5,'Hà Nội','Hải Phòng');
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
  PRIMARY KEY (`id`),
  KEY `FK_COACH_idx` (`id_coach`),
  CONSTRAINT `FK_COACH` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'A01'),(2,1,'A02'),(3,1,'A03'),(4,1,'A04'),(5,2,'A01'),(6,2,'A02'),(7,2,'B01'),(8,2,'B02'),(104,5,'A01'),(105,5,'A02'),(106,5,'A03'),(107,5,'A04'),(108,5,'A05'),(109,5,'A06'),(110,5,'A07'),(111,5,'A08'),(112,5,'A09'),(113,5,'A10'),(114,5,'A11'),(115,5,'A12'),(116,5,'A13'),(117,5,'A14'),(118,5,'A15'),(119,5,'A16'),(120,5,'A17'),(121,5,'A18'),(122,5,'A19'),(123,5,'A20'),(124,5,'A21'),(125,5,'A22'),(126,5,'A23'),(127,5,'A24'),(128,5,'A25'),(129,5,'A26'),(130,5,'A27'),(131,5,'A28'),(132,5,'A29'),(133,5,'A30'),(134,5,'A31'),(135,5,'A32'),(136,5,'A33'),(137,5,'A34'),(138,5,'A35'),(139,5,'A36'),(140,5,'A37'),(141,5,'A38'),(142,5,'A39'),(143,5,'A40'),(144,5,'A41'),(145,5,'A42'),(146,5,'A43'),(147,5,'A44'),(148,5,'A45');
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
  `id_user_login` int DEFAULT NULL,
  `id_customer_new` int NOT NULL,
  `id_trip` int NOT NULL,
  `book_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_content` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_ticket` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TICKET_EMPLOYEE_idx` (`id_user_login`),
  KEY `FK_TICKET_CUSTOMER_idx` (`id_customer_new`),
  KEY `FK_TICKET_TRIP_idx` (`id_trip`),
  CONSTRAINT `FK_TICKET_CUSTOMER` FOREIGN KEY (`id_customer_new`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TICKET_EMPLOYEE` FOREIGN KEY (`id_user_login`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TICKET_TRIP` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,9,12,'2022-11-01 15:27:00','Trực tiếp','2022-11-01 15:39:00',NULL,'Ðã thanh toán'),(2,2,10,11,'2022-11-01 15:41:00','MoMo','2022-11-01 15:41:00',NULL,'Ðã thanh toán'),(3,4,11,10,'2022-11-01 16:50:00','MoMo','2022-11-01 16:50:00',NULL,'Ðã thanh toán'),(4,4,12,9,'2022-11-01 17:53:00','Trực tiếp',NULL,NULL,'Chưa thanh toán');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_detail`
--

DROP TABLE IF EXISTS `ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_detail` (
  `id_ticket_detail` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_seat` int NOT NULL,
  `price_seat` decimal(10,0) DEFAULT NULL,
  `status_seat` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_ticket_detail`),
  KEY `FK_TICKET_idx` (`id_ticket`),
  KEY `FK_TICKET_SEAT_idx` (`id_seat`),
  CONSTRAINT `FK_TICKET` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`),
  CONSTRAINT `FK_TICKET_SEAT` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_detail`
--

LOCK TABLES `ticket_detail` WRITE;
/*!40000 ALTER TABLE `ticket_detail` DISABLE KEYS */;
INSERT INTO `ticket_detail` VALUES (1,1,105,150000,1),(2,1,104,150000,1),(3,2,7,0,1),(4,3,7,100000,1),(5,3,6,100000,1),(6,3,5,100000,1),(7,4,1,10000,1);
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
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'Hồ Chí Minh - Đà Lạt','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-09-01 10:30:00',300000,3,1,1),(2,'Hà Nội - Hồ Chí Minh','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-09-02 09:30:00',500000,3,2,2),(3,'Hồ Chí Minh - Đà Lạt','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-10-28 00:35:00',50000,3,1,1),(4,'Nha Trang - Đà Lạt','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-10-29 00:36:00',100000,3,2,1),(5,'Hồ Chí Minh - Hà Nội','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-12-01 00:36:00',5000000,3,2,2),(6,'Hà Nội - Hải Phòng','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-05 00:42:00',20000,3,2,5),(7,'Cần Thơ - Hồ Chí Minh','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-10 00:42:00',50000,3,2,3),(8,'Hồ Chí Minh - Vũng Tàu','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-30 00:43:00',250000,3,2,4),(9,'Vùng Tàu - Hồ Chí Minh','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-08 00:43:00',10000,3,1,4),(10,'Hà Nội - Hải Phòng','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-16 00:44:00',100000,3,2,5),(11,'Hải Phòng - Hà Nội','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-12-31 00:44:00',250000,3,2,5),(12,'Hồ Chí Minh - Vũng Tàu','https://res.cloudinary.com/doe6rzwse/image/upload/v1661163654/busApp/hn-hcm_j9jqmm.jpg','2022-11-24 16:45:00',150000,3,5,4);
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
  `birthday` datetime DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Nam','2022-09-01 00:00:00','HCM','012345678','admin@gmail.com','admin','$2a$10$lXGZX6Bt8HXqtnh33YQwoOtjRE8tTOoV43sPFujYn1wGDiN6NSMny','https://res.cloudinary.com/doe6rzwse/image/upload/v1663062934/rywurihjjegsyms1zew3.jpg',_binary '','ROLE_ADMIN'),(2,'Lisa','Nu','2022-09-01 00:00:00','Korea','012345678','lisa@gmail.com','lisa','$2a$10$qwCBLYE7O7vTpVgHNVX94eqUOIZB6R8qo3Z7VnhCWD3y6GUlNUMtO','https://res.cloudinary.com/doe6rzwse/image/upload/v1663063109/jti0egeiqudta0n3uzw1.jpg',_binary '','ROLE_EMPLOYEE'),(3,'Ken','Nam','2022-09-01 00:00:00','HCM','012345678','ken@gmail.com','ken','$2a$10$pJ6FlNYUa4aGg2uHAskBh.R8KA79KUXxDLYqKeH22Hu/IJzOdBgYO','https://res.cloudinary.com/doe6rzwse/image/upload/v1663063156/nwjocqebxwkj4ywjnez5.jpg',_binary '','ROLE_DRIVER'),(4,'Doraemon','Nam','2022-09-01 00:00:00','Japan','012345678','doraemon@gmail.com','doraemon','$2a$10$EOAdD7325jZCvFtCRPEHiOxBdPtQHdAzeqdhHNqyuQBrg3DCTf0Ae','https://res.cloudinary.com/doe6rzwse/image/upload/v1663063218/hwx1guneigppuhpx5ieu.jpg',_binary '','ROLE_CUSTOMER'),(5,'Shizuka','Nu','2022-09-01 00:00:00','Japan','012345678','shizuka@gmail.com','shizuka','$2a$10$MxOv.yLhC6h6TBk7BsdBWOiTua6cETD.IPlvux.9E8L9mpQs93Pxq','https://res.cloudinary.com/doe6rzwse/image/upload/v1663063283/noomryxlgzblxehhqwia.jpg',_binary '','ROLE_CUSTOMER'),(9,'Kim','Nu',NULL,'HCM','012345678','kim@gmail.com',NULL,NULL,NULL,NULL,NULL),(10,'Nam','Nam',NULL,'HCM','012345678','nam@gmail.com',NULL,NULL,NULL,NULL,NULL),(11,'Doraemon','Nam',NULL,'Japan','012345678','doraemon@gmail.com',NULL,NULL,NULL,NULL,NULL),(12,'Doraemon','Nam',NULL,'Japan','012345678','doraemon@gmail.com',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2022-11-04 18:18:59
