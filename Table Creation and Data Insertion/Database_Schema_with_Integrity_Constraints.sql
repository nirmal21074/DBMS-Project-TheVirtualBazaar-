CREATE DATABASE  IF NOT EXISTS `dbmsproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbmsproject`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmsproject
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_Product_ID` int NOT NULL,
  `Cart_Customer_ID` int NOT NULL,
  KEY `Cart_Product_ID` (`Cart_Product_ID`),
  KEY `Cart_Customer_ID` (`Cart_Customer_ID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Cart_Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Cart_Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Category_ID`),
  KEY `cat_name_index` (`Category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int NOT NULL,
  `Street_number` int NOT NULL,
  `District` varchar(50) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Pincode` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `customer_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Delivery_person_ID` int NOT NULL,
  `Delivery_Customer_ID` int NOT NULL,
  `Delivery_Order_ID` int NOT NULL,
  `Date` date NOT NULL,
  KEY `Delivery_Customer_ID` (`Delivery_Customer_ID`),
  KEY `Delivery_Order_ID` (`Delivery_Order_ID`),
  KEY `Delivery_person_ID` (`Delivery_person_ID`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Delivery_Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Delivery_Order_ID`) REFERENCES `final_order` (`Order_ID`),
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`Delivery_person_ID`) REFERENCES `delivery_person` (`Delivery_person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_person` (
  `Delivery_person_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`Delivery_person_ID`),
  KEY `del_person_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_order`
--

DROP TABLE IF EXISTS `final_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_order` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Order_Product_ID` int NOT NULL,
  `Total_Charges` varchar(100) DEFAULT NULL,
  `Ordered_date` date NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Order_Product_ID` (`Order_Product_ID`),
  CONSTRAINT `final_order_ibfk_1` FOREIGN KEY (`Order_Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `Login_ID` int NOT NULL AUTO_INCREMENT,
  `Login_username` varchar(50) NOT NULL,
  `Password` varchar(40) DEFAULT NULL,
  `Login_Type` varchar(30) NOT NULL,
  PRIMARY KEY (`Login_ID`),
  KEY `uname_index` (`Login_username`),
  KEY `login_type_index` (`Login_Type`),
  CONSTRAINT `login_chk_1` CHECK ((length(`Password`) > 5))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Product_category` varchar(225) NOT NULL,
  `Product_Availabilty` tinyint(1) DEFAULT '0',
  `Product_price_in$` varchar(100) DEFAULT NULL,
  `Product_name` varchar(120) NOT NULL,
  `Product_Discount` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `prod_name_index` (`Product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retailer`
--

DROP TABLE IF EXISTS `retailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retailer` (
  `Retailer_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`Retailer_ID`),
  KEY `retailer_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `Store_Product_ID` int NOT NULL,
  `Store_Retailer_ID` int NOT NULL,
  KEY `Store_Product_ID` (`Store_Product_ID`),
  KEY `Store_Retailer_ID` (`Store_Retailer_ID`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`Store_Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `store_ibfk_2` FOREIGN KEY (`Store_Retailer_ID`) REFERENCES `retailer` (`Retailer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'dbmsproject'
--

--
-- Dumping routines for database 'dbmsproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 22:04:17
