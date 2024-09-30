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
  PRIMARY KEY (`TripID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1015,'New York','Los Angeles',7,1200,3),(1027,'Denver','Salt Lake City',5,950,2),(2489,'Chicago','Miami',5,800,2),(3271,'San Francisco','Seattle',4,600,1),(4568,'Houston','New Orleans',3,500,4),(5894,'Phoenix','Las Vegas',2,300,2),(6732,'Boston','Washington D.C.',6,900,2),(7851,'Dallas','Austin',3,400,1),(8523,'Philadelphia','Orlando',8,1100,5),(9134,'Atlanta','Savannah',4,700,3);
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
INSERT INTO `userpreferences` VALUES (1023,'English','USD'),(5589,'Spanish','EUR'),(7812,'French','CAD'),(3621,'German','AUD'),(4859,'Chinese','CNY'),(6498,'Japanese','JPY'),(2934,'Russian','RUB'),(8751,'Italian','CHF'),(1005,'Korean','NZD'),(9174,'Portuguese','BRL');
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
INSERT INTO `users` VALUES (1005,'ivan@example.com','password9','admin'),(1023,'alice@example.com','password1','admin'),(2934,'grace@example.com','password7','regular user'),(3621,'dave@example.com','password4','admin'),(4859,'eve@example.com','password5','regular user'),(5589,'bob@example.com','password2','regular user'),(6498,'frank@example.com','password6','regular user'),(7812,'charlie@example.com','password3','regular user'),(8751,'heidi@example.com','password8','regular user'),(9174,'judy@example.com','password10','regular user');
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
INSERT INTO `usertrips` VALUES (1023,1015),(1023,2489),(5589,3271),(7812,4568),(3621,5894),(4859,6732),(6498,7851),(2934,8523),(8751,9134),(1005,1027);
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

-- Dump completed on 2024-09-29 22:44:06
