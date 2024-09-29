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
  CONSTRAINT `FK_ActivityID` FOREIGN KEY (`ActivityID`) REFERENCES `customactivities` (`ActivityID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Create_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createcustomactivities`
--

LOCK TABLES `createcustomactivities` WRITE;
/*!40000 ALTER TABLE `createcustomactivities` DISABLE KEYS */;
INSERT INTO `createcustomactivities` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5);
/*!40000 ALTER TABLE `createcustomactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customactivities`
--

DROP TABLE IF EXISTS `customactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customactivities` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `ActivityName` varchar(45) DEFAULT NULL,
  `ActivityDesc` varchar(500) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customactivities`
--

LOCK TABLES `customactivities` WRITE;
/*!40000 ALTER TABLE `customactivities` DISABLE KEYS */;
INSERT INTO `customactivities` VALUES (1,'City Tour','A guided tour of the city\'s historical sites.','29.99'),(2,'Cooking Class','Learn to cook local cuisine with a chef.','49.99'),(3,'Wine Tasting','Enjoy a tasting of local wines.','39.50'),(4,'Adventure Hiking','A day of hiking in the beautiful countryside.','59.00'),(5,'Museum Visit','Explore the local art and history museum.','15.00'),(6,'Scuba Diving','Experience underwater diving in beautiful locations.','120.00'),(7,'Bike Rental','Rent a bike for a day of exploration.','20.00'),(8,'Surfing Lessons','Take lessons from a professional surf instructor.','75.00'),(9,'Spa Day','Relax with a full day of spa treatments.','150.00'),(10,'Concert Tickets','Enjoy a night of music at a local concert.','45.00');
/*!40000 ALTER TABLE `customactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `FlightClass` varchar(45) DEFAULT NULL,
  `Airline` varchar(45) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`FlightID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'Economy','Delta','300','2024-10-10','2024-10-17'),(2,'Business','American Airlines','1200','2024-11-01','2024-11-10'),(3,'First Class','United','2500','2024-12-05','2024-12-12'),(4,'Economy','Southwest','150','2024-09-20','2024-09-25'),(5,'Economy','JetBlue','200','2024-11-15','2024-11-22'),(6,'Business','Emirates','2200','2024-10-05','2024-10-15'),(7,'First Class','Qatar Airways','3000','2024-12-20','2024-12-30'),(8,'Economy','Spirit Airlines','100','2024-11-10','2024-11-15'),(9,'Business','Lufthansa','1800','2024-11-25','2024-12-01'),(10,'Economy','Alaska Airlines','250','2024-10-22','2024-10-28');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `HotelID` int NOT NULL AUTO_INCREMENT,
  `HotelName` varchar(45) DEFAULT NULL,
  `CheckinDate` date DEFAULT NULL,
  `CheckoutDate` date DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Marriott','2024-10-01','2024-10-05','500'),(2,'Hilton','2024-11-10','2024-11-15','600'),(3,'Hyatt','2024-12-20','2024-12-27','1200'),(4,'Holiday Inn','2024-09-15','2024-09-18','300'),(5,'Sheraton','2024-10-05','2024-10-10','700'),(6,'Four Seasons','2024-11-25','2024-12-01','2500'),(7,'Ritz-Carlton','2024-12-15','2024-12-20','3000'),(8,'Best Western','2024-09-20','2024-09-23','400'),(9,'Radisson','2024-10-15','2024-10-20','800'),(10,'Wyndham','2024-11-01','2024-11-07','900');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
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
INSERT INTO `suggestedactivities` VALUES ('Arizona','Grand Canyon Tour','Visit one of the natural wonders of the world.','70.00'),('California','Beach Bonfire','Enjoy a fun bonfire on the beach.','35.00'),('Colorado','Mountain Hiking','Explore beautiful mountain trails.','40.00'),('Florida','Theme Park Visit','Spend a day at a famous theme park.','99.99'),('Hawaii','Luau Experience','Enjoy traditional Hawaiian food and entertainment.','85.00'),('Illinois','City River Cruise','Take a scenic cruise on the Chicago River.','25.00'),('Nevada','Casino Night','Try your luck at the famous casinos.','50.00'),('New York','Broadway Show','Watch a live performance in Times Square.','120.00'),('Texas','Barbecue Tour','Experience a tour of local barbecue joints.','45.00'),('Washington','National Park Visit','Discover the beauty of the national parks.','30.00');
/*!40000 ALTER TABLE `suggestedactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `TripID` int NOT NULL AUTO_INCREMENT,
  `StartLocation` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Budget` int DEFAULT NULL,
  `Travelers` int DEFAULT NULL,
  PRIMARY KEY (`TripID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'San Francisco','Los Angeles',5,700,2),(2,'New York','Miami',7,1200,4),(3,'Chicago','Las Vegas',6,1500,3),(4,'Seattle','Vancouver',3,500,2),(5,'Austin','Houston',2,300,1),(6,'Boston','Philadelphia',4,400,2),(7,'Orlando','New Orleans',5,800,5),(8,'Denver','Salt Lake City',4,600,3),(9,'Phoenix','San Diego',3,450,2),(10,'Atlanta','Nashville',2,350,1),(14,'Denver','Salt Lake City',4,600,3);
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
  CONSTRAINT `FK_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselectflights`
--

LOCK TABLES `tripselectflights` WRITE;
/*!40000 ALTER TABLE `tripselectflights` DISABLE KEYS */;
INSERT INTO `tripselectflights` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
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
  CONSTRAINT `FK_HotelID` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Select_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselecthotels`
--

LOCK TABLES `tripselecthotels` WRITE;
/*!40000 ALTER TABLE `tripselecthotels` DISABLE KEYS */;
INSERT INTO `tripselecthotels` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10);
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
  CONSTRAINT `FK_StateName` FOREIGN KEY (`StateName`) REFERENCES `suggestedactivities` (`StateName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Suggested_TripID` FOREIGN KEY (`TripID`) REFERENCES `trips` (`TripID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripselectsuggestedactivities`
--

LOCK TABLES `tripselectsuggestedactivities` WRITE;
/*!40000 ALTER TABLE `tripselectsuggestedactivities` DISABLE KEYS */;
INSERT INTO `tripselectsuggestedactivities` VALUES (1,'Arizona'),(2,'California'),(3,'Colorado'),(4,'Florida'),(5,'Hawaii'),(6,'Illinois'),(7,'Nevada'),(8,'New York'),(9,'Texas'),(10,'Washington');
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
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'English','USD'),(2,'Spanish','EUR'),(3,'French','CAD'),(4,'German','AUD'),(5,'Chinese','CNY'),(6,'Japanese','JPY'),(7,'Russian','RUB'),(8,'Italian','CHF'),(9,'Portuguese','BRL'),(10,'Korean','KRW');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `RoleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1@example.com','password1','regular user'),(2,'user2@example.com','password2','regular user'),(3,'user3@example.com','password3','admin'),(4,'user4@example.com','password4','regular user'),(5,'user5@example.com','password5','regular user'),(6,'user6@example.com','password6','admin'),(7,'user7@example.com','password7','regular user'),(8,'user8@example.com','password8','regular user'),(9,'user9@example.com','password9','admin'),(10,'user10@example.com','password10','regular user');
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
INSERT INTO `usertrips` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
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

-- Dump completed on 2024-09-28 22:15:01
