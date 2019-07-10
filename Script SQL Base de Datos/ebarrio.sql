CREATE DATABASE  IF NOT EXISTS `ebarrio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ebarrio`;
-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: ebarrio
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Francisco','admin@admin.cl','159',1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `calculo`
--

DROP TABLE IF EXISTS `calculo`;
/*!50001 DROP VIEW IF EXISTS `calculo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `calculo` (
  `meta` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `promValorMens` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `consumohistorico`
--

DROP TABLE IF EXISTS `consumohistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumohistorico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailuser` varchar(100) DEFAULT NULL,
  `numcliente` varchar(45) DEFAULT NULL,
  `distribuidora` varchar(45) DEFAULT NULL,
  `nomusuario` varchar(45) DEFAULT NULL,
  `inmueble` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `medidor` int(11) DEFAULT NULL,
  `mes1` varchar(45) DEFAULT NULL,
  `mes2` varchar(45) DEFAULT NULL,
  `mes3` varchar(45) DEFAULT NULL,
  `mes4` varchar(45) DEFAULT NULL,
  `mes5` varchar(45) DEFAULT NULL,
  `mes6` varchar(45) DEFAULT NULL,
  `kwh1` int(11) DEFAULT NULL,
  `kwh2` int(11) DEFAULT NULL,
  `kwh3` int(11) DEFAULT NULL,
  `kwh4` int(11) DEFAULT NULL,
  `kwh5` int(11) DEFAULT NULL,
  `kwh6` int(11) DEFAULT NULL,
  `valor1` int(11) DEFAULT NULL,
  `valor2` int(11) DEFAULT NULL,
  `valor3` int(11) DEFAULT NULL,
  `valor4` int(11) DEFAULT NULL,
  `valor5` int(11) DEFAULT NULL,
  `valor6` int(11) DEFAULT NULL,
  `promKwh` double DEFAULT NULL,
  `promValorMens` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emailuser_idx` (`emailuser`),
  CONSTRAINT `emailuser` FOREIGN KEY (`emailuser`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumohistorico`
--

LOCK TABLES `consumohistorico` WRITE;
/*!40000 ALTER TABLE `consumohistorico` DISABLE KEYS */;
INSERT INTO `consumohistorico` VALUES (1,'c@unab.cl','123456-7','Chilquinta','Carlos Lopez Soto','Casa','Manuel Rodriguez 8456, Valparaíso',8785652,'2018-12-15','2018-11-15','2018-10-15','2018-09-15','2018-08-15','2018-07-15',250,245,240,235,230,225,36000,35280,34560,33840,33120,32400,237.5,34200);
/*!40000 ALTER TABLE `consumohistorico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos` (
  `idproyectos` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(45) DEFAULT NULL,
  `rutsocial` varchar(45) DEFAULT NULL,
  `organizacion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tarifa` varchar(45) DEFAULT NULL,
  `destinatario` varchar(45) DEFAULT NULL,
  `beneficiariodirecto` int(11) DEFAULT NULL,
  `beneficiarioindirecto` int(11) DEFAULT NULL,
  `dimensiones` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `region` varchar(70) DEFAULT NULL,
  `estado` varchar(70) DEFAULT 'En Postulación fase 1	',
  `meta` int(11) DEFAULT NULL,
  `dinero` int(30) DEFAULT NULL,
  `aporte` int(11) DEFAULT NULL,
  `manodeobra` int(11) DEFAULT NULL,
  `materiales` int(11) DEFAULT NULL,
  `aprobado` varchar(45) DEFAULT 'No',
  `porcentaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Universidad Andrés Bello','71540100-2','Establecimiento educacional','322456789','unab@unab.cl','Reducción de consumo de energía','Construcción muro facultad','No','Personas con discapacidad',150,300,246,18,'V Región de Valparaíso','En proceso fase 1',15,25000000,50000000,10000000,5000000,'Si',45),(2,'Conafe S.A','31143000-2','Fundación','32458907','vina@conafe.cl','Reducción de consumo de energía','Mejorar luminarias sector las palmas chilenas','no','Personas de escasos recursos',500,1000,234,6,'V Región de Valparaíso','Adjudicado Fase 2',10,20000000,10000000,0,0,'Si',100),(3,'Los canelos S.A','16500789-6','Fundación','23456789','soporte@loscanelos.cl','Reducción de consumo de energía','Mejorar para tercera edad sector Rodelillo','No','Personas con discapacidad',100,300,34,10,'R.M Región Metropolitana de Santiago','En postulación fase 1',20,0,10000000,0,0,'No',0),(15,'DuocUC','72754700-2','Establecimiento educacional','56322268600','comunidad@duoc.cl','Reciclaje','Save the World 2019','No','Personas de escasos recursos',30,500,0,6,'V Región de Valparaíso','Terminado Fase 1',60,3580990,300000,1500000,2350000,'Si',60);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nivel` int(11) DEFAULT '2',
  `estado` varchar(45) DEFAULT 'on',
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos Lopez Soto','123','c@unab.cl',2,'on'),(2,'Test Test Test','123','test@test.cl',2,'on');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioproyecto`
--

DROP TABLE IF EXISTS `usuarioproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioproyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailusu` varchar(100) DEFAULT NULL,
  `idproyecto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idusuario_idx` (`emailusu`),
  KEY `idproyecto_idx` (`idproyecto`),
  CONSTRAINT `emailusu` FOREIGN KEY (`emailusu`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idproyecto` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idproyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioproyecto`
--

LOCK TABLES `usuarioproyecto` WRITE;
/*!40000 ALTER TABLE `usuarioproyecto` DISABLE KEYS */;
INSERT INTO `usuarioproyecto` VALUES (1,'c@unab.cl',1);
/*!40000 ALTER TABLE `usuarioproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `calculo`
--

/*!50001 DROP TABLE IF EXISTS `calculo`*/;
/*!50001 DROP VIEW IF EXISTS `calculo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `calculo` AS (select `proyectos`.`meta` AS `meta`,(`consumohistorico`.`promValorMens` - (`consumohistorico`.`promValorMens` / `proyectos`.`meta`)) AS `Total`,`consumohistorico`.`promValorMens` AS `promValorMens` from (`consumohistorico` join `proyectos`) where ((`proyectos`.`idproyectos` = 1) and (`consumohistorico`.`emailuser` = 'c@unab.cl'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-30 17:32:51
