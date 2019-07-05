/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.40-MariaDB : Database - programas_presupuestales
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`programas_presupuestales` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `programas_presupuestales`;

/*Table structure for table `problemas` */

DROP TABLE IF EXISTS `objetivos`;

CREATE TABLE `objetivos` (
  `iId_objeivos` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre_objetivo` text,
  `tEstructura_objetivo` text,
  `iId_problemas` int(11) NULL,
  `IActivo` int(11) NULL,
  PRIMARY KEY (`iId_objeivos`),
  FOREIGN KEY (`iId_problemas`) REFERENCES problemas (`iId_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `problemas` */

