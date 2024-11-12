-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: team6
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `createcustomactivities`
--

DROP TABLE IF EXISTS `createcustomactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `createcustomactivities` (
  `ActivityID` int DEFAULT NULL,
  `TripID` int DEFAULT NULL,
  KEY `FK_ActivityID_idx` (`ActivityID`),
  KEY `FK_Create_TripID_idx` (`TripID`),
  CONSTRAINT `FK_CustomActivities_ActivityID` FOREIGN KEY (`ActivityID`) REFERENCES `customactivities` (`ActivityID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CustomActivities_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createcustomactivities`
--

LOCK TABLES `createcustomactivities` WRITE;
/*!40000 ALTER TABLE `createcustomactivities` DISABLE KEYS */;
INSERT INTO `createcustomactivities` VALUES (1001,1015),(2047,2489),(3058,3271),(4123,4568),(5632,5894),(6789,6732),(7405,7851),(8504,8523),(9176,9134),(1034,1027);
/*!40000 ALTER TABLE `createcustomactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customactivities`
--

DROP TABLE IF EXISTS `customactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customactivities` (
  `ActivityID` int NOT NULL,
  `ActivityName` varchar(45) DEFAULT NULL,
  `ActivityDesc` varchar(500) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customactivities`
--

LOCK TABLES `customactivities` WRITE;
/*!40000 ALTER TABLE `customactivities` DISABLE KEYS */;
INSERT INTO `customactivities` VALUES (1001,'Skydiving','Experience the thrill of free-fall from 15,000 feet!','250.00'),(1034,'Photography Tour','Capture stunning landscapes with expert photography tips.','90.00'),(2047,'Cooking Class','Learn to make authentic Italian pasta from scratch.','75.00'),(3058,'City Tour','Explore the historical sites of the city with a local guide.','50.00'),(4123,'Mountain Biking','Ride through scenic trails and enjoy the great outdoors.','100.00'),(5632,'Wine Tasting','Taste a selection of local wines at a beautiful vineyard.','45.00'),(6789,'Scuba Diving','Discover the underwater world with a certified instructor.','300.00'),(7405,'Yoga Retreat','Relax and rejuvenate with daily yoga sessions and meditation.','200.00'),(8504,'Art Workshop','Create your own masterpiece in a guided painting class.','60.00'),(9176,'Zip Lining','Soar through the trees on a thrilling zip line adventure.','120.00');
/*!40000 ALTER TABLE `customactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `FlightID` int NOT NULL,
  `FlightClass` varchar(45) DEFAULT NULL,
  `Airline` varchar(45) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`FlightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1078,'Business','Allegiant Air','650.00','2024-11-25','2024-11-25'),(2015,'Economy','Delta Airlines','350.00','2024-10-15','2024-10-15'),(2490,'Economy','Hawaiian Airlines','400.00','2024-11-30','2024-11-30'),(3489,'Business','American Airlines','850.00','2024-10-20','2024-10-20'),(4312,'First Class','United Airlines','1200.00','2024-10-25','2024-10-25'),(5198,'Economy','Southwest Airlines','250.00','2024-10-30','2024-10-30'),(6074,'Business','JetBlue','700.00','2024-11-05','2024-11-05'),(7201,'Economy','Alaska Airlines','300.00','2024-11-10','2024-11-10'),(8123,'First Class','Frontier Airlines','1500.00','2024-11-15','2024-11-15'),(9342,'Economy','Spirit Airlines','200.00','2024-11-20','2024-11-20');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `HotelID` int NOT NULL,
  `HotelName` varchar(45) DEFAULT NULL,
  `CheckinDate` date DEFAULT NULL,
  `CheckoutDate` date DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1006,'Desert Oasis','2024-12-10','2024-12-15','130.00'),(1034,'Ocean View Resort','2024-10-01','2024-10-07','120.00'),(2198,'Mountain Retreat','2024-10-10','2024-10-15','150.00'),(3210,'City Center Hotel','2024-10-12','2024-10-19','200.00'),(4876,'Countryside Inn','2024-10-20','2024-10-25','90.00'),(5983,'Lakeside Cabins','2024-11-01','2024-11-05','110.00'),(6745,'Luxury Suites','2024-11-10','2024-11-15','250.00'),(7320,'Budget Stay','2024-11-18','2024-11-20','65.00'),(8493,'Historic Hotel','2024-11-25','2024-11-30','175.00'),(9142,'Beachfront Hotel','2024-12-01','2024-12-05','220.00');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestedactivities`
--

DROP TABLE IF EXISTS `suggestedactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestedactivities` (
  `StateName` varchar(45) NOT NULL,
  `ActivityName` varchar(45) DEFAULT NULL,
  `ActivityDesc` varchar(500) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestedactivities`
--

LOCK TABLES `suggestedactivities` WRITE;
/*!40000 ALTER TABLE `suggestedactivities` DISABLE KEYS */;
INSERT INTO `suggestedactivities` VALUES ('Alaska','Glacier Cruise','Witness breathtaking glaciers and wildlife on a boat tour.','200.00'),('Arizona','Grand Canyon Hiking','Explore the stunning landscapes of the Grand Canyon.','40.00'),('California','Surfing Lessons','Learn to ride the waves with professional instructors.','100.00'),('Florida','Everglades Airboat Tour','Explore the unique ecosystem of the Everglades.','70.00'),('Hawaii','Snorkeling Adventure','Discover vibrant marine life in beautiful coral reefs.','120.00'),('Nevada','Las Vegas Strip Tour','Experience the excitement of the Las Vegas Strip.','60.00'),('New York','Broadway Show','Enjoy a spectacular performance in the heart of NYC.','150.00'),('North Carolina','Great Smoky Mountains National Park','Hike the scenic trails of America’s most visited national park.','30.00'),('Oregon','Wine Tasting Tour','Visit some of Oregon’s finest vineyards for wine tastings.','90.00'),('Texas','Barbecue Cooking Class','Master the art of Texas-style barbecue cooking.','80.00');
/*!40000 ALTER TABLE `suggestedactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `TripID` int NOT NULL,
  `StartLocation` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Budget` int DEFAULT NULL,
  `Travelers` int DEFAULT NULL,
  `FlightClass` varchar(255) DEFAULT NULL,
  `Airline` varchar(255) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TripID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1015,'New York','Los Angeles',7,1200,3,NULL,NULL,NULL,NULL),(1027,'Denver','Salt Lake City',5,950,2,NULL,NULL,NULL,NULL),(2489,'Chicago','Miami',5,800,2,NULL,NULL,NULL,NULL),(3271,'San Francisco','Seattle',4,600,1,NULL,NULL,NULL,NULL),(4568,'Houston','New Orleans',3,500,4,NULL,NULL,NULL,NULL),(5894,'Phoenix','Las Vegas',2,300,2,NULL,NULL,NULL,NULL),(6732,'Boston','Washington D.C.',6,900,2,NULL,NULL,NULL,NULL),(7851,'Dallas','Austin',3,400,1,NULL,NULL,NULL,NULL),(8523,'Philadelphia','Orlando',8,1100,5,NULL,NULL,NULL,NULL),(9134,'Atlanta','Savannah',4,700,3,NULL,NULL,NULL,NULL),(9135,'San Jose','Sydney',5,20,5,NULL,NULL,NULL,NULL),(9136,'San Jose','Taipei',5,500,1,NULL,NULL,NULL,NULL),(9137,'San Jose','Taipei',5,500,1,NULL,NULL,NULL,NULL),(9138,'San Jose','Taipei',5,600,2,NULL,NULL,NULL,NULL),(9139,'San Jose','Sydney',3,590,6,NULL,NULL,NULL,NULL),(9140,'Sydney','Chicagp',3,800,3,NULL,NULL,NULL,NULL),(9141,'San Jose','Australia',3,800,3,NULL,NULL,NULL,NULL),(9142,'San Jose','Taipei',5,600,3,NULL,NULL,NULL,NULL),(9143,'Taipei','Japan',5,1000,4,'firstClass','Japan Airlines',NULL,NULL),(9144,'Taipei','Japan',5,100,2,'Economy','',NULL,NULL),(9145,'Taipef','dfsf',4,3000,3,'Economy','',NULL,NULL),(9146,'Taipef','dfsf',4,3000,3,'Economy','',NULL,NULL),(9147,'Taipef','dfsf',4,3000,3,'Economy','',NULL,NULL),(9148,'San Jose','Taipei',5,300,5,'Economy','',NULL,NULL),(9149,'San Jose','Taipei',8,8000,3,'Economy','',NULL,NULL),(9150,'San Jose','Taipei',4,3000,6,'Economy','',NULL,NULL),(9151,'San Jose','Taipei',3,300,5,'Economy','',NULL,NULL),(9152,'San Jose','Taipei',3,3000,4,'Economy','',NULL,NULL),(9153,'San Jose','Taipei',4,400,4,'Economy','',NULL,NULL),(9154,'San Jose','Taipei',3,300,5,'Economy','',NULL,NULL),(9155,'taipei','san jose',13,300,4,'Economy','',NULL,NULL),(9156,'taipei','san jose',13,300,4,'Economy','',NULL,NULL),(9157,'San Jose','Taipei',5,100,3,'Economy','',NULL,NULL),(9158,'San Jose','Taipei',3,300,3,'Economy','',NULL,NULL),(9159,'San Jose','Taipei',3,5000,5,'Economy','',NULL,NULL),(9160,'San Jose','Taipei',3,100,4,'Economy','',NULL,NULL),(9161,'San Jose','Taipei',3,100,4,'Economy','',NULL,NULL),(9162,'San Jose','Taipei',3,100,4,'Economy','',NULL,NULL),(9163,'San Jose','Taipei',3,3000,4,'Economy','',NULL,NULL),(9164,'Taipei','San Jose',3,300,5,'Economy','',NULL,NULL),(9165,'San Jose','Taipei',5,100,3,'Economy','',NULL,NULL),(9166,'San Jose','Taipei',2,3000,2,'Economy','',NULL,NULL),(9167,'San Jose','Taipei',3,300,3,'Economy','',NULL,NULL),(9168,'San Jose','Taipei',3,300,3,'Economy','',NULL,NULL),(9169,'San Jose','Taipei',3,300,3,'Economy','',NULL,NULL),(9170,'San Jose','Taipei',2,1000,5,'Economy','','2024-11-14 00:00:00','2024-11-16 00:00:00'),(9171,'sdyney','tokyo',3,1000,3,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9172,'sdyney','tokyo',3,1000,3,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9173,'sdyney','tokyo',4,1000,5,'Economy','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9174,'sdyney','tokyo',3,5000,2,'Economy','','2024-11-14 00:00:00','2024-11-16 00:00:00'),(9175,'sdyney','tokyo',3,300,2,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9176,'sdyney','tokyo',3,500,1,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9177,'San Jose','tokyo',2,500,2,'Economy','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9178,'sdyney','Taipei',3,1000,2,'Economy','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9179,'San Jose','Sydney',3,700,2,'Economy','','2024-11-14 00:00:00','2024-11-16 00:00:00'),(9180,'San Jose','tokyo',2,500,2,'Economy','','2024-11-13 00:00:00','2024-11-14 00:00:00'),(9181,'San Jose','Taipei',3,2000,2,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9182,'san francisco','tokyo',6,1000,2,'Economy','','2024-11-12 00:00:00','2024-11-17 00:00:00'),(9183,'San Jose','Sydney',4,200,2,'Economy','','2024-11-12 00:00:00','2024-11-15 00:00:00'),(9184,'San Jose','Japan',7,1000,2,'Economy','','2024-11-14 00:00:00','2024-11-21 00:00:00'),(9185,'San Jose','Sydney',5,2000,2,'Economy','','2024-11-13 00:00:00','2024-11-20 00:00:00'),(9186,'San Jose','tokyo',2,200,1,'Economy','','2024-11-12 00:00:00','2024-11-13 00:00:00'),(9187,'San Jose','Taipei',10,1000,1,'Economy','','2024-11-14 00:00:00','2024-11-22 00:00:00'),(9188,'San Jose','Taipei',10,1000,1,'Economy','','2024-11-14 00:00:00','2024-11-22 00:00:00'),(9189,'San Jose','sydney',3,300,1,'Economy','','2024-11-11 00:00:00','2024-11-14 00:00:00'),(9190,'San Jose','sydney',3,300,1,'Economy','','2024-11-12 00:00:00','2024-11-14 00:00:00'),(9191,'San Jose','sydney',3,300,1,'Economy','','2024-11-12 00:00:00','2024-11-14 00:00:00'),(9192,'tokyo','san francisco',3,300,1,'Economy','','2024-11-12 00:00:00','2024-11-14 00:00:00'),(9193,'san francisco','sydney',4,1000,1,'Economy','','2024-11-13 00:00:00','2024-11-20 00:00:00'),(9194,'san francisco','sydney',7,1000,2,'Economy','','2024-11-14 00:00:00','2024-11-20 00:00:00'),(9195,'San Jose','hong kong',6,100,5,'Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9196,'San Jose','China',1,300,1,'Premium Economy','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9197,'San Jose','China',1,300,1,'Premium Economy','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9198,'San Jose','China',3,300,4,'Premium Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9199,'San Jose','Peking',3,300,4,'Premium Economy','','2024-11-13 00:00:00','2024-11-15 00:00:00'),(9200,'san jose','Sydney',4,1000,2,'Business','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9201,'san jose','Sydney',4,1000,2,'Business','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9202,'san jose','Sydney',4,1000,2,'None','','2024-11-13 00:00:00','2024-11-16 00:00:00'),(9203,'san francisco','taipei',7,1000,5,'Business','','2024-11-14 00:00:00','2024-11-21 00:00:00'),(9204,'San Jose','peking',2,1000,3,'Business','','2024-11-14 00:00:00','2024-11-15 00:00:00'),(9205,'San Jose','peking',2,1000,3,'Business','','2024-11-14 00:00:00','2024-11-20 00:00:00'),(9206,'San Jose','tokyo',4,1000,3,'Business','','2024-11-12 00:00:00','2024-11-15 00:00:00');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripselectflights`
--

DROP TABLE IF EXISTS `tripselectflights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripselectflights` (
  `TripID` int DEFAULT NULL,
  `FlightID` int DEFAULT NULL,
  KEY `FK_TripID_idx` (`TripID`),
  KEY `FK_FlightID_idx` (`FlightID`),
  CONSTRAINT `FK_SelectFlights_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SelectFlights_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselectflights`
--

LOCK TABLES `tripselectflights` WRITE;
/*!40000 ALTER TABLE `tripselectflights` DISABLE KEYS */;
INSERT INTO `tripselectflights` VALUES (1015,2015),(2489,3489),(3271,4312),(4568,5198),(5894,6074),(6732,7201),(7851,8123),(8523,9342),(9134,1078),(1027,2490);
/*!40000 ALTER TABLE `tripselectflights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripselecthotels`
--

DROP TABLE IF EXISTS `tripselecthotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripselecthotels` (
  `TripID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  KEY `FK_TripID_idx` (`TripID`),
  KEY `FK_HotelID_idx` (`HotelID`),
  CONSTRAINT `FK_SelectHotels_HotelID` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SelectHotels_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselecthotels`
--

LOCK TABLES `tripselecthotels` WRITE;
/*!40000 ALTER TABLE `tripselecthotels` DISABLE KEYS */;
INSERT INTO `tripselecthotels` VALUES (1015,1034),(2489,2198),(3271,3210),(4568,4876),(5894,5983),(6732,6745),(7851,7320),(8523,8493),(9134,9142),(1027,1006);
/*!40000 ALTER TABLE `tripselecthotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripselectsuggestedactivities`
--

DROP TABLE IF EXISTS `tripselectsuggestedactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripselectsuggestedactivities` (
  `TripID` int DEFAULT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  KEY `FK_Suggested_TripID_idx` (`TripID`),
  KEY `FK_StateName_idx` (`StateName`),
  CONSTRAINT `FK_SuggestedActivities_StateName` FOREIGN KEY (`StateName`) REFERENCES `suggestedactivities` (`StateName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SuggestedActivities_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselectsuggestedactivities`
--

LOCK TABLES `tripselectsuggestedactivities` WRITE;
/*!40000 ALTER TABLE `tripselectsuggestedactivities` DISABLE KEYS */;
INSERT INTO `tripselectsuggestedactivities` VALUES (1015,'New York'),(2489,'Florida'),(3271,'California'),(4568,'Texas'),(5894,'Nevada'),(6732,'Arizona'),(7851,'Hawaii'),(8523,'Oregon'),(9134,'North Carolina'),(1027,'Alaska');
/*!40000 ALTER TABLE `tripselectsuggestedactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `UserID` int DEFAULT NULL,
  `Language` varchar(45) DEFAULT NULL,
  `Currency` varchar(45) DEFAULT NULL,
  KEY `FK_Preferences_UserID_idx` (`UserID`),
  CONSTRAINT `FK_Preferences_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1023,'English','USD'),(5589,'Spanish','EUR'),(7812,'French','CAD'),(3621,'German','AUD'),(4859,'Chinese','CNY'),(6498,'Japanese','JPY'),(2934,'Russian','RUB'),(8751,'Italian','CHF'),(1005,'Korean','NZD'),(9174,'Portuguese','BRL'),(9176,'Spanish','AUD'),(9177,'Russian','CHF'),(9178,'Korean','AUD'),(9179,'English','EUR'),(9180,'German','CAD'),(9181,'Portuguese','AUD'),(9182,'English','INR'),(9183,'Japanese','EUR');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `RoleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (100,'testing@gmail.com','12345','regular user'),(1005,'ivan@example.com','password9','admin'),(1023,'alice@example.com','password1','admin'),(2934,'grace@example.com','password7','regular user'),(3621,'dave@example.com','password4','admin'),(4859,'eve@example.com','password5','regular user'),(5589,'bob@example.com','password2','regular user'),(6498,'frank@example.com','password6','regular user'),(7812,'charlie@example.com','password3','regular user'),(8751,'heidi@example.com','password8','regular user'),(9174,'judy@example.com','password10','regular user'),(9175,'testing2@gmail.com','12345','regular user'),(9176,'ronaldtesting@gmail.com','907890908','regular user'),(9177,'ronaldtesting2@gmail.com','12345','regular user'),(9178,'ron@gmail.com','12345','regular user'),(9179,'testing3@gmail.com','12345','regular user'),(9180,'testing4@gmail.com','12345','regular user'),(9181,'testing5@gmail.com','12345','regular user'),(9182,'testing3@gmail.com','12345','regular user'),(9183,'ronald@gmail.com','12345','regular user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertrips`
--

DROP TABLE IF EXISTS `usertrips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertrips` (
  `UserID` int DEFAULT NULL,
  `TripID` int DEFAULT NULL,
  KEY `UserID_idx` (`UserID`),
  KEY `TripID_idx` (`TripID`),
  CONSTRAINT `FK_UserTrips_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_UserTrips_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertrips`
--

LOCK TABLES `usertrips` WRITE;
/*!40000 ALTER TABLE `usertrips` DISABLE KEYS */;
INSERT INTO `usertrips` VALUES (1023,1015),(1023,2489),(5589,3271),(7812,4568),(3621,5894),(4859,6732),(6498,7851),(2934,8523),(8751,9134),(1005,1027),(9179,9136),(9179,9137),(9179,9138),(9180,9139),(9181,9140),(9179,9141),(9183,9142),(100,9143),(100,9144),(100,9145),(100,9146),(100,9147),(100,9148),(100,9149),(100,9150),(100,9151),(100,9152),(100,9153),(100,9154),(100,9155),(100,9156),(100,9157),(100,9158),(100,9159),(100,9160),(100,9161),(100,9162),(100,9163),(100,9164),(100,9165),(100,9166),(100,9167),(100,9168),(100,9169),(100,9170),(100,9171),(100,9172),(100,9173),(100,9174),(100,9175),(100,9176),(100,9177),(100,9178),(100,9179),(100,9180),(100,9181),(100,9182),(100,9183),(100,9184),(100,9185),(100,9186),(100,9187),(100,9188),(100,9189),(100,9190),(100,9191),(100,9192),(100,9193),(100,9194),(100,9195),(100,9196),(100,9197),(100,9198),(100,9199),(100,9200),(100,9201),(100,9202),(100,9203),(100,9204),(100,9205),(100,9206);
/*!40000 ALTER TABLE `usertrips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 22:20:03
