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

DROP TABLE IF EXISTS `problemas`;

CREATE TABLE `problemas` (
  `id_problema` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_problema` text,
  `estructura_problema` text ,
  PRIMARY KEY (`id_problema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `problemas` (`id_problema`, `Nombre_problema`, `estructura_problema`) VALUES (NULL, 'Problema', '');

/*Data for the table `problemas` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
