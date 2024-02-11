-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cashier
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_product_id_idx` (`product_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`idorders`) ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`idproduct_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,2,60);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idorders` int NOT NULL AUTO_INCREMENT,
  `costumer_name` varchar(45) NOT NULL,
  `total` double NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`idorders`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Dhaval',3000,'2024-11-15 00:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_table` (
  `idproduct_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `oum_Id` int NOT NULL,
  `price_per_unit` double NOT NULL,
  PRIMARY KEY (`idproduct_id`),
  UNIQUE KEY `idproduct_id_UNIQUE` (`idproduct_id`),
  KEY `fk_oum_id_idx` (`oum_Id`),
  CONSTRAINT `fk_oum_id` FOREIGN KEY (`oum_Id`) REFERENCES `uom` (`uom_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Blackberry',1,30),(2,'Breadfruit',2,50),(3,'Cantaloupe',2,45),(4,'Cheesecake',2,65),(5,'Chopsticks',1,5),(6,'Clementine',1,50),(7,'Cornflakes',1,54),(8,'Elderberry',1,60);
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `change_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'Toothpaste',30.00,30.00,0.00),(2,'Toothpaste',30.00,30.00,0.00),(3,'Toothpaste',120.00,170.00,50.00),(4,'Bondpaper',60.00,90.00,30.00),(5,'Oil',65.00,78.00,13.00),(6,'Rice',180.00,900.00,720.00),(7,'avocado',120.00,200.00,80.00),(8,'Bear',170.00,200.00,30.00),(9,'Toothpaste',330.00,800.00,470.00),(10,'Toothpaste',30.00,50.00,20.00),(11,'Toothpaste',30.00,30.00,0.00),(12,'Toothpaste',30.00,40.00,10.00),(13,'Toothpaste',30.00,30.00,0.00),(14,'Toothpaste',30.00,30.00,0.00),(15,'Toothpaste',60.00,80.00,20.00),(16,'Oil',370.00,370.00,0.00),(17,'Meat',80.00,80.00,0.00),(18,'Toothpaste',30.00,40.00,10.00),(19,'Toothpaste',30.00,30.00,0.00),(20,'Toothpaste',30.00,30.00,0.00),(21,'Toothpaste',30.00,30.00,0.00),(22,'Toothpaste',30.00,30.00,0.00),(23,'Toothpaste',30.00,30.00,0.00),(24,'Toothpaste',30.00,30.00,0.00),(25,'Toothpaste',30.00,30.00,0.00),(26,'Toothpaste',30.00,30.00,0.00),(27,'Toothpaste',30.00,30.00,0.00),(28,'Toothpaste',30.00,30.00,0.00),(29,'Toothpaste',30.00,30.00,0.00),(30,'Toothpaste',30.00,30.00,0.00),(31,'Toothpaste',30.00,30.00,0.00),(32,'Toothpaste',30.00,30.00,0.00),(33,'Toothpaste',30.00,30.00,0.00),(34,'Toothpaste',30.00,30.00,0.00),(35,'Toothpaste',30.00,30.00,0.00),(36,'Toothpaste',30.00,30.00,0.00),(37,'Toothpaste',30.00,30.00,0.00),(38,'Toothpaste',30.00,30.00,0.00),(39,'Toothpaste',30.00,30.00,0.00),(40,'Toothpaste',30.00,30.00,0.00),(41,'Toothpaste',30.00,30.00,0.00),(42,'Toothpaste',30.00,30.00,0.00),(43,'Toothpaste',30.00,30.00,0.00),(44,'Toothpaste',160.00,500.00,340.00),(45,'Meat',150.00,656.00,506.00),(46,'Chopsticks',195.00,200.00,5.00),(47,'Blackberry',30.00,30.00,0.00),(48,'Blackberry',30.00,30.00,0.00),(49,'Blackberry',30.00,30.00,0.00),(50,'Breadfruit',100.00,100.00,0.00),(51,'Breadfruit',50.00,90.00,40.00),(52,'Blackberry',30.00,40.00,10.00),(53,'Blackberry, Breadfruit',210.00,346.00,136.00),(54,'Blackberry, Blackberry, Blackberry',90.00,90.00,0.00),(55,'Blackberry, Blackberry, Blackberry',90.00,100.00,10.00),(56,'Blackberry, Blackberry',60.00,400.00,340.00),(57,'Blackberry, Blackberry, Blackberry',90.00,100.00,10.00),(58,'Blackberry, Blackberry, Blackberry',90.00,100.00,10.00),(59,'Blackberry, Blackberry, Blackberry',90.00,100.00,10.00),(60,'Breadfruit, Cantaloupe',1040.00,100000.00,98960.00),(61,'Blackberry, Blackberry',60.00,100.00,40.00),(62,'Blackberry, Cornflakes',30486.00,900000.00,869514.00);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom` (
  `uom_id` int NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(45) NOT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (1,'each'),(2,'kg');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cashier'
--

--
-- Dumping routines for database 'cashier'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-11 11:13:51
