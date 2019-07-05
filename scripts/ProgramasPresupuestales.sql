/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.35-MariaDB : Database - programaspresupuestales
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`programaspresupuestales` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `programaspresupuestales`;

/*Table structure for table `bienesservicios` */

DROP TABLE IF EXISTS `bienesservicios`;

CREATE TABLE `bienesservicios` (
  `iIdBienServicio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tDescripcion` text NOT NULL,
  `tCriteriosCalidad` text NOT NULL,
  `tCriteriosEntregas` text NOT NULL,
  `iIdUnidadMedida` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdBienServicio`),
  KEY `FkUnidadMedida` (`iIdUnidadMedida`),
  KEY `FkProgramab` (`iIdPrograma`),
  CONSTRAINT `FkProgramab` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`),
  CONSTRAINT `FkUnidadMedida` FOREIGN KEY (`iIdUnidadMedida`) REFERENCES `unidadmedida` (`iUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bienesservicios` */

/*Table structure for table `bienesserviciossimilares` */

DROP TABLE IF EXISTS `bienesserviciossimilares`;

CREATE TABLE `bienesserviciossimilares` (
  `iIdBienesServiciosSimilares` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreServicio` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdBienesServiciosSimilares`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bienesserviciossimilares` */

/*Table structure for table `causasproblemas` */

DROP TABLE IF EXISTS `causasproblemas`;

CREATE TABLE `causasproblemas` (
  `iIdCausa` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tDescripcion` text NOT NULL,
  `iIdprograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdCausa`),
  KEY `FkIdProblema` (`iIdprograma`),
  CONSTRAINT `FkIdProblema` FOREIGN KEY (`iIdprograma`) REFERENCES `programas` (`iIdPrograma`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `causasproblemas` */

/*Table structure for table `coberturageografica` */

DROP TABLE IF EXISTS `coberturageografica`;

CREATE TABLE `coberturageografica` (
  `iIdCobertura` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nPorcentajePoblacion` decimal(5,2) unsigned NOT NULL,
  `nPorcentajeRural` decimal(5,2) unsigned NOT NULL,
  `i5Habitantes500` int(10) unsigned DEFAULT NULL,
  `iHabitantes500_2500` int(10) unsigned DEFAULT NULL,
  `iHabitantes2500_10000` int(10) unsigned DEFAULT NULL,
  `iHabitantes10001_15000` int(10) unsigned DEFAULT NULL,
  `iHabitantes15000_49999` int(10) unsigned DEFAULT NULL,
  `iHabitantes500000Mas` int(10) unsigned DEFAULT NULL,
  `iIdmunicipio` int(11) unsigned NOT NULL,
  `iIdCuantificacion` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdCobertura`),
  KEY `FkCuantificacionPob` (`iIdCuantificacion`),
  CONSTRAINT `FkCuantificacionPob` FOREIGN KEY (`iIdCuantificacion`) REFERENCES `cuantificacionpoblacion` (`iIdCuantificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `coberturageografica` */

/*Table structure for table `confprogramadersoccul` */

DROP TABLE IF EXISTS `confprogramadersoccul`;

CREATE TABLE `confprogramadersoccul` (
  `iIdDerEcSocCul` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  KEY `FkDerEcoSocCul` (`iIdDerEcSocCul`),
  KEY `FkIdProgramaP` (`iIdPrograma`),
  CONSTRAINT `FkDerEcoSocCul` FOREIGN KEY (`iIdDerEcSocCul`) REFERENCES `derecsoccul` (`iIdDerEcSocCul`),
  CONSTRAINT `FkIdProgramaP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `confprogramadersoccul` */

/*Table structure for table `confprogramasprevios` */

DROP TABLE IF EXISTS `confprogramasprevios`;

CREATE TABLE `confprogramasprevios` (
  `iIdConfiguracion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdProgramaPrevio` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdConfiguracion`),
  KEY `FkProgramaA` (`iIdPrograma`),
  KEY `FkProgramaPrevio` (`iIdProgramaPrevio`),
  CONSTRAINT `FkProgramaA` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`),
  CONSTRAINT `FkProgramaPrevio` FOREIGN KEY (`iIdProgramaPrevio`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `confprogramasprevios` */

/*Table structure for table `criteriofocalizacion` */

DROP TABLE IF EXISTS `criteriofocalizacion`;

CREATE TABLE `criteriofocalizacion` (
  `iIdCriterioFoc` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdCriterioFoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `criteriofocalizacion` */

/*Table structure for table `criteriosfocalizacioncomplemento` */

DROP TABLE IF EXISTS `criteriosfocalizacioncomplemento`;

CREATE TABLE `criteriosfocalizacioncomplemento` (
  `iIdCriterio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vDescripcion` varchar(255) NOT NULL,
  `vJustificacion` varchar(255) NOT NULL,
  `vMedioVerificacion` varchar(255) NOT NULL,
  `tLiga` text NOT NULL,
  `tArchivo` text NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdCriterioFoc` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdCriterio`),
  KEY `FkProgramaCr` (`iIdCriterioFoc`),
  CONSTRAINT `FkCriterioFoca` FOREIGN KEY (`iIdCriterioFoc`) REFERENCES `criteriofocalizacion` (`iIdCriterioFoc`),
  CONSTRAINT `FkProgramaCr` FOREIGN KEY (`iIdCriterioFoc`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `criteriosfocalizacioncomplemento` */

/*Table structure for table `cuantificacionpoblacion` */

DROP TABLE IF EXISTS `cuantificacionpoblacion`;

CREATE TABLE `cuantificacionpoblacion` (
  `iIdCuantificacion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tDescripcion` text NOT NULL,
  `iHombres` int(10) NOT NULL,
  `iMujeres` int(10) NOT NULL,
  `iHablantesIndigenas` int(10) unsigned NOT NULL,
  `tEspecificacionGrupo` text NOT NULL,
  `iIdGrupoEdad` int(11) unsigned NOT NULL,
  `iIdDefinicion` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdCuantificacion`),
  KEY `FkGrupoEdad` (`iIdGrupoEdad`),
  KEY `FkDefinicionPoblacion` (`iIdDefinicion`),
  KEY `FkProgramaC` (`iIdPrograma`),
  CONSTRAINT `FkDefinicionPoblacion` FOREIGN KEY (`iIdDefinicion`) REFERENCES `definicionpoblacion` (`iIdDefinicion`),
  CONSTRAINT `FkGrupoEdad` FOREIGN KEY (`iIdGrupoEdad`) REFERENCES `grupoedad` (`iIdGrupoEdad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkProgramaC` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuantificacionpoblacion` */

/*Table structure for table `definicionpoblacion` */

DROP TABLE IF EXISTS `definicionpoblacion`;

CREATE TABLE `definicionpoblacion` (
  `iIdDefinicion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdDefinicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `definicionpoblacion` */

/*Table structure for table `derecsoccul` */

DROP TABLE IF EXISTS `derecsoccul`;

CREATE TABLE `derecsoccul` (
  `iIdDerEcSocCul` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdDerEcSocCul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `derecsoccul` */

/*Table structure for table `ejeped` */

DROP TABLE IF EXISTS `ejeped`;

CREATE TABLE `ejeped` (
  `iIdEje` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vEje` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdEje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ejeped` */

/*Table structure for table `fuentescuantificacion` */

DROP TABLE IF EXISTS `fuentescuantificacion`;

CREATE TABLE `fuentescuantificacion` (
  `iIdFuentesCuantificacion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  `dFechaConsulta` date DEFAULT NULL,
  `tLiga` text,
  `tArchivo` text,
  `iIdCuantificacion` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdFuentesCuantificacion`),
  KEY `FkIdCuantificacion` (`iIdCuantificacion`),
  CONSTRAINT `FkIdCuantificacion` FOREIGN KEY (`iIdCuantificacion`) REFERENCES `cuantificacionpoblacion` (`iIdCuantificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fuentescuantificacion` */

/*Table structure for table `fuentesprogramas` */

DROP TABLE IF EXISTS `fuentesprogramas`;

CREATE TABLE `fuentesprogramas` (
  `iIdFuentesProgramas` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) DEFAULT NULL,
  `dFechaConsulta` date DEFAULT NULL,
  `tLiga` text,
  `tArchivo` text,
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdFuentesProgramas`),
  KEY `FkIdPrograma` (`iIdPrograma`),
  CONSTRAINT `FkIdPrograma` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fuentesprogramas` */

/*Table structure for table `grupoedad` */

DROP TABLE IF EXISTS `grupoedad`;

CREATE TABLE `grupoedad` (
  `iIdGrupoEdad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vClasificacion` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdGrupoEdad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grupoedad` */

/*Table structure for table `importancia` */

DROP TABLE IF EXISTS `importancia`;

CREATE TABLE `importancia` (
  `iIdImportancia` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreImportancia` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdImportancia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `importancia` */

/*Table structure for table `institucion` */

DROP TABLE IF EXISTS `institucion`;

CREATE TABLE `institucion` (
  `iIdInstitucion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vInstitucion` varchar(255) NOT NULL,
  `iIdEje` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdInstitucion`),
  KEY `FkEjePedInstitucion` (`iIdEje`),
  CONSTRAINT `FkEjePedInstitucion` FOREIGN KEY (`iIdEje`) REFERENCES `ejeped` (`iIdEje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `institucion` */

/*Table structure for table `involucrados` */

DROP TABLE IF EXISTS `involucrados`;

CREATE TABLE `involucrados` (
  `iIdInvolucrado` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreInvolucrado` varchar(255) NOT NULL COMMENT 'Es el nombre del actor',
  `iIdTipoActor` int(11) unsigned NOT NULL,
  `iIdPosicion` int(11) unsigned NOT NULL,
  `iIdImportancia` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdInvolucrado`),
  KEY `FkTipoActor` (`iIdTipoActor`),
  KEY `FkPosicion` (`iIdPosicion`),
  KEY `FkImportancia` (`iIdImportancia`),
  KEY `FkProgramaI` (`iIdPrograma`),
  CONSTRAINT `FkImportancia` FOREIGN KEY (`iIdImportancia`) REFERENCES `importancia` (`iIdImportancia`),
  CONSTRAINT `FkPosicion` FOREIGN KEY (`iIdPosicion`) REFERENCES `posicion` (`iIdPosicion`),
  CONSTRAINT `FkProgramaI` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`),
  CONSTRAINT `FkTipoActor` FOREIGN KEY (`iIdTipoActor`) REFERENCES `tipoactor` (`iIdTipoActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `involucrados` */

/*Table structure for table `localidad` */

DROP TABLE IF EXISTS `localidad`;

CREATE TABLE `localidad` (
  `iIdLocalidad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vLocalidad` varchar(255) NOT NULL,
  `iIdMunicipio` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdLocalidad`),
  KEY `FkIdMunicipios` (`iIdMunicipio`),
  CONSTRAINT `FkIdMunicipios` FOREIGN KEY (`iIdMunicipio`) REFERENCES `municipio` (`iIdMunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `localidad` */

/*Table structure for table `lugarimplementacion` */

DROP TABLE IF EXISTS `lugarimplementacion`;

CREATE TABLE `lugarimplementacion` (
  `iIdmunicipio` int(11) unsigned NOT NULL,
  `iIdConfiguracion` int(11) unsigned NOT NULL,
  KEY `FkConfiguracion` (`iIdConfiguracion`),
  CONSTRAINT `FkConfiguracion` FOREIGN KEY (`iIdConfiguracion`) REFERENCES `confprogramasprevios` (`iIdConfiguracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lugarimplementacion` */

/*Table structure for table `lugarimplementacionpsimilar` */

DROP TABLE IF EXISTS `lugarimplementacionpsimilar`;

CREATE TABLE `lugarimplementacionpsimilar` (
  `iIdLugar` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vDescripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdLugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lugarimplementacionpsimilar` */

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `iIdMunicipio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vClave` varchar(3) NOT NULL,
  `vMunicipio` varchar(100) NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `municipio` */

/*Table structure for table `municipiosincidencia` */

DROP TABLE IF EXISTS `municipiosincidencia`;

CREATE TABLE `municipiosincidencia` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `IidMunicipio` int(11) unsigned NOT NULL,
  KEY `FkIdProgramaMun` (`iIdPrograma`),
  CONSTRAINT `FkIdProgramaMun` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `municipiosincidencia` */

/*Table structure for table `objetivos` */

DROP TABLE IF EXISTS `objetivos`;

CREATE TABLE `objetivos` (
  `iIdObjetivo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreObjetivo` varchar(255) NOT NULL,
  `tEstructuraObjetivo` text NOT NULL,
  `iIdProblema` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdObjetivo`),
  KEY `FkIdProblemao` (`iIdProblema`),
  CONSTRAINT `FkIdProblemao` FOREIGN KEY (`iIdProblema`) REFERENCES `problema` (`iIdProblema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `objetivos` */

/*Table structure for table `otroscriterios` */

DROP TABLE IF EXISTS `otroscriterios`;

CREATE TABLE `otroscriterios` (
  `iIdCriterio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tDescripcionCriterio` text NOT NULL,
  `iIdCuantificacion` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdCriterio`),
  KEY `FkCuantificacion` (`iIdCuantificacion`),
  CONSTRAINT `FkCuantificacion` FOREIGN KEY (`iIdCuantificacion`) REFERENCES `cuantificacionpoblacion` (`iIdCuantificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `otroscriterios` */

/*Table structure for table `posicion` */

DROP TABLE IF EXISTS `posicion`;

CREATE TABLE `posicion` (
  `iIdPosicion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombrePosicion` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdPosicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `posicion` */

/*Table structure for table `problema` */

DROP TABLE IF EXISTS `problema`;

CREATE TABLE `problema` (
  `iIdProblema` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreProblema` varchar(255) NOT NULL,
  `tEstructuraProblema` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdProblema`),
  KEY `FkIdProgramaproblema` (`iIdPrograma`),
  CONSTRAINT `FkIdProgramaproblema` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `problema` */

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `iIdPrograma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  `vObjetivo` varchar(255) DEFAULT NULL,
  `tDescripcion` text,
  `tPoblacionObjetivo` text,
  `tResultadoEvaluaciones` text,
  `tLigaInforme` text,
  `tArchivoAdjunto` text,
  `tDiagnosticoProblematica` text,
  `tEvolucionProblematica` text,
  `tProblematicaHM` text,
  `tProblematicaMayaIndg` text,
  `iIdUsuario` int(11) unsigned NOT NULL,
  `iIdTipoPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdPrograma`),
  KEY `FkIdUsuario` (`iIdUsuario`),
  KEY `FkTipoPrograma` (`iIdTipoPrograma`),
  CONSTRAINT `FkIdUsuario` FOREIGN KEY (`iIdUsuario`) REFERENCES `usuario` (`iIdUsuario`),
  CONSTRAINT `FkTipoPrograma` FOREIGN KEY (`iIdTipoPrograma`) REFERENCES `tipoprograma` (`iIdTipoPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programas` */

/*Table structure for table `programassimilares` */

DROP TABLE IF EXISTS `programassimilares`;

CREATE TABLE `programassimilares` (
  `iIdProgramaSimilar` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) DEFAULT NULL,
  `vObjetivo` varchar(255) DEFAULT NULL,
  `tDescripcion` text,
  `tPoblacionObjetivo` text,
  `tResultadoEvaluaciones` text,
  `tLigaInforme` text,
  `tArchivoAdjunto` text,
  `vEspecificarOtro` varchar(255) DEFAULT NULL,
  `iIdLugar` int(11) unsigned NOT NULL,
  `iIdBienesServiciosSimilares` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdProgramaSimilar`),
  KEY `FkLugarImplementacion` (`iIdLugar`),
  KEY `FkIdBienServicio` (`iIdBienesServiciosSimilares`),
  KEY `FkProgramasS` (`iIdPrograma`),
  CONSTRAINT `FkIdBienServicio` FOREIGN KEY (`iIdBienesServiciosSimilares`) REFERENCES `bienesserviciossimilares` (`iIdBienesServiciosSimilares`),
  CONSTRAINT `FkLugarImplementacion` FOREIGN KEY (`iIdLugar`) REFERENCES `lugarimplementacionpsimilar` (`iIdLugar`),
  CONSTRAINT `FkProgramasS` FOREIGN KEY (`iIdPrograma`) REFERENCES `programas` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programassimilares` */

/*Table structure for table `tipoactor` */

DROP TABLE IF EXISTS `tipoactor`;

CREATE TABLE `tipoactor` (
  `iIdTipoActor` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombreTipo` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdTipoActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoactor` */

/*Table structure for table `tipoprograma` */

DROP TABLE IF EXISTS `tipoprograma`;

CREATE TABLE `tipoprograma` (
  `iIdTipoPrograma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`iIdTipoPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoprograma` */

/*Table structure for table `unidadmedida` */

DROP TABLE IF EXISTS `unidadmedida`;

CREATE TABLE `unidadmedida` (
  `iUnidadMedida` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`iUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `unidadmedida` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `iIdUsuario` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vUsuario` varchar(100) NOT NULL,
  `tPassword` text NOT NULL COMMENT 'Password códificado en SHA1',
  `vNombres` varchar(100) NOT NULL,
  `vPrimerApellido` varchar(100) NOT NULL,
  `vSegundoApellido` varchar(100) NOT NULL,
  `vCorreo` varchar(100) NOT NULL,
  `iIdInstitucion` int(11) unsigned NOT NULL,
  `iIdRol` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1:Sí, 0:No',
  PRIMARY KEY (`iIdUsuario`),
  KEY `FkUsuarioInstitucion` (`iIdInstitucion`),
  CONSTRAINT `FkUsuarioInstitucion` FOREIGN KEY (`iIdInstitucion`) REFERENCES `institucion` (`iIdInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
