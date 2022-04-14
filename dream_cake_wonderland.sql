-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(45) DEFAULT NULL,
  `address_line_2` varchar(45) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1fa36y2oqhao3wgg2rw1pi459` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'200, basil tower, Lokeshnagar','swarget','pune','india','415511','maharashtra ',4);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrynrwuqbpdheocivcmp9itsxi` (`customer_id`),
  KEY `FKpu4bcbluhsxagirmbdn7dilm5` (`product_id`),
  CONSTRAINT `FKpu4bcbluhsxagirmbdn7dilm5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrynrwuqbpdheocivcmp9itsxi` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Customize Cake\'s ','ACTIVE'),(2,'Cakes','ACTIVE'),(8,'Confectionary item\'s','ACTIVE'),(9,'Decoration Item\'s','ACTIVE');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,400,1,1,3),(2,500,1,1,4),(3,500,1,2,4),(4,400,1,2,3),(5,450,1,2,2),(6,400,1,3,3),(7,150,1,4,18),(8,50,1,4,15),(9,350,1,4,1),(10,350,1,5,1),(11,450,1,5,2),(12,50,5,6,15),(13,100,4,6,17),(14,450,3,6,2),(15,400,3,6,3),(16,300,1,7,16),(17,150,3,7,18),(18,400,1,7,3),(19,500,1,7,4);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` varchar(25) DEFAULT NULL,
  `status_update_date` datetime(6) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customer_id` int NOT NULL,
  `delivery_address_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsjfs85qf6vmcurlx43cnc16gy` (`customer_id`),
  KEY `FK3s2t83m5ddty3rgomn94d4ht6` (`delivery_address_id`),
  KEY `FKgd67qo7p9pvyabrt03jamvni5` (`employee_id`),
  CONSTRAINT `FK3s2t83m5ddty3rgomn94d4ht6` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `FKgd67qo7p9pvyabrt03jamvni5` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsjfs85qf6vmcurlx43cnc16gy` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-04-04 21:17:55.567448','DELIVERED','2022-04-05 06:56:21.348630',900,4,1,7),(2,'2022-04-05 06:44:59.986711','DELIVERED','2022-04-05 06:59:02.140175',1350,4,1,7),(3,'2022-04-05 06:45:50.634125','DELIVERED','2022-04-05 10:07:30.053941',400,4,1,7),(4,'2022-04-05 10:03:17.541562','DELIVERED','2022-04-05 10:14:57.354575',550,4,1,7),(5,'2022-04-05 10:03:51.408052','DELIVERED','2022-04-05 20:42:00.658935',800,4,1,7),(6,'2022-04-05 20:37:02.029722','DELIVERED','2022-04-07 11:15:17.783710',3200,4,1,7),(7,'2022-04-07 11:12:07.765729','DELIVERED','2022-04-07 11:22:02.560458',1650,4,1,7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `type` varchar(12) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK81gagumt0r8y3rmudcgpbk42l` (`order_id`),
  CONSTRAINT `FK81gagumt0r8y3rmudcgpbk42l` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,925,'2022-04-04 21:17:55.582116','COMPLETED','NETBANKING',1),(2,1375,'2022-04-05 06:45:00.009634','COMPLETED','COD',2),(3,425,'2022-04-05 06:45:50.637021','COMPLETED','UPI',3),(4,575,'2022-04-05 10:03:17.554533','COMPLETED','UPI',4),(5,825,'2022-04-05 10:03:51.412433','COMPLETED','NETBANKING',5),(6,3225,'2022-04-05 20:37:02.054492','COMPLETED','UPI',6),(7,1675,'2022-04-07 11:12:07.793339','COMPLETED','NETBANKING',7);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `image_name` varchar(40) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dark chocolate truffle cake with chocolate sponge inside','ck1.jpg','chocolate cake',350,'ACTIVE',2),(2,' Rich cake made by using traditional Indian sweet rasmalai. ','ck9.jpg','Rasmalai cake',450,'ACTIVE',2),(3,'Fruitcake with butterscotch toppings','ck6.jpg','Fruit cake',400,'ACTIVE',2),(4,'a chocolate shell stuffed with a delicious chocolate pinata cake','ck12.jpg','Round Penata cake',500,'ACTIVE',2),(15,'chocolate pastry','chocolate_pastry.jpg','chocolate pastry',50,'ACTIVE',8),(16,'ferrero_rocher','ferrero_rocher.jpg','ferrero_rocher chocolates',300,'ACTIVE',8),(17,'anniversary_flowers','anniversary_flowers.jpg','anniversary_flowers',100,'ACTIVE',9),(18,'metallic_baloons.','metallic_baloons.jpg','metallic_baloons.',150,'ACTIVE',9),(22,'crunchy delicious waffels_cookies','waffels_cookies.jpg','waffels_cookies',100,'ACTIVE',8),(23,'chocolate_cupcake.','chocolate_cupcake.jpg','chocolate_cupcake.',50,'ACTIVE',8),(24,'birthday_caps','birthday_caps.jpg','birthday_caps',10,'ACTIVE',9),(25,'flower buffet. with colorful roses','flower buffet.jpg','flower buffet.',100,'ACTIVE',9);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `FKeuiihog7wq4cu7nvqu7jx57d2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,18,'kg'),(2,10,'kg'),(3,18,'kg'),(4,7,'kg'),(15,14,'pc'),(16,9,'pkt'),(17,96,'pc'),(18,96,'pkt'),(22,100,'pkt'),(23,100,'pc'),(24,10,'pc'),(25,10,'pc');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','priyanka','kenjale','admin123','8877665544','ADMIN'),(2,'choice@gmail.com','customize choice','Neha Kadam','choice','6677889956','EMPLOYEE'),(3,'rohan@gmail.com','Rohan','Jadhav ','rohan','9988776655','DELIVERY_PERSON'),(4,'trupti@gmail.com','Trupti','kadam','trupti','8899776655','CUSTOMER'),(5,'monginies@gmail.com','Monginies ','Akshay shelar','monginies','6789578978','EMPLOYEE'),(6,'golden@gmail.com','Golden bakery','Suhas Mane','golden','776558899','EMPLOYEE'),(7,'sagar@gmail.com','Sagar ','Chavan','sagar','8989898989','DELIVERY_PERSON'),(8,'royal@gmail.com','Royal Bakery','pooja jadhav','royal','9988776655','EMPLOYEE');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14  8:32:47
