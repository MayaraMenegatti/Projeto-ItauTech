-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: itaubank
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Matheus Lopes Silva','030.512.323-14','(87) 98877-6677','matheus@gmail.com'),(2,'Nilton Alves Gusmão','925.501.050-60','(62) 93840-8159','alves627@gmail.com'),(3,'Vitória Canela Álvaro','475.011.710-25','(33) 96732-4449','vitoriac609@gmail.com'),(4,'Anna Monsanto Abasto','543.272.470-73','(55) 91291-9110','anna9831@gmail.com'),(5,'Kaio Borges Amado','120.713.160-10','(52) 94504-5368','kaiob1365@gmail.com'),(6,'Romeu Pereira Lários','511.762.220-07','(56) 91390-0055','laurios4583@gmail.com'),(7,'Ivo Leal Veloso','962.920.190-98','(89) 93223-1271','ivo8691@gmail.com'),(8,'Wallace Carreiro Picinatto','141.603.950-31','(31) 99001-8945','wall5234@gmail.com'),(9,'Alonso Bettencourt Tavares','267.219.590-03','(56) 93015-0094','alonso5232@gmail.com'),(10,'Yasmin Vidal Diegues','081.807.470-18','(82) 98552-7805','yasmin1268@gmail.com');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_conta`
--

DROP TABLE IF EXISTS `tb_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_conta` (
  `numero` int NOT NULL,
  `agencia` int NOT NULL,
  `tipo` int NOT NULL,
  `saldo` double NOT NULL,
  `codigocliente` int NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `titular` (`codigocliente`),
  CONSTRAINT `titular` FOREIGN KEY (`codigocliente`) REFERENCES `tb_cliente` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_conta`
--

LOCK TABLES `tb_conta` WRITE;
/*!40000 ALTER TABLE `tb_conta` DISABLE KEYS */;
INSERT INTO `tb_conta` VALUES (1000,1234,0,20000,1),(1001,1234,1,5000,1),(1002,1234,2,0,1),(1003,1234,0,0,2),(1004,1234,1,12256.45,2),(1005,1234,2,3987.83,2),(1006,1234,0,2854.37,3),(1007,1234,1,7853.85,3),(1008,1234,2,954.27,3),(1009,1234,0,3971.35,4),(1010,1234,1,0,4),(1011,1234,2,0,4),(1012,1234,0,23.98,5),(1013,1234,1,0,5),(1014,1234,2,23945.6,5),(1015,1234,0,125,6),(1016,1234,1,50,6),(1017,1234,2,23500,6),(1018,1234,0,759.43,7),(1019,1234,1,57.33,7),(1020,1234,2,1022.15,7),(1021,1234,0,2345.06,8),(1022,1234,1,0,8),(1023,1234,2,0,8),(1024,1234,0,1222.23,9),(1025,1234,1,547.99,9),(1026,1234,2,0,9),(1027,1234,0,267.33,10),(1028,1234,1,1558.85,10),(1029,1234,2,14882.24,10);
/*!40000 ALTER TABLE `tb_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'itaubank'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29  0:56:09
