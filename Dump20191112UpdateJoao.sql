-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: financeiro
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Saldo` decimal(9,2) NOT NULL,
  `Usuario_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Conta_Usuario_idx` (`Usuario_Id`),
  CONSTRAINT `fk_Conta_Usuario` FOREIGN KEY (`Usuario_Id`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (2,'Cartão de Crédito',1500.00,1),(5,'Poupança',3000.00,1),(6,'Santander',6666.00,1);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_contas`
--

DROP TABLE IF EXISTS `plano_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plano_contas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Tipo` char(1) DEFAULT NULL,
  `Usuario_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_contas`
--

LOCK TABLES `plano_contas` WRITE;
/*!40000 ALTER TABLE `plano_contas` DISABLE KEYS */;
INSERT INTO `plano_contas` VALUES (2,'CAsa','R',1),(3,'Moto','R',1),(4,'huveiro','D',1),(7,'Moto','R',1),(8,'Moto','D',1),(12,'Aluguel','R',1);
/*!40000 ALTER TABLE `plano_contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` datetime NOT NULL,
  `Tipo` char(1) NOT NULL,
  `Valor` decimal(9,2) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Conta_Id` int(11) NOT NULL,
  `Plano_Contas_Id` int(11) NOT NULL,
  `Usuario_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Transacao_Conta1_idx` (`Conta_Id`),
  KEY `fk_Transacao_Plano_Contas1_idx` (`Plano_Contas_Id`),
  CONSTRAINT `fk_Transacao_Conta1` FOREIGN KEY (`Conta_Id`) REFERENCES `conta` (`Id`),
  CONSTRAINT `fk_Transacao_Plano_Contas1` FOREIGN KEY (`Plano_Contas_Id`) REFERENCES `plano_contas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacao`
--

LOCK TABLES `transacao` WRITE;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` VALUES (1,'2019-11-11 00:00:00','D',1200.00,'teste',2,2,1);
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Alisson','alisson.ghf@gmail.com','123456','1997-08-16'),(6,'Aluno teste','aluno@gmail.com','123456','1111-08-16');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 22:41:27
