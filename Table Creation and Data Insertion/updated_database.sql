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
  `cart_product_quantity` int NOT NULL,
  KEY `Cart_Product_ID` (`Cart_Product_ID`),
  KEY `Cart_Customer_ID` (`Cart_Customer_ID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Cart_Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Cart_Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (94,75,2),(96,38,2),(60,21,1),(99,51,2),(76,31,1),(8,13,1),(28,16,1),(80,35,1),(88,41,1),(81,12,1),(58,95,1),(98,17,2),(12,36,1),(43,44,1),(82,56,1),(41,95,1),(57,84,1),(94,99,2),(87,18,1),(6,19,1),(9,33,1),(33,77,1),(68,15,1),(13,86,1),(45,100,1),(32,84,1),(66,34,1),(31,26,1),(52,94,1),(53,84,1),(36,97,1),(42,26,1),(61,73,1),(65,7,1),(3,32,3),(14,94,1),(86,7,1),(4,73,3),(83,57,1),(48,18,1),(77,9,1),(52,94,1),(100,91,2),(16,54,1),(8,58,1),(58,32,1),(73,50,1),(2,43,3),(97,63,2),(28,52,1),(36,37,1),(96,67,2),(89,25,1),(67,45,1),(11,76,1),(35,31,1),(41,80,1),(73,42,1),(93,12,2),(50,92,1),(36,62,1),(25,25,1),(94,74,2),(66,78,1),(70,55,1),(44,81,1),(25,61,1),(47,49,1),(10,35,1),(24,15,1),(99,19,2),(95,19,2),(14,15,1),(41,26,1),(80,45,1),(52,99,1),(30,45,1),(99,27,2),(81,19,1),(43,2,1),(45,100,1),(18,41,1),(82,21,1),(51,45,1),(66,43,1),(2,28,3),(77,53,1),(94,38,2),(17,42,1),(7,16,1),(21,19,1),(89,9,1),(61,26,1),(51,97,1),(78,15,1),(62,64,1),(93,81,2),(30,25,1),(77,92,1),(62,87,1),(2,1,1),(1,1,1),(4,108,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_stock_quantity` BEFORE INSERT ON `cart` FOR EACH ROW BEGIN 
IF (SELECT product_quantity FROM product WHERE product_id = NEW.cart_product_id) < NEW.cart_product_quantity THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product out of stock'; 
END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dec_quantity` AFTER INSERT ON `cart` FOR EACH ROW BEGIN 
UPDATE Product SET Product_Quantity = Product_Quantity - NEW.Cart_Product_Quantity WHERE Product_ID = NEW.Cart_Product_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (91,'Antiques & Collectibles'),(92,'Art Supplies'),(11,'Baby Products'),(18,'Beauty & Accessories'),(26,'Beauty & Accessories'),(32,'Beauty & Accessories'),(51,'Beauty & Accessories'),(70,'Beauty & Accessories'),(4,'Beauty & Personal Care'),(79,'Bicycles'),(76,'Board Games'),(8,'Books & Media'),(29,'Books & Media'),(31,'Books & Media'),(100,'Car Accessories'),(1,'Clothing'),(45,'Clothing'),(65,'Clothing'),(67,'Clothing'),(68,'Clothing'),(74,'Clothing'),(30,'Comedy'),(50,'Comedy'),(97,'Computers & Laptops'),(6,'Daily Use'),(58,'Daily Use'),(66,'Daily Use'),(89,'Daily Use'),(2,'Electronics'),(27,'Electronics'),(28,'Electronics'),(33,'Electronics'),(36,'Electronics'),(42,'Electronics'),(48,'Electronics'),(53,'Electronics'),(57,'Electronics'),(72,'Electronics'),(78,'Electronics'),(96,'Electronics'),(7,'Food & Beverage'),(9,'Furniture & Decor'),(88,'Gifts'),(69,'Golf'),(87,'Hand Tools'),(14,'Health & Wellness'),(3,'Home & Kitchen'),(19,'Home Appliances '),(17,'Jewelery & Watches'),(61,'Kids & baby'),(94,'Kids & Baby'),(37,'Mens Fashion'),(47,'Mens Fashion'),(56,'Mens Fashion'),(60,'Mens Fashion'),(62,'Mens Fashion'),(63,'Mens Fashion'),(71,'Mobile Devices'),(21,'Musical Instruments'),(24,'Office Furniture'),(38,'Office Furniture'),(39,'Office Furniture'),(41,'Office Furniture'),(43,'Office Furniture'),(46,'Office Furniture'),(49,'Office Furniture'),(52,'Office Furniture'),(64,'Office Furniture'),(83,'Office Furniture'),(84,'Office Furniture'),(93,'Office Furniture'),(95,'Office Furniture'),(12,'Office supplies'),(13,'Outdoor Living'),(44,'Outdoor Living'),(80,'Outdoor Living'),(82,'Outdoor Living'),(85,'Outdoor Living'),(20,'Party Supplies'),(15,'Pet Supplies'),(54,'Power Tools'),(86,'Power Tools'),(16,'Shoes & Accessories'),(22,'Shoes & Accessories'),(25,'Shoes & Accessories'),(35,'Shoes & Accessories'),(40,'Shoes & Accessories'),(55,'Shoes & Accessories'),(59,'Shoes & Accessories'),(73,'Shoes & Accessories'),(81,'Shoes & Accessories'),(90,'Shoes & Accessories'),(99,'Shoes & Accessories'),(98,'Smart Home'),(5,'Sports & Outdoors'),(75,'Tennis'),(10,'Toys & Games'),(23,'Video Games'),(34,'Video Games'),(77,'Winter Sports');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
  `CLogin_ID` int NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `customer_fname_index` (`FirstName`),
  KEY `fk_CLogin_ID` (`CLogin_ID`),
  CONSTRAINT `fk_CLogin_ID` FOREIGN KEY (`CLogin_ID`) REFERENCES `login` (`Login_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Renard','Storm','2022-09-29',95,1,'Tomscot','New York','33','9016072619',1),(2,'Simona','Tibols','2022-06-27',85,6311,'Huxley','New York','4','7739233309',2),(3,'Jere','Arend','2022-03-30',62,328,'Hazelcrest','California','2524','5641811345',3),(4,'Ernesta','Waudby','2023-02-08',19,94632,'Hintze','Florida','94744','4222360853',4),(5,'Maible','Preto','2022-09-01',36,6659,'Schmedeman','New Jersey','80','9389830512',5),(6,'Jerad','Dmych','2022-03-24',61,8721,'Shasta','Texas','49613','3875386292',6),(7,'Xenia','Saffon','2022-06-07',9,51008,'Meadow Vale','Texas','5265','4718906481',7),(8,'Georgina','Ruprecht','2022-11-24',58,86,'Coolidge','California','932','1848639064',8),(9,'Manya','McMurdo','2022-06-26',23,7,'Superior','Florida','9','3481037782',9),(10,'Everard','Misselbrook','2022-08-04',46,24,'Waxwing','New Jersey','9','5552022118',10),(11,'Federica','Cleminshaw','2022-04-07',97,53948,'Hermina','New York','9','5362437187',11),(12,'Selina','Gepson','2023-02-01',91,32036,'Ridgeview','Texas','7267','3739991848',12),(13,'Lillian','Ciobotaru','2022-11-25',80,4,'Warbler','Indiana','7903','1103164901',13),(14,'Van','Jeannequin','2022-05-22',96,61,'New Castle','Texas','59','8466817969',14),(15,'Zsa zsa','Norster','2022-03-30',32,276,'Nobel','New Jersey','7983','5487286885',15),(16,'Kerry','Durrett','2022-12-25',3,3,'Kim','California','9020','4405048987',16),(17,'Hettie','Kolodziej','2022-09-29',37,1901,'Milwaukee','Washington','49','7084989331',17),(18,'Katleen','Garfoot','2022-10-19',44,922,'Walton','Florida','95994','1885519777',18),(19,'Nicola','Chittleburgh','2022-07-10',86,9,'Carpenter','California','8125','4904168349',19),(20,'Brunhilda','Hothersall','2022-07-08',95,95157,'Maple','New Jersey','100','8131380159',20),(21,'Emalia','Pounds','2022-07-30',18,13,'Hauk','Texas','32947','7258910644',21),(22,'Susy','Lundon','2022-07-22',22,74,'Old Gate','New York','5','9864324554',22),(23,'Larine','Server','2023-01-17',28,848,'Gina','New York','05784','8856698359',23),(24,'Micheal','Denne','2022-02-17',18,1,'Kropf','California','22','9832132449',24),(25,'Lockwood','Binstead','2022-04-19',14,0,'3rd','Washington','76457','7236583153',25),(26,'Elena','Pauwel','2022-09-30',99,32593,'Towne','Indiana','0','4253345831',26),(27,'Reid','Duke','2022-05-17',62,9,'Dahle','Florida','93','1228113545',27),(28,'Derk','Bernardoux','2022-12-28',24,5317,'Main','Texas','3','6639215115',28),(29,'Germain','Scanes','2022-11-03',56,0,'Bayside','New York','711','9265386565',29),(30,'Aretha','Culbert','2022-06-14',67,62503,'Fordem','Texas','90','6759977963',30),(31,'Thomasa','Clausson','2022-10-31',16,8,'Fuller','New York','77767','5093085601',31),(32,'Johannes','Bridat','2022-04-01',1,5,'Laurel','California','11','1619439263',32),(33,'Lanita','Daggett','2022-09-16',94,1610,'Canary','New York','140','7175132375',33),(34,'Sherwood','Lanmeid','2022-03-11',56,11188,'Maywood','Washington','45','1344624495',34),(35,'Cammie','Riordan','2022-09-04',48,81,'Oneill','New Jersey','911','5724669722',35),(36,'Correy','Kettlestringe','2022-05-02',94,4,'Maple Wood','Florida','22','1524772459',36),(37,'Roddie','Kellock','2022-11-05',38,4146,'Shasta','New York','0','4983615183',37),(38,'Wolfgang','Jeannot','2022-03-06',77,90,'2nd','California','51','5569369694',38),(39,'Vonni','Sydes','2022-06-12',57,7744,'Linden','Indiana','1240','3683366562',39),(40,'Donavon','Odam','2022-02-21',55,298,'Vera','New Jersey','353','7623977490',40),(41,'Micheline','Deelay','2022-10-31',51,6937,'John Wall','Indiana','58','7255840178',41),(42,'Emilie','Dobinson','2022-04-27',83,67,'Onsgard','Texas','960','3152469707',42),(43,'Elfrida','Pulman','2022-09-29',98,81830,'Butternut','New York','7803','5461756581',43),(44,'Rosaleen','Mervyn','2022-08-11',12,2628,'Amoth','New York','59','3552336570',44),(45,'Farand','Baumert','2022-07-16',5,9780,'Sachtjen','Florida','1697','2507282501',45),(46,'Hoyt','Peasgood','2022-07-27',16,224,'Transport','New York','62965','7372523660',46),(47,'Cary','Godsafe','2022-11-11',84,95,'Monica','Indiana','8','5414773436',47),(48,'Malchy','Hasell','2022-07-22',60,7725,'Waxwing','California','21','5243175503',48),(49,'Olga','Gendricke','2022-08-13',99,77,'Calypso','Texas','4','6738579154',49),(50,'Noelyn','Folds','2022-02-17',33,36,'Orin','Washington','07','6417234570',50),(51,'Francklin','Adin','2022-04-16',65,8,'Clove','Washington','0','3473747414',51),(52,'Konstantin','Glendining','2022-06-14',6,83508,'Norway Maple','Indiana','4003','5143596846',52),(53,'Calla','Mayhou','2022-08-24',56,279,'Arrowood','Indiana','77990','3432004137',53),(54,'Lynn','Morten','2023-02-04',59,6,'Daystar','Florida','2','8523953114',54),(55,'Tadeas','Storks','2023-01-20',44,40120,'Novick','New York','0462','3845194375',55),(56,'Penrod','Betteridge','2022-03-30',19,2,'Logan','California','59477','2716055576',56),(57,'Carena','Giron','2022-11-23',25,0,'Montana','California','07413','8618877000',57),(58,'Bjorn','Stork','2022-03-10',3,233,'Homewood','New York','19366','3816416378',58),(59,'Jenda','Curwen','2022-10-07',55,3,'Michigan','Indiana','98','3204779934',59),(60,'Betsey','Morford','2022-12-05',58,70741,'Southridge','New Jersey','83','1156397447',60),(61,'Enrika','Torbet','2022-10-23',4,45,'Kensington','Texas','977','7969032201',61),(62,'Maureene','Mayoh','2022-08-02',48,10974,'Judy','New York','538','8427662528',62),(63,'Berkley','Gabbidon','2022-10-10',64,0,'Bellgrove','Florida','672','7302055420',63),(64,'Tobiah','Cortez','2022-07-07',83,9193,'Schiller','California','4','5766856627',64),(65,'Teriann','Lax','2022-11-19',6,6862,'Sullivan','New Jersey','27','1343023048',65),(66,'Kelsi','Wimpenny','2023-01-02',66,850,'Main','New York','196','7787123621',66),(67,'Agata','Borwick','2022-03-18',43,2,'Hauk','Texas','18','8892391847',67),(68,'Tabbitha','Iglesia','2022-07-29',89,9,'Maple Wood','Washington','65','4346781878',68),(69,'Coop','Holtaway','2022-12-31',90,86175,'Ilene','New York','33','9533964156',69),(70,'Clarice','Cassy','2023-01-12',30,2,'Golf View','New Jersey','62','2373666968',70),(71,'Theodoric','Duferie','2023-01-23',32,22,'Old Shore','Texas','81021','8789659046',71),(72,'Paulina','Shakesby','2022-11-26',42,79,'Talmadge','Florida','551','2406012570',72),(73,'Abraham','Maybery','2022-08-05',87,6798,'Darwin','Texas','401','4095806355',73),(74,'Clint','Messenger','2022-07-24',66,0,'Farmco','New York','7','1229142914',74),(75,'Angelika','Baumford','2022-12-25',44,1,'Charing Cross','Washington','2326','3195533425',75),(76,'Patricio','Stanborough','2022-11-28',15,418,'Ridgeway','California','270','8513542881',76),(77,'Jerald','Eglin','2022-07-28',97,7081,'Melrose','New York','683','9186268679',77),(78,'Jemimah','Medendorp','2022-10-07',56,189,'Arizona','Texas','46','4908418336',78),(79,'Mindy','Duckett','2022-05-22',90,44,'Del Sol','Texas','48340','5461675867',79),(80,'Chan','Charrisson','2022-03-06',33,18,'Lyons','New Jersey','6','6976392841',80),(81,'Estel','Friend','2022-05-20',20,79553,'Maryland','Florida','32244','6325015013',81),(82,'Row','Callen','2022-11-16',96,12,'Claremont','Indiana','2015','9541121219',82),(83,'Catha','Scholte','2022-05-30',3,85,'Graceland','Texas','96088','3534402521',83),(84,'Conan','Willingham','2022-08-11',26,729,'Bashford','Texas','656','3045131370',84),(85,'Erin','Urrey','2022-11-16',32,3,'Knutson','New Jersey','8','2202589200',85),(86,'Leonardo','Meeny','2022-04-18',91,2484,'Lotheville','New York','73780','2952228742',86),(87,'Simon','Blakeston','2022-03-16',11,7837,'Meadow Ridge','New York','96','7817692422',87),(88,'Tamiko','Ionnidis','2022-09-28',52,56960,'Golden Leaf','California','3','7142614307',88),(89,'Hugues','Chawkley','2023-01-06',10,8803,'5th','Texas','94105','1829980285',89),(90,'Bernard','Ferreira','2022-03-02',89,367,'Crest Line','Florida','1','4671421525',90),(91,'Cesar','Kildale','2022-07-12',93,56,'Southridge','Texas','6515','3013266402',91),(92,'Agosto','Blann','2022-09-23',17,0,'Holy Cross','New York','9','9905261681',92),(93,'Brigid','de\'-Ancy Willis','2022-12-09',23,563,'Westend','New York','378','9647990429',93),(94,'Charmion','Gelletly','2022-05-07',17,16346,'Darwin','Indiana','3','7813739795',94),(95,'Hermione','Jeckell','2022-04-04',56,9911,'Milwaukee','New Jersey','9338','2644885762',95),(96,'Gerianne','Wheeldon','2022-03-19',27,826,'Dryden','California','630','7364618345',96),(97,'Bernarr','Powelee','2022-11-16',78,47,'5th','Texas','113','1582775327',97),(98,'Catie','Baselli','2022-09-09',73,113,'Myrtle','Texas','0051','3287480071',98),(99,'Simonette','Hambatch','2022-08-26',21,24,'2nd','Florida','963','6846635858',99),(100,'Cobbie','Paget','2022-08-29',11,39,'Cody','New Jersey','12','9415909995',100),(101,'k','s',NULL,41,9,'abc','delhi','31','94567558',301),(102,'rohit','kr',NULL,23,9,'delhi','delhi','31','9876543210',305),(103,'rohit','kr',NULL,21,8,'delhi','delhi','110092','848410840918',305),(104,'rohit','kr',NULL,19,8,'del','delhi','19','4987201840184',305),(105,'rs','kr',NULL,31,9,'del','delhi','31','40740184',305),(106,'r','s',NULL,21,8,'del','delhi','31','47294719474',305),(107,'r','s',NULL,13,5,'del','delh','91','48014441',305),(108,'k','s',NULL,41,8,'d','d','31','3178384104',306),(109,'r','s',NULL,12,3,'delhi','delhi','47','407104',305),(110,'r','s',NULL,13,9,'delhi','delhi','61','74104184',305),(111,'r','s',NULL,45,8,'delhi','delhi','74','408418414',305);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (32,27,3,'2022-03-22'),(45,84,2,'2022-09-03'),(45,26,47,'2023-01-09'),(80,98,90,'2022-11-06'),(1,98,99,'2022-09-26'),(79,77,19,'2022-10-06'),(58,4,36,'2022-06-28'),(16,59,15,'2022-11-05'),(16,100,80,'2022-08-13'),(23,71,38,'2022-05-19'),(29,63,76,'2022-08-16'),(61,82,3,'2022-07-04'),(83,89,4,'2022-08-23'),(52,56,63,'2022-04-12'),(55,94,3,'2023-01-28'),(85,65,52,'2022-07-31'),(52,63,59,'2022-09-10'),(47,34,4,'2022-10-14'),(87,62,26,'2022-09-05'),(37,98,4,'2022-10-17'),(60,23,27,'2022-12-29'),(64,72,34,'2022-11-17'),(97,22,13,'2022-08-24'),(67,2,81,'2022-12-02'),(37,26,71,'2022-06-16'),(36,19,64,'2022-08-26'),(77,34,10,'2022-10-18'),(75,100,37,'2022-12-12'),(62,12,69,'2022-07-16'),(56,74,54,'2022-05-01'),(90,31,36,'2022-07-29'),(53,94,87,'2022-05-07'),(96,70,62,'2022-06-15'),(62,65,46,'2022-11-16'),(26,4,92,'2022-10-17'),(46,82,27,'2022-03-06'),(31,69,2,'2022-03-05'),(19,83,66,'2022-12-20'),(70,11,32,'2022-10-23'),(6,16,56,'2022-07-28'),(25,82,45,'2022-10-17'),(83,71,67,'2022-04-16'),(63,69,87,'2022-06-20'),(70,6,84,'2022-04-18'),(67,10,25,'2022-11-05'),(55,47,76,'2022-09-20'),(66,13,22,'2023-01-12'),(47,81,65,'2022-09-24'),(95,97,62,'2023-01-21'),(42,46,36,'2022-10-14'),(97,32,75,'2022-06-13'),(22,90,53,'2022-05-02'),(23,76,18,'2022-03-30'),(65,12,73,'2022-03-04'),(39,40,75,'2022-06-22'),(38,16,59,'2022-12-24'),(39,70,36,'2022-11-13'),(15,83,2,'2022-09-21'),(83,22,97,'2022-12-07'),(21,36,44,'2022-06-28'),(6,30,93,'2022-04-14'),(85,55,48,'2022-09-27'),(3,40,70,'2022-05-16'),(96,53,9,'2022-07-11'),(52,59,28,'2022-12-23'),(48,98,78,'2022-04-12'),(42,3,93,'2022-11-04'),(59,65,30,'2022-11-30'),(2,38,7,'2022-03-15'),(95,49,72,'2022-08-22'),(12,86,33,'2022-12-10'),(79,96,63,'2022-08-02'),(78,95,45,'2023-01-18'),(75,96,37,'2022-06-07'),(10,68,96,'2022-03-29'),(86,98,74,'2022-04-26'),(75,88,25,'2023-01-19'),(95,23,73,'2022-06-20'),(37,45,23,'2022-10-23'),(6,28,51,'2022-04-03'),(28,54,32,'2022-09-15'),(4,19,47,'2022-02-13'),(42,80,94,'2022-06-24'),(20,94,50,'2022-11-29'),(92,62,27,'2022-10-19'),(8,67,9,'2022-02-26'),(48,77,35,'2022-06-04'),(77,56,94,'2022-05-07'),(87,56,13,'2022-10-06'),(62,31,48,'2022-11-12'),(12,14,51,'2022-12-13'),(70,3,41,'2022-04-07'),(1,99,10,'2022-07-10'),(67,65,86,'2022-06-27'),(94,66,11,'2023-01-29'),(48,63,34,'2022-08-03'),(44,84,99,'2022-10-04'),(96,94,18,'2022-03-01'),(18,1,70,'2022-07-13'),(61,91,1,'2022-08-12'),(12,1,101,'2022-11-12'),(53,89,1,'2022-11-04'),(34,35,2,'2022-09-02'),(8,18,3,'2023-01-31'),(38,23,4,'2022-12-30'),(65,89,5,'2022-11-22'),(12,68,6,'2022-12-26'),(63,86,7,'2023-02-14'),(79,23,8,'2022-03-17'),(7,58,9,'2022-04-14'),(96,37,10,'2022-03-30'),(61,93,11,'2022-10-24'),(14,74,12,'2022-08-25'),(87,83,13,'2022-11-25'),(92,56,14,'2022-08-09'),(99,2,15,'2022-06-28'),(18,4,16,'2022-12-17'),(91,73,17,'2023-01-02'),(2,45,18,'2022-04-07'),(35,65,19,'2022-10-03'),(67,35,20,'2022-03-04'),(33,95,21,'2022-06-11'),(63,81,22,'2022-05-18'),(15,64,23,'2022-12-02'),(86,89,24,'2022-07-10'),(85,28,25,'2022-05-06'),(67,22,26,'2022-06-19'),(79,37,27,'2022-10-21'),(94,20,28,'2022-05-31'),(31,82,29,'2023-01-04'),(72,42,30,'2023-01-27'),(68,69,31,'2022-10-30'),(22,75,32,'2023-01-10'),(5,6,33,'2022-03-18'),(57,88,34,'2022-03-08'),(72,62,35,'2022-04-19'),(89,13,36,'2022-08-23'),(27,74,37,'2022-12-27'),(66,41,38,'2022-03-05'),(50,20,39,'2023-01-27'),(51,1,40,'2022-04-28'),(6,99,41,'2022-12-10'),(77,76,42,'2023-02-04'),(64,55,43,'2022-09-30'),(91,6,44,'2022-03-27'),(63,61,45,'2022-04-08'),(41,64,46,'2022-11-18'),(16,15,47,'2022-06-09'),(55,22,48,'2023-01-14'),(26,66,49,'2022-10-14'),(67,78,50,'2022-08-08'),(53,26,51,'2022-08-27'),(66,66,52,'2022-07-25'),(69,40,53,'2022-08-06'),(47,9,54,'2022-06-17'),(26,33,55,'2022-08-06'),(92,70,56,'2022-03-10'),(78,1,57,'2022-09-25'),(15,70,58,'2022-06-19'),(40,65,59,'2022-06-23'),(53,76,60,'2022-05-16'),(46,81,61,'2022-10-22'),(69,28,62,'2022-12-04'),(8,16,63,'2022-12-08'),(30,7,64,'2022-05-05'),(27,56,65,'2022-04-28'),(44,94,66,'2022-10-25'),(40,95,67,'2022-06-27'),(68,67,68,'2022-04-13'),(18,34,69,'2022-02-26'),(86,86,70,'2022-04-27'),(77,28,71,'2022-08-25'),(25,94,72,'2022-11-19'),(95,46,73,'2022-08-07'),(1,70,74,'2022-03-10'),(16,1,75,'2022-12-17'),(79,49,76,'2022-04-25'),(46,56,77,'2022-04-29'),(94,72,78,'2022-03-11'),(29,77,79,'2022-12-04'),(62,61,80,'2023-01-08'),(22,51,81,'2023-02-07'),(25,72,82,'2022-08-23'),(59,79,83,'2022-02-27'),(17,52,84,'2022-11-03'),(9,74,85,'2022-04-22'),(94,48,86,'2022-11-29'),(44,7,87,'2022-08-29'),(37,71,88,'2022-10-18'),(52,13,89,'2022-04-27'),(49,8,90,'2022-07-05'),(88,90,91,'2022-12-09'),(93,56,92,'2022-08-30'),(2,47,93,'2022-08-17'),(31,22,94,'2022-11-19'),(46,87,95,'2022-10-18'),(35,78,96,'2022-03-29'),(39,82,97,'2022-05-10'),(91,27,98,'2022-08-27'),(35,86,99,'2022-10-12'),(4,72,100,'2022-08-24'),(14,1,101,'2022-11-12'),(68,102,105,'2023-04-02'),(15,1,106,'2022-12-10'),(88,108,107,'2023-04-02'),(95,102,108,'2023-04-02'),(13,102,109,'2023-04-02');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

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
  `DLogin_ID` int NOT NULL,
  PRIMARY KEY (`Delivery_person_ID`),
  KEY `del_person_fname_index` (`FirstName`),
  KEY `fk_DLogin_ID` (`DLogin_ID`),
  CONSTRAINT `fk_DLogin_ID` FOREIGN KEY (`DLogin_ID`) REFERENCES `login` (`Login_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (1,'Rollin','McBoyle','2022-04-21',16,'Male','41517 Debra Center','7927529577',201),(2,'Katherina','Darey','2022-07-06',3,'Female','32076 Golf Course Plaza','3745678178',202),(3,'Fleurette','Dies','2022-02-26',88,'Female','4 Mayer Way','3484477119',203),(4,'Honoria','Sleet','2022-03-02',28,'Female','2 Bashford Point','8093325127',204),(5,'Jourdain','Yair','2022-07-16',10,'Male','25267 Nevada Park','7029960491',205),(6,'Titos','Carrabott','2023-01-05',88,'Male','89655 Fordem Street','9057803773',206),(7,'Ginger','Munnis','2022-07-02',56,'Female','414 Northport Junction','5275933875',207),(8,'Fleur','Teaser','2022-03-19',21,'Female','6 Swallow Road','9166049470',208),(9,'Gerri','Ratcliffe','2023-01-18',88,'Male','36 Westerfield Trail','9882882423',209),(10,'Estrella','Kelsow','2022-11-15',16,'Female','39 Gina Trail','6208862299',210),(11,'Prince','Coye','2022-05-26',65,'Male','6300 Sunfield Hill','4847892512',211),(12,'Tadio','Brownsea','2023-01-30',18,'Male','6 Pleasure Place','1831461124',212),(13,'Winfred','Garett','2023-02-02',30,'Male','9291 Aberg Hill','4806986183',213),(14,'Luci','Haitlie','2022-07-06',84,'Female','2436 Trailsway Court','9158737625',214),(15,'Abie','Smullin','2022-03-06',67,'Male','02 Ridgeview Avenue','8887379973',215),(16,'Kendricks','Delicate','2022-05-30',32,'Male','49 Mallory Circle','1116834993',216),(17,'Mattie','Hudd','2022-06-26',19,'Male','1 Evergreen Way','7199482191',217),(18,'Nertie','Rawdall','2022-11-21',21,'Female','8477 Anthes Way','2081709599',218),(19,'Aurel','McVeigh','2022-03-01',54,'Female','247 Arkansas Alley','2495952093',219),(20,'Jo-anne','Quilligan','2022-03-28',90,'Female','09 Talmadge Junction','3225875894',220),(21,'Martainn','Windham','2022-10-05',31,'Male','2862 Oakridge Circle','3771006839',221),(22,'Donica','MacWhirter','2022-11-10',31,'Female','91845 Chinook Place','5316391666',222),(23,'Odetta','Feehily','2022-07-04',89,'Female','948 Golden Leaf Place','6762923067',223),(24,'Shelley','MacKean','2023-01-05',39,'Male','1911 Dottie Road','7732453414',224),(25,'Kimberley','Bandiera','2022-07-13',82,'Female','3241 Rieder Parkway','1974636383',225),(26,'Sondra','Jackways','2022-06-04',54,'Male','6147 Almo Drive','3058650590',226),(27,'Iago','Beddon','2022-04-03',26,'Male','9 Crownhardt Way','7748454975',227),(28,'Vitia','Le Port','2022-12-05',43,'Female','85 Kings Circle','6272026378',228),(29,'Stirling','Dunbleton','2022-08-13',77,'Male','715 Loftsgordon Junction','6288753145',229),(30,'Nanon','Loren','2022-07-21',94,'Female','18 Mosinee Park','3656004089',230),(31,'Des','Mannakee','2022-04-20',10,'Male','5983 American Ash Drive','8852539123',231),(32,'Vale','Fergie','2022-06-13',41,'Male','5 Linden Pass','9287831886',232),(33,'Inness','Buckthorpe','2022-10-31',23,'Male','52215 Waxwing Park','5312992182',233),(34,'Klaus','Abella','2023-02-03',33,'Male','870 Anzinger Trail','6154084809',234),(35,'Roddie','Pedwell','2022-07-29',21,'Male','0 Waubesa Park','9225990090',235),(36,'Cordy','Racher','2022-08-18',69,'Female','58 Sycamore Circle','3723516597',236),(37,'Nevin','Barth','2022-06-24',64,'Male','92787 Hooker Parkway','5044828531',237),(38,'Caressa','Robberts','2022-07-27',47,'Female','4 Thierer Way','2775200154',238),(39,'Kenneth','Showers','2022-03-19',91,'Male','4712 Florence Circle','6818383478',239),(40,'Mada','Gierke','2022-11-21',28,'Female','9072 Kropf Pass','6401777591',240),(41,'Conrad','Matlock','2022-03-31',53,'Male','987 Artisan Way','4782303855',241),(42,'Richie','Tregonna','2022-05-05',61,'Male','2784 Sullivan Circle','6932659023',242),(43,'Luce','Fowlie','2022-03-20',51,'Male','4 Oxford Place','3667977296',243),(44,'Paulie','Shurrocks','2022-09-10',67,'Male','66450 Melby Trail','2573416029',244),(45,'Richart','Rubinsohn','2022-08-25',46,'Male','65580 Hauk Alley','2665286517',245),(46,'Chandal','Sautter','2022-03-27',59,'Female','270 Fremont Lane','8659588847',246),(47,'Jerrie','Snary','2022-03-06',47,'Male','8 Carey Junction','3591670634',247),(48,'Loleta','Hauxley','2022-12-03',86,'Female','242 Moland Circle','5714911302',248),(49,'Estrella','Yezafovich','2022-07-16',31,'Female','2 Anderson Trail','2044825432',249),(50,'Barde','Chaytor','2022-09-12',12,'Male','1266 Jana Hill','2628039674',250),(51,'Cindi','Critzen','2023-01-26',20,'Female','01020 Glendale Trail','6137294400',251),(52,'Kincaid','Vasnev','2022-03-04',65,'Male','22 Commercial Drive','4386272816',252),(53,'Maren','MacBey','2022-10-21',38,'Female','666 Carey Circle','6505530940',253),(54,'Ermanno','Paolillo','2022-12-12',73,'Male','4053 Monterey Pass','7274628592',254),(55,'Danni','Teesdale','2022-11-25',92,'Female','90206 Farwell Alley','7978504250',255),(56,'Elisabet','Smylie','2022-06-22',75,'Female','80 Eagle Crest Pass','6206555005',256),(57,'Doloritas','Jirus','2022-12-25',14,'Female','57 Mccormick Drive','1876455637',257),(58,'Sissie','Krysztofiak','2022-09-12',8,'Female','17742 Center Alley','1229307216',258),(59,'Cassie','Speares','2022-03-24',8,'Male','3 Hayes Park','3433212040',259),(60,'Johnath','Haversum','2022-06-21',27,'Female','35 Summerview Terrace','3845889045',260),(61,'Aubrey','Bugler','2022-10-10',26,'Male','2508 Hanson Lane','8311026850',261),(62,'Cordie','Filoniere','2023-02-05',49,'Female','4 Becker Crossing','1026281867',262),(63,'Pall','Wale','2022-03-08',80,'Male','9776 Dayton Terrace','4011847271',263),(64,'Kennie','Olyfat','2022-08-05',92,'Male','45684 Maple Junction','2208054430',264),(65,'Anthony','Cattel','2022-04-11',30,'Male','50873 Vahlen Way','6166074490',265),(66,'Dene','Livermore','2023-01-01',66,'Male','77 Brown Way','5227400694',266),(67,'Yasmin','Biasotti','2022-12-21',32,'Male','34 Lyons Court','4353323133',267),(68,'Cosetta','Robbeke','2022-02-10',4,'Female','298 Bluejay Alley','3909665130',268),(69,'Nappy','Donaghie','2022-03-06',86,'Male','69006 Thackeray Plaza','9273436223',269),(70,'Osborne','Seater','2023-01-04',36,'Male','4718 Waubesa Way','2393370936',270),(71,'Vaclav','Burnham','2022-12-15',88,'Male','281 Elmside Pass','5945604459',271),(72,'Padraic','Grasha','2022-11-26',45,'Male','182 Southridge Road','3127513454',272),(73,'Alex','Whicher','2022-08-04',61,'Male','76632 Badeau Park','3512178551',273),(74,'Gal','Mattinson','2022-10-10',28,'Male','690 Montana Hill','6856153137',274),(75,'Elfrida','Minards','2022-09-02',49,'Female','30 Orin Way','6843395807',275),(76,'Serena','Groger','2023-01-25',6,'Female','54747 Mandrake Way','4999312399',276),(77,'Wanids','Danilishin','2022-04-30',31,'Female','7432 Arrowood Road','6727253776',277),(78,'Delphinia','Jobbins','2022-03-13',67,'Female','720 Bunting Park','1756303492',278),(79,'Arty','Faulconbridge','2022-09-18',17,'Male','6521 Larry Alley','3502297710',279),(80,'Rosaleen','Messer','2022-12-14',97,'Female','447 Sachtjen Alley','3701996701',280),(81,'Nadiya','Bilbee','2022-03-01',70,'Female','20 Hansons Street','2759218121',281),(82,'Mohammed','Millions','2022-10-07',5,'Male','2 Monterey Drive','7904006490',282),(83,'Sande','Handsheart','2022-07-30',39,'Female','933 Northfield Road','1394136972',283),(84,'Cam','Kelsow','2022-04-19',56,'Male','88699 David Drive','7054499716',284),(85,'Gianna','Gravy','2022-04-09',31,'Male','148 Walton Avenue','1972333921',285),(86,'Carter','Tithacott','2022-10-01',1,'Male','351 Elka Trail','9196907829',286),(87,'Susette','Dran','2022-06-10',18,'Female','4850 Orin Parkway','4122076493',287),(88,'Kele','Strathearn','2022-11-14',47,'Male','3 Schlimgen Junction','7122962021',288),(89,'Trumann','Braisted','2022-07-26',45,'Male','58266 Arizona Park','8142084783',289),(90,'Libbi','Kingzeth','2022-08-16',32,'Female','2 Hazelcrest Circle','8866680706',290),(91,'Joly','Burgh','2023-02-03',68,'Female','8 Delaware Court','9009982754',291),(92,'Ginni','Pinwell','2022-08-05',9,'Female','36465 Elka Drive','8116048581',292),(93,'Odey','Halliwell','2022-09-08',93,'Male','84 Farragut Hill','5934296675',293),(94,'Wallis','Artus','2022-08-21',57,'Male','24564 3rd Circle','4555702732',294),(95,'Durward','Haldene','2022-05-02',46,'Male','93 Monica Street','6686663370',295),(96,'Shani','MacAllester','2022-12-19',18,'Female','4353 Melby Drive','8621517735',296),(97,'Jan','Rigolle','2023-01-23',80,'Male','4957 Rowland Street','2734771732',297),(98,'Mathias','Koubu','2022-07-11',82,'Male','6807 Holmberg Hill','7983439118',298),(99,'Mikkel','Sherwyn','2022-05-12',42,'Male','94622 Golf View Plaza','4445675891',299),(100,'Eachelle','Hehnke','2022-07-31',21,'Female','786 Coleman Center','1025175342',300);
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_order`
--

DROP TABLE IF EXISTS `final_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_order` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Order_Customer_ID` int NOT NULL,
  `Order_Product_ID` int NOT NULL,
  `Total_Charges` float DEFAULT NULL,
  `Ordered_date` date NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Order_Product_ID` (`Order_Product_ID`),
  KEY `Order_Customer_ID` (`Order_Customer_ID`),
  CONSTRAINT `final_order_ibfk_1` FOREIGN KEY (`Order_Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `final_order_ibfk_2` FOREIGN KEY (`Order_Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_order`
--

LOCK TABLES `final_order` WRITE;
/*!40000 ALTER TABLE `final_order` DISABLE KEYS */;
INSERT INTO `final_order` VALUES (1,89,6,14.11,'2022-10-28'),(2,35,64,11.36,'2022-08-26'),(3,18,74,13.86,'2023-01-24'),(4,23,12,9.79,'2022-12-23'),(5,89,63,4.42,'2022-11-15'),(6,68,77,18.73,'2022-12-19'),(7,86,21,5.34,'2023-02-07'),(8,23,15,14.61,'2022-03-10'),(9,58,64,9.69,'2022-04-07'),(10,37,20,13.24,'2022-03-23'),(11,93,27,7.57,'2022-10-17'),(12,74,48,15.42,'2022-08-18'),(13,83,93,19.66,'2022-11-18'),(14,56,84,19.7,'2022-08-02'),(15,2,13,6.15,'2022-06-21'),(16,4,8,5.21,'2022-12-10'),(17,73,2,12.41,'2022-12-26'),(18,45,5,7.36,'2022-03-31'),(19,65,30,13.5,'2022-09-26'),(20,35,30,11.26,'2022-02-25'),(21,95,100,19.66,'2022-06-04'),(22,81,59,4.91,'2022-05-11'),(23,64,67,7.23,'2022-11-25'),(24,89,77,5.49,'2022-07-03'),(25,28,52,4.93,'2022-04-29'),(26,22,42,9.9,'2022-06-12'),(27,37,82,9,'2022-10-14'),(28,20,19,5.54,'2022-05-24'),(29,82,5,14.97,'2022-12-28'),(30,42,81,12.5,'2023-01-20'),(31,69,83,11.97,'2022-10-23'),(32,75,11,14.3,'2023-01-03'),(33,6,99,17.08,'2022-03-11'),(34,88,42,9.38,'2022-03-01'),(35,62,39,8.04,'2022-04-12'),(36,13,53,6.14,'2022-08-16'),(37,74,25,7.79,'2022-12-20'),(38,41,77,12.83,'2022-02-26'),(39,20,80,11.94,'2023-01-20'),(40,1,69,7.84,'2022-04-21'),(41,99,61,5.19,'2022-12-03'),(42,76,93,7.22,'2023-01-28'),(43,55,98,12.12,'2022-09-23'),(44,6,80,6.04,'2022-03-20'),(45,61,100,17.84,'2022-04-01'),(46,64,88,11.9,'2022-11-11'),(47,15,84,13.51,'2022-06-02'),(48,22,85,16.92,'2023-01-07'),(49,66,38,10.58,'2022-10-07'),(50,78,76,4.74,'2022-08-01'),(51,26,58,9.35,'2022-08-20'),(52,66,28,14.73,'2022-07-18'),(53,40,52,19.41,'2022-07-30'),(54,9,76,15.39,'2022-06-10'),(55,33,52,13.85,'2022-07-30'),(56,70,21,9.95,'2022-03-03'),(57,1,20,16.83,'2022-09-18'),(58,70,77,6.66,'2022-06-12'),(59,65,91,17.79,'2022-06-16'),(60,76,78,4.37,'2022-05-09'),(61,81,8,13.95,'2022-10-15'),(62,28,89,5.44,'2022-11-27'),(63,16,91,17.54,'2022-12-01'),(64,7,12,10.34,'2022-04-28'),(65,56,56,5.79,'2022-04-21'),(66,94,21,17.24,'2022-10-18'),(67,95,58,7.13,'2022-06-20'),(68,67,97,8.74,'2022-04-06'),(69,34,47,14.8,'2022-02-19'),(70,86,85,11.83,'2022-04-20'),(71,28,1,18.1,'2022-08-18'),(72,94,57,19.31,'2022-11-12'),(73,46,15,5.53,'2022-07-31'),(74,70,49,8.86,'2022-03-03'),(75,1,81,10.18,'2022-12-10'),(76,49,5,6.24,'2022-04-18'),(77,56,8,19.08,'2022-04-22'),(78,72,82,11.62,'2022-03-04'),(79,77,46,19.26,'2022-11-27'),(80,61,57,16.05,'2023-01-01'),(81,51,64,6.41,'2023-01-31'),(82,72,92,9.92,'2022-08-16'),(83,79,52,12.49,'2022-02-20'),(84,52,85,18.82,'2022-10-27'),(85,74,53,8.8,'2022-04-15'),(86,48,1,5.2,'2022-11-22'),(87,7,73,16.96,'2022-08-22'),(88,71,73,16.35,'2022-10-11'),(89,13,25,11.93,'2022-04-20'),(90,8,55,11.39,'2022-06-28'),(91,90,100,17.43,'2022-12-02'),(92,56,26,13.2,'2022-08-23'),(93,47,2,10.09,'2022-08-10'),(94,22,5,17.43,'2022-11-12'),(95,87,21,15.9,'2022-10-11'),(96,78,45,6.24,'2022-03-22'),(97,82,84,14.37,'2022-05-03'),(98,27,19,10.67,'2022-08-20'),(99,86,81,10.43,'2022-10-05'),(100,72,52,13.37,'2022-08-17'),(101,1,1,11.11,'2022-11-05'),(105,102,3,10.5,'2023-03-26'),(106,1,4,11,'2022-12-03'),(107,108,4,10.5,'2023-03-26'),(108,102,6,10.5,'2023-03-26'),(109,102,5,10.5,'2023-03-26');
/*!40000 ALTER TABLE `final_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_delivery` AFTER INSERT ON `final_order` FOR EACH ROW BEGIN INSERT INTO delivery (delivery_person_id, delivery_customer_id, delivery_order_id, date) VALUES ((FLOOR(RAND() * 100) + 1), NEW.order_customer_id, NEW.order_id, DATE_ADD(NEW.ordered_date, INTERVAL 7 DAY)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'astokes0','55uZC8idwv','Customer'),(2,'mickowicz1','GAZiaWL3LoE','Customer'),(3,'wbosher2','pCly4Q','Customer'),(4,'cpedron3','z0S21IeA5t','Customer'),(5,'jbirkett4','yI1jGqj','Customer'),(6,'psaltmarshe5','zE4HcoCL','Customer'),(7,'gbloxsom6','IPALAUk','Customer'),(8,'erispin7','5pMLKkTlQAf','Customer'),(9,'ffutcher8','dCsotxru6jPY','Customer'),(10,'freinbeck9','d14gbvdvwBG','Customer'),(11,'bsutcliffb','z9GOeHBlBm','Customer'),(12,'ypengilleya','rF1STai2f5','Customer'),(13,'tradsdalec','LYDkfyee','Customer'),(14,'lbendond','8dzMw2c','Customer'),(15,'drizzonee','QKvVNAenh9','Customer'),(16,'pchewf','8jnH6Zhne','Customer'),(17,'agrimsteadg','pLDiFISjBQH','Customer'),(18,'lgemnetth','CDvdBJ9FK86','Customer'),(19,'fdefreynei','6NgllcB','Customer'),(20,'aoakj','2KvW9HV3iBs','Customer'),(21,'abickerdykek','VbEtIAD5','Customer'),(22,'ceilhersenl','9uej2Lyd9','Customer'),(23,'tragsdallm','jWRmqyf1r','Customer'),(24,'abrunsenn','9lUIkEYvLeWJ','Customer'),(25,'ldownero','l1uzYE8r','Customer'),(26,'pbilberyp','H8og1H2Z3Q','Customer'),(27,'dwillmoreq','A3z4v42szec','Customer'),(28,'tmarcroftr','K8HpSElS','Customer'),(29,'esires','XXAczsezCo9Q','Customer'),(30,'sissacsont','JUxjISLVd6Vt','Customer'),(31,'hkewu','CkwPEat3g9','Customer'),(32,'hbrazearv','CEOlS7hR','Customer'),(33,'bpashbeew','9SfM3VuGre','Customer'),(34,'mstogillx','geQ1Rr4kQM5','Customer'),(35,'kchimientiy','UULyHBNT9d','Customer'),(36,'vmcandrewz','kfPp3I','Customer'),(37,'lmaven10','EceS3isz61J','Customer'),(38,'akisar11','RkARyk7QY6','Customer'),(39,'sbloomfield12','zWP2UdNDF','Customer'),(40,'taulsford13','lMYYZGx','Customer'),(41,'linns14','ZxzspwpV5sS','Customer'),(42,'scampa15','S8jM3n5l','Customer'),(43,'smacvain16','8o2hqtvs','Customer'),(44,'ecroucher17','WmtmsR4t','Customer'),(45,'vdelazenne18','mJ5FLgPPqxU','Customer'),(46,'lstubbe19','FIr6fb','Customer'),(47,'sgerritsma1a','ZWboweqI','Customer'),(48,'rbickell1b','zcyZWgX','Customer'),(49,'aharesnape1c','uVLAK8BNS19','Customer'),(50,'nolney1d','eKEmzSXmkZ','Customer'),(51,'mdyers1e','ropP4XM','Customer'),(52,'gpigny1f','ipvfiI','Customer'),(53,'emccathay1g','ldDm9m','Customer'),(54,'aeberlein1h','BX1o4le','Customer'),(55,'shackforth1i','wDXS4rf','Customer'),(56,'kchaplyn1j','3HlUnCmR2AwJ','Customer'),(57,'kjoan1k','zQ2sUAGz7F2','Customer'),(58,'cdray1l','NXY4beH','Customer'),(59,'ojackman1m','d163BZGJJRst','Customer'),(60,'mquirke1n','2ni6iZOeJw','Customer'),(61,'gmathevet1o','Ywc1psWJx','Customer'),(62,'dcomrie1p','TZ0feRI','Customer'),(63,'dvittery1q','7QQFoy7P','Customer'),(64,'tbiagioni1r','itxPbYTP','Customer'),(65,'ggavriel1s','k94Na3QiBOf','Customer'),(66,'bbiner1t','XJzzHc','Customer'),(67,'rbabonau1u','oExpBnPJ2z1g','Customer'),(68,'rborkett1v','oIaUfe41vFw','Customer'),(69,'kpinnocke1w','gyyeJZ','Customer'),(70,'lhedin1x','AzWpEzek','Customer'),(71,'wpuvia1z','uVTu2kdX7uG','Customer'),(72,'ahirthe1y','YPqfUvXkCF','Customer'),(73,'aneno20','LGX0VgkLP','Customer'),(74,'tpridgeon21','82QWNjJb3E1H','Customer'),(75,'ncammell22','9fN3GPG8eM','Customer'),(76,'smoretto23','PBF81nKQ1','Customer'),(77,'mroundtree24','CykpjKMS0H','Customer'),(78,'cduddle25','nokEKIGDXoF','Customer'),(79,'dvanzon26','8DFXhjtp','Customer'),(80,'gboater27','xrw1udOvrp','Customer'),(81,'mglauber29','WOJK2HIjY','Customer'),(82,'rboich28','OZ01UGwH9Y6','Customer'),(83,'pchanning2a','3uYdYK3ScJsl','Customer'),(84,'cgilardone2b','9F3yUvsqW','Customer'),(85,'follet2c','wmx3PA','Customer'),(86,'ascalera2d','NVskUDFvizC','Customer'),(87,'cchstney2e','zau01GIdJ','Customer'),(88,'sbrandino2f','fcQsjuj2l','Customer'),(89,'rwhaites2g','thmrznI','Customer'),(90,'jlehoux2h','5056q6Hk','Customer'),(91,'acabedo2j','ik6BAGkVh9hY','Customer'),(92,'bshewsmith2i','1fR5X5M','Customer'),(93,'cbedin2k','3P0GlfRkyZ5','Customer'),(94,'jvickerstaff2l','DGXUZKT7SG','Customer'),(95,'pfallow2m','w3Z2cN9jz','Customer'),(96,'kmacfayden2n','T1CL4Li9Zg','Customer'),(97,'oronnay2o','R5s9PrNZz4Mr','Customer'),(98,'msapsforde2p','eNIui7o8c','Customer'),(99,'tkruschev2q','dDf7qG4NHoz','Customer'),(100,'jgladhill2r','TmDzE3ELmDeo','Customer'),(101,'Johnny','123456','Retailer'),(102,'kfulle2t','amkok7jQs','Retailer'),(103,'ks','123456','Retailer'),(104,'bchevolleau2v','6QILUgwlsTX','Retailer'),(105,'jgalland2w','FV0vQfDm','Retailer'),(106,'oopy2x','JgzkvY2Z','Retailer'),(107,'ghould2y','Ng9BaZ','Retailer'),(108,'cjohansen2z','qUkVWfK','Retailer'),(109,'phaston30','wWv7ngJlaDD4','Retailer'),(110,'ewarland31','f7HUS9PnOVe','Retailer'),(111,'dgarrow32','jqNekHKaSLj','Retailer'),(112,'ethacker33','ahj9XAaIa8K','Retailer'),(113,'ppalphreyman34','47ZUJz','Retailer'),(114,'rkeable35','JJZlnfWO','Retailer'),(115,'bsouthcombe36','6J50GhQlWHPD','Retailer'),(116,'rbleier37','WMWnp4sZMXxQ','Retailer'),(117,'sdreger38','eVbIwxrTT','Retailer'),(118,'gmackro39','rIlYyAkRnk3','Retailer'),(119,'pfauguel3a','0rIr9DjCIrZ','Retailer'),(120,'jdouche3b','DrQkvtyOoch','Retailer'),(121,'usouthorn3c','mo9cZUT6S','Retailer'),(122,'pwoolvett3d','OTEU1e','Retailer'),(123,'zbodleigh3e','LEGzklz22HU','Retailer'),(124,'dgoater3f','3xRBPUNgwm','Retailer'),(125,'drodwell3g','2lLpZPU7','Retailer'),(126,'cstout3h','Evt374vHZ','Retailer'),(127,'syanshinov3i','wIGXrIZaRv','Retailer'),(128,'kbrilleman3j','Z0xmcMhQRsm','Retailer'),(129,'bhooban3k','PbXJgN','Retailer'),(130,'atenbrug3l','heNfYvV3','Retailer'),(131,'rianson3m','9racI7xI','Retailer'),(132,'jegan3n','tqACGT','Retailer'),(133,'llomb3o','gt8xmxT','Retailer'),(134,'mwaber3p','RsT1ATqJf','Retailer'),(135,'kstonner3q','SpiVA1t','Retailer'),(136,'jbudden3r','HlYTU0','Retailer'),(137,'eborwick3s','K2AfdW','Retailer'),(138,'mcarbett3t','VtQSMb5WhwlF','Retailer'),(139,'cwrack3u','fEKComtlxbF1','Retailer'),(140,'elammert3v','RnM3fPcFEJe','Retailer'),(141,'vholwell3w','2hdfgjGA','Retailer'),(142,'mfolbig3x','inhef9L','Retailer'),(143,'dholliar3y','rcvOEsba','Retailer'),(144,'adwight3z','bNOjjrrGrZ','Retailer'),(145,'jellison40','Ccb1WyL','Retailer'),(146,'ipentycost41','2PmYZdM2b','Retailer'),(147,'kottawell42','5Asd4kd','Retailer'),(148,'cmckune43','tA6XeOghJ','Retailer'),(149,'gbrandreth44','BXblAhixSZr','Retailer'),(150,'mjancar45','68q9cXqcWX','Retailer'),(151,'jkohring46','gKWREIlL','Retailer'),(152,'bjohnsey47','QiLEaS6tdkLO','Retailer'),(153,'rdifranceschi48','YW6rWsaVaMU','Retailer'),(154,'gmcgrirl49','PPZiMZX8Ed','Retailer'),(155,'cfones4a','kcbIGPWKGuey','Retailer'),(156,'kgregoratti4b','nLIcjTUtn','Retailer'),(157,'igeffen4c','Wc3O32L1oD5','Retailer'),(158,'bstodit4d','JO3QrZpaAP','Retailer'),(159,'meverleigh4e','osjDxDQH','Retailer'),(160,'nlensch4f','5eWaCTJ','Retailer'),(161,'elushey4g','FhZnP0hi6H','Retailer'),(162,'avassel4h','zcqWTfnH2','Retailer'),(163,'cemmerson4i','7jjgT94M','Retailer'),(164,'fashton4j','DJbxyda','Retailer'),(165,'mhempel4k','c8QOLATq9kD','Retailer'),(166,'cmaccolm4l','N2ilovj','Retailer'),(167,'rpley4m','NmotNsCAG','Retailer'),(168,'hsackler4n','h2sbHDcVWhY','Retailer'),(169,'mdallewater4o','vXBNEO1G','Retailer'),(170,'mledamun4p','LHwN9Sk','Retailer'),(171,'ktrethewey4q','yc6hflw','Retailer'),(172,'bvandermerwe4r','0w3Ccj','Retailer'),(173,'kcarvilla4s','lpKQUDKrzSfQ','Retailer'),(174,'kalbasiny4t','mswHA3B7uY','Retailer'),(175,'nalfonsetto4u','kJMMJI','Retailer'),(176,'dakester4v','PP99QPmn','Retailer'),(177,'bphilippard4w','WMCzPHy','Retailer'),(178,'heddison4x','vdJw1U','Retailer'),(179,'tuwins4y','YDu33u27e3','Retailer'),(180,'ghanssmann4z','FhrsVD','Retailer'),(181,'sgossart50','mBYSinpCS','Retailer'),(182,'cmuslim51','pTGE9kh','Retailer'),(183,'awaskett52','TpmlYGL4Weh','Retailer'),(184,'ddayer53','d8VsdnCe','Retailer'),(185,'kdibdin54','Yh2LKm','Retailer'),(186,'cbreznovic55','VeRviUl68m','Retailer'),(187,'swathall56','UsNZtJY','Retailer'),(188,'ekinton57','KiKWrla','Retailer'),(189,'acassin58','z8wHXVB','Retailer'),(190,'uwilman59','SnJprnMXoYt','Retailer'),(191,'twrench5a','r5ZAaGkban59','Retailer'),(192,'sperree5b','aXqver','Retailer'),(193,'kmakepeace5c','7mM8nbhaV5VC','Retailer'),(194,'shebblethwaite5d','DOGN1lAKkSd','Retailer'),(195,'tazema5e','iiEhAe4h','Retailer'),(196,'gmaggillandreis5f','IRONqPv0','Retailer'),(197,'whearon5g','E57512fUDva8','Retailer'),(198,'tfronzek5h','x9XMXyl9','Retailer'),(199,'kmyrick5i','eB5XCkODkRX','Retailer'),(200,'mbentinck5j','Tz6cZATfRJx','Retailer'),(201,'gwynrehame5k','z2V0jFy','Delivery Person'),(202,'cconstanza5l','FAyMAPf3B','Delivery Person'),(203,'dswindon5m','RTtHSitI','Delivery Person'),(204,'resposita5n','APG3PkMxI9kS','Delivery Person'),(205,'dmcguirk5o','Hln788d4bu','Delivery Person'),(206,'vgalfour5p','ldIgtOma','Delivery Person'),(207,'ccolnett5q','YV6zNTvIoE','Delivery Person'),(208,'bbalassi5r','cvMZNmqCbz6','Delivery Person'),(209,'jdavidson5s','oaQiOQTyjB','Delivery Person'),(210,'bbench5t','Ob0zWxYSo2X','Delivery Person'),(211,'gmuckian5u','Ol8dAdB8nI4','Delivery Person'),(212,'msmowton5v','wd24hTZ','Delivery Person'),(213,'tmaplesden5w','GzCn2SZU3OEa','Delivery Person'),(214,'vgidney5x','LPyASNPYGb5','Delivery Person'),(215,'dtreleaven5y','4QvBMBjwo','Delivery Person'),(216,'nmusslewhite5z','BgNNFH','Delivery Person'),(217,'adwelley60','1jV2eC99Sx','Delivery Person'),(218,'imongin61','mrZEg2n8','Delivery Person'),(219,'tloins62','a8ecQQhne','Delivery Person'),(220,'gismirnioglou63','P1Z1BKEKD','Delivery Person'),(221,'alivard64','lHZeyJd','Delivery Person'),(222,'tkenrat65','o46ZPsrR','Delivery Person'),(223,'agajownik66','Cgep08pVVtCQ','Delivery Person'),(224,'jtelling67','tRiSMyCId','Delivery Person'),(225,'mmorillas68','n37S9kI4u','Delivery Person'),(226,'lmaffiotti69','qcQbwvcA','Delivery Person'),(227,'ashepard6a','Je2HbYeRw','Delivery Person'),(228,'jpeche6b','MDm6MW','Delivery Person'),(229,'aberzon6c','zhmDO2gwO','Delivery Person'),(230,'mkalinsky6d','Hmo0Prujk','Delivery Person'),(231,'ecarmel6e','zOSnRYm','Delivery Person'),(232,'nbruggeman6f','m0xuOc42Za9','Delivery Person'),(233,'mpierton6g','uIBByl','Delivery Person'),(234,'tbenne6h','9Xm2XokQeAY','Delivery Person'),(235,'gbuche6i','rrt7EkKFU','Delivery Person'),(236,'hgladwin6j','keZEg09G','Delivery Person'),(237,'pchesterton6k','Arlu8Tw9M','Delivery Person'),(238,'hmurkitt6l','GovqCQDVL','Delivery Person'),(239,'aclemo6m','E4lWxRbmN3no','Delivery Person'),(240,'rpatise6n','GSKrIo8U1i','Delivery Person'),(241,'lsantarelli6o','Ft36ol5z0EAe','Delivery Person'),(242,'zmaynard6p','X0ayok2SK5lR','Delivery Person'),(243,'tproschek6q','dFr0GU2huI','Delivery Person'),(244,'jclemens6r','skkuReJsJtn','Delivery Person'),(245,'efranzoli6s','I11jPbW5M3','Delivery Person'),(246,'tmerrien6t','hQwZfEc','Delivery Person'),(247,'eyetton6u','1i3G1dOIgp','Delivery Person'),(248,'fflintuff6v','VdCHEG','Delivery Person'),(249,'edelahunty6w','qcqdOckSQ','Delivery Person'),(250,'bhalliberton6x','mRsGo46i1jb','Delivery Person'),(251,'aohm6y','Gn5Qi4e','Delivery Person'),(252,'rbonnor6z','jVlHRcOU2mf','Delivery Person'),(253,'lpeople70','M0JmAT','Delivery Person'),(254,'dadriani71','HbuqPai','Delivery Person'),(255,'adakhno72','7X6bDYzUCyT','Delivery Person'),(256,'bwelden73','JQsT8AN9qz','Delivery Person'),(257,'egravy74','0BjYfVvT7y1x','Delivery Person'),(258,'sfleeman75','sk8LsC7Nli6s','Delivery Person'),(259,'smcartan76','xHkMHiH5HVQ1','Delivery Person'),(260,'jfaudrie77','EUPc5nAMr','Delivery Person'),(261,'mportman78','mqSyYME','Delivery Person'),(262,'qmaccumiskey79','0mzZJdWFEWN','Delivery Person'),(263,'chainning7a','N8eJ9H','Delivery Person'),(264,'dsealove7b','ueaqgDqtPf7r','Delivery Person'),(265,'ecancellario7c','MTd37G','Delivery Person'),(266,'sodams7d','LvbIkIrys','Delivery Person'),(267,'cscatchar7e','rhrrJrZBd4VL','Delivery Person'),(268,'ftumilty7f','vJVlDZ03','Delivery Person'),(269,'asimonyi7g','DY4tf4','Delivery Person'),(270,'dmccollum7h','QKIy9oC','Delivery Person'),(271,'gmckimmey7i','fNo36M','Delivery Person'),(272,'alarkings7j','kunXwnPg','Delivery Person'),(273,'dgajewski7k','AIYGjZSM','Delivery Person'),(274,'ccorstan7l','oR21mDGMUb','Delivery Person'),(275,'bbidder7m','3xLYTK','Delivery Person'),(276,'pmceneny7n','berPp5Klmp','Delivery Person'),(277,'jvallender7o','Od4wuxB','Delivery Person'),(278,'kbach7p','1uPMs2','Delivery Person'),(279,'bmackegg7q','Jwilr97','Delivery Person'),(280,'vendrici7r','YYPyDoxqgbzF','Delivery Person'),(281,'gtitherington7s','uEF5S5N4kd','Delivery Person'),(282,'edruhan7t','CWHnD9zfZiO','Delivery Person'),(283,'gadrianello7u','FeNMIq9uMBW','Delivery Person'),(284,'sbearsmore7v','cQa0TVUo','Delivery Person'),(285,'smoyse7w','2T6CGVq4','Delivery Person'),(286,'ckindon7x','K7ootl','Delivery Person'),(287,'swingham7y','BQ14vtkgoY','Delivery Person'),(288,'vpestor7z','Yrwfs114i4Vq','Delivery Person'),(289,'jsteaning80','vHIPYvG6Kqr','Delivery Person'),(290,'wkoubu81','MEh6azq','Delivery Person'),(291,'tepinay82','XoTaD08t','Delivery Person'),(292,'estarcks83','CDWXS2','Delivery Person'),(293,'dmabee84','VdWUhkGO3OLx','Delivery Person'),(294,'lbarus85','dvjydt','Delivery Person'),(295,'llashmore86','O5uN4Em','Delivery Person'),(296,'lburchatt87','yD5SWtNyQR','Delivery Person'),(297,'mmea88','3Liu4D5P8','Delivery Person'),(298,'irimbault89','SuQmhiz','Delivery Person'),(299,'ijindrich8a','nagpx8Jt','Delivery Person'),(300,'mwoodier8b','mBdIzPFqA0OM','Delivery Person'),(301,'krishna','123456','Customer'),(302,'krishna','123456','Customer'),(303,'ks','asdfgh','Retailer'),(304,'ks','asdfgh','Delivery Person'),(305,'rohit','rohit123','Customer'),(306,'k','123456','Customer');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Product_Category_ID` int NOT NULL,
  `Product_price_in$` float DEFAULT NULL,
  `Product_name` varchar(120) NOT NULL,
  `Product_Discount` int DEFAULT NULL,
  `Product_Quantity` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Product_Category_ID` (`Product_Category_ID`),
  KEY `prod_name_index` (`Product_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Product_Category_ID`) REFERENCES `category` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,86,1.94,'Telivsion',17,1),(2,60,7.76,'Shoes',54,1),(3,49,1.8,'Chair',26,1),(4,30,1.25,'Telephone',28,0),(5,88,7.29,'Shirt',21,0),(6,14,1.51,'Notebooks',15,1),(7,14,2.9,'Laptop',11,2),(8,89,1.78,'Kettle',22,2),(9,82,4.04,'Paintings',25,2),(10,17,2.29,'Oven',22,2),(11,80,3.39,'Laptop',9,5),(12,34,8.4,'Span',7,5),(13,4,4.71,'Laptop',24,5),(14,43,9.87,'Air Conditioner',25,5),(15,66,8.99,'Table',29,2),(16,11,0.3,'Keyboard',17,1),(17,40,4.46,'Soap',21,1),(18,70,3.23,'Laptop',6,1),(19,47,2.73,'Scissors',18,1),(20,14,1.12,'Shirt',18,1),(21,12,7.36,'Fan',4,1),(22,69,3.24,'Laptop',12,1),(23,55,4.36,'Dress',17,1),(24,13,10,'Laptop',19,1),(25,52,7.39,'Telivsion',8,3),(26,31,4.47,'Pen',26,3),(27,57,6.08,'Charger',31,3),(28,96,8.07,'Socks',30,3),(29,63,7.04,'Laptop',22,3),(30,36,8.41,'Soap',6,1),(31,50,9.35,'Paintings',27,1),(32,58,2.17,'Sofa',29,1),(33,14,9.92,'Bag',5,1),(34,99,2.44,'Bamity',21,1),(35,17,7.09,'Span',4,1),(36,79,1.34,'Phone',14,1),(37,63,7.5,'Dress',30,1),(38,43,0.97,'Laptop',29,1),(39,64,5.32,'Violen',8,1),(40,16,3.71,'Bag',26,2),(41,83,7.84,'Hatity',24,2),(42,17,0.24,'Cricket Ball',13,2),(43,45,0.22,'Bag',18,2),(44,4,6.19,'Jar',18,2),(45,83,3.05,'Laptop',16,2),(46,69,9.63,'Cup',16,2),(47,26,9.24,'Keyboard',26,2),(48,88,9.57,'Cap',57,2),(49,51,5.94,'Telephone',11,2),(50,96,8.74,'Phone',0,2),(51,36,2.46,'Notebooks',54,4),(52,46,2.93,'Water Bottle',23,4),(53,64,9.22,'Water Bottle',15,4),(54,39,2.64,'Dress',22,4),(55,89,9.36,'Hatity',28,4),(56,43,4.88,'Couch',20,4),(57,70,5.4,'Bag',21,4),(58,74,0.4,'Bag',22,4),(59,87,0.89,'Laptop',16,4),(60,33,9.69,'Home Ing',16,4),(61,51,9.89,'Telephone',8,2),(62,100,9.78,'Golf Ball',59,2),(63,33,0.2,'Oven',28,2),(64,99,4.07,'Socks',18,2),(65,45,9.43,'Keyboard',52,2),(66,57,9.56,'Table',33,2),(67,32,8.93,'Cricket Bat',58,2),(68,44,4.32,'Air Conditioner',24,2),(69,26,6,'Cap',23,2),(70,45,8.59,'Tin',12,2),(71,89,8.83,'Soap',25,2),(72,81,8.4,'Laptop',51,2),(73,44,0.45,'Cricket Bat',23,2),(74,31,6.57,'Jacket',26,2),(75,25,2.59,'Basketball',20,2),(76,36,3.52,'Golf Stick',23,2),(77,64,7.71,'Cricket Bat',9,2),(78,47,4.89,'Sofa',53,2),(79,93,9.05,'Laptop',17,1),(80,58,0.89,'Cup',7,1),(81,88,2.16,'Golf Ball',7,1),(82,9,2.85,'Paintings',7,1),(83,50,8.55,'Cap',17,1),(84,93,2.13,'Hatity',3,1),(85,52,4.98,'Tin',24,3),(86,12,8.6,'Keyboard',27,3),(87,14,8.78,'Violen',57,3),(88,51,7.79,'Smartphone',59,1),(89,74,2.82,'Smartphone',19,1),(90,33,9.38,'Laptop',8,1),(91,35,7.03,'Smartphone',28,1),(92,45,3.68,'Laptop',1,1),(93,20,8.5,'Jacket',18,1),(94,86,6.64,'Geometry Box',15,5),(95,81,6.83,'Laptop',27,5),(96,44,3.95,'Water Bottle',19,3),(97,44,4.9,'Box',7,3),(98,72,8.69,'Laptop',56,3),(99,24,8.11,'Sofa',54,3),(100,58,6.51,'Geometry Box',0,3),(110,4,7.5,'Laptop',10,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
  `RLogin_ID` int NOT NULL,
  PRIMARY KEY (`Retailer_ID`),
  KEY `retailer_fname_index` (`FirstName`),
  KEY `fk_RLogin_ID` (`RLogin_ID`),
  CONSTRAINT `fk_RLogin_ID` FOREIGN KEY (`RLogin_ID`) REFERENCES `login` (`Login_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer`
--

LOCK TABLES `retailer` WRITE;
/*!40000 ALTER TABLE `retailer` DISABLE KEYS */;
INSERT INTO `retailer` VALUES (1,'Yolande','Grafham','2022-05-20',29,'14 Lindbergh Lane','8918065076',101),(2,'Ashbey','Zute','2022-09-27',82,'2 Prentice Place','3098582813',102),(3,'Cissy','Checchi','2022-09-11',11,'5 Waxwing Crossing','7617290398',103),(4,'Martie','Delgadillo','2022-11-29',75,'0 Lotheville Center','2338369074',104),(5,'Rozele','Fawcett','2022-08-03',46,'22 Cottonwood Point','2672541866',105),(6,'Misty','Robelin','2022-03-31',77,'03691 Waubesa Avenue','3116687611',106),(7,'Phip','Burtwistle','2023-01-31',100,'7 Nevada Drive','7733453072',107),(8,'Nelli','Bereford','2022-11-02',70,'187 Loeprich Junction','2749138530',108),(9,'Gualterio','Winchester','2023-02-04',26,'6549 Kensington Junction','3881905824',109),(10,'Myles','Hassin','2022-08-20',74,'90 Clove Center','1677752975',110),(11,'Chick','Jans','2022-07-07',25,'80 Erie Junction','7864974427',111),(12,'Emmy','Peepall','2022-03-13',35,'74729 Straubel Trail','9033978486',112),(13,'Basilius','Sawell','2022-08-23',72,'932 Sheridan Center','8461287275',113),(14,'Issiah','Danelut','2022-02-17',61,'91 Anniversary Alley','4437623327',114),(15,'Sollie','Coyish','2022-07-21',3,'0 Melrose Drive','6117951909',115),(16,'Ashby','Bassham','2022-05-31',71,'875 Burrows Plaza','3787453134',116),(17,'Aleksandr','Krystof','2022-08-29',29,'8 Jenna Hill','8866022919',117),(18,'Ginger','Dubique','2023-01-16',25,'095 Porter Drive','4864921852',118),(19,'Evita','Showering','2022-11-27',82,'26748 Northridge Parkway','8683785071',119),(20,'Mayne','McCarlie','2023-01-19',31,'4589 Texas Street','1252617265',120),(21,'Una','Tothe','2022-02-11',9,'1405 Summit Plaza','7147717798',121),(22,'Joel','Goschalk','2022-06-22',62,'40 Oxford Place','5843901151',122),(23,'Barnebas','Figgins','2022-10-09',96,'53 Veith Junction','9475968655',123),(24,'Christie','Gregine','2022-11-11',27,'4462 Stuart Lane','1453686989',124),(25,'Berenice','Bront','2022-08-01',46,'2044 Kedzie Parkway','6651185643',125),(26,'Gayle','Hylands','2022-11-11',3,'8 Daystar Trail','4612271580',126),(27,'Kerr','Adame','2022-07-30',78,'45273 Blackbird Park','6651754161',127),(28,'Boothe','Owain','2022-09-22',52,'623 Rusk Place','2913548212',128),(29,'Tobias','Szymoni','2022-08-04',49,'096 Westridge Junction','4759670367',129),(30,'Averell','McCritichie','2022-12-07',42,'66658 Haas Plaza','5654564631',130),(31,'Druci','Voden','2022-09-02',46,'7870 Anthes Plaza','2741300057',131),(32,'Dorella','Dresser','2022-07-12',57,'6 Vera Court','3344364487',132),(33,'Kingsly','Bramstom','2022-03-23',40,'0 Corry Alley','6323167173',133),(34,'Rasia','Bendon','2022-10-25',46,'2998 Porter Place','5948650423',134),(35,'Zora','Petrelluzzi','2022-10-27',88,'04 Helena Way','5854997431',135),(36,'Nancie','Filchagin','2022-06-10',77,'4202 Manley Plaza','2914271615',136),(37,'Berenice','Feltoe','2022-09-02',42,'645 Fulton Avenue','8652676468',137),(38,'Bernardo','Halwell','2023-01-20',14,'9 Express Trail','2824554201',138),(39,'Marcia','Johann','2022-10-03',28,'92021 Harper Road','2694651384',139),(40,'Hammad','Rentelll','2022-03-27',18,'7 Mccormick Parkway','5925847604',140),(41,'Licha','Cordy','2022-06-03',94,'71 Ridge Oak Place','9389944562',141),(42,'Diane','Fautly','2022-07-14',31,'04517 Mifflin Park','7146957453',142),(43,'Peirce','Pepall','2023-01-20',22,'407 Browning Alley','4505026589',143),(44,'Broddie','Dickenson','2022-06-21',41,'90 Buena Vista Street','3992092602',144),(45,'Isidora','Everly','2022-07-28',53,'6 Parkside Way','3875307169',145),(46,'Nicoli','Bygreaves','2023-01-02',27,'1 Golf Course Hill','9973619510',146),(47,'Nil','Siege','2022-03-20',81,'87 Del Mar Point','3826055001',147),(48,'Elissa','Gorwood','2022-09-22',60,'22 David Parkway','6066418957',148),(49,'Michel','Wedderburn','2022-11-16',50,'77453 Glendale Trail','7489888397',149),(50,'Auberon','Fansy','2022-07-20',4,'800 Shopko Pass','7986300625',150),(51,'Godard','Wilstead','2022-09-08',44,'09 Lukken Lane','3477833875',151),(52,'Terrel','Butts','2022-10-05',75,'73 Clyde Gallagher Road','2226313647',152),(53,'Ben','Tomaselli','2023-01-22',37,'542 Marquette Hill','9379685547',153),(54,'Inna','Locksley','2022-07-31',52,'4 Cody Crossing','7813211976',154),(55,'Woodman','Sibbering','2023-01-08',22,'3102 Forster Way','2257698298',155),(56,'Helyn','Bainbridge','2022-04-25',4,'9 Sage Drive','5831668504',156),(57,'Barnett','McClurg','2022-06-26',91,'5 Novick Pass','6167780232',157),(58,'Nessy','Lealle','2022-05-31',45,'6465 Moose Trail','1924636154',158),(59,'Maxie','Meneux','2022-06-22',49,'65 Homewood Street','5176282750',159),(60,'Ester','Klimontovich','2022-06-08',44,'46 West Trail','7655669849',160),(61,'Dani','Dowers','2022-08-07',43,'6 Monica Point','6444423124',161),(62,'Babbie','Shellshear','2022-06-12',80,'59182 Russell Plaza','3177829195',162),(63,'Binny','Carlyle','2022-07-02',85,'4439 Weeping Birch Terrace','3556716028',163),(64,'Natividad','McCrisken','2023-01-27',47,'361 Sullivan Terrace','2166201328',164),(65,'Danny','Chisnell','2022-03-04',68,'45094 Hazelcrest Plaza','2824522176',165),(66,'Ebony','Loines','2022-02-26',6,'0011 Nobel Park','6168733583',166),(67,'Chase','Kither','2022-04-05',92,'07 Laurel Alley','2948431090',167),(68,'Erena','Gostyke','2022-05-07',54,'98972 Butterfield Plaza','8777266996',168),(69,'Paton','Foran','2022-07-22',83,'23773 Mayfield Pass','1345750305',169),(70,'Ewell','Purdey','2022-04-09',11,'8 Hoepker Alley','9986966332',170),(71,'Cherish','Deevey','2022-10-29',64,'29 Clove Drive','7408815064',171),(72,'Tanhya','de Werk','2023-01-30',60,'78089 High Crossing Crossing','8706357794',172),(73,'Danita','Rignold','2022-07-22',13,'51 Golden Leaf Road','9628578448',173),(74,'Syd','Jarrett','2022-03-02',82,'7 Moland Parkway','3617853717',174),(75,'Harp','Siggin','2022-09-04',91,'75680 Lerdahl Center','5513586302',175),(76,'Chrissie','Perkin','2022-12-03',82,'529 Clemons Terrace','6136795827',176),(77,'Les','Pallent','2022-10-15',94,'94 Di Loreto Pass','6568716737',177),(78,'Knox','Sogg','2022-04-07',53,'9 Tony Parkway','2088958435',178),(79,'Teddie','Curphey','2022-06-06',12,'38987 Maple Wood Road','4207936359',179),(80,'Tobi','Yacobsohn','2022-10-29',6,'7 Lillian Trail','1062915971',180),(81,'Morgan','Snartt','2022-05-17',79,'12380 Northwestern Drive','4442581955',181),(82,'Nisse','Noden','2022-11-23',65,'78934 Evergreen Street','7169014529',182),(83,'Elwira','Crehan','2022-09-23',1,'02 Shopko Lane','4703513582',183),(84,'Linoel','Testro','2022-10-31',83,'8 Daystar Terrace','6507997206',184),(85,'Rosanne','Meredyth','2022-06-04',40,'0 Fair Oaks Lane','3241365453',185),(86,'Dalston','Darbey','2022-04-09',94,'916 Luster Plaza','5665167967',186),(87,'Veronique','Walduck','2022-12-29',78,'3390 Eagan Terrace','5663278590',187),(88,'Lyda','Loosely','2022-09-24',4,'79920 Washington Place','3991630118',188),(89,'Aurelie','Alessandrucci','2022-10-26',29,'0334 Forest Center','5645423048',189),(90,'Zondra','Bour','2022-11-25',58,'5 Coolidge Place','1287459803',190),(91,'Addi','Ussher','2022-11-27',85,'887 Roth Lane','6036042594',191),(92,'Jess','Caney','2022-05-25',31,'30 Mendota Center','9443341798',192),(93,'Estrellita','Garza','2022-07-09',79,'74 Hollow Ridge Avenue','3637548157',193),(94,'Darin','Fossey','2022-08-04',82,'66635 Brickson Park Terrace','2585187517',194),(95,'Christiano','Dorton','2022-09-03',42,'50420 Clove Lane','7535386352',195),(96,'Ricoriki','Jaulmes','2022-10-25',86,'3 Forest Run Avenue','1947148233',196),(97,'Editha','Rowlands','2022-03-15',9,'7 Havey Alley','8462433164',197),(98,'Warde','Haglington','2022-11-18',45,'9076 Commercial Street','4223524468',198),(99,'Griswold','Sancho','2022-09-18',57,'20614 Jackson Center','1208375871',199),(100,'Elsa','Tolhurst','2022-09-24',71,'514 Holmberg Court','8364939633',200),(101,'k','s',NULL,12,'del','34804441414',303),(102,'k','s',NULL,43,'del','31038104804',303),(103,'k','s',NULL,31,'del','4287408',303),(104,'k','s',NULL,4,'del','4198740194',303),(105,'ks','somani',NULL,41,'delhi','959871401',303),(106,'k','s',NULL,13,'6fkha','671441974',303),(107,'k','s',NULL,13,'afh','4794174',303),(108,'ks','hfla',NULL,341,'fajlfaf','479414',303);
/*!40000 ALTER TABLE `retailer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (91,23),(80,23),(28,33),(66,21),(46,50),(77,21),(9,1),(7,60),(12,50),(75,35),(73,83),(54,85),(42,33),(86,6),(89,1),(63,53),(1,1),(8,1),(82,12),(4,1),(15,1),(62,74),(30,2),(100,35),(1,1),(32,59),(1,1),(75,35),(98,1),(1,1),(55,21),(31,39),(60,61),(30,2),(92,1),(5,6),(2,17),(66,21),(1,1),(5,6),(8,1),(9,1),(2,17),(36,1),(16,19),(15,1),(42,5),(99,1),(31,79),(3,1),(21,1),(67,46),(43,1),(2,17),(12,47),(54,17),(82,42),(54,34),(84,1),(5,6),(97,3),(28,63),(32,31),(97,83),(1,1),(55,21),(49,83),(71,1),(2,17),(50,35),(8,1),(100,35),(79,5),(18,20),(23,48),(99,1),(22,1),(60,11),(23,15),(54,17),(66,21),(11,81),(100,35),(46,82),(4,1),(73,84),(14,44),(53,65),(99,1),(1,1),(32,33),(46,31),(47,2),(10,20),(21,1),(1,1),(2,17),(99,1),(15,1),(10,20);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2023-03-26 23:30:37
