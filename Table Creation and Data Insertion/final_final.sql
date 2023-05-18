-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmsproject2
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
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (94,75),(96,38),(60,21),(99,51),(76,31),(8,13),(28,16),(80,35),(88,41),(81,12),(58,95),(98,17),(12,36),(43,44),(82,56),(41,95),(57,84),(94,99),(87,18),(6,19),(9,33),(33,77),(68,15),(13,86),(45,100),(32,84),(66,34),(31,26),(52,94),(53,84),(36,97),(42,26),(61,73),(65,7),(3,32),(14,94),(86,7),(4,73),(83,57),(48,18),(77,9),(52,94),(100,91),(16,54),(8,58),(58,32),(73,50),(2,43),(97,63),(28,52),(36,37),(96,67),(89,25),(67,45),(11,76),(35,31),(41,80),(73,42),(93,12),(50,92),(36,62),(25,25),(94,74),(66,78),(70,55),(44,81),(25,61),(47,49),(10,35),(24,15),(99,19),(95,19),(14,15),(41,26),(80,45),(52,99),(30,45),(99,27),(81,19),(43,2),(45,100),(18,41),(82,21),(51,45),(66,43),(2,28),(77,53),(94,38),(17,42),(7,16),(21,19),(89,9),(61,26),(51,97),(78,15),(62,64),(93,81),(30,25),(77,92),(62,87);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `category` VALUES (58,'Adventure|Comedy'),(66,'Animation'),(91,'Antiques & Collectibles'),(92,'Art Supplies'),(6,'AUtomative'),(11,'Baby Products'),(18,'Beauty & Accessories'),(26,'Beauty & Accessories'),(32,'Beauty & Accessories'),(51,'Beauty & Accessories'),(70,'Beauty & Accessories'),(4,'Beauty & Personal Care'),(79,'Bicycles'),(76,'Board Games'),(8,'Books & Media'),(29,'Books & Media'),(31,'Books & Media'),(100,'Car Accessories'),(1,'Clothing'),(45,'Clothing'),(65,'Clothing'),(67,'Clothing'),(68,'Clothing'),(74,'Clothing'),(30,'Comedy'),(50,'Comedy'),(97,'Computers & Laptops'),(89,'Drama'),(2,'Electronics'),(27,'Electronics'),(28,'Electronics'),(33,'Electronics'),(36,'Electronics'),(42,'Electronics'),(48,'Electronics'),(53,'Electronics'),(57,'Electronics'),(72,'Electronics'),(78,'Electronics'),(96,'Electronics'),(7,'Food & Beverage'),(9,'Furniture & Decor'),(88,'Gifts'),(69,'Golf'),(87,'Hand Tools'),(14,'Health & Wellness'),(3,'Home & Kitchen'),(19,'Home Appliances '),(54,'Horror'),(17,'Jewelery & Watches'),(61,'Kids & baby'),(94,'Kids & Baby'),(37,'Mens Fashion'),(47,'Mens Fashion'),(56,'Mens Fashion'),(60,'Mens Fashion'),(62,'Mens Fashion'),(63,'Mens Fashion'),(71,'Mobile Devices'),(21,'Musical Instruments'),(24,'Office Furniture'),(38,'Office Furniture'),(39,'Office Furniture'),(41,'Office Furniture'),(43,'Office Furniture'),(46,'Office Furniture'),(49,'Office Furniture'),(52,'Office Furniture'),(64,'Office Furniture'),(83,'Office Furniture'),(84,'Office Furniture'),(93,'Office Furniture'),(95,'Office Furniture'),(12,'Office supplies'),(13,'Outdoor Living'),(44,'Outdoor Living'),(80,'Outdoor Living'),(82,'Outdoor Living'),(85,'Outdoor Living'),(20,'Party Supplies'),(15,'Pet Supplies'),(86,'Power Tools'),(16,'Shoes & Accessories'),(22,'Shoes & Accessories'),(25,'Shoes & Accessories'),(35,'Shoes & Accessories'),(40,'Shoes & Accessories'),(55,'Shoes & Accessories'),(59,'Shoes & Accessories'),(73,'Shoes & Accessories'),(81,'Shoes & Accessories'),(90,'Shoes & Accessories'),(99,'Shoes & Accessories'),(98,'Smart Home'),(5,'Sports & Outdoors'),(75,'Tennis'),(10,'Toys & Games'),(23,'Video Games'),(34,'Video Games'),(77,'Winter Sports');
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
  PRIMARY KEY (`Customer_ID`),
  KEY `customer_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Renard','Storm','2022-09-29',95,1,'Tomscot','Dongsheng','33','9016072619'),(2,'Simona','Tibols','2022-06-27',85,6311,'Huxley','Hengelo','4','7739233309'),(3,'Jere','Arend','2022-03-30',62,328,'Hazelcrest','Mospyne','2524','5641811345'),(4,'Ernesta','Waudby','2023-02-08',19,94632,'Hintze','Jiuhu','94744','4222360853'),(5,'Maible','Preto','2022-09-01',36,6659,'Schmedeman','Xinshui','80','9389830512'),(6,'Jerad','Dmych','2022-03-24',61,8721,'Shasta','Polonne','49613','3875386292'),(7,'Xenia','Saffon','2022-06-07',9,51008,'Meadow Vale','Ilongero','5265','4718906481'),(8,'Georgina','Ruprecht','2022-11-24',58,86,'Coolidge','Palenggihan','932','1848639064'),(9,'Manya','McMurdo','2022-06-26',23,7,'Superior','Selopuro','9','3481037782'),(10,'Everard','Misselbrook','2022-08-04',46,24,'Waxwing','Gusev','9','5552022118'),(11,'Federica','Cleminshaw','2022-04-07',97,53948,'Hermina','Sasovo','9','5362437187'),(12,'Selina','Gepson','2023-02-01',91,32036,'Ridgeview','Huaping','7267','3739991848'),(13,'Lillian','Ciobotaru','2022-11-25',80,4,'Warbler','Zásmuky','7903','1103164901'),(14,'Van','Jeannequin','2022-05-22',96,61,'New Castle','Grazhdanka','59','8466817969'),(15,'Zsa zsa','Norster','2022-03-30',32,276,'Nobel','Union','7983','5487286885'),(16,'Kerry','Durrett','2022-12-25',3,3,'Kim','Ba?ka Topola','9020','4405048987'),(17,'Hettie','Kolodziej','2022-09-29',37,1901,'Milwaukee','Pszczew','49','7084989331'),(18,'Katleen','Garfoot','2022-10-19',44,922,'Walton','Vanadzor','95994','1885519777'),(19,'Nicola','Chittleburgh','2022-07-10',86,9,'Carpenter','Na???l?n','8125','4904168349'),(20,'Brunhilda','Hothersall','2022-07-08',95,95157,'Maple','Geshan','100','8131380159'),(21,'Emalia','Pounds','2022-07-30',18,13,'Hauk','Kamenjane','32947','7258910644'),(22,'Susy','Lundon','2022-07-22',22,74,'Old Gate','Piquillín','5','9864324554'),(23,'Larine','Server','2023-01-17',28,848,'Gina','Novobiryusinskiy','05784','8856698359'),(24,'Micheal','Denne','2022-02-17',18,1,'Kropf','Kudang','22','9832132449'),(25,'Lockwood','Binstead','2022-04-19',14,0,'3rd','Mandepa Barat','76457','7236583153'),(26,'Elena','Pauwel','2022-09-30',99,32593,'Towne','Caherconlish','0','4253345831'),(27,'Reid','Duke','2022-05-17',62,9,'Dahle','Los Pinos','93','1228113545'),(28,'Derk','Bernardoux','2022-12-28',24,5317,'Main','Mulan','3','6639215115'),(29,'Germain','Scanes','2022-11-03',56,0,'Bayside','Soest','711','9265386565'),(30,'Aretha','Culbert','2022-06-14',67,62503,'Fordem','Lilongwe','90','6759977963'),(31,'Thomasa','Clausson','2022-10-31',16,8,'Fuller','Kinnegad','77767','5093085601'),(32,'Johannes','Bridat','2022-04-01',1,5,'Laurel','Pengdian','11','1619439263'),(33,'Lanita','Daggett','2022-09-16',94,1610,'Canary','Xintang','140','7175132375'),(34,'Sherwood','Lanmeid','2022-03-11',56,11188,'Maywood','Montbéliard','45','1344624495'),(35,'Cammie','Riordan','2022-09-04',48,81,'Oneill','Dambarta','911','5724669722'),(36,'Correy','Kettlestringe','2022-05-02',94,4,'Maple Wood','Chongmin','22','1524772459'),(37,'Roddie','Kellock','2022-11-05',38,4146,'Shasta','Vacaria','0','4983615183'),(38,'Wolfgang','Jeannot','2022-03-06',77,90,'2nd','Alukama','51','5569369694'),(39,'Vonni','Sydes','2022-06-12',57,7744,'Linden','Verenchanka','1240','3683366562'),(40,'Donavon','Odam','2022-02-21',55,298,'Vera','Casma','353','7623977490'),(41,'Micheline','Deelay','2022-10-31',51,6937,'John Wall','Batanghari','58','7255840178'),(42,'Emilie','Dobinson','2022-04-27',83,67,'Onsgard','Shimen','960','3152469707'),(43,'Elfrida','Pulman','2022-09-29',98,81830,'Butternut','Shaxi','7803','5461756581'),(44,'Rosaleen','Mervyn','2022-08-11',12,2628,'Amoth','Jingling','59','3552336570'),(45,'Farand','Baumert','2022-07-16',5,9780,'Sachtjen','Cisoka','1697','2507282501'),(46,'Hoyt','Peasgood','2022-07-27',16,224,'Transport','Makrýgialos','62965','7372523660'),(47,'Cary','Godsafe','2022-11-11',84,95,'Monica','Melaka','8','5414773436'),(48,'Malchy','Hasell','2022-07-22',60,7725,'Waxwing','Dabu','21','5243175503'),(49,'Olga','Gendricke','2022-08-13',99,77,'Calypso','Dolní ?ermná','4','6738579154'),(50,'Noelyn','Folds','2022-02-17',33,36,'Orin','Hule','07','6417234570'),(51,'Francklin','Adin','2022-04-16',65,8,'Clove','?awr al B??ah','0','3473747414'),(52,'Konstantin','Glendining','2022-06-14',6,83508,'Norway Maple','Sychëvo','4003','5143596846'),(53,'Calla','Mayhou','2022-08-24',56,279,'Arrowood','Irkutsk','77990','3432004137'),(54,'Lynn','Morten','2023-02-04',59,6,'Daystar','Ermelo','2','8523953114'),(55,'Tadeas','Storks','2023-01-20',44,40120,'Novick','Bia?a','0462','3845194375'),(56,'Penrod','Betteridge','2022-03-30',19,2,'Logan','Ku?tilj','59477','2716055576'),(57,'Carena','Giron','2022-11-23',25,0,'Montana','Mamfe','07413','8618877000'),(58,'Bjorn','Stork','2022-03-10',3,233,'Homewood','Niños Heroes','19366','3816416378'),(59,'Jenda','Curwen','2022-10-07',55,3,'Michigan','Kaduy','98','3204779934'),(60,'Betsey','Morford','2022-12-05',58,70741,'Southridge','Patpata Segundo','83','1156397447'),(61,'Enrika','Torbet','2022-10-23',4,45,'Kensington','Kabinda','977','7969032201'),(62,'Maureene','Mayoh','2022-08-02',48,10974,'Judy','Baolong','538','8427662528'),(63,'Berkley','Gabbidon','2022-10-10',64,0,'Bellgrove','Tarq?my?','672','7302055420'),(64,'Tobiah','Cortez','2022-07-07',83,9193,'Schiller','Tanjung','4','5766856627'),(65,'Teriann','Lax','2022-11-19',6,6862,'Sullivan','Francisco Villa','27','1343023048'),(66,'Kelsi','Wimpenny','2023-01-02',66,850,'Main','Lyudinovo','196','7787123621'),(67,'Agata','Borwick','2022-03-18',43,2,'Hauk','Vykhino-Zhulebino','18','8892391847'),(68,'Tabbitha','Iglesia','2022-07-29',89,9,'Maple Wood','?ita','65','4346781878'),(69,'Coop','Holtaway','2022-12-31',90,86175,'Ilene','Nagrog Wetan','33','9533964156'),(70,'Clarice','Cassy','2023-01-12',30,2,'Golf View','Belköl','62','2373666968'),(71,'Theodoric','Duferie','2023-01-23',32,22,'Old Shore','Tashang','81021','8789659046'),(72,'Paulina','Shakesby','2022-11-26',42,79,'Talmadge','Vai?ode','551','2406012570'),(73,'Abraham','Maybery','2022-08-05',87,6798,'Darwin','Nyima','401','4095806355'),(74,'Clint','Messenger','2022-07-24',66,0,'Farmco','Zhayang','7','1229142914'),(75,'Angelika','Baumford','2022-12-25',44,1,'Charing Cross','Hengshan','2326','3195533425'),(76,'Patricio','Stanborough','2022-11-28',15,418,'Ridgeway','Otwock','270','8513542881'),(77,'Jerald','Eglin','2022-07-28',97,7081,'Melrose','Parakanpanjang','683','9186268679'),(78,'Jemimah','Medendorp','2022-10-07',56,189,'Arizona','Yangzi','46','4908418336'),(79,'Mindy','Duckett','2022-05-22',90,44,'Del Sol','Xinbao','48340','5461675867'),(80,'Chan','Charrisson','2022-03-06',33,18,'Lyons','Vacoas','6','6976392841'),(81,'Estel','Friend','2022-05-20',20,79553,'Maryland','Yuza','32244','6325015013'),(82,'Row','Callen','2022-11-16',96,12,'Claremont','Castelo de Vide','2015','9541121219'),(83,'Catha','Scholte','2022-05-30',3,85,'Graceland','Bela Vista do Paraíso','96088','3534402521'),(84,'Conan','Willingham','2022-08-11',26,729,'Bashford','Bamiantong','656','3045131370'),(85,'Erin','Urrey','2022-11-16',32,3,'Knutson','Song','8','2202589200'),(86,'Leonardo','Meeny','2022-04-18',91,2484,'Lotheville','Sundbyberg','73780','2952228742'),(87,'Simon','Blakeston','2022-03-16',11,7837,'Meadow Ridge','Sokolnice','96','7817692422'),(88,'Tamiko','Ionnidis','2022-09-28',52,56960,'Golden Leaf','Ashley','3','7142614307'),(89,'Hugues','Chawkley','2023-01-06',10,8803,'5th','Kampunganyar','94105','1829980285'),(90,'Bernard','Ferreira','2022-03-02',89,367,'Crest Line','Makui','1','4671421525'),(91,'Cesar','Kildale','2022-07-12',93,56,'Southridge','Mizdah','6515','3013266402'),(92,'Agosto','Blann','2022-09-23',17,0,'Holy Cross','Sanban','9','9905261681'),(93,'Brigid','de\'-Ancy Willis','2022-12-09',23,563,'Westend','Naprawa','378','9647990429'),(94,'Charmion','Gelletly','2022-05-07',17,16346,'Darwin','Níkaia','3','7813739795'),(95,'Hermione','Jeckell','2022-04-04',56,9911,'Milwaukee','Rancabelut','9338','2644885762'),(96,'Gerianne','Wheeldon','2022-03-19',27,826,'Dryden','Bouças','630','7364618345'),(97,'Bernarr','Powelee','2022-11-16',78,47,'5th','Eadestown','113','1582775327'),(98,'Catie','Baselli','2022-09-09',73,113,'Myrtle','Tambakmerak','0051','3287480071'),(99,'Simonette','Hambatch','2022-08-26',21,24,'2nd','Bafoussam','963','6846635858'),(100,'Cobbie','Paget','2022-08-29',11,39,'Cody','Ban Rangsit','12','9415909995');
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
INSERT INTO `delivery` VALUES (32,27,3,'2022-03-22'),(45,84,2,'2022-09-03'),(45,26,47,'2023-01-09'),(80,98,90,'2022-11-06'),(1,98,99,'2022-09-26'),(79,77,19,'2022-10-06'),(58,4,36,'2022-06-28'),(16,59,15,'2022-11-05'),(16,100,80,'2022-08-13'),(23,71,38,'2022-05-19'),(29,63,76,'2022-08-16'),(61,82,3,'2022-07-04'),(83,89,4,'2022-08-23'),(52,56,63,'2022-04-12'),(55,94,3,'2023-01-28'),(85,65,52,'2022-07-31'),(52,63,59,'2022-09-10'),(47,34,4,'2022-10-14'),(87,62,26,'2022-09-05'),(37,98,4,'2022-10-17'),(60,23,27,'2022-12-29'),(64,72,34,'2022-11-17'),(97,22,13,'2022-08-24'),(67,2,81,'2022-12-02'),(37,26,71,'2022-06-16'),(36,19,64,'2022-08-26'),(77,34,10,'2022-10-18'),(75,100,37,'2022-12-12'),(62,12,69,'2022-07-16'),(56,74,54,'2022-05-01'),(90,31,36,'2022-07-29'),(53,94,87,'2022-05-07'),(96,70,62,'2022-06-15'),(62,65,46,'2022-11-16'),(26,4,92,'2022-10-17'),(46,82,27,'2022-03-06'),(31,69,2,'2022-03-05'),(19,83,66,'2022-12-20'),(70,11,32,'2022-10-23'),(6,16,56,'2022-07-28'),(25,82,45,'2022-10-17'),(83,71,67,'2022-04-16'),(63,69,87,'2022-06-20'),(70,6,84,'2022-04-18'),(67,10,25,'2022-11-05'),(55,47,76,'2022-09-20'),(66,13,22,'2023-01-12'),(47,81,65,'2022-09-24'),(95,97,62,'2023-01-21'),(42,46,36,'2022-10-14'),(97,32,75,'2022-06-13'),(22,90,53,'2022-05-02'),(23,76,18,'2022-03-30'),(65,12,73,'2022-03-04'),(39,40,75,'2022-06-22'),(38,16,59,'2022-12-24'),(39,70,36,'2022-11-13'),(15,83,2,'2022-09-21'),(83,22,97,'2022-12-07'),(21,36,44,'2022-06-28'),(6,30,93,'2022-04-14'),(85,55,48,'2022-09-27'),(3,40,70,'2022-05-16'),(96,53,9,'2022-07-11'),(52,59,28,'2022-12-23'),(48,98,78,'2022-04-12'),(42,3,93,'2022-11-04'),(59,65,30,'2022-11-30'),(2,38,7,'2022-03-15'),(95,49,72,'2022-08-22'),(12,86,33,'2022-12-10'),(79,96,63,'2022-08-02'),(78,95,45,'2023-01-18'),(75,96,37,'2022-06-07'),(10,68,96,'2022-03-29'),(86,98,74,'2022-04-26'),(75,88,25,'2023-01-19'),(95,23,73,'2022-06-20'),(37,45,23,'2022-10-23'),(6,28,51,'2022-04-03'),(28,54,32,'2022-09-15'),(4,19,47,'2022-02-13'),(42,80,94,'2022-06-24'),(20,94,50,'2022-11-29'),(92,62,27,'2022-10-19'),(8,67,9,'2022-02-26'),(48,77,35,'2022-06-04'),(77,56,94,'2022-05-07'),(87,56,13,'2022-10-06'),(62,31,48,'2022-11-12'),(12,14,51,'2022-12-13'),(70,3,41,'2022-04-07'),(1,99,10,'2022-07-10'),(67,65,86,'2022-06-27'),(94,66,11,'2023-01-29'),(48,63,34,'2022-08-03'),(44,84,99,'2022-10-04'),(96,94,18,'2022-03-01'),(18,1,70,'2022-07-13'),(61,91,1,'2022-08-12');
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
  PRIMARY KEY (`Delivery_person_ID`),
  KEY `del_person_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (1,'Rollin','McBoyle','2022-04-21',16,'Male','41517 Debra Center','7927529577'),(2,'Katherina','Darey','2022-07-06',3,'Female','32076 Golf Course Plaza','3745678178'),(3,'Fleurette','Dies','2022-02-26',88,'Female','4 Mayer Way','3484477119'),(4,'Honoria','Sleet','2022-03-02',28,'Female','2 Bashford Point','8093325127'),(5,'Jourdain','Yair','2022-07-16',10,'Male','25267 Nevada Park','7029960491'),(6,'Titos','Carrabott','2023-01-05',88,'Male','89655 Fordem Street','9057803773'),(7,'Ginger','Munnis','2022-07-02',56,'Female','414 Northport Junction','5275933875'),(8,'Fleur','Teaser','2022-03-19',21,'Female','6 Swallow Road','9166049470'),(9,'Gerri','Ratcliffe','2023-01-18',88,'Male','36 Westerfield Trail','9882882423'),(10,'Estrella','Kelsow','2022-11-15',16,'Female','39 Gina Trail','6208862299'),(11,'Prince','Coye','2022-05-26',65,'Male','6300 Sunfield Hill','4847892512'),(12,'Tadio','Brownsea','2023-01-30',18,'Male','6 Pleasure Place','1831461124'),(13,'Winfred','Garett','2023-02-02',30,'Male','9291 Aberg Hill','4806986183'),(14,'Luci','Haitlie','2022-07-06',84,'Female','2436 Trailsway Court','9158737625'),(15,'Abie','Smullin','2022-03-06',67,'Male','02 Ridgeview Avenue','8887379973'),(16,'Kendricks','Delicate','2022-05-30',32,'Male','49 Mallory Circle','1116834993'),(17,'Mattie','Hudd','2022-06-26',19,'Male','1 Evergreen Way','7199482191'),(18,'Nertie','Rawdall','2022-11-21',21,'Female','8477 Anthes Way','2081709599'),(19,'Aurel','McVeigh','2022-03-01',54,'Female','247 Arkansas Alley','2495952093'),(20,'Jo-anne','Quilligan','2022-03-28',90,'Female','09 Talmadge Junction','3225875894'),(21,'Martainn','Windham','2022-10-05',31,'Male','2862 Oakridge Circle','3771006839'),(22,'Donica','MacWhirter','2022-11-10',31,'Female','91845 Chinook Place','5316391666'),(23,'Odetta','Feehily','2022-07-04',89,'Female','948 Golden Leaf Place','6762923067'),(24,'Shelley','MacKean','2023-01-05',39,'Male','1911 Dottie Road','7732453414'),(25,'Kimberley','Bandiera','2022-07-13',82,'Female','3241 Rieder Parkway','1974636383'),(26,'Sondra','Jackways','2022-06-04',54,'Male','6147 Almo Drive','3058650590'),(27,'Iago','Beddon','2022-04-03',26,'Male','9 Crownhardt Way','7748454975'),(28,'Vitia','Le Port','2022-12-05',43,'Female','85 Kings Circle','6272026378'),(29,'Stirling','Dunbleton','2022-08-13',77,'Male','715 Loftsgordon Junction','6288753145'),(30,'Nanon','Loren','2022-07-21',94,'Female','18 Mosinee Park','3656004089'),(31,'Des','Mannakee','2022-04-20',10,'Male','5983 American Ash Drive','8852539123'),(32,'Vale','Fergie','2022-06-13',41,'Male','5 Linden Pass','9287831886'),(33,'Inness','Buckthorpe','2022-10-31',23,'Male','52215 Waxwing Park','5312992182'),(34,'Klaus','Abella','2023-02-03',33,'Male','870 Anzinger Trail','6154084809'),(35,'Roddie','Pedwell','2022-07-29',21,'Male','0 Waubesa Park','9225990090'),(36,'Cordy','Racher','2022-08-18',69,'Female','58 Sycamore Circle','3723516597'),(37,'Nevin','Barth','2022-06-24',64,'Male','92787 Hooker Parkway','5044828531'),(38,'Caressa','Robberts','2022-07-27',47,'Female','4 Thierer Way','2775200154'),(39,'Kenneth','Showers','2022-03-19',91,'Male','4712 Florence Circle','6818383478'),(40,'Mada','Gierke','2022-11-21',28,'Female','9072 Kropf Pass','6401777591'),(41,'Conrad','Matlock','2022-03-31',53,'Male','987 Artisan Way','4782303855'),(42,'Richie','Tregonna','2022-05-05',61,'Male','2784 Sullivan Circle','6932659023'),(43,'Luce','Fowlie','2022-03-20',51,'Male','4 Oxford Place','3667977296'),(44,'Paulie','Shurrocks','2022-09-10',67,'Male','66450 Melby Trail','2573416029'),(45,'Richart','Rubinsohn','2022-08-25',46,'Male','65580 Hauk Alley','2665286517'),(46,'Chandal','Sautter','2022-03-27',59,'Female','270 Fremont Lane','8659588847'),(47,'Jerrie','Snary','2022-03-06',47,'Male','8 Carey Junction','3591670634'),(48,'Loleta','Hauxley','2022-12-03',86,'Female','242 Moland Circle','5714911302'),(49,'Estrella','Yezafovich','2022-07-16',31,'Female','2 Anderson Trail','2044825432'),(50,'Barde','Chaytor','2022-09-12',12,'Male','1266 Jana Hill','2628039674'),(51,'Cindi','Critzen','2023-01-26',20,'Female','01020 Glendale Trail','6137294400'),(52,'Kincaid','Vasnev','2022-03-04',65,'Male','22 Commercial Drive','4386272816'),(53,'Maren','MacBey','2022-10-21',38,'Female','666 Carey Circle','6505530940'),(54,'Ermanno','Paolillo','2022-12-12',73,'Male','4053 Monterey Pass','7274628592'),(55,'Danni','Teesdale','2022-11-25',92,'Female','90206 Farwell Alley','7978504250'),(56,'Elisabet','Smylie','2022-06-22',75,'Female','80 Eagle Crest Pass','6206555005'),(57,'Doloritas','Jirus','2022-12-25',14,'Female','57 Mccormick Drive','1876455637'),(58,'Sissie','Krysztofiak','2022-09-12',8,'Female','17742 Center Alley','1229307216'),(59,'Cassie','Speares','2022-03-24',8,'Male','3 Hayes Park','3433212040'),(60,'Johnath','Haversum','2022-06-21',27,'Female','35 Summerview Terrace','3845889045'),(61,'Aubrey','Bugler','2022-10-10',26,'Male','2508 Hanson Lane','8311026850'),(62,'Cordie','Filoniere','2023-02-05',49,'Female','4 Becker Crossing','1026281867'),(63,'Pall','Wale','2022-03-08',80,'Male','9776 Dayton Terrace','4011847271'),(64,'Kennie','Olyfat','2022-08-05',92,'Male','45684 Maple Junction','2208054430'),(65,'Anthony','Cattel','2022-04-11',30,'Male','50873 Vahlen Way','6166074490'),(66,'Dene','Livermore','2023-01-01',66,'Male','77 Brown Way','5227400694'),(67,'Yasmin','Biasotti','2022-12-21',32,'Male','34 Lyons Court','4353323133'),(68,'Cosetta','Robbeke','2022-02-10',4,'Female','298 Bluejay Alley','3909665130'),(69,'Nappy','Donaghie','2022-03-06',86,'Male','69006 Thackeray Plaza','9273436223'),(70,'Osborne','Seater','2023-01-04',36,'Male','4718 Waubesa Way','2393370936'),(71,'Vaclav','Burnham','2022-12-15',88,'Male','281 Elmside Pass','5945604459'),(72,'Padraic','Grasha','2022-11-26',45,'Male','182 Southridge Road','3127513454'),(73,'Alex','Whicher','2022-08-04',61,'Male','76632 Badeau Park','3512178551'),(74,'Gal','Mattinson','2022-10-10',28,'Male','690 Montana Hill','6856153137'),(75,'Elfrida','Minards','2022-09-02',49,'Female','30 Orin Way','6843395807'),(76,'Serena','Groger','2023-01-25',6,'Female','54747 Mandrake Way','4999312399'),(77,'Wanids','Danilishin','2022-04-30',31,'Female','7432 Arrowood Road','6727253776'),(78,'Delphinia','Jobbins','2022-03-13',67,'Female','720 Bunting Park','1756303492'),(79,'Arty','Faulconbridge','2022-09-18',17,'Male','6521 Larry Alley','3502297710'),(80,'Rosaleen','Messer','2022-12-14',97,'Female','447 Sachtjen Alley','3701996701'),(81,'Nadiya','Bilbee','2022-03-01',70,'Female','20 Hansons Street','2759218121'),(82,'Mohammed','Millions','2022-10-07',5,'Male','2 Monterey Drive','7904006490'),(83,'Sande','Handsheart','2022-07-30',39,'Female','933 Northfield Road','1394136972'),(84,'Cam','Kelsow','2022-04-19',56,'Male','88699 David Drive','7054499716'),(85,'Gianna','Gravy','2022-04-09',31,'Male','148 Walton Avenue','1972333921'),(86,'Carter','Tithacott','2022-10-01',1,'Male','351 Elka Trail','9196907829'),(87,'Susette','Dran','2022-06-10',18,'Female','4850 Orin Parkway','4122076493'),(88,'Kele','Strathearn','2022-11-14',47,'Male','3 Schlimgen Junction','7122962021'),(89,'Trumann','Braisted','2022-07-26',45,'Male','58266 Arizona Park','8142084783'),(90,'Libbi','Kingzeth','2022-08-16',32,'Female','2 Hazelcrest Circle','8866680706'),(91,'Joly','Burgh','2023-02-03',68,'Female','8 Delaware Court','9009982754'),(92,'Ginni','Pinwell','2022-08-05',9,'Female','36465 Elka Drive','8116048581'),(93,'Odey','Halliwell','2022-09-08',93,'Male','84 Farragut Hill','5934296675'),(94,'Wallis','Artus','2022-08-21',57,'Male','24564 3rd Circle','4555702732'),(95,'Durward','Haldene','2022-05-02',46,'Male','93 Monica Street','6686663370'),(96,'Shani','MacAllester','2022-12-19',18,'Female','4353 Melby Drive','8621517735'),(97,'Jan','Rigolle','2023-01-23',80,'Male','4957 Rowland Street','2734771732'),(98,'Mathias','Koubu','2022-07-11',82,'Male','6807 Holmberg Hill','7983439118'),(99,'Mikkel','Sherwyn','2022-05-12',42,'Male','94622 Golf View Plaza','4445675891'),(100,'Eachelle','Hehnke','2022-07-31',21,'Female','786 Coleman Center','1025175342');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_order`
--

LOCK TABLES `final_order` WRITE;
/*!40000 ALTER TABLE `final_order` DISABLE KEYS */;
INSERT INTO `final_order` VALUES (1,89,6,14.11,'2022-10-28'),(2,35,64,11.36,'2022-08-26'),(3,18,74,13.86,'2023-01-24'),(4,23,12,9.79,'2022-12-23'),(5,89,63,4.42,'2022-11-15'),(6,68,77,18.73,'2022-12-19'),(7,86,21,5.34,'2023-02-07'),(8,23,15,14.61,'2022-03-10'),(9,58,64,9.69,'2022-04-07'),(10,37,20,13.24,'2022-03-23'),(11,93,27,7.57,'2022-10-17'),(12,74,48,15.42,'2022-08-18'),(13,83,93,19.66,'2022-11-18'),(14,56,84,19.7,'2022-08-02'),(15,2,13,6.15,'2022-06-21'),(16,4,8,5.21,'2022-12-10'),(17,73,2,12.41,'2022-12-26'),(18,45,5,7.36,'2022-03-31'),(19,65,30,13.5,'2022-09-26'),(20,35,30,11.26,'2022-02-25'),(21,95,100,19.66,'2022-06-04'),(22,81,59,4.91,'2022-05-11'),(23,64,67,7.23,'2022-11-25'),(24,89,77,5.49,'2022-07-03'),(25,28,52,4.93,'2022-04-29'),(26,22,42,9.9,'2022-06-12'),(27,37,82,9,'2022-10-14'),(28,20,19,5.54,'2022-05-24'),(29,82,5,14.97,'2022-12-28'),(30,42,81,12.5,'2023-01-20'),(31,69,83,11.97,'2022-10-23'),(32,75,11,14.3,'2023-01-03'),(33,6,99,17.08,'2022-03-11'),(34,88,42,9.38,'2022-03-01'),(35,62,39,8.04,'2022-04-12'),(36,13,53,6.14,'2022-08-16'),(37,74,25,7.79,'2022-12-20'),(38,41,77,12.83,'2022-02-26'),(39,20,80,11.94,'2023-01-20'),(40,1,69,7.84,'2022-04-21'),(41,99,61,5.19,'2022-12-03'),(42,76,93,7.22,'2023-01-28'),(43,55,98,12.12,'2022-09-23'),(44,6,80,6.04,'2022-03-20'),(45,61,100,17.84,'2022-04-01'),(46,64,88,11.9,'2022-11-11'),(47,15,84,13.51,'2022-06-02'),(48,22,85,16.92,'2023-01-07'),(49,66,38,10.58,'2022-10-07'),(50,78,76,4.74,'2022-08-01'),(51,26,58,9.35,'2022-08-20'),(52,66,28,14.73,'2022-07-18'),(53,40,52,19.41,'2022-07-30'),(54,9,76,15.39,'2022-06-10'),(55,33,52,13.85,'2022-07-30'),(56,70,21,9.95,'2022-03-03'),(57,1,20,16.83,'2022-09-18'),(58,70,77,6.66,'2022-06-12'),(59,65,91,17.79,'2022-06-16'),(60,76,78,4.37,'2022-05-09'),(61,81,8,13.95,'2022-10-15'),(62,28,89,5.44,'2022-11-27'),(63,16,91,17.54,'2022-12-01'),(64,7,12,10.34,'2022-04-28'),(65,56,56,5.79,'2022-04-21'),(66,94,21,17.24,'2022-10-18'),(67,95,58,7.13,'2022-06-20'),(68,67,97,8.74,'2022-04-06'),(69,34,47,14.8,'2022-02-19'),(70,86,85,11.83,'2022-04-20'),(71,28,1,18.1,'2022-08-18'),(72,94,57,19.31,'2022-11-12'),(73,46,15,5.53,'2022-07-31'),(74,70,49,8.86,'2022-03-03'),(75,1,81,10.18,'2022-12-10'),(76,49,5,6.24,'2022-04-18'),(77,56,8,19.08,'2022-04-22'),(78,72,82,11.62,'2022-03-04'),(79,77,46,19.26,'2022-11-27'),(80,61,57,16.05,'2023-01-01'),(81,51,64,6.41,'2023-01-31'),(82,72,92,9.92,'2022-08-16'),(83,79,52,12.49,'2022-02-20'),(84,52,85,18.82,'2022-10-27'),(85,74,53,8.8,'2022-04-15'),(86,48,1,5.2,'2022-11-22'),(87,7,73,16.96,'2022-08-22'),(88,71,73,16.35,'2022-10-11'),(89,13,25,11.93,'2022-04-20'),(90,8,55,11.39,'2022-06-28'),(91,90,100,17.43,'2022-12-02'),(92,56,26,13.2,'2022-08-23'),(93,47,2,10.09,'2022-08-10'),(94,22,5,17.43,'2022-11-12'),(95,87,21,15.9,'2022-10-11'),(96,78,45,6.24,'2022-03-22'),(97,82,84,14.37,'2022-05-03'),(98,27,19,10.67,'2022-08-20'),(99,86,81,10.43,'2022-10-05'),(100,72,52,13.37,'2022-08-17');
/*!40000 ALTER TABLE `final_order` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'astokes0','55uZC8idwv','Delivery Person'),(2,'mickowicz1','GAZiaWL3LoE','Customer'),(3,'wbosher2','pCly4Q','Retailer'),(4,'cpedron3','z0S21IeA5t','Delivery Person'),(5,'jbirkett4','yI1jGqj','Customer'),(6,'psaltmarshe5','zE4HcoCL','Retailer'),(7,'gbloxsom6','IPALAUk','Customer'),(8,'erispin7','5pMLKkTlQAf','Retailer'),(9,'ffutcher8','dCsotxru6jPY','Customer'),(10,'freinbeck9','d14gbvdvwBG','Retailer'),(11,'bsutcliffb','z9GOeHBlBm','Retailer'),(12,'ypengilleya','rF1STai2f5','Customer'),(13,'tradsdalec','LYDkfyee','Customer'),(14,'lbendond','8dzMw2c','Retailer'),(15,'drizzonee','QKvVNAenh9','Delivery Person'),(16,'pchewf','8jnH6Zhne','Retailer'),(17,'agrimsteadg','pLDiFISjBQH','Retailer'),(18,'lgemnetth','CDvdBJ9FK86','Delivery Person'),(19,'fdefreynei','6NgllcB','Customer'),(20,'aoakj','2KvW9HV3iBs','Customer'),(21,'abickerdykek','VbEtIAD5','Customer'),(22,'ceilhersenl','9uej2Lyd9','Retailer'),(23,'tragsdallm','jWRmqyf1r','Customer'),(24,'abrunsenn','9lUIkEYvLeWJ','Retailer'),(25,'ldownero','l1uzYE8r','Customer'),(26,'pbilberyp','H8og1H2Z3Q','Retailer'),(27,'dwillmoreq','A3z4v42szec','Retailer'),(28,'tmarcroftr','K8HpSElS','Retailer'),(29,'esires','XXAczsezCo9Q','Retailer'),(30,'sissacsont','JUxjISLVd6Vt','Customer'),(31,'hkewu','CkwPEat3g9','Customer'),(32,'hbrazearv','CEOlS7hR','Retailer'),(33,'bpashbeew','9SfM3VuGre','Customer'),(34,'mstogillx','geQ1Rr4kQM5','Customer'),(35,'kchimientiy','UULyHBNT9d','Customer'),(36,'vmcandrewz','kfPp3I','Customer'),(37,'lmaven10','EceS3isz61J','Retailer'),(38,'akisar11','RkARyk7QY6','Retailer'),(39,'sbloomfield12','zWP2UdNDF','Retailer'),(40,'taulsford13','lMYYZGx','Customer'),(41,'linns14','ZxzspwpV5sS','Retailer'),(42,'scampa15','S8jM3n5l','Customer'),(43,'smacvain16','8o2hqtvs','Delivery Person'),(44,'ecroucher17','WmtmsR4t','Retailer'),(45,'vdelazenne18','mJ5FLgPPqxU','Delivery Person'),(46,'lstubbe19','FIr6fb','Retailer'),(47,'sgerritsma1a','ZWboweqI','Customer'),(48,'rbickell1b','zcyZWgX','Retailer'),(49,'aharesnape1c','uVLAK8BNS19','Customer'),(50,'nolney1d','eKEmzSXmkZ','Retailer'),(51,'mdyers1e','ropP4XM','Delivery Person'),(52,'gpigny1f','ipvfiI','Customer'),(53,'emccathay1g','ldDm9m','Delivery Person'),(54,'aeberlein1h','BX1o4le','Customer'),(55,'shackforth1i','wDXS4rf','Retailer'),(56,'kchaplyn1j','3HlUnCmR2AwJ','Retailer'),(57,'kjoan1k','zQ2sUAGz7F2','Customer'),(58,'cdray1l','NXY4beH','Retailer'),(59,'ojackman1m','d163BZGJJRst','Customer'),(60,'mquirke1n','2ni6iZOeJw','Delivery Person'),(61,'gmathevet1o','Ywc1psWJx','Customer'),(62,'dcomrie1p','TZ0feRI','Customer'),(63,'dvittery1q','7QQFoy7P','Delivery Person'),(64,'tbiagioni1r','itxPbYTP','Delivery Person'),(65,'ggavriel1s','k94Na3QiBOf','Delivery Person'),(66,'bbiner1t','XJzzHc','Retailer'),(67,'rbabonau1u','oExpBnPJ2z1g','Retailer'),(68,'rborkett1v','oIaUfe41vFw','Customer'),(69,'kpinnocke1w','gyyeJZ','Retailer'),(70,'lhedin1x','AzWpEzek','Retailer'),(71,'wpuvia1z','uVTu2kdX7uG','Delivery Person'),(72,'ahirthe1y','YPqfUvXkCF','Delivery Person'),(73,'aneno20','LGX0VgkLP','Retailer'),(74,'tpridgeon21','82QWNjJb3E1H','Delivery Person'),(75,'ncammell22','9fN3GPG8eM','Retailer'),(76,'smoretto23','PBF81nKQ1','Delivery Person'),(77,'mroundtree24','CykpjKMS0H','Delivery Person'),(78,'cduddle25','nokEKIGDXoF','Customer'),(79,'dvanzon26','8DFXhjtp','Retailer'),(80,'gboater27','xrw1udOvrp','Delivery Person'),(81,'mglauber29','WOJK2HIjY','Customer'),(82,'rboich28','OZ01UGwH9Y6','Retailer'),(83,'pchanning2a','3uYdYK3ScJsl','Delivery Person'),(84,'cgilardone2b','9F3yUvsqW','Retailer'),(85,'follet2c','wmx3PA','Retailer'),(86,'ascalera2d','NVskUDFvizC','Delivery Person'),(87,'cchstney2e','zau01GIdJ','Delivery Person'),(88,'sbrandino2f','fcQsjuj2l','Retailer'),(89,'rwhaites2g','thmrznI','Retailer'),(90,'jlehoux2h','5056q6Hk','Customer'),(91,'acabedo2j','ik6BAGkVh9hY','Retailer'),(92,'bshewsmith2i','1fR5X5M','Retailer'),(93,'cbedin2k','3P0GlfRkyZ5','Delivery Person'),(94,'jvickerstaff2l','DGXUZKT7SG','Customer'),(95,'pfallow2m','w3Z2cN9jz','Retailer'),(96,'kmacfayden2n','T1CL4Li9Zg','Customer'),(97,'oronnay2o','R5s9PrNZz4Mr','Delivery Person'),(98,'msapsforde2p','eNIui7o8c','Customer'),(99,'tkruschev2q','dDf7qG4NHoz','Retailer'),(100,'jgladhill2r','TmDzE3ELmDeo','Customer');
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
  `Product_Availability` varchar(5) DEFAULT 'NO',
  `Product_price_in$` float DEFAULT NULL,
  `Product_name` varchar(120) NOT NULL,
  `Product_Discount` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Product_Category_ID` (`Product_Category_ID`),
  KEY `prod_name_index` (`Product_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Product_Category_ID`) REFERENCES `category` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,86,'YES',1.94,'Telivsion',52),(2,60,'NO',7.76,'Shoes',74),(3,49,'NO',1.8,'Chair',61),(4,30,'NO',1.25,'Telephone',48),(5,88,'YES',7.29,'Shirt',41),(6,14,'NO',1.51,'Notebooks',35),(7,14,'YES',2.9,'Laptop',11),(8,89,'NO',1.78,'Kettle',22),(9,82,'NO',4.04,'Paintings',100),(10,17,'NO',2.29,'Oven',57),(11,80,'YES',3.39,'Laptop',9),(12,34,'YES',8.4,'Span',7),(13,4,'NO',4.71,'Laptop',24),(14,43,'YES',9.87,'Air Conditioner',60),(15,66,'YES',8.99,'Table',64),(16,11,'NO',0.3,'Bitchip',17),(17,40,'NO',4.46,'Soap',96),(18,70,'NO',3.23,'Laptop',6),(19,47,'NO',2.73,'Scissors',93),(20,14,'YES',1.12,'Shirt',53),(21,12,'YES',7.36,'Fan',4),(22,69,'NO',3.24,'Biodex',32),(23,55,'YES',4.36,'Dress',17),(24,13,'YES',10,'Laptop',19),(25,52,'NO',7.39,'Telivsion',28),(26,31,'NO',4.47,'Pen',46),(27,57,'YES',6.08,'Charger',66),(28,96,'YES',8.07,'Socks',85),(29,63,'YES',7.04,'Laptop',57),(30,36,'YES',8.41,'Soap',26),(31,50,'NO',9.35,'Paintings',82),(32,58,'YES',2.17,'Sofa',84),(33,14,'NO',9.92,'Bag',5),(34,99,'NO',2.44,'Bamity',56),(35,17,'NO',7.09,'Span',4),(36,79,'YES',1.34,'Phone',14),(37,63,'NO',7.5,'Dress',65),(38,43,'YES',0.97,'Laptop',84),(39,64,'NO',5.32,'Violen',28),(40,16,'NO',3.71,'Bag',81),(41,83,'NO',7.84,'Hatity',59),(42,17,'YES',0.24,'Cricket Ball',13),(43,45,'YES',0.22,'Bag',93),(44,4,'NO',6.19,'Jar',53),(45,83,'YES',3.05,'Laptop',16),(46,69,'NO',9.63,'Cup',51),(47,26,'YES',9.24,'Bitchip',86),(48,88,'NO',9.57,'Cap',77),(49,51,'YES',5.94,'Telephone',31),(50,96,'YES',8.74,'Phone',67),(51,36,'YES',2.46,'Notebooks',74),(52,46,'YES',2.93,'Overhold',58),(53,64,'NO',9.22,'Overhold',50),(54,39,'NO',2.64,'Dress',57),(55,89,'NO',9.36,'Hatity',83),(56,43,'NO',4.88,'Couch',40),(57,70,'YES',5.4,'Bag',21),(58,74,'YES',0.4,'Daltfresh',97),(59,87,'NO',0.89,'Laptop',36),(60,33,'NO',9.69,'Home Ing',16),(61,51,'NO',9.89,'Telephone',8),(62,100,'YES',9.78,'Golf Ball',79),(63,33,'NO',0.2,'Oven',63),(64,99,'NO',4.07,'Socks',53),(65,45,'YES',9.43,'String',72),(66,57,'YES',9.56,'Table',68),(67,32,'NO',8.93,'Cricket Bat',78),(68,44,'YES',4.32,'Air Conditioner',99),(69,26,'YES',6,'Cap',43),(70,45,'YES',8.59,'Tin',32),(71,89,'NO',8.83,'Soap',100),(72,81,'NO',8.4,'Job',71),(73,44,'NO',0.45,'Cricket Bat',58),(74,31,'NO',6.57,'Jacket',46),(75,25,'NO',2.59,'Basketball',20),(76,36,'YES',3.52,'Golf Stick',23),(77,64,'NO',7.71,'Cricket Bat',29),(78,47,'NO',4.89,'Sofa',73),(79,93,'YES',9.05,'Temp',17),(80,58,'NO',0.89,'Cup',27),(81,88,'NO',2.16,'Golf Ball',27),(82,9,'YES',2.85,'Paintings',27),(83,50,'NO',8.55,'Cap',37),(84,93,'NO',2.13,'Hatity',3),(85,52,'YES',4.98,'Tin',24),(86,12,'NO',8.6,'Pannier',47),(87,14,'YES',8.78,'Violen',77),(88,51,'NO',7.79,'Smartphone',79),(89,74,'YES',2.82,'Smartphone',19),(90,33,'NO',9.38,'Flowdesk',28),(91,35,'NO',7.03,'Smartphone',88),(92,45,'YES',3.68,'Job',1),(93,20,'YES',8.5,'Jacket',53),(94,86,'NO',6.64,'Geometry Box',35),(95,81,'NO',6.83,'Treeflex',87),(96,44,'YES',3.95,'Namfix',39),(97,44,'YES',4.9,'Box',7),(98,72,'NO',8.69,'Wrapsafe',76),(99,24,'NO',8.11,'Sofa',74),(100,58,'YES',6.51,'Geometry Box',99);
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
  PRIMARY KEY (`Retailer_ID`),
  KEY `retailer_fname_index` (`FirstName`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer`
--

LOCK TABLES `retailer` WRITE;
/*!40000 ALTER TABLE `retailer` DISABLE KEYS */;
INSERT INTO `retailer` VALUES (1,'Yolande','Grafham','2022-05-20',29,'14 Lindbergh Lane','8918065076'),(2,'Ashbey','Zute','2022-09-27',82,'2 Prentice Place','3098582813'),(3,'Cissy','Checchi','2022-09-11',11,'5 Waxwing Crossing','7617290398'),(4,'Martie','Delgadillo','2022-11-29',75,'0 Lotheville Center','2338369074'),(5,'Rozele','Fawcett','2022-08-03',46,'22 Cottonwood Point','2672541866'),(6,'Misty','Robelin','2022-03-31',77,'03691 Waubesa Avenue','3116687611'),(7,'Phip','Burtwistle','2023-01-31',100,'7 Nevada Drive','7733453072'),(8,'Nelli','Bereford','2022-11-02',70,'187 Loeprich Junction','2749138530'),(9,'Gualterio','Winchester','2023-02-04',26,'6549 Kensington Junction','3881905824'),(10,'Myles','Hassin','2022-08-20',74,'90 Clove Center','1677752975'),(11,'Chick','Jans','2022-07-07',25,'80 Erie Junction','7864974427'),(12,'Emmy','Peepall','2022-03-13',35,'74729 Straubel Trail','9033978486'),(13,'Basilius','Sawell','2022-08-23',72,'932 Sheridan Center','8461287275'),(14,'Issiah','Danelut','2022-02-17',61,'91 Anniversary Alley','4437623327'),(15,'Sollie','Coyish','2022-07-21',3,'0 Melrose Drive','6117951909'),(16,'Ashby','Bassham','2022-05-31',71,'875 Burrows Plaza','3787453134'),(17,'Aleksandr','Krystof','2022-08-29',29,'8 Jenna Hill','8866022919'),(18,'Ginger','Dubique','2023-01-16',25,'095 Porter Drive','4864921852'),(19,'Evita','Showering','2022-11-27',82,'26748 Northridge Parkway','8683785071'),(20,'Mayne','McCarlie','2023-01-19',31,'4589 Texas Street','1252617265'),(21,'Una','Tothe','2022-02-11',9,'1405 Summit Plaza','7147717798'),(22,'Joel','Goschalk','2022-06-22',62,'40 Oxford Place','5843901151'),(23,'Barnebas','Figgins','2022-10-09',96,'53 Veith Junction','9475968655'),(24,'Christie','Gregine','2022-11-11',27,'4462 Stuart Lane','1453686989'),(25,'Berenice','Bront','2022-08-01',46,'2044 Kedzie Parkway','6651185643'),(26,'Gayle','Hylands','2022-11-11',3,'8 Daystar Trail','4612271580'),(27,'Kerr','Adame','2022-07-30',78,'45273 Blackbird Park','6651754161'),(28,'Boothe','Owain','2022-09-22',52,'623 Rusk Place','2913548212'),(29,'Tobias','Szymoni','2022-08-04',49,'096 Westridge Junction','4759670367'),(30,'Averell','McCritichie','2022-12-07',42,'66658 Haas Plaza','5654564631'),(31,'Druci','Voden','2022-09-02',46,'7870 Anthes Plaza','2741300057'),(32,'Dorella','Dresser','2022-07-12',57,'6 Vera Court','3344364487'),(33,'Kingsly','Bramstom','2022-03-23',40,'0 Corry Alley','6323167173'),(34,'Rasia','Bendon','2022-10-25',46,'2998 Porter Place','5948650423'),(35,'Zora','Petrelluzzi','2022-10-27',88,'04 Helena Way','5854997431'),(36,'Nancie','Filchagin','2022-06-10',77,'4202 Manley Plaza','2914271615'),(37,'Berenice','Feltoe','2022-09-02',42,'645 Fulton Avenue','8652676468'),(38,'Bernardo','Halwell','2023-01-20',14,'9 Express Trail','2824554201'),(39,'Marcia','Johann','2022-10-03',28,'92021 Harper Road','2694651384'),(40,'Hammad','Rentelll','2022-03-27',18,'7 Mccormick Parkway','5925847604'),(41,'Licha','Cordy','2022-06-03',94,'71 Ridge Oak Place','9389944562'),(42,'Diane','Fautly','2022-07-14',31,'04517 Mifflin Park','7146957453'),(43,'Peirce','Pepall','2023-01-20',22,'407 Browning Alley','4505026589'),(44,'Broddie','Dickenson','2022-06-21',41,'90 Buena Vista Street','3992092602'),(45,'Isidora','Everly','2022-07-28',53,'6 Parkside Way','3875307169'),(46,'Nicoli','Bygreaves','2023-01-02',27,'1 Golf Course Hill','9973619510'),(47,'Nil','Siege','2022-03-20',81,'87 Del Mar Point','3826055001'),(48,'Elissa','Gorwood','2022-09-22',60,'22 David Parkway','6066418957'),(49,'Michel','Wedderburn','2022-11-16',50,'77453 Glendale Trail','7489888397'),(50,'Auberon','Fansy','2022-07-20',4,'800 Shopko Pass','7986300625'),(51,'Godard','Wilstead','2022-09-08',44,'09 Lukken Lane','3477833875'),(52,'Terrel','Butts','2022-10-05',75,'73 Clyde Gallagher Road','2226313647'),(53,'Ben','Tomaselli','2023-01-22',37,'542 Marquette Hill','9379685547'),(54,'Inna','Locksley','2022-07-31',52,'4 Cody Crossing','7813211976'),(55,'Woodman','Sibbering','2023-01-08',22,'3102 Forster Way','2257698298'),(56,'Helyn','Bainbridge','2022-04-25',4,'9 Sage Drive','5831668504'),(57,'Barnett','McClurg','2022-06-26',91,'5 Novick Pass','6167780232'),(58,'Nessy','Lealle','2022-05-31',45,'6465 Moose Trail','1924636154'),(59,'Maxie','Meneux','2022-06-22',49,'65 Homewood Street','5176282750'),(60,'Ester','Klimontovich','2022-06-08',44,'46 West Trail','7655669849'),(61,'Dani','Dowers','2022-08-07',43,'6 Monica Point','6444423124'),(62,'Babbie','Shellshear','2022-06-12',80,'59182 Russell Plaza','3177829195'),(63,'Binny','Carlyle','2022-07-02',85,'4439 Weeping Birch Terrace','3556716028'),(64,'Natividad','McCrisken','2023-01-27',47,'361 Sullivan Terrace','2166201328'),(65,'Danny','Chisnell','2022-03-04',68,'45094 Hazelcrest Plaza','2824522176'),(66,'Ebony','Loines','2022-02-26',6,'0011 Nobel Park','6168733583'),(67,'Chase','Kither','2022-04-05',92,'07 Laurel Alley','2948431090'),(68,'Erena','Gostyke','2022-05-07',54,'98972 Butterfield Plaza','8777266996'),(69,'Paton','Foran','2022-07-22',83,'23773 Mayfield Pass','1345750305'),(70,'Ewell','Purdey','2022-04-09',11,'8 Hoepker Alley','9986966332'),(71,'Cherish','Deevey','2022-10-29',64,'29 Clove Drive','7408815064'),(72,'Tanhya','de Werk','2023-01-30',60,'78089 High Crossing Crossing','8706357794'),(73,'Danita','Rignold','2022-07-22',13,'51 Golden Leaf Road','9628578448'),(74,'Syd','Jarrett','2022-03-02',82,'7 Moland Parkway','3617853717'),(75,'Harp','Siggin','2022-09-04',91,'75680 Lerdahl Center','5513586302'),(76,'Chrissie','Perkin','2022-12-03',82,'529 Clemons Terrace','6136795827'),(77,'Les','Pallent','2022-10-15',94,'94 Di Loreto Pass','6568716737'),(78,'Knox','Sogg','2022-04-07',53,'9 Tony Parkway','2088958435'),(79,'Teddie','Curphey','2022-06-06',12,'38987 Maple Wood Road','4207936359'),(80,'Tobi','Yacobsohn','2022-10-29',6,'7 Lillian Trail','1062915971'),(81,'Morgan','Snartt','2022-05-17',79,'12380 Northwestern Drive','4442581955'),(82,'Nisse','Noden','2022-11-23',65,'78934 Evergreen Street','7169014529'),(83,'Elwira','Crehan','2022-09-23',1,'02 Shopko Lane','4703513582'),(84,'Linoel','Testro','2022-10-31',83,'8 Daystar Terrace','6507997206'),(85,'Rosanne','Meredyth','2022-06-04',40,'0 Fair Oaks Lane','3241365453'),(86,'Dalston','Darbey','2022-04-09',94,'916 Luster Plaza','5665167967'),(87,'Veronique','Walduck','2022-12-29',78,'3390 Eagan Terrace','5663278590'),(88,'Lyda','Loosely','2022-09-24',4,'79920 Washington Place','3991630118'),(89,'Aurelie','Alessandrucci','2022-10-26',29,'0334 Forest Center','5645423048'),(90,'Zondra','Bour','2022-11-25',58,'5 Coolidge Place','1287459803'),(91,'Addi','Ussher','2022-11-27',85,'887 Roth Lane','6036042594'),(92,'Jess','Caney','2022-05-25',31,'30 Mendota Center','9443341798'),(93,'Estrellita','Garza','2022-07-09',79,'74 Hollow Ridge Avenue','3637548157'),(94,'Darin','Fossey','2022-08-04',82,'66635 Brickson Park Terrace','2585187517'),(95,'Christiano','Dorton','2022-09-03',42,'50420 Clove Lane','7535386352'),(96,'Ricoriki','Jaulmes','2022-10-25',86,'3 Forest Run Avenue','1947148233'),(97,'Editha','Rowlands','2022-03-15',9,'7 Havey Alley','8462433164'),(98,'Warde','Haglington','2022-11-18',45,'9076 Commercial Street','4223524468'),(99,'Griswold','Sancho','2022-09-18',57,'20614 Jackson Center','1208375871'),(100,'Elsa','Tolhurst','2022-09-24',71,'514 Holmberg Court','8364939633');
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
INSERT INTO `store` VALUES (91,21),(80,23),(28,33),(66,88),(46,50),(77,67),(9,77),(7,60),(12,50),(75,56),(73,83),(97,85),(42,33),(86,22),(89,1),(63,53),(37,94),(8,38),(82,12),(57,6),(15,25),(62,74),(30,2),(100,59),(37,13),(32,59),(74,59),(75,94),(98,30),(88,27),(55,73),(31,39),(60,61),(30,17),(92,98),(5,92),(2,29),(66,21),(44,29),(29,68),(69,38),(9,75),(2,99),(36,46),(16,84),(15,45),(42,5),(99,37),(31,79),(3,3),(21,53),(67,46),(43,80),(2,77),(12,47),(61,17),(82,42),(23,34),(84,85),(29,54),(97,3),(28,63),(32,31),(97,83),(1,27),(55,50),(49,83),(71,3),(2,72),(50,6),(7,95),(100,97),(79,5),(18,20),(23,48),(99,42),(22,92),(60,11),(23,15),(83,17),(66,23),(18,81),(100,42),(46,82),(4,24),(73,84),(34,44),(53,65),(99,90),(37,18),(32,33),(46,31),(47,67),(10,57),(21,61),(44,99),(24,2),(79,64),(15,23),(10,14);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbmsproject2'
--

--
-- Dumping routines for database 'dbmsproject2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17 21:27:48
