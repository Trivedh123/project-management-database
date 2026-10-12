-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: company_sql_practice
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '927c8a8d-a2ed-11f1-92c3-005056c00001:1-23';

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (201,'TechNova Solutions','Hyderabad','Technology'),(202,'Global Finance Corp','Mumbai','Finance'),(203,'HealthPlus','Bangalore','Healthcare'),(204,'RetailMart','Chennai','Retail'),(205,'EduWorld','Pune','Education'),(206,'AutoWorks','Chennai','Automobile'),(207,'GreenEnergy','Hyderabad','Energy'),(208,'MediaHub','Delhi','Media');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Engineering','Hyderabad'),(2,'Human Resources','Bangalore'),(3,'Finance','Chennai'),(4,'Marketing','Hyderabad'),(5,'Information Technology','Vijayawada'),(6,'Operations','Bangalore'),(7,'Research','Pune'),(8,'Legal','Mumbai');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_projects`
--

DROP TABLE IF EXISTS `employee_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_projects` (
  `employee_id` int NOT NULL,
  `project_id` int NOT NULL,
  `hours_worked` int DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `employee_projects_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `employee_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_projects`
--

LOCK TABLES `employee_projects` WRITE;
/*!40000 ALTER TABLE `employee_projects` DISABLE KEYS */;
INSERT INTO `employee_projects` VALUES (107,312,140,'Engineer');
/*!40000 ALTER TABLE `employee_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (101,'Arjun','arjun@gmail.com','Hyderabad',95000.00,'2020-05-15',1,NULL),(102,'Sneha','sneha@gmail.com','Hyderabad',72000.00,'2021-07-10',1,101),(103,'Rahul','rahul@gmail.com','Bangalore',68000.00,'2022-03-18',1,101),(104,'Priya','priya@gmail.com','Chennai',85000.00,'2019-11-25',3,NULL),(105,'Kiran','kiran@gmail.com','Bangalore',60000.00,'2023-01-12',3,104),(106,'Anjali','anjali@gmail.com','Hyderabad',78000.00,'2022-08-20',4,NULL),(107,'Ravi','ravi@gmail.com','Vijayawada',55000.00,'2023-06-15',5,NULL),(108,'Divya','divya@gmail.com','Hyderabad',88000.00,'2021-02-10',1,101),(109,'Vikram','vikram@gmail.com','Bangalore',92000.00,'2020-09-05',5,NULL),(110,'Neha','neha@gmail.com','Hyderabad',65000.00,'2024-01-20',4,106),(111,'Suresh','suresh@gmail.com','Chennai',58000.00,'2022-04-12',2,NULL),(112,'Pooja',NULL,'Chennai',62000.00,'2023-10-01',2,111),(113,'Amit','amit@gmail.com','Pune',105000.00,'2018-06-30',1,NULL),(114,'Kavya','kavya@gmail.com','Hyderabad',73000.00,'2024-05-14',1,113),(115,'Varun','varun@gmail.com','Mumbai',50000.00,'2023-08-19',5,109),(116,'Swathi','swathi@gmail.com','Bangalore',81000.00,'2021-12-05',6,NULL),(117,'Ramesh','ramesh@gmail.com','Hyderabad',45000.00,'2024-07-11',4,106),(118,'Meena',NULL,'Chennai',70000.00,'2022-01-25',3,104),(119,'Aditya','aditya@gmail.com','Pune',99000.00,'2020-03-17',1,113),(120,'Sara','sara@gmail.com','Mumbai',67000.00,'2024-09-09',6,116);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `department_id` (`department_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (301,'Banking Portal','2023-01-10','2024-01-15',1800000.00,1,202),(302,'E-Commerce Platform','2023-03-15','2024-06-30',2500000.00,1,204),(303,'HR Management System','2024-01-05','2024-12-31',800000.00,2,201),(304,'Financial Analytics','2024-02-10','2025-01-31',1500000.00,3,202),(305,'Marketing Automation','2024-04-01','2024-11-30',600000.00,4,201),(306,'Cloud Migration','2023-08-20','2025-03-31',2200000.00,5,201),(307,'Mobile Banking App','2024-05-10','2025-05-31',3000000.00,1,202),(308,'Healthcare Dashboard','2024-06-15','2025-02-28',1200000.00,3,203),(309,'Retail Analytics','2023-11-01','2024-10-31',900000.00,4,204),(310,'AI Recommendation Engine','2024-07-01','2025-07-31',3500000.00,7,205),(311,'Electric Vehicle Platform','2024-03-20','2025-06-30',2800000.00,6,206),(312,'Energy Monitoring System','2025-01-10','2026-01-10',1700000.00,5,207);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-12 15:37:49
