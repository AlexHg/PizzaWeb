-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: planet_pizza
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo_ingred`
--

DROP TABLE IF EXISTS `costo_ingred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costo_ingred` (
  `cantidad` smallint(6) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  PRIMARY KEY (`cantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_ingred`
--

LOCK TABLES `costo_ingred` WRITE;
/*!40000 ALTER TABLE `costo_ingred` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_ingred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `id_dir` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`id_dir`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `id_puesto` int(11) NOT NULL,
  `id_suc` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `anotaciones` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto` (`id_puesto`),
  KEY `id_suc` (`id_suc`),
  KEY `id_horario` (`id_horario`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_edo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`id_edo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_suc`
--

DROP TABLE IF EXISTS `extra_suc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_suc` (
  `id_extra` int(11) NOT NULL,
  `id_suc` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_extra`,`id_suc`),
  KEY `id_suc` (`id_suc`),
  CONSTRAINT `extra_suc_ibfk_1` FOREIGN KEY (`id_extra`) REFERENCES `extras` (`id_extra`),
  CONSTRAINT `extra_suc_ibfk_2` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_suc`
--

LOCK TABLES `extra_suc` WRITE;
/*!40000 ALTER TABLE `extra_suc` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_suc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extras` (
  `id_extra` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ing_suc`
--

DROP TABLE IF EXISTS `ing_suc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_suc` (
  `id_ingrediente` int(11) NOT NULL,
  `id_suc` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_ingrediente`,`id_suc`),
  KEY `id_suc` (`id_suc`),
  CONSTRAINT `ing_suc_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `ing_suc_ibfk_2` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ing_suc`
--

LOCK TABLES `ing_suc` WRITE;
/*!40000 ALTER TABLE `ing_suc` DISABLE KEYS */;
/*!40000 ALTER TABLE `ing_suc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `ingrediente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masa`
--

DROP TABLE IF EXISTS `masa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masa` (
  `id_masa` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(7,2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_masa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masa`
--

LOCK TABLES `masa` WRITE;
/*!40000 ALTER TABLE `masa` DISABLE KEYS */;
/*!40000 ALTER TABLE `masa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitad`
--

DROP TABLE IF EXISTS `mitad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitad` (
  `id_mitad` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_mitad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitad`
--

LOCK TABLES `mitad` WRITE;
/*!40000 ALTER TABLE `mitad` DISABLE KEYS */;
/*!40000 ALTER TABLE `mitad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `anotaciones` varchar(250) DEFAULT NULL,
  `id_dir` int(11) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `id_edo` int(11) NOT NULL,
  `id_suc` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_dir` (`id_dir`),
  KEY `id_edo` (`id_edo`),
  KEY `id_suc` (`id_suc`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_dir`) REFERENCES `direcciones` (`id_dir`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`id_edo`) REFERENCES `estados` (`id_edo`),
  CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_extra`
--

DROP TABLE IF EXISTS `orden_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_extra` (
  `id_orden` int(11) NOT NULL,
  `id_extra` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_extra`),
  KEY `id_extra` (`id_extra`),
  CONSTRAINT `orden_extra_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_extra_ibfk_2` FOREIGN KEY (`id_extra`) REFERENCES `extras` (`id_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_extra`
--

LOCK TABLES `orden_extra` WRITE;
/*!40000 ALTER TABLE `orden_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_paq`
--

DROP TABLE IF EXISTS `orden_paq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_paq` (
  `id_orden` int(11) NOT NULL,
  `id_paq` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_paq`),
  KEY `id_paq` (`id_paq`),
  CONSTRAINT `orden_paq_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_paq_ibfk_2` FOREIGN KEY (`id_paq`) REFERENCES `paquetes` (`id_paq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_paq`
--

LOCK TABLES `orden_paq` WRITE;
/*!40000 ALTER TABLE `orden_paq` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_paq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_per`
--

DROP TABLE IF EXISTS `orden_per`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_per` (
  `id_orden` int(11) NOT NULL,
  `id_pers` int(11) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_pers`,`id_tamano`),
  KEY `id_pers` (`id_pers`),
  KEY `id_tamano` (`id_tamano`),
  CONSTRAINT `orden_per_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_per_ibfk_2` FOREIGN KEY (`id_pers`) REFERENCES `personalizada` (`id_p_pers`),
  CONSTRAINT `orden_per_ibfk_3` FOREIGN KEY (`id_tamano`) REFERENCES `tamano` (`id_tamano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_per`
--

LOCK TABLES `orden_per` WRITE;
/*!40000 ALTER TABLE `orden_per` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_per` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pizza`
--

DROP TABLE IF EXISTS `orden_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_pizza` (
  `id_orden` int(11) NOT NULL,
  `id_pizza` int(11) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  `id_masa` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_pizza`,`id_tamano`,`id_masa`),
  KEY `id_pizza` (`id_pizza`),
  KEY `id_tamano` (`id_tamano`),
  KEY `id_masa` (`id_masa`),
  CONSTRAINT `orden_pizza_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_pizza_ibfk_2` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  CONSTRAINT `orden_pizza_ibfk_3` FOREIGN KEY (`id_tamano`) REFERENCES `tamano` (`id_tamano`),
  CONSTRAINT `orden_pizza_ibfk_4` FOREIGN KEY (`id_masa`) REFERENCES `masa` (`id_masa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pizza`
--

LOCK TABLES `orden_pizza` WRITE;
/*!40000 ALTER TABLE `orden_pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_prom`
--

DROP TABLE IF EXISTS `orden_prom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_prom` (
  `id_orden` int(11) NOT NULL,
  `id_prom` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_prom`),
  KEY `id_prom` (`id_prom`),
  CONSTRAINT `orden_prom_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `orden_prom_ibfk_2` FOREIGN KEY (`id_prom`) REFERENCES `promociones` (`id_prom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_prom`
--

LOCK TABLES `orden_prom` WRITE;
/*!40000 ALTER TABLE `orden_prom` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_prom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paq_extra`
--

DROP TABLE IF EXISTS `paq_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paq_extra` (
  `id_paq` int(11) NOT NULL,
  `id_extra` int(11) NOT NULL,
  PRIMARY KEY (`id_paq`,`id_extra`),
  KEY `id_extra` (`id_extra`),
  CONSTRAINT `paq_extra_ibfk_1` FOREIGN KEY (`id_paq`) REFERENCES `paquetes` (`id_paq`),
  CONSTRAINT `paq_extra_ibfk_2` FOREIGN KEY (`id_extra`) REFERENCES `extras` (`id_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paq_extra`
--

LOCK TABLES `paq_extra` WRITE;
/*!40000 ALTER TABLE `paq_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `paq_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paq_pizza`
--

DROP TABLE IF EXISTS `paq_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paq_pizza` (
  `id_paq` int(11) NOT NULL,
  `id_pizza` int(11) NOT NULL,
  PRIMARY KEY (`id_paq`,`id_pizza`),
  KEY `id_pizza` (`id_pizza`),
  CONSTRAINT `paq_pizza_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  CONSTRAINT `paq_pizza_ibfk_2` FOREIGN KEY (`id_paq`) REFERENCES `paquetes` (`id_paq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paq_pizza`
--

LOCK TABLES `paq_pizza` WRITE;
/*!40000 ALTER TABLE `paq_pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `paq_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquetes` (
  `id_paq` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  PRIMARY KEY (`id_paq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes`
--

LOCK TABLES `paquetes` WRITE;
/*!40000 ALTER TABLE `paquetes` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalizada`
--

DROP TABLE IF EXISTS `personalizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalizada` (
  `id_p_pers` int(11) NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int(11) NOT NULL,
  `id_mitad` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_p_pers`,`id_ingrediente`,`id_mitad`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_mitad` (`id_mitad`),
  CONSTRAINT `personalizada_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `personalizada_ibfk_2` FOREIGN KEY (`id_mitad`) REFERENCES `mitad` (`id_mitad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalizada`
--

LOCK TABLES `personalizada` WRITE;
/*!40000 ALTER TABLE `personalizada` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `id_pizza` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pizza`),
  KEY `idpizza` (`id_pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingrediente`
--

DROP TABLE IF EXISTS `pizza_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_ingrediente` (
  `id_pizza` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`id_pizza`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `pizza_ingrediente_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  CONSTRAINT `pizza_ingrediente_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingrediente`
--

LOCK TABLES `pizza_ingrediente` WRITE;
/*!40000 ALTER TABLE `pizza_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prom_extra`
--

DROP TABLE IF EXISTS `prom_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prom_extra` (
  `id_prom` int(11) NOT NULL,
  `id_extra` int(11) NOT NULL,
  PRIMARY KEY (`id_prom`,`id_extra`),
  KEY `id_extra` (`id_extra`),
  CONSTRAINT `prom_extra_ibfk_1` FOREIGN KEY (`id_prom`) REFERENCES `promociones` (`id_prom`),
  CONSTRAINT `prom_extra_ibfk_2` FOREIGN KEY (`id_extra`) REFERENCES `extras` (`id_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prom_extra`
--

LOCK TABLES `prom_extra` WRITE;
/*!40000 ALTER TABLE `prom_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `prom_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prom_pizza`
--

DROP TABLE IF EXISTS `prom_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prom_pizza` (
  `id_prom` int(11) NOT NULL,
  `id_pizza` int(11) NOT NULL,
  PRIMARY KEY (`id_prom`,`id_pizza`),
  KEY `id_pizza` (`id_pizza`),
  CONSTRAINT `prom_pizza_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  CONSTRAINT `prom_pizza_ibfk_2` FOREIGN KEY (`id_prom`) REFERENCES `promociones` (`id_prom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prom_pizza`
--

LOCK TABLES `prom_pizza` WRITE;
/*!40000 ALTER TABLE `prom_pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `prom_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promociones` (
  `id_prom` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  PRIMARY KEY (`id_prom`),
  KEY `idprom` (`id_prom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puestos` (
  `id_puesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `permitido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_rol`,`id_permiso`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursales` (
  `id_suc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `ubicacion` varchar(250) NOT NULL,
  `coordenadas` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  PRIMARY KEY (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamano`
--

DROP TABLE IF EXISTS `tamano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamano` (
  `id_tamano` int(11) NOT NULL AUTO_INCREMENT,
  `tamano` varchar(50) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id_tamano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamano`
--

LOCK TABLES `tamano` WRITE;
/*!40000 ALTER TABLE `tamano` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `id_suc` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `id_suc` (`id_suc`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaje` (
  `id_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `cambio` decimal(7,2) NOT NULL,
  `id_suc` int(11) NOT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_suc` (`id_suc`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`id_suc`) REFERENCES `sucursales` (`id_suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_orden`
--

DROP TABLE IF EXISTS `viaje_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaje_orden` (
  `id_viaje` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  PRIMARY KEY (`id_viaje`,`id_orden`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `viaje_orden_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`),
  CONSTRAINT `viaje_orden_ibfk_2` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_orden`
--

LOCK TABLES `viaje_orden` WRITE;
/*!40000 ALTER TABLE `viaje_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_orden` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-20 16:25:17
