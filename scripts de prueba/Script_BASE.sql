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

/*Table structure for table `actividad` */

DROP TABLE IF EXISTS `actividad`;

CREATE TABLE `actividad` (
  `iIdActividad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `Proposito` varchar(255) NOT NULL,
  `vIndicador` text NOT NULL,
  `vMedioVerificacion` text NOT NULL,
  `vSupuesto` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `nMeta` decimal(12,2) DEFAULT NULL,
  `nLineaBase` decimal(12,2) DEFAULT NULL,
  `nMetaAnio1` decimal(12,2) DEFAULT NULL,
  `nMetaAnio2` decimal(12,2) DEFAULT NULL,
  `nMetaAnio3` decimal(12,2) DEFAULT NULL,
  `nMetaAnio4` decimal(12,2) DEFAULT NULL,
  `nMetaAnio5` decimal(12,2) DEFAULT NULL,
  `nMetaFinal` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`iIdActividad`),
  KEY `FK_Actividad_PP` (`iIdPrograma`),
  CONSTRAINT `FK_Actividad_PP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `actividad` */

LOCK TABLES `actividad` WRITE;

UNLOCK TABLES;

/*Table structure for table `actor` */

DROP TABLE IF EXISTS `actor`;

CREATE TABLE `actor` (
  `iIdActor` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vActor` varchar(150) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdActor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `actor` */

LOCK TABLES `actor` WRITE;

insert  into `actor`(`iIdActor`,`vActor`,`iActivo`) values (1,'Públicos',1),(2,'Privados',1),(3,'ONG',1);

UNLOCK TABLES;

/*Table structure for table `alineacionplaneacion` */

DROP TABLE IF EXISTS `alineacionplaneacion`;

CREATE TABLE `alineacionplaneacion` (
  `iIdProgramaPresupuestario` int(11) unsigned NOT NULL,
  `iIdLineaAccion` int(11) unsigned NOT NULL,
  PRIMARY KEY (`iIdProgramaPresupuestario`,`iIdLineaAccion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `alineacionplaneacion` */

LOCK TABLES `alineacionplaneacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `ambitomedicion` */

DROP TABLE IF EXISTS `ambitomedicion`;

CREATE TABLE `ambitomedicion` (
  `iIdAmbitoMedicion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vAmbitoMedicion` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdAmbitoMedicion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ambitomedicion` */

LOCK TABLES `ambitomedicion` WRITE;

insert  into `ambitomedicion`(`iIdAmbitoMedicion`,`vAmbitoMedicion`,`iActivo`) values (1,'Resultados a corto plazo',1);

UNLOCK TABLES;

/*Table structure for table `bienservicio` */

DROP TABLE IF EXISTS `bienservicio`;

CREATE TABLE `bienservicio` (
  `iIdBienServicio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vBienServicio` varchar(255) NOT NULL,
  `iTipo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Sin espcificar, 1=Bien, 2=Servicio',
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdBienServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bienservicio` */

LOCK TABLES `bienservicio` WRITE;

UNLOCK TABLES;

/*Table structure for table `carateristicabienservicio` */

DROP TABLE IF EXISTS `carateristicabienservicio`;

CREATE TABLE `carateristicabienservicio` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdBienServicio` int(11) unsigned NOT NULL,
  `vDescripcion` text NOT NULL,
  `vcriteriosCalidad` text NOT NULL,
  `vCriteriosEntrega` text NOT NULL,
  `vRequisitos` text NOT NULL,
  `vCumplimientoObjetivo` text NOT NULL,
  PRIMARY KEY (`iIdPrograma`,`iIdBienServicio`),
  KEY `FK_CBServ_BienServicio` (`iIdBienServicio`),
  CONSTRAINT `FK_CBServ_BienServicio` FOREIGN KEY (`iIdBienServicio`) REFERENCES `bienservicio` (`iIdBienServicio`),
  CONSTRAINT `FK_CBServ_pp` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `carateristicabienservicio` */

LOCK TABLES `carateristicabienservicio` WRITE;

UNLOCK TABLES;

/*Table structure for table `cobertura` */

DROP TABLE IF EXISTS `cobertura`;

CREATE TABLE `cobertura` (
  `iIdCobertura` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vCobertura` varchar(100) NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdCobertura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cobertura` */

LOCK TABLES `cobertura` WRITE;

insert  into `cobertura`(`iIdCobertura`,`vCobertura`,`iActivo`) values (1,'Todos los municipios',1),(2,'Regional',1),(3,'Zonas prioritarias',1),(4,'Municipal',1);

UNLOCK TABLES;

/*Table structure for table `coberturageografica` */

DROP TABLE IF EXISTS `coberturageografica`;

CREATE TABLE `coberturageografica` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdLocalidad` int(11) unsigned NOT NULL,
  `iPoblacionTotal` int(10) unsigned NOT NULL,
  `nPorcentajeUrbana` decimal(12,2) unsigned NOT NULL,
  `nPorcentajeRural` decimal(12,2) unsigned NOT NULL,
  `iIdTamanioLocalidad` int(11) unsigned NOT NULL,
  `iValorTamanioLocalidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iIdPrograma`,`iIdLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `coberturageografica` */

LOCK TABLES `coberturageografica` WRITE;

UNLOCK TABLES;

/*Table structure for table `coherenciainstitucional` */

DROP TABLE IF EXISTS `coherenciainstitucional`;

CREATE TABLE `coherenciainstitucional` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdInstitucion` int(11) unsigned NOT NULL,
  `vArea` varchar(255) NOT NULL,
  `vResponsabilidad` text NOT NULL,
  `vInteractua` text NOT NULL,
  `vMecanismoCoordinacion` text NOT NULL,
  PRIMARY KEY (`iIdPrograma`,`iIdInstitucion`),
  KEY `FK_Coherencia_Institucion` (`iIdInstitucion`),
  CONSTRAINT `FK_Coherencia_Institucion` FOREIGN KEY (`iIdInstitucion`) REFERENCES `institucion` (`iIdInstitucion`),
  CONSTRAINT `FK_Coherencia_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `coherenciainstitucional` */

LOCK TABLES `coherenciainstitucional` WRITE;

UNLOCK TABLES;

/*Table structure for table `componente` */

DROP TABLE IF EXISTS `componente`;

CREATE TABLE `componente` (
  `iIdComponente` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vComponente` varchar(255) NOT NULL,
  `vIndicador` text NOT NULL,
  `vMedioVerificacion` text NOT NULL,
  `vSupuesto` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL,
  `nMeta` decimal(12,2) DEFAULT NULL,
  `nLineaBase` decimal(12,2) DEFAULT NULL,
  `nMetaAnio1` decimal(12,2) DEFAULT NULL,
  `nMetaAnio2` decimal(12,2) DEFAULT NULL,
  `nMetaAnio3` decimal(12,2) DEFAULT NULL,
  `nMetaAnio4` decimal(12,2) DEFAULT NULL,
  `nMetaAnio5` decimal(12,2) DEFAULT NULL,
  `nMetaFinal` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`iIdComponente`),
  KEY `FK_Componente_PP` (`iIdPrograma`),
  CONSTRAINT `FK_Componente_PP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `componente` */

LOCK TABLES `componente` WRITE;

UNLOCK TABLES;

/*Table structure for table `criteriofocalizacion` */

DROP TABLE IF EXISTS `criteriofocalizacion`;

CREATE TABLE `criteriofocalizacion` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vIngresoDescripcion` text NOT NULL,
  `vIngresoJustificacion` text NOT NULL,
  `iSexo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Indistinto,1=Hombre, 2=Mujer',
  `vSexoJustificacion` text NOT NULL,
  `iIdGrupoEtario` int(11) unsigned NOT NULL,
  `vGrupoEtarioJustificacion` text NOT NULL,
  `iCondicionHablante` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=Si, 2=No, 0=Indistinto',
  `vCondicionHablanteJustificacion` text NOT NULL,
  `vUbicacion` text NOT NULL,
  `vUbicacionJustificacion` text NOT NULL,
  `vOtrosCriterios` text NOT NULL,
  `vOtrosCriteriosJustificacion` text NOT NULL,
  PRIMARY KEY (`iIdPrograma`),
  KEY `FK_CriFoc_GrupoEta` (`iIdGrupoEtario`),
  CONSTRAINT `FK_CriFoc_GrupoEta` FOREIGN KEY (`iIdGrupoEtario`) REFERENCES `grupoetario` (`iIdGrupoEtario`),
  CONSTRAINT `FK_CriFoc_PP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `criteriofocalizacion` */

LOCK TABLES `criteriofocalizacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `cuantificacionpoblacion` */

DROP TABLE IF EXISTS `cuantificacionpoblacion`;

CREATE TABLE `cuantificacionpoblacion` (
  `iIdCuantificacionPoblacion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vPReferencia` varchar(255) NOT NULL,
  `iPReferenciaH` int(10) unsigned NOT NULL,
  `vPReferenciaHVerificacion` text NOT NULL,
  `iPReferenciaM` int(10) unsigned NOT NULL,
  `vPReferenciaMVerficacion` text NOT NULL,
  `iPReferenciaHablantes` int(10) unsigned NOT NULL,
  `vPReferenciaHablantesVerificacion` text NOT NULL,
  `iPReferenciaGrupoEdad` int(10) unsigned NOT NULL,
  `vPReferenciaGrupoEdadVerificacion` text NOT NULL,
  `vPReferenciaOtros` text NOT NULL,
  `PReferenciaOtrosVerificacion` text NOT NULL,
  `vPPotencial` varchar(255) NOT NULL,
  `iPPotencialH` int(10) unsigned NOT NULL,
  `vPPotencialHVerificacion` text NOT NULL,
  `iPPotencialM` int(10) unsigned NOT NULL,
  `vPPotencialMVerficacion` text NOT NULL,
  `iPPotencialHablantes` int(10) unsigned NOT NULL,
  `vPPotencialHablantesVerificacion` text NOT NULL,
  `iPPotencialGrupoEdad` int(10) unsigned NOT NULL,
  `vPPotencialGrupoEdadVerificacion` text NOT NULL,
  `vPPotencialOtros` text NOT NULL,
  `PPotencialOtrosVerificacion` text NOT NULL,
  `vPObjetivo` varchar(255) NOT NULL,
  `iPObjetivoH` int(10) unsigned NOT NULL,
  `vPObjetivoHVerificacion` text NOT NULL,
  `iPObjetivoM` int(10) unsigned NOT NULL,
  `vPObjetivoMVerficacion` text NOT NULL,
  `iPObjetivoHablantes` int(10) unsigned NOT NULL,
  `vPObjetivoHablantesVerificacion` text NOT NULL,
  `iPObjetivoGrupoEdad` int(10) unsigned NOT NULL,
  `vPObjetivoGrupoEdadVerificacion` text NOT NULL,
  `vPObjetivoOtros` text NOT NULL,
  `PObjetivoOtrosVerificacion` text NOT NULL,
  `vPProgramada` varchar(255) NOT NULL,
  `iPProgramadaH` int(10) unsigned NOT NULL,
  `vPProgramadaHVerificacion` text NOT NULL,
  `iPProgramadaM` int(10) unsigned NOT NULL,
  `vPProgramadaMVerficacion` text NOT NULL,
  `iPProgramadaHablantes` int(10) unsigned NOT NULL,
  `vPProgramadaHablantesVerificacion` text NOT NULL,
  `iPProgramadaGrupoEdad` int(10) unsigned NOT NULL,
  `vPProgramadaGrupoEdadVerificacion` text NOT NULL,
  `vPProgramadaOtros` text NOT NULL,
  `PProgramadaOtrosVerificacion` text NOT NULL,
  `vPPostergada` varchar(255) NOT NULL,
  `iPPostergadaH` int(10) unsigned NOT NULL,
  `vPPostergadaHVerificacion` text NOT NULL,
  `iPPostergadaM` int(10) unsigned NOT NULL,
  `vPPostergadaMVerficacion` text NOT NULL,
  `iPPostergadaHablantes` int(10) unsigned NOT NULL,
  `vPPostergadaHablantesVerificacion` text NOT NULL,
  `iPPostergadaGrupoEdad` int(10) unsigned NOT NULL,
  `vPPostergadaGrupoEdadVerificacion` text NOT NULL,
  `vPPostergadaOtros` text NOT NULL,
  `PPostergadaOtrosVerificacion` text NOT NULL,
  PRIMARY KEY (`iIdCuantificacionPoblacion`),
  KEY `FK_Cuantificacion_Programa` (`iIdPrograma`),
  CONSTRAINT `FK_Cuantificacion_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuantificacionpoblacion` */

LOCK TABLES `cuantificacionpoblacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `dimensiondesempenio` */

DROP TABLE IF EXISTS `dimensiondesempenio`;

CREATE TABLE `dimensiondesempenio` (
  `iDimensionDesempenio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vDimensionDesempenio` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iDimensionDesempenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dimensiondesempenio` */

LOCK TABLES `dimensiondesempenio` WRITE;

UNLOCK TABLES;

/*Table structure for table `documentacion` */

DROP TABLE IF EXISTS `documentacion`;

CREATE TABLE `documentacion` (
  `iIdDocumentacion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vPoliticaPrograma` varchar(255) NOT NULL,
  `iIdLugar` int(11) unsigned NOT NULL,
  `iIdObjetivo` int(11) unsigned NOT NULL,
  `vDescripcion` text NOT NULL,
  `iIdPoblacionObjetivo` int(11) unsigned NOT NULL,
  `iIdBienServicio` int(11) unsigned NOT NULL,
  `vResultados` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`iIdDocumentacion`),
  KEY `FK_Documentacion_Programa` (`iIdPrograma`),
  KEY `FK_Documentacion_Objetivo` (`iIdObjetivo`),
  KEY `FK_Documentacion_PobObje` (`iIdPoblacionObjetivo`),
  KEY `FK_Documentacion_BienServ` (`iIdBienServicio`),
  CONSTRAINT `FK_Documentacion_BienServ` FOREIGN KEY (`iIdBienServicio`) REFERENCES `bienservicio` (`iIdBienServicio`),
  CONSTRAINT `FK_Documentacion_Objetivo` FOREIGN KEY (`iIdObjetivo`) REFERENCES `objetivo` (`iIdObjetivo`),
  CONSTRAINT `FK_Documentacion_PobObje` FOREIGN KEY (`iIdPoblacionObjetivo`) REFERENCES `poblacionobjetivo` (`iIdPoblacionObjetivo`),
  CONSTRAINT `FK_Documentacion_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `documentacion` */

LOCK TABLES `documentacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `ejeped` */

DROP TABLE IF EXISTS `ejeped`;

CREATE TABLE `ejeped` (
  `iIdEje` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vEje` text NOT NULL,
  PRIMARY KEY (`iIdEje`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ejeped` */

LOCK TABLES `ejeped` WRITE;

insert  into `ejeped`(`iIdEje`,`vEje`) values (1,'Yucatán con Economía Inclusiva'),(2,'Yucatán con Calidad de Vida y Bienestar Social '),(3,'Yucatán Cultural con Identidad para el Desarrollo'),(4,'Yucatán Verde y Sustentable'),(5,'Igualdad de género oportunidades y no discriminación'),(6,'Innovación, conocimiento y tecnología'),(7,'Paz, Justicia y Gobernabilidad'),(8,'Gobierno Abierto, Eficiente y Finanzas Sanas'),(9,'Ciudades y Comunidades Sostenibles'),(10,'Desarrollo regional');

UNLOCK TABLES;

/*Table structure for table `estrategiaped` */

DROP TABLE IF EXISTS `estrategiaped`;

CREATE TABLE `estrategiaped` (
  `iIdEstrategia` int(11) NOT NULL AUTO_INCREMENT,
  `vEstrategia` text NOT NULL,
  `iIdObjetivo` int(11) NOT NULL,
  `iActivo` int(11) NOT NULL,
  PRIMARY KEY (`iIdEstrategia`),
  KEY `FK_Estrategia_ObjPED` (`iIdObjetivo`),
  CONSTRAINT `FK_Estrategia_ObjPED` FOREIGN KEY (`iIdObjetivo`) REFERENCES `objetivoped` (`iIdObjetivoid`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

/*Data for the table `estrategiaped` */

LOCK TABLES `estrategiaped` WRITE;

insert  into `estrategiaped`(`iIdEstrategia`,`vEstrategia`,`iIdObjetivo`,`iActivo`) values (1,'Fortalecer la profesionalización de las empresas para el comercio local, nacional e internacional con enfoque de sostenibilidad y responsabilidad social.',1,1),(2,'Impulsar la tecnificación digital en las actividades comerciales.',1,1),(3,'Fortalecer la productividad y competitividad empresarial. ',2,1),(4,'Impulsar la comercialización de los productos locales.',2,1),(5,'Impulsar las ventajas competitivas del estado.',3,1),(6,'Fomentar esquemas que eleven la competitividad del talento en Yucatán.',3,1),(7,'Promocionar la propuesta de valor del estado.',4,1),(8,'Fomentar la reducción de costos de inversión extranjera a través de un sistema de consolidación de inversiones para el estado de Yucatán ',4,1),(9,'Fortalecer la producción sostenible entre las empresas del sector manufacturero e industrial.',5,1),(10,'Inducir las condiciones para el desarrollo industrial integral.',5,1),(11,'Impulsar el desarrollo de las zonas y proyectos industriales sostenibles.',6,1),(12,'Impulsar la inclusión y responsabilidad social en el sector industrial',6,1),(13,'Fomentar la especialización de los prestadores de servicios turísticos del estado orientados a la sostenibilidad.',7,1),(14,'Impulsar la diversificación de los productos y  servicios turísticos sostenibles',7,1),(15,'Promover la imagen y los atractivos turísticos del estado a nivel nacional e internacional.',8,1),(16,'Fortalecer los segmentos de mercado turístico, existentes y potenciales.',8,1),(17,' Desarrollar la calidad de los productos y servicios turísticos del estado.',9,1),(18,'Fomentar una economía turística incluyente en las comunidades del estado con potencial turístico.',9,1),(19,'Promover la inclusión laboral productiva.',10,1),(20,'Impulsar la regularización de la seguridad social de la población trabajadora.',10,1),(21,'Impulsar esquemas que aumenten la productividad laboral en el estado.',11,1),(22,'Promover la alta productividad de las empresas.',11,1),(23,'Generar capacidades de emprendimiento inclusivo y sostenible.',12,1),(24,'Impulsar el emprendimiento en los grupos vulnerables.',12,1),(25,'Impulsar acciones que permitan el emprendimiento local en igualdad de oportunidades en el mercado interno, nacional e internacional.',12,1),(26,'Fortalecer la capacidad del sector agropecuario de manera sostenible.',13,1),(27,'Fomentar el uso de la tecnología en el sector agropecuario.',13,1),(28,'Fomentar la sostenibilidad ambiental y sanidad en las actividades agropecuarias del estado.',13,1),(29,'Impulsar un sector pecuario productivo y sostenible.',14,1),(30,'Promover la mejora genética de las especies pecuarias del estado. ',14,1),(31,'Consolidar un sector agroalimentario productivo que garantice la seguridad alimentaria en el estado.',15,1),(32,'Fomentar la calidad de la producción agrícola.',15,1),(33,'Impulsar la competitividad sostenible de los productos pesqueros y acuícolas.',16,1),(34,'Promover el consumo interno de productos acuícolas y pesqueros para mejorar la calidad alimenticia de los sectores más desprotegidos.',16,1),(35,'Promover la investigación y transferencia tecnológica para el desarrollo sustentable de la pesca y la acuacultura.',16,1),(36,'Fomentar acciones para proteger los ecosistemas en las zonas donde se desarrollan actividades pesqueras y acuícolas.',16,1),(37,'Fortalecer la gestión hospitalaria y el desarrollo del capital humano en salud con enfoque de inclusión e interculturalidad.',17,1),(38,'Impulsar una estrategia integral de formación para la mejora continua de la calidad de los servicios de salud del estado.',17,1),(39,'Impulsar el desarrollo y uso de infraestructura sostenible, así como de las tecnologías de la información, en las instituciones de salud de todos los municipios del estado.',17,1),(40,'Fomentar acciones de promoción y prestación de servicios de la salud entre la población en situación de vulnerabilidad.',18,1),(41,'Fortalecer acciones de prevención y atención integral de enfermedades para reducir los daños a la salud.',18,1),(42,'Fortalecer la prevención y atención integral de los trastornos mentales y riesgo suicida para favorecer el bienestar biopsicosocial del individuo y la sociedad.',18,1),(43,'Fortalecer la protección contra riesgos sanitarios en establecimientos y puntos sujetos a control sanitario para prevenir enfermedades asociadas.',18,1),(44,'Impulsar la participación de autoridades locales y comunitarias en el mejoramiento de las determinantes sociales en salud para incidir positivamente en la salud pública.',18,1),(45,'Impulsar la atención integral para las personas con malnutrición y desnutrición severa y moderada.',19,1),(46,'Promover hábitos alimenticios con alto valor nutricional con énfasis en las comunidades marginadas.',19,1),(47,'Fomentar mecanismos que garanticen el acceso a una vida sana a la población con inseguridad alimentaria.',20,1),(48,'Incentivar el autoconsumo, principalmente en zonas de alta inseguridad alimentaria.',20,1),(49,'Impulsar mecanismos que reduzcan las carencias sociales en las comunidades indígenas.',21,1),(50,'Fomentar esquemas que eliminen las brechas sociales de personas maya hablantes potenciando el respeto a los derechos y sus tradiciones.',21,1),(51,'Fortalecer la infraestructura educativa básica y media superior, priorizando a las comunidades con mayor rezago educativo.',22,1),(52,'Fomentar acciones de alfabetización integral en las comunidades con mayor rezago educativo.',22,1),(53,'Fortalecer la calidad de la educación en todos sus niveles.',23,1),(54,'Impulsar mecanismos que garanticen el derecho a la educación laica, gratuita, de calidad y libre de discriminación.',23,1),(55,'Impulsar esquemas de financiamiento para la adquisición, construcción, ampliación y mejoramiento de vivienda.',24,1),(56,'Fortalecer las acciones que mejoran la calidad y los espacios de la vivienda.',24,1),(57,'Promover acciones de infraestructura básica que permitan el acceso de la población a servicios de calidad para la vivienda.',25,1),(58,'Elevar la calidad del entorno y el acceso a servicios básicos en la vivienda.',25,1),(59,'Impulsar acciones dirigidas a la protección laboral y social de la población, que permitan llevar una vida digna.',26,1),(60,'Fortalecer esquemas que incrementen la cobertura y el acceso al sistema de seguridad social para la población en situación de pobreza.',26,1),(61,'Impulsar un sistema de seguridad social que garantice el bienestar del adulto mayor.',26,1),(62,'Fortalecer la infraestructura cultural de calidad incluyente y resiliente.',27,1),(63,'Fortalecer la oferta cultural incluyente y accesible para toda la población.',27,1),(64,'Impulsar la adopción del modelo de economía naranja, logrando con ello el encadenamiento de ideas para su posterior transformación en bienes y servicios culturales cuyo valor este determinado por su contenido de propiedad intelectual.',27,1),(65,'Promocionar los eventos y servicios culturales.',28,1),(66,'Facilitar el acceso a los eventos, productos y servicios artísticos y culturales.',28,1),(67,'Fomentar la producción literaria y el hábito de la lectura.',28,1),(68,'Promover las tradiciones, lenguaje, costumbres, valores y todas las formas de expresión de la identidad y la cultura yucateca.',29,1),(69,'Fomentar el desarrollo de las actividades artesanales.',29,1),(70,'Fomentar el surgimiento de nuevos creadores de arte.',30,1),(71,'Impulsar a los creadores de arte y promotores de cultura de la entidad.',30,1),(72,'Fortalecer el aprendizaje musical y la educación artística de calidad en el sistema educativo.',31,1),(73,'Procurar la vinculación entre el sistema educativo y profesionales del arte.',31,1),(74,'Impulsar la formación de profesionales de las artes.',32,1),(75,'Consolidar la oferta educativa superior en artes.',32,1),(76,'Fomentar el conocimiento del patrimonio material, natural e inmaterial del estado.',33,1),(77,'Fortalecer el patrimonio cultural.',33,1),(78,'Fortalecer la preparación de los talentos deportivos de forma incluyente.',34,1),(79,'Fortalecer el nivel de desarrollo de los deportistas de alto rendimiento.',34,1),(80,'Fomentar la cultura física como estilo de vida saludable.',35,1),(81,'Fomentar la cultura de recreación física.',35,1),(82,'Facilitar el acceso a los eventos deportivos.',36,1),(83,'Promover la realización de eventos deportivos.',36,1),(84,'Fortalecer acciones para la conservación de las áreas naturales protegidas.',37,1),(85,'Impulsar acciones a favor de la protección y aprovechamiento sustentable de la biodiversidad.',37,1),(86,'Fortalecer los mecanismos de regulación y capacitación para la administración y conservación de los recursos naturales del estado. ',37,1),(87,'Impulsar acciones de reforestación mediante el manejo sustentable de especies endémicas que incrementen la superficie arbórea.',38,1),(88,'Fortalecer acciones de prevención que disminuyan la deforestación.',38,1),(89,'Impulsar medidas de adaptación y mitigación ante el cambio climático.',39,1),(90,'Impulsar acciones que reduzcan el impacto de los desastres naturales.',39,1),(91,'Fomentar una economía baja en emisiones de carbono en Yucatán.',40,1),(92,'Fomentar la gestión integral de la calidad del aire.',40,1),(93,'Fortalecer la cultura de reutilización de aguas residuales, para disminuir la demanda del agua.',41,1),(94,'Mejorar la infraestructura y el funcionamiento en torno al abastecimiento y tratamiento del agua.',41,1),(95,'Promover la innovación y la economía circular en el saneamiento del agua.',41,1),(96,'Impulsar el uso responsable del agua para disminuir su contaminación y desperdicio.',42,1),(97,'Impulsar mecanismos e instrumentos de monitoreo e inspección de la calidad del agua. ',42,1),(98,'Impulsar una cultura del adecuado manejo de residuos que disminuya los riesgos ambientales.',43,1),(99,'Impulsar acciones que contribuyan a la reducción de residuos sólidos.',44,1),(100,'Promover acciones que contribuyan a la reutilización de materiales de desecho.',44,1),(101,'Impulsar el desarrollo tecnológico de energías limpias.',45,1),(102,'Impulsar la generación de energía de fuentes renovables y la eficiencia energética compatible con el entorno social y ambiental.',45,1),(103,'Fomentar la generación de energías limpias.',46,1),(104,'Priorizar acciones que reduzcan costos por consumo de energéticos. ',46,1),(105,'Fortalecer las acciones que incrementen la conservación de las especies marinas.',47,1),(106,'Impulsar acciones de protección de playas y mares que aumenten su conservación.',47,1),(107,'Fortalecer el sistema de transporte público para disminuir los tiempos de traslado de la población.',48,1),(108,'Impulsar acciones que permitan el acceso al transporte público atendiendo las necesidades de las personas en situación de vulnerabilidad.',48,1),(109,'Fortalecer la infraestructura vial urbana que incremente las alternativas de movilidad en las ciudades.',49,1),(110,'Impulsar la cultura vial para la reducción de accidentes.',49,1),(111,'Promover sistemas de movilidad urbana asequibles y sustentables.',49,1),(112,'Impulsar la mejora continua de los servicios y capacitación del personal de salud para garantizar el acceso y ejercicio del derecho a la salud de las mujeres en forma incluyente.',50,1),(113,'Promover mecanismos para la prevención y atención del embarazo adolescente en todo el Sistema de Salud.',50,1),(114,'Reducir la deserción, abandono y rezago educativo de las mujeres.',51,1),(115,'Impulsar una mayor participación y presencia de las mujeres en los campos de las ciencias, ingenierías, y tecnologías.',51,1),(116,'Promover la autonomía y el empoderamiento de las mujeres para el desarrollo económico sostenible. ',52,1),(117,'Impulsar el acceso de las mujeres a cargos de toma de decisiones y un mayor involucramiento en las decisiones públicas.',52,1),(118,'Fortalecer la coordinación interinstitucional para prevenir, atender y sancionar  prácticas que vulneren los derechos de las mujeres.',53,1),(119,'Promover mecanismos para involucrar a la sociedad en la prevención de las violencias hacia las mujeres.',53,1),(120,'Implementar acciones que garanticen la seguridad y la salud integral de las mujeres en situación de violencia. ',53,1),(121,'Facilitar el acceso de las mujeres a la justicia.',53,1),(122,'Fortalecer los sistemas de información sobre las violencias hacia las mujeres.',53,1),(123,'Fomentar la igualdad de oportunidades de los derechos de las personas en situación de vulnerabilidad.',54,1),(124,'Impulsar la igualdad de oportunidades de bienestar social de las personas en situación de vulnerabilidad.',54,1),(125,'Promover oportunidades de una vida digna para las personas en situación de vulnerabilidad.',54,1),(126,'Impulsar acciones que contribuyan con el ejercicio de los derechos políticos, sociales y culturales en condiciones de igualdad y no discriminación.',54,1),(127,'Mejorar la cobertura de la educación superior en el estado de manera sostenible e inclusiva.',55,1),(128,'Vincular de manera sostenible y permanente el sector productivo con el educativo para satisfacer la demanda actual y emergente de capital humano de las empresas.',55,1),(129,'Impulsar de manera sostenible e inclusiva la formación temprana de la ciencia.',55,1),(130,'Fortalecer la pertinencia de la educación superior en el estado de manera sostenible e inclusiva.',55,1),(131,'Mejorar de manera permanente y sostenible la calidad de los posgrados.',56,1),(132,'Fortalecer de manera sostenible e inclusiva la eficiencia terminal de los estudiantes de educación superior.',56,1),(133,'Impulsar la generación de conocimiento en ciencia, tecnología, artes y humanidades.',57,1),(134,'Extender de manera sostenible e inclusiva la vinculación de las ciencias, la tecnología, las artes y las humanidades con instituciones nacionales e internacionales. ',57,1),(135,'Impulsar la aplicación de la ciencia y la tecnología en la solución de problemas estratégicos de manera permanente y sostenible.',57,1),(136,'Impulsar de manera permanente y sostenible la innovación para el desarrollo del estado.',58,1),(137,'Favorecer de manera sostenible e inclusiva el desarrollo de invenciones en los sectores público, privado y social.',58,1),(138,'Fortalecer de manera sostenible la infraestructura para el conocimiento científico, tecnológico e innovación.',58,1),(139,'Fortalecer de manera sostenible la prevención del delito con un enfoque de derechos humanos y especial énfasis en la igualdad de género y la interculturalidad.',59,1),(140,'Impulsar la mediación comunitaria con perspectiva de género.',59,1),(141,'Fortalecer la profesionalización y dignificación de los elementos policiales del estado de forma incluyente y sostenible.',59,1),(142,'Reforzar las acciones de seguridad vial en el estado.',59,1),(143,'Fortalecer la seguridad pública  con énfasis en las regiones de mayor vulnerabilidad y en apego a los derechos humanos.',60,1),(144,'Implementar acciones que fomenten el cumplimiento de la Ley en favor de la seguridad de las y los habitantes.',60,1),(145,'Fortalecer la infraestructura y organización institucional de procuración de justicia en el estado.\n',61,1),(146,'Mejorar  la calidad en la atención a las y los usuarios del Sistema de Justicia.',61,1),(147,'Fortalecer los mecanismos de acceso a la justicia de los grupos en situación de vulnerabilidad.',61,1),(148,'Fortalecer el marco normativo de procuración de justicia en el estado,con enfoque de derechos humanos. ',62,1),(149,'Fortalecer las instituciones de justicia se constituyan como instituciones sólidas y de vanguardia.',62,1),(150,' Fortalecer la cultura de la transparencia en las instituciones de seguridad y justicia en el estado.',63,1),(151,'Impulsar acciones que aumenten la certeza jurídica de las personas de forma incluyente y sostenible.',63,1),(152,'Promover acciones para el desarrollo integral de los municipios del estado.',63,1),(153,'Acercar los servicios de las instituciones vinculadas con la seguridad, justicia y certeza jurídica de forma incluyente y sostenible.',63,1),(154,'Fortalecer la coordinación para la cooperación internacional y entre gobiernos subnacionales para el desarrollo incluyente y sostenible.',64,1),(155,'Impulsar la participación y organización de  eventos de carácter internacional.',64,1),(156,'Facilitar la accesibilidad, consulta y procesamiento de la información para la toma de decisiones.',65,1),(157,'Fomentar la participación y colaboración ciudadana para que la Administración Pública Estatal realice sus acciones en apego a los principios de transparencia y rendición de cuentas.',65,1),(158,'Vigilar la correcta aplicación de los recursos públicos',66,1),(159,'Fortalecer los mecanismos de prevención y sanción ante actos de corrupción.',66,1),(160,'Fomentar la incorporación del enfoque a resultados en el proceso de planeación, programación, presupuestación, control, seguimiento y evaluación.',67,1),(161,'Favorecer los mecanismos de seguimiento y evaluación del desempeño.',67,1),(162,'Impulsar la política de mejora regulatoria para mejorar la atracción de inversiones y el bienestar social en el Estado de Yucatán y sus municipios.',68,1),(163,'Impulsar la gestión por procesos para mejorar la eficiencia y calidad en la administración pública estatal.',68,1),(164,'Fortalecer la gestión de los recursos humanos y patrimoniales del Gobierno del Estado garantizando su sostenibilidad.',68,1),(165,'Fortalecer las capacidades de recaudación del Gobierno del Estado.',69,1),(166,'Mejorar la gestión del gasto público.',69,1),(167,'Fomentar la inversión pública y privada sostenible.',70,1),(168,'Establecer mecanismos de cobertura vial que permita el acceso a todas las comunidades del estado.',71,1),(169,'Fortalecer la infraestructura ferroviaria sostenible.',71,1),(170,'Fortalecer la infraestructura logística de transporte a través del rescate y modernización integral y sostenible de los puertos y aeropuertos del estado.',71,1),(171,'Fortalecer el acceso a las redes y servicios de telecomunicaciones en las comunidades del estado.',72,1),(172,'Fortalecer la infraestructura tecnológica con enfoque de sostenibilidad.',72,1),(173,'Impulsar la participación de la industria de telecomunicaciones en los modelos educativos.',72,1),(174,'Impulsar un esquema de ordenamiento territorial de los asentamientos humanos que favorezca el desarrollo sostenible de las ciudades y comunidades.',73,1),(175,'Impulsar acciones para el cumplimiento de la normatividad urbana en coordinación con los sectores público, privado, social y académico.',73,1),(176,'Impulsar la elaboración de planes de ordenamiento ecológico local.',73,1),(177,'Estructurar los proyectos de infraestructura mediante una planeación consciente y racional con base en la rentabilidad económica y social.',73,1),(178,'Establecer áreas prioritarias de inversión que permitan enfocar los recursos de los programas federales, estatales y municipales desde una perspectiva territorial.',74,1),(179,'Fortalecer programas integrales de bienestar social regional que permitan mejorar la calidad de vida y la igualdad de condiciones, derechos y oportunidades de la población.',74,1),(180,'Fortalecer los programas culturales para potencializar el acceso a los servicios y actividades culturales en todas las regiones.',74,1),(181,'Promover buenas prácticas de sustentabilidad que garanticen la reducción de los impactos en el medio ambiente.',74,1),(182,'Desarrollar políticas de base territorial que permitan disminuir la incidencia delictiva en los municipios y regiones del Estado.',74,1),(183,'Apoyar a los municipios en la implantación y operación del Presupuesto Basado en Resultados y del Sistema de Evaluación del Desempeño PBR-SED.',74,1),(184,'Constituir un proceso de planificación territorial bajo un marco integrado que considere los diferentes instrumentos de planeación con la óptica de sustentabilidad para la provisión óptima de bienes y servicios públicos.',74,1),(185,'Favorecer la integración meso regional entre Yucatán, Campeche y Quintana Roo que permitan favorecer el desarrollo de la península.',75,1);

UNLOCK TABLES;

/*Table structure for table `fin` */

DROP TABLE IF EXISTS `fin`;

CREATE TABLE `fin` (
  `iIdFin` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `Fin` varchar(255) NOT NULL,
  `vIndicador` text NOT NULL,
  `vMedioVerificacion` text NOT NULL,
  `vSupuesto` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdFin`),
  KEY `FK_Fin_PP` (`iIdPrograma`),
  CONSTRAINT `FK_Fin_PP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fin` */

LOCK TABLES `fin` WRITE;

UNLOCK TABLES;

/*Table structure for table `fuentefinanciamiento` */

DROP TABLE IF EXISTS `fuentefinanciamiento`;

CREATE TABLE `fuentefinanciamiento` (
  `iIdFuenteFinanciamiento` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iClave` int(11) NOT NULL,
  `vFuenteFinanciamiento` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdFuenteFinanciamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

/*Data for the table `fuentefinanciamiento` */

LOCK TABLES `fuentefinanciamiento` WRITE;

insert  into `fuentefinanciamiento`(`iIdFuenteFinanciamiento`,`iClave`,`vFuenteFinanciamiento`,`iActivo`) values (1,1,'Recursos Propios',1),(2,2,'Fondo de Aportaciones para el Fortalecimiento de las Entidades Federativas Fafef',1),(3,3,'Fone',1),(4,4,'Fassa Ramo 33',1),(5,6,'Fondo de Infraestructura Social para Entidades Fise',1),(6,7,'Fam Asistencia Social Ramo 33',1),(7,8,'Fam Infraestructura Educativa Básica',1),(8,9,'Fam-IE Superior Ramo 33',1),(9,10,'Fam Infraestructura Educativa Media Superior',1),(10,11,'Faeta Ramo 33',1),(11,12,'Fone Años Anteriores  Ramo 33',1),(12,15,'Fortalecimiento a Municipios Ramo 33',1),(13,16,'Infraestructura a Municipios Ramo 33',1),(14,17,'Fondo de Aportaciones para la Seguridad Pública de Los Estados Fasp',1),(15,21,'Fondo de Infraestructura Social para Entidades Fise A.A.',1),(16,22,'Fam Infraestructura Educativa Básica A.A.',1),(17,28,'Fam IE Superior Años Anteriores  Ramo 33',1),(18,30,'Fassa Años Anteriores Ramo 33',1),(19,31,'Faeta Años Anteriores Ramo 33',1),(20,34,'Fondo de Aportaciones para la Seguridad Pública de los Estados Fasp A.A.',1),(21,45,'Uady Subsidio Federal Años Anteriores',1),(22,46,'Uady Subsidio Federal',1),(23,50,'Convenio Parte Estatal',1),(24,53,'Zona Metropolitana de la Ciudad de Mérida',1),(25,58,'Proyectos de Desarrollo Regional Años Anteriores',1),(26,62,'Fondo para la Accesibilidad en El Transporte Público para las Personas con Discapacidad Fotradis',1),(27,64,'Fondo de Aportaciones para el Fortalecimiento de las Entidades Federativas Fafef A.A.',1),(28,69,'Fondo para la Accesibilidad de las Personas con Discapacidad A.A.',1),(29,73,'Recursos Propios de las Entidades Paraestatales',1),(30,79,'Aportación Solidaria Estatal al Seguro Popular',1),(31,85,'Fondo de Apoyo a Migrantes Años Anteriores',1),(32,90,'Fideicomiso para la Infraestructura de los Estados Fies Años Anteriores',1),(33,94,'Fideicomiso para la Infraestructura de los Estados',1),(34,97,'Programa de Fortalecimiento Financiero Libre AA',1),(35,101,'Ingresos Fiscales Recursos Propios',1),(36,102,'Fondo para el Fortalecimiento Financiero para la Inversión A.A.',1),(37,5001,'Ingresos Fiscales Convenios Participación Estatal',1),(38,7901,'Ingresos Fiscales Aportación Solidaria Estatal al Seguro Popular',1),(39,9201,'Ingresos Fiscales Aportación Solidaria Liquida al Seguro Popular',1),(40,18001,'Subsidio para el Colegio de Estudios Científicos y Tecnológicos del Estado de Yu',1),(41,18003,'Subsidio para el Colegio de Bachilleres del Estado de Yucatán (Cobay) Años Anter',1),(42,18017,'Programa Nacional de Becas Años Anteriores',1),(43,18023,'Anexo Específico del Convenio de Coordinación y Colaboración Conade Años Anterio',1),(44,18037,'Programa de Atención a la demanda Ieaey Años Anteriores',1),(45,18047,'Programa de Fortalecimiento a la Transversalidad de la Perspectiva de Genero A.A.',1),(46,18057,'Programa Agua Potable Alcantarillado y Saneamiento Urbano AA',1),(47,18060,'Proagua Rural AA',1),(48,18067,'Proyectos de Cultura (Pef) Años Anteriores',1),(49,18073,'Programa de Infraestructura Indígena Proii Años Anteriores',1),(50,18075,'Programa de Producción de Planta Forestal (Conafor) Años Anteriores',1),(51,18098,'Fortaseg Años Anteriores',1),(52,18106,'Programa de Protección Social en Salud Seguro Popular Años Anteriores',1),(53,18112,'Instituciones Estatales de Cultura Años Anteriores',1),(54,18115,'Programa de Fortalecimiento de la Calidad Educativa A.A.',1),(55,18116,'Programa de Escuelas de Tiempo Completo Años Anteriores',1),(56,18126,'Componente de Atención a desastres Naturales en el Sector Agropecuario AA',1),(57,18128,'Modernizacion Integral del Registro Civil Años Anteriores',1),(58,18132,'Programa Nacional de Inglés en la Educación Básica (Pnieb) Años Anteriores',1),(59,18138,'Convenio de Apoyo Financiero para el Programa de Carrera Docente Años Anteriores',1),(60,18145,'Programa de Estímulo a la Creación y al desarrollo Artístico Años Anteriores',1),(61,18149,'Convenio 5% Museos o Zonas Arqueológicas Años Anteriores',1),(62,18174,'Convenio de Colaboración de Apoyos del Fondo Nacional Emprendedor AA',1),(63,18180,'Fondo para Fortalecer la Autonomía de la Gestión en Planteles de Educación Media Superior A.A.',1),(64,18186,'Programa de Fortalecimiento de la Calidad en Educación Básica Años Anteriores',1),(65,18187,'Programa Reforma Educativa A.A.',1),(66,18189,'Apoyo Financiero del Servicio Educativo denominado Telebachillerato Comunitario AA',1),(67,18192,'Apoyo Financiero Extraordinario No Regularizable Años Anteriores',1),(68,18202,'Programa para la Inclusión y la Equidad Educativa Años Anteriores',1),(69,18215,'Beca de Apoyo a la Práctica Intensiva y al Servicio Social',1),(70,18216,'Convenio de Coordinación para la Creación Operación y  Apoyo Financiero del Icaty Años Anteriores',1),(71,18217,'Programa Nacional Convivencia Escolar A.A.',1),(72,18223,'Convenio de Coordinación para la Implementación del Programa parae el desarrollo  Profesional Docente Tipo Básico A.A.',1),(73,18229,'Programa de Infraestructura en Su Vertiente Ampliación Mejoramiento de la Vivienda de la Sedatu',1),(74,18230,'Fondo Institucional de Fomento Regional para el desarrollo Científico Tecnológico y de Innovación Fordecyt AA',1),(75,18231,'Convenio de Apoyo Financiero para el Reconocimiento de la Plantilla Uady Años Anteriores',1),(76,18232,'Programa Fortalecimiento de la Calidad Educativa Pacten A.A.',1),(77,18244,'Programa de Apoyo a la Infraestructura Hidroagrícola Conagua Años Anteriores',1),(78,18245,'Convenio de Coordinación para el Otorgamiento del Subsidio para el Fortalecimiento del Centro de Justicia para las Mujeres de Yucatán Años Anteriores',1),(79,18246,'Programa de Apoyo al desarrollo de la Educación Superior (Pades) Años Anteriores',1),(80,19001,'Subsidio para el Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán (Cecitey)',1),(81,19003,'Subsidio para el Colegio de Bachilleres del Estado de Yucatán (Cobay)',1),(82,19004,'Programa de Incubación de Empresas de Tecnologías de la Información (Incubatics)',1),(83,19012,'Programa de Estrategia Integral de desarrollo Comunitario Comunidad Diferente',1),(84,19017,'Programa Nacional de Becas',1),(85,19023,'Anexo Específico del Convenio de Coordinación y Colaboración Conade',1),(86,19037,'Programa de Atención a la demanda (Ieaey)',1),(87,19046,'Programa de Apoyo a las Instancias de Mujeres en las Entidades Federativas para Ejecutar Acciones de Prevención de la Violencia Contra las Mujeres Paimef',1),(88,19047,'Programa de Fortalecimiento a la Transversalidad de la Perspectiva de Género',1),(89,19059,'Proagua Agua Limpia',1),(90,19062,'Extensión e Innovación Productiva',1),(91,19063,'Conservación y Uso Sustentable de Suelo y Agua Coussa',1),(92,19064,'Programa de Sanidad e Inocuidad Agroalimentaria',1),(93,19065,'Proyecto Estratégico de Seguridad Alimentaria Pesa',1),(94,19081,'Apoyos Financieros para la Universidad de Oriente',1),(95,19086,'Proyectos de Construcción de Carreteras Alimentadoras y Caminos Rurales',1),(96,19091,'Apoyos Financieros para la Universidad Tecnólogica Metropolitana',1),(97,19092,'Apoyos Financieros para la Universidad Tecnológica Regional del Sur',1),(98,19093,'Apoyos Financieros para la Universidad Tecnológica del Centro',1),(99,19094,'Apoyos Financieros para la Universidad Tecnológica del Poniente',1),(100,19095,'Apoyos Financieros para la Universidad Tecnológica del Mayab',1),(101,19098,'Fortaseg',1),(102,19100,'Fondo para el Fortalecimiento de Acciones de Salud Pública en las Entidades Federativas (Afaspe)',1),(103,19101,'Unidades Medicas Móviles',1),(104,19102,'Programa de Cultura del Agua',1),(105,19104,'Programa Seguro Médico Siglo XXI',1),(106,19106,'Programa de Protección Social en Salud (Seguro Popular)',1),(107,19107,'Convenio para la Ejecución de Acciones de Prospera Programa de Inclusión Social',1),(108,19108,'Fondo de Protección contra Gastos Catastróficos',1),(109,19116,'Programa Escuelas de Tiempo Completo',1),(110,19117,'Apoyo al Fortalecimiento de Instancias Estatales de Juventud',1),(111,19118,'Espacios Poder Joven',1),(112,19119,'Red Nacional de Programas de Radio y Television Poder Joven y Radio por Internet',1),(113,19121,'Convenio de Coordinacion para la Creacion, Operación y Apoyo Financiero de Los I',1),(114,19122,'laboratorio Estatal de Salud Publica (Cofepris',1),(115,19126,'Componente de Atención a Desastres Naturales en el Sector Agropecuario',1),(116,19128,'Modernizacion Integral del Registro Civil',1),(117,19132,'Programa Nacional de Inglés en la Educación Básica (Pnieb)',1),(118,19137,'Fondo para Ampliar y Diversificar la Oferta Educativa en Educación Superior Fadoe',1),(119,19138,'Convenio de Apoyo Financiero para el Programa de Carrera Docente',1),(120,19144,'Programa Nacional de Fomento A la Lectura',1),(121,19145,'Programa de Estímulo a la Creación y al desarrollo Artístico',1),(122,19146,'Programa de Apoyo a las Culturas Municipales y Comunitarias Pacmyc',1),(123,19148,'Fondo Especial para la Ejecución del Programa para el desarrollo Integral de las Culturas de los Pueblos y Comunidades Indígenas',1),(124,19162,'Programa de desarrollo Cultural Infantil del Estado de Yucatán  Alas Y Raíces',1),(125,19174,'Convenio de Colaboración de Apoyos del Fondo Nacional Emprendedor',1),(126,19180,'Fondo para Fortalecer la Autonomía de la Gestión en Planteles de Educación Media Superior',1),(127,19186,'Programa Fortalecimiento de Calidad Educativa Tipo Básico',1),(128,19187,'Programa de Reforma Educativa',1),(129,19189,'Apoyo Financiero del Servicio Educativo  denominado Telebachillerato  Comunitario',1),(130,19192,'Apoyo Financiero Extraordinario',1),(131,19193,'Unidad Regional de Culturas Populares del Estado de Yucatán',1),(132,19197,'Convenio de Colaboración para el desarrollo del Programa de Estímulos a la Investigación de desarrollo Tecnológico e Innovación PEI del Conacyt',1),(133,19200,'Convenio Específico Cresca Conadic Cenadic Yuc 001',1),(134,19202,'Programa para la Inclusión y la Equidad Educativa',1),(135,19206,'Información Estadística y Estudios (Snidrus)',1),(136,19208,'Programa Rehabilitación Modernización Tecnificación y Equipamiento de Unidades de Riego',1),(137,19216,'Convenio de Coordinación para la Creación Operación y  Apoyo Financiero del Icaty',1),(138,19217,'Programa Nacional Convivencia Escolar',1),(139,19220,'Agua Potable Drenaje y Tratamiento',1),(140,19223,'Convenio de Coordinación para la Implementación del Programa para el desarrollo  Profesional Docente Tipo Básico Prodep',1),(141,19224,'C-291045.82/2016 Formación Temprana de Científicos de Yucatán',1),(142,19230,'Fondo Institucional de Fomento Regional para el desarrollo Científico, Tecnológico y de Innovación Fordecyt',1),(143,19232,'Programa Fortalecimiento de la Calidad Educativa Pacten',1),(144,19234,'Convenio para el Fortalecimiento de los Servicios de Salud a Través del Repssy',1),(145,19235,'Apoyo Solidario para la Operación de la Universidad Politécnica del Estado de Yucatán',1);

UNLOCK TABLES;

/*Table structure for table `grupoetario` */

DROP TABLE IF EXISTS `grupoetario`;

CREATE TABLE `grupoetario` (
  `iIdGrupoEtario` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vGrupoEtario` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdGrupoEtario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grupoetario` */

LOCK TABLES `grupoetario` WRITE;

UNLOCK TABLES;

/*Table structure for table `institucion` */

DROP TABLE IF EXISTS `institucion`;

CREATE TABLE `institucion` (
  `iIdInstitucion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vInstitucion` varchar(255) NOT NULL,
  `iIdEje` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdInstitucion`),
  KEY `FK_Inst_EjePED` (`iIdEje`),
  CONSTRAINT `FK_Inst_EjePED` FOREIGN KEY (`iIdEje`) REFERENCES `ejeped` (`iIdEje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `institucion` */

LOCK TABLES `institucion` WRITE;

UNLOCK TABLES;

/*Table structure for table `involucrado` */

DROP TABLE IF EXISTS `involucrado`;

CREATE TABLE `involucrado` (
  `iIdInvolucrado` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Involucrado` varchar(255) NOT NULL,
  `iTipoInvolucrado` int(11) unsigned NOT NULL,
  `vDescripcionRelacion` text NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`iIdInvolucrado`),
  KEY `FK_Involucrado_Programa` (`iIdPrograma`),
  CONSTRAINT `FK_Involucrado_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `involucrado` */

LOCK TABLES `involucrado` WRITE;

UNLOCK TABLES;

/*Table structure for table `lineaaccionped` */

DROP TABLE IF EXISTS `lineaaccionped`;

CREATE TABLE `lineaaccionped` (
  `iIdLineaAccion` int(11) NOT NULL AUTO_INCREMENT,
  `vLineaAccion` text NOT NULL,
  `iIdEstrategia` int(11) NOT NULL,
  `iActivo` int(11) NOT NULL,
  `iIdOds` int(11) NOT NULL,
  PRIMARY KEY (`iIdLineaAccion`),
  KEY `FK_Linea_EstraPED` (`iIdEstrategia`),
  CONSTRAINT `FK_Linea_EstraPED` FOREIGN KEY (`iIdEstrategia`) REFERENCES `estrategiaped` (`iIdEstrategia`)
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8;

/*Data for the table `lineaaccionped` */

LOCK TABLES `lineaaccionped` WRITE;

insert  into `lineaaccionped`(`iIdLineaAccion`,`vLineaAccion`,`iIdEstrategia`,`iActivo`,`iIdOds`) values (1,'Profesionalizar a las empresas a través del fomento a las buenas prácticas comerciales y un enfoque de mejora continua.',1,1,8),(2,'Impulsar alianzas estratégicas en materia comercial con empresas especializadas y el sector académico.',1,1,8),(3,'Promover la responsabilidad social en el sector comercial y las empresas locales.',1,1,8),(4,'Establecer programas de inversión en tecnología para los productos comerciales.',2,1,8),(5,'Fomentar herramientas para el comercio digital de compra y venta de productos yucatecos en línea.',2,1,8),(6,'Dotar de equipo básico digital a las empresas para su crecimiento.',2,1,8),(7,'Establecer programas de capacitación de herramientas digitales.',2,1,8),(8,'Impulsar convenios de colaboración entre micro, pequeñas y medianas con las grandes empresas para el desarrollo de cadenas productivas.',3,1,8),(9,'Fomentar en las empresas el análisis de mercado previo, durante y después de la inversión y producción.',3,1,8),(10,'Impulsar la capacitación a las empresas en materia de productividad y aprovechamiento estratégico del sector comercial.',3,1,8),(11,'Gestionar estímulos e incentivos a las empresas para promover su formalización.',3,1,8),(12,'Impulsar esquemas de financiamiento accesible para las empresas en apoyo de sus procesos operativos.',3,1,8),(13,'Simplificar el marco regulatorio, los trámites de apertura de empresas y el acceso a apoyos financieros.',3,1,8),(14,'Promover las fortalezas y valores de los productos yucatecos.',4,1,8),(15,'Fomentar el crecimiento de la cadena de suministros local.',4,1,8),(16,'Favorecer el vínculo entre las empresas locales, nacionales e internacionales para la comercialización de sus productos.',4,1,8),(17,'Motivar la participación en exposiciones comerciales para la expansión de los productos yucatecos.',4,1,8),(18,'Incentivar la innovación en las empresas para que sus productos y servicios sean más competitivos.',5,1,17),(19,'Promover la producción de insumos acordes con la demanda del mercado',5,1,17),(20,'Incentivar la conformación de órganos ciudadanos, académicos y empresariales en materia de competitividad para implementar y dar seguimiento a buenas prácticas.',5,1,17),(21,'Promover el desarrollo de las zonas estratégicas  en el estado que respondan a sus vocaciones particulares.',5,1,17),(22,'Poner en marcha campañas para la atracción de talento en Yucatán.',6,1,17),(23,'Promover el establecimiento de incentivos en el sector privado que permitan incrementar la inversión en capital humano.',6,1,17),(24,'Elaborar un plan de gestión de capacidades técnicas que cubra las demandas del mercado local.',6,1,17),(25,'Difundir las bondades estratégicas y geográficas del estado',7,1,17),(26,'Promocionar los casos de éxito de las empresas que invierten en Yucatán.',7,1,17),(27,'Promover la relevancia, valor y diferenciación del estado de forma coordinada con los sectores público, privado, social y académico.',7,1,17),(28,'Gestionar estímulos fiscales rentables y atractivos a las inversiones internacionales',8,1,17),(29,'Impulsar el potencial de recursos energéticos y la infraestructura necesaria para la atracción de inversiones.',8,1,17),(30,'Propiciar un marco regulatorio eficiente para la atracción de inversiones en el estado.',8,1,17),(31,'Facilitar mediante herramientas digitales el proceso de inversión en Yucatán.',8,1,17),(32,'Impulsar esquemas de acompañamiento en las empresas para proveer la demanda de insumos industriales.',9,1,9),(33,'Establecer programas de sensibilización hacia la sostenibilidad industrial.',9,1,9),(34,'Estimular el diseño de procesos y productos industriales innovadores.',9,1,9),(35,'Facilitar la modernización de infraestructura logística para la movilización eficiente de productos industriales',10,1,9),(36,'Impulsar la disponibilidad energética para la realización de procesos de producción eficientes en el sector industrial.',10,1,9),(37,'Promover la constitución y modernización de parques industriales sostenibles e incluyentes.',10,1,9),(38,'Promover el aprovechamiento de las Tecnologías de Información y Comunicación (TICs) en la industria del estado.',10,1,9),(39,'Promover el progreso industrial sostenible en las zonas estratégicas del estado.',11,1,9),(40,'Reforzar los financiamientos a empresas y emprendedores del sector industrial con enfoque sostenible.',11,1,9),(41,'Garantizar la capacidad técnica industrial a través de la vinculación con el sector académico.',11,1,9),(42,'Promover la creación de grupos empresariales con enfoque de impulso a grupos en situación de vulnerabilidad.',12,1,9),(43,'Mejorar las condiciones de trabajo para los grupos en situación de vulnerabilidad por medio de programas de equidad en el sector industrial.',12,1,9),(44,'Diseñar mecanismos de regulación ambiental para fomentar la sostenibilidad de las empresas del sector secundario. ',12,1,9),(45,'Promover incentivos para desarrollar una cultura sostenible dentro del sector secundario.',12,1,9),(46,'Implementar talleres de sostenibilidad y de profesionalización para los prestadores de servicios turísticos del estado.',13,1,8),(47,'Promover distintivos y certificados de calidad a las empresas turísticas del estado.',13,1,8),(48,'Impulsar la adopción de sellos de calidad y certificaciones en los restaurantes que usan productos locales.',13,1,8),(49,'Consolidar los instrumentos y sistemas de información estadística y geográfica en materia turística.',13,1,8),(50,'Vincular al sector empresarial turístico con organismos de educación para la integración de mano de obra especializada y certificada al mercado laboral.',13,1,8),(51,'Estimular el diseño de nuevos proyectos turísticos sostenibles en el estado.',14,1,8),(52,'Fomentar la creación de productos y servicios turísticos sustentables e innovadores.',14,1,8),(53,'Impulsar el aprovechamiento de nichos de mercado novedosos y con alta demanda.',14,1,8),(54,'Promover alianzas estratégicas con empresas turísticas nacionales e internacionales.',14,1,8),(55,'Fomentar la participación del estado en eventos de promoción turística nacionales e internacionales.',15,1,8),(56,'Promocionar la imagen de la cultura maya en las campañas de promoción nacional e internacional.',15,1,8),(57,'Realizar campañas de promoción turística a través de diferentes medios nacionales e internacionales.',15,1,8),(58,'Impulsar el uso de herramientas tecnológicas para la difusión turística en medios electrónicos.',15,1,8),(59,'Promover la apertura de más rutas aéreas que se conecten a lugares estratégicos.',15,1,8),(60,'Establecer vínculos con los ayuntamientos para mejorar la imagen turística del estado.',15,1,8),(61,'Reforzar las acciones de atracción de turistas de negocios, con énfasis en la calidad y diversidad de los productos y servicios locales.',15,1,8),(62,'Restaurar la infraestructura de servicios para el turismo sostenible.',16,1,8),(63,'Consolidar el segmento de turismo de naturaleza en los municipios turísticos.',16,1,8),(64,'Poner en marcha acciones integrales de atracción y comercialización de congresos y convenciones nacionales e internacionales.',16,1,8),(65,'Diseñar programas de comercialización de productos y servicios para el turismo de lujo.',16,1,8),(66,'Facilitar la prestación de servicios de movilidad turística sostenible a través del vínculo entre el sector académico, empresarial y público.',16,1,8),(67,'Reforzar el desarrollo de centros turísticos en zonas con alto patrimonio cultural.',16,1,8),(68,'Promocionar la oferta de todos los segmentos turísticos consolidados y potenciales con un enfoque particular para cada tipo.',16,1,8),(69,'Promover que los residentes de la península consuman los productos y servicios turísticos de Yucatán.',16,1,8),(70,'Promover el turismo médico para convertirse en una opción más de servicios y productos turísticos que generen empleos y beneficios para el estado.',16,1,8),(71,'Impulsar la celebración de festivales, exposiciones y eventos turísticos de talla internacional.',17,1,8),(72,'Adecuar los paradores turísticos del estado para que sean modernos, accesibles e incluyentes.',17,1,8),(73,'Adecuar la infraestructura turística a las nuevas demandas y necesidades del mercado con especial énfasis en la accesibilidad',17,1,8),(74,'Rescatar los espacios con alto valor turístico para los visitantes nacionales e internacionales.',17,1,8),(75,'Diseñar herramientas digitales que faciliten la difusión de los atractivos turísticos en segmentos preferentes.',17,1,8),(76,' Coordinar la realización de eventos turísticos y gastronómicos en los municipios del estado en conjunto con los sectores público, privado y social.',17,1,8),(77,' Promover las ferias y tradiciones del estado en localidades con alto potencial turístico.',17,1,8),(78,'Desarrollar el turismo alternativo y comunitario en los municipios con mayor potencial.',18,1,8),(79,'Otorgar facilidades de acceso a la oferta turística a los yucatecos y nacionales con énfasis a la población en situación de vulnerabilidad.',18,1,8),(80,'Fomentar la accesibilidad en los servicios turísticos del estado.',18,1,8),(81,'Facilitar el establecimiento de nuevas rutas turísticas sostenibles en las comunidades del estado respetando su identidad cultural.',18,1,8),(82,'Promover a los artesanos, comerciantes y productores turísticos y gastronómicos locales en ferias y eventos turísticos nacionales e internacionales.',18,1,8),(83,'Vincular los sectores público, privado, social y académico para mejorar el acceso laboral incluyente y productivo',19,1,8),(84,'Fomentar el establecimiento de condiciones justas, equitativas y satisfactorias de trabajo en las empresas.',19,1,8),(85,'Promover los beneficios del sentido de identidad y pertenencia como consecuencia de mejores condiciones laborales.',19,1,8),(86,'Facilitar la inserción en el mercado laboral de todos los grupos sociales.',19,1,8),(87,'Promocionar los beneficios de la formalidad laboral entre la población trabajadora',20,1,8),(88,'Coadyuvar con el sector privado para que las empresas impulsen la seguridad social laboral.',20,1,8),(89,'Impulsar la coordinación efectiva entre los distintos órdenes de gobierno para mejorar los procesos de incorporación a la seguridad social.',20,1,8),(90,'Capacitar a las empresas en materia de productividad laboral.',21,1,8),(91,'Implementar tecnología que mejore la productividad de las empresas.',21,1,8),(92,'Promover la formación de capital humano en las áreas de alto impacto económico acorde con la demanda actual y emergente.',21,1,8),(93,'Crear un certificado de calidad para las empresas con alta productividad.',22,1,8),(94,'Otorgar estímulos a las empresas que cuenten con procesos de calidad y demuestren ser productivas.',22,1,8),(95,'Promocionar las mejores prácticas de productividad en las empresas.',22,1,8),(96,'Promover una cultura del emprendimiento desde la educación básica.',23,1,8),(97,'Fomentar la formación de aptitudes empresariales en estudiantes de educación media superior y superior.',23,1,8),(98,'Promover la aplicación de buenas prácticas en materia de emprendimiento.',23,1,8),(99,'Ofrecer capacitación con valor curricular, para acciones de emprendimiento en el hogar, que permitan conciliar la vida laboral y personal.',23,1,8),(100,'Celebrar convenios de colaboración entre organizaciones de apoyo al ecosistema emprendedor para la formación de capacidades de emprendimiento.',23,1,8),(101,'Realizar un seguimiento a las acciones de emprendimiento a fin de detectar necesidades de formación, fortalezas y áreas de oportunidad.',23,1,8),(102,'Impulsar la formación de equipos multidisciplinarios y con diferentes niveles de especialización técnica para la formación de capacidades empresariales.',23,1,8),(103,'Desarrollar programas formativos de habilidades proactivas para aumentar la eficiencia y la modernización continua en las empresas.',23,1,8),(104,'Crear programas de inversión para emprendedores con esquemas de financiamiento vinculados a los sectores público, privado, social y académico.',23,1,8),(105,'Desarrollar acciones de fortalecimiento a emprendedores con enfoque de inclusión.',24,1,8),(106,'Incorporar habilidades de liderazgo y herramientas de empoderamiento en los procesos de acompañamiento y formación.',24,1,8),(107,'Promover redes que impulsen de manera focalizada el emprendimiento inclusivo a través del acompañamiento, servicios y comercialización de sus productos.',24,1,8),(108,'Establecer espacios físicos o virtuales que permitan visibilizar las acciones de los emprendedores locales en el ecosistema de emprendimiento de la entidad.',25,1,8),(109,'Impulsar el uso de las Tecnologías de la Información y Comunicación (TICs) para vincular a los emprendedores en la cadena de valor que les permita mejorar la competitividad empresarial.',25,1,8),(110,'Promover el uso de tecnología e innovación para acceder a los financiamientos',25,1,8),(111,'Promover la integración de cadenas de valor para aumentar la productividad, calidad y rentabilidad entre los emprendedores.',25,1,8),(112,'Gestionar insumos para los productores del sector agropecuario.',26,1,2),(113,'Generar acciones para promover el consumo de productos agropecuarios locales. ',26,1,2),(114,'Impulsar esquemas de financiamiento y reducción de costos financieros para el desarrollo del sector agropecuario.',26,1,2),(115,'Impulsar acciones de infraestructura que faciliten el movimiento de productos agropecuarios.',26,1,2),(116,'Inducir la implementación de procesos productivos que favorezcan la producción sostenible.',26,1,2),(117,'Favorecer la comercialización estratégica de productos agropecuarios locales en los mercados locales e internacionales.',26,1,2),(118,'Desarrollar acciones para la industrialización de productos agropecuarios de manera sostenible',26,1,2),(119,'Fomentar la creación de mecanismos para el aprovechamiento de la denominación de origen de productos locales o indicación geográfica. ',26,1,2),(120,'Impulsar la certificación de la calidad de los productos agropecuarios.',26,1,2),(121,'Desarrollar acciones para el aprovechamiento de productos agropecuarios de manera sostenible',26,1,2),(122,'Promover la investigación y el desarrollo de innovaciones en los procesos agropecuarios.',26,1,2),(123,'Impulsar la mecanización y tecnificación del sector agropecuario.',27,1,2),(124,'Apoyar a productores y emprendedores en procesos y técnicas que permitan mejorar la calidad de su producción.',27,1,2),(125,'Dotar de herramientas tecnológicas al sector agropecuario para mejorar sus procesos productivos.',27,1,2),(126,'Promover el uso de insumos que minimicen el impacto ambiental. ',28,1,2),(127,'Incentivar prácticas que ayuden a la conservación de los recursos hídricos del estado.',28,1,2),(128,'Gestionar herramientas para los productores a efecto de prevenir y combatir plagas y enfermedades en el sector agropecuario.',28,1,2),(129,'Realizar un control de seguimiento y vigilancia de sanidad a las unidades productivas así como reforzar los comités de sanidad estatal.',28,1,2),(130,'Incentivar la producción de las especies con mayor valor y rendimiento.',29,1,2),(131,'Proporcionar cursos de inocuidad pecuaria sostenible.',29,1,2),(132,'Otorgar apoyos para la producción pecuaria.',29,1,2),(133,'Impulsar la creación de centros de transferencia y tecnología genética pecuaria.',30,1,2),(134,'Promover la asistencia técnica y la capacitación en procesos reproductivos que mejoren la genética de las especies pecuarias.',30,1,2),(135,'Otorgar apoyos para el mejoramiento genético del sector pecuario. ',30,1,2),(136,'Apoyar la producción agrícola de los cultivos con mayor rentabilidad en el estado.',31,1,2),(137,'Reforzar la cadena de suministros agroalimentaria estatal.',31,1,2),(138,'Consolidar programas de producción y consumo responsable en temas agroalimentarios',31,1,2),(139,'Favorecer el cultivo de productos agrícolas con mayor demanda en la entidad.',31,1,2),(140,'Promover mecanismos que propicien el trato directo entre los productores agrícolas y los consumidores finales.',31,1,2),(141,'Reforzar la inocuidad y diversificación de la producción agrícola.',32,1,2),(142,'Estimular las inversiones que favorezcan la calidad y disponibilidad de productos agrícolas.',32,1,2),(143,'Proporcionar capacitación sobre prevención de riesgos en materia agrícola.',32,1,2),(144,'Modernizar la infraestructura para la pesca a fin de dar mayor valor agregado a los productos pesqueros.',33,1,2),(145,'Brindar asesoría a las empresas pesqueras y acuícolas del estado.',33,1,2),(146,'Reforzar la cadena productiva y los canales de comercialización del sector pesquero de forma eficiente.',33,1,2),(147,'Impulsar campañas de concientización de los tiempos de veda y fomento de la acuacultura en el estado.',33,1,2),(148,'Incentivar el emprendimiento para fomentar la creación de unidades económicas del sector pesquero y acuícola.',33,1,2),(149,'Establecer mecanismos de control y seguimiento de embarcaciones pesqueras y unidades acuícolas.',33,1,2),(150,'Gestionar campañas de concientización sobre el valor nutrimental de los productos acuícolas y pesqueros en el estado.',34,1,2),(151,'Promover el desarrollo de proyectos de granjas acuícolas en las poblaciones rurales.',34,1,2),(152,'Fomentar la cultura de consumo de productos pesqueros y acuícolas entre la población rural.',34,1,2),(153,'Gestionar apoyos justos para mejorar la calidad de las condiciones de los pescadores.',34,1,2),(154,'Consolidar la producción de especies marinas nativas mediante la elaboración de estudios que garanticen la capacidad productiva.',35,1,2),(155,'Suscribir convenios con instituciones educativas para capacitar a los productores pesqueros y acuícolas del estado.',35,1,2),(156,'Impulsar el uso de tecnología para las actividades pesqueras y acuícolas sostenibles.',35,1,2),(157,'Crear campañas de concientización sobre la preservación del medio ambiente de la zona costera.',36,1,2),(158,'Realizar un monitoreo de la calidad de las aguas subterráneas para identificar zonas con potencial acuícola en el estado.',36,1,2),(159,'Identificar zonas de anidamiento y reproducción de las especies marítimas para reforzar la vigilancia.',36,1,2),(160,'Organizar las unidades de primer nivel y la atención pre hospitalaria con medicamentos suficientes, equipos especializados y atención de los padecimientos con mayor frecuencia en las regiones de mayor vulnerabilidad social.  ',37,1,3),(161,'Reorganizar el recurso humano de salud con esquemas que amplíen la cobertura en el estado y aseguren la atención en hogares y comunidades.  ',37,1,3),(162,'Expandir los horarios de atención médica para brindar servicios  en el primer nivel de atención durante las 24 horas del día, los siete días de la semana. ',37,1,3),(163,'Incentivar la actualización de los conocimientos y habilidades del personal de salud con la participación de organismos oficialmente reconocidos y especializados en temas de prevención y atención integral.',38,1,3),(164,'Consolidar la calidad del servicio médico mediante la ampliación y certificación periódica del personal de salud. ',38,1,3),(165,'Promover el apego de los establecimientos de salud públicos y privados a los estándares de calidad en materia de salud.',38,1,3),(166,'Fortalecer la relación médico-paciente en los tres niveles de atención especializada de forma incluyente.',38,1,3),(167,'Incentivar la aplicación de la biotecnología roja en los procesos médicos. ',38,1,3),(168,'Promover una red de hospitales que cuenten con las herramientas y tecnologías robóticas, para brindar un servicio especializado y de vanguardia al cuidado de la salud.',38,1,3),(169,'Consolidar la infraestructura y equipamiento de las unidades médicas y establecimientos de apoyo para la prestación de servicios de manera incluyente y sostenible.',39,1,3),(170,'Expandir la cobertura de conectividad de voz y datos en las unidades médicas y establecimientos pertenecientes al Sistema Estatal de Salud. ',39,1,3),(171,'Modernizar la infraestructura y  promover el uso y aprovechamiento de sistemas informáticos integrales en el Sistema Estatal de Salud. ',39,1,3),(172,'Consolidar el uso de las tecnologías de la información para la capacitación continua del personal de salud, así como la prestación de servicios médicos a distancia.',39,1,3),(173,'Impulsar la atención integral en las unidades médicas del sector salud a personas que viven violencia familiar y/o sexual con énfasis en grupos en situación de vulnerabilidad.',40,1,3),(174,'Fomentar la atención integral a las mujeres, en especial durante el periodo preconcepcional, embarazo, parto y puerperio, para disminuir el riesgo de enfermedades obstétricas y ginecológicas.',40,1,3),(175,'Promover en las unidades médicas la orientación y consejería sobre planificación familiar. ',40,1,3),(176,'Desarrollar mecanismos de prevención y atención integral que reduzcan la mortalidad materna e infantil.',40,1,3),(177,'Promover nuevas habilidades y formas de comportamiento entre la población en situación de vulnerabilidad que permita el mejoramiento de las condiciones de salud en el estado.',40,1,3),(178,'Reforzar los esquemas de atención en el sector público para la detección y atención oportuna de las enfermedades que más afectan a la población en situación de vulnerabilidad.',40,1,3),(179,'Reforzar las acciones de prevención y atención integral de enfermedades crónico degenerativas, respiratorias e infecto contagiosas, con énfasis en las más frecuentes.',41,1,3),(180,'Promover la cobertura de vacunación universal con esquema completo. ',41,1,3),(181,'Reforzar las acciones de prevención y control de las enfermedades transmitidas por vector y zoonosis. ',41,1,3),(182,'Impulsar acciones de promoción de la salud, prevención y atención integral de enfermedades metabólicas asociadas a la nutrición, para el combate al sobrepeso y la obesidad.',41,1,3),(183,'Reforzar los mecanismos de prevención, detección, atención integral y seguimiento de las personas que viven con el Virus de la Inmunodeficiencia Humana (VIH), sida y otras Infecciones de Transmisión Sexual (ITS).',41,1,3),(184,'Reforzar las acciones de promoción de la salud en la población para la adopción habitual de medidas de autocuidado de la salud, donación de sangre y adopción de conductas seguras en la vida cotidiana.',41,1,3),(185,'Reforzar las acciones de prevención, atención y control de trastornos mentales, padecimientos psicosociales y por uso de sustancias, con especial atención en la población en situación de vulnerabilidad.',42,1,3),(186,'Desarrollar acciones de mejora en las unidades de atención de salud mental con enfoque a los derechos humanos de los pacientes.',42,1,3),(187,'Promover acciones de sensibilización en los diferentes órdenes de gobierno y la sociedad sobre salud mental y la inclusión de personas con trastornos mentales.',42,1,3),(188,'Reforzar la vigilancia y control sanitario de establecimientos que ofrecen bienes y servicios de uso y/o consumo humano así como los asociados a factores ambientales y de salud ocupacional.',43,1,3),(189,'Reforzar las acciones de saneamiento básico derivados de la ocurrencia de emergencias y desastres en el estado.',43,1,3),(190,'Consolidar las acciones de regulación de la publicidad y etiquetado de alimentos, bebidas y sustancias adictivas legales. ',43,1,3),(191,'Fomentar la actualización del marco legal que permita la regulación sanitaria de establecimientos no formales.',43,1,3),(192,'Gestionar el trabajo colaborativo en las comunidades, escuelas y municipios que propicien la certificación como entornos saludables que mejoran la condición de vida de la población.',44,1,3),(193,'Promover la colaboración con las y los auxiliares de salud comunitarias y parteras tradicionales en el reforzamiento de acciones de prevención y control de las enfermedades en las comunidades.',44,1,3),(194,'Reforzar la colaboración interinstitucional en la operación de puntos de control de niveles de alcohol en conductores de vehículos como medida en la prevención de accidentes viales.',44,1,3),(195,'Generar acciones que garanticen la sostenibilidad alimentaria de las personas en condición de desnutrición.',45,1,2),(196,'Incentivar la sana alimentación de las y los lactantes y de la niñez en el desarrollo de la primera infancia.',45,1,2),(197,'Elaborar campañas que incentiven el consumo de alimentos con alta calidad nutricia y erradiquen conductas alimentarias que generan desnutrición.',45,1,2),(198,'Coordinar acciones entre los sectores académico, privado, público y personas de las comunidades para abatir el hambre.',45,1,2),(199,'Proporcionar capacitación sobre los hábitos de una buena alimentación y la importancia del desarrollo infantil.',46,1,2),(200,'Apoyar a las personas y/u organizaciones que propicien la sana alimentación en las comunidades de mayor carencia alimentaria en el estado.',46,1,2),(201,'Promover la entrega de desayunos y paquetes alimenticios con alta calidad nutricia, priorizando a las comunidades con mayor marginación y carencia alimentaria, previniendo las enfermedades relacionadas con la desnutrición.',46,1,2),(202,'Impulsar, en coordinación con las organizaciones de la sociedad civil, una campaña de manejo de excedentes y de las pérdidas post cosecha con el objetivo de disminuir la malnutrición y desnutrición.',46,1,2),(203,'Impartir capacitaciones sobre la selección e inocuidad de cultivos con alto valor calórico.',47,1,2),(204,'Promover la investigación sobre la diversidad genética de las semillas, las plantas y los animales de granja para el procesamiento de alimentos nutritivos e inocuos.',47,1,2),(205,'Gestionar una mayor inversión en infraestructura rural, servicios de extensión, desarrollo tecnológico y en bancos de granos o de animales de crianza.',47,1,2),(206,'Promover la producción agropecuaria sostenible y la autogestión alimentaria, priorizando a las familias indígenas con mayor inseguridad alimentaria. ',48,1,2),(207,'Brindar capacitación sobre técnicas de producción eficiente y sostenible en las comunidades rurales con un enfoque incluyente.',48,1,2),(208,'Expandir el sistema educativo a las comunidades indígenas para reducir el rezago.',49,1,10),(209,'Realizar acciones que garanticen la seguridad alimentaria y nutricional en los pueblos indígenas.',49,1,10),(210,'Extender la cobertura y calidad de los servicios de salud en las comunidades indígenas.',49,1,10),(211,'Proporcionar la infraestructura adecuada y de calidad para las viviendas en comunidades indígenas.',49,1,10),(212,'Reforzar el acceso a los servicios básicos para las viviendas en comunidades indígenas.',49,1,10),(213,'Promover el acceso a la seguridad social sostenible para las comunidades indígenas.',49,1,10),(214,'Impulsar intérpretes traductores que proveen asistencia multidisciplinaria a la población maya hablante.',50,1,10),(215,'Realizar campañas de respeto a los derechos de los maya hablantes con un lenguaje incluyente y accesible.',50,1,10),(216,'Organizar consejos comunitarios que supervisen el cumplimiento de los derechos de la población maya hablante.',50,1,10),(217,'Reforzar la medicina tradicional maya a través de un registro único de mujeres y hombres que ejercen esta milenaria práctica en Yucatán.',50,1,10),(218,'Incorporar la perspectiva de género en la asignación de apoyos y recursos de los programas federales dirigidos a la población indígena.',50,1,10),(219,'Ampliar la cobertura de los centros educativos, principalmente en las comunidades indígenas.',51,1,4),(220,'Rehabilitar los espacios educativos con infraestructura accesible e inclusiva.',51,1,4),(221,'Impulsar acciones de construcción y mantenimiento en las escuelas, que satisfagan las necesidades de los usuarios.',51,1,4),(222,'Implementar acciones de equipamiento en escuelas del interior del estado.',51,1,4),(223,'Consolidar los espacios radioeléctricos y televisivos para ofertar la educación básica y media superior en comunidades de difícil acceso.',51,1,4),(224,'Desarrollar acciones de alfabetización para la atención de jóvenes y adultos en rezago educativo.',52,1,4),(225,'Organizar grupos de enseñanza continua entre la comunidad con técnicas de aprendizaje que prioricen la atención de la primera infancia, adultos mayores y personas con discapacidad.',52,1,4),(226,'Generar apoyos para las organizaciones que combaten el analfabetismo.',52,1,4),(227,'Impartir asesoría extra clases en comunidades con altos niveles de rezago educativo y/o personas con discapacidad.',52,1,4),(228,'Establecer programas de regularización educativa en las comunidades que presentan mayor rezago educativo.',52,1,4),(229,'Reforzar la profesionalización integral del personal docente para la educación multigrado y la innovación de los procesos pedagógicos, incluyendo contenidos de emprendimiento desde nivel básico.',53,1,4),(230,'Coordinar acciones que vinculen la educación media superior y superior con el mercado laboral, mediante el reforzamiento de la educación dual y profesionalización técnica.',53,1,4),(231,'Promover programas para el desarrollo socioemocional de las y los estudiantes.',53,1,4),(232,'Desarrollar mecanismos innovadores que promuevan la mejora en el desempeño de las y los estudiantes.',53,1,4),(233,'Adaptar el aprendizaje en función al uso de tecnologías de la información y comunicación.',54,1,4),(234,'Reforzar la atención y calidad de los centros que brindan educación especial y los centros de atención múltiple con enfoque de inclusión, prioritariamente aquellas asociadas con discapacidad y/o con aptitudes sobresalientes.',54,1,4),(235,'Instruir a los padres de familia y personal docente sobre el pleno desarrollo integral de las personas con necesidades educativas especiales.',54,1,4),(236,'Proporcionar materiales académicos para las y los estudiantes de educación básica y media superior, principalmente a las personas de comunidades indígenas.',54,1,4),(237,'Extender la oferta de becas para las y los estudiantes de todos los niveles educativos, priorizando a las madres adolescentes, la niñez con alguna discapacidad y la población en situación de vulnerabilidad.',54,1,4),(238,'Establecer acciones para mejorar las capacidades de las y los trabajadores sociales en las instituciones educativas, con énfasis en las zonas con altos niveles de rezago.',54,1,4),(239,'Asegurar la educación integral con un  esquema de participación social que favorezca las decisiones libres, responsables e informadas de niñas, niños y adolescentes, sobre el ejercicio de su sexualidad y salud sexual y reproductiva.',54,1,4),(240,'Promover acciones que fortalezcan la educación intercultural bilingüe y el uso de la lengua maya en escuelas públicas de educación básica.',54,1,4),(241,'Gestionar recursos para la adquisición, construcción, ampliación y mejoramiento de viviendas, principalmente en comunidades marginadas.',55,1,11),(242,'Establecer mecanismos de coordinación con los diferentes órdenes y niveles de gobierno para reforzar las acciones de vivienda.',55,1,11),(243,'Fomentar la adquisición, construcción y ampliación de viviendas adecuadas, especialmente para personas con discapacidad ',55,1,11),(244,'Desarrollar acciones que faciliten el acceso a planes de financiamiento de viviendas dignas y de bajo costo, para mujeres y  grupos en situación de vulnerabilidad.',55,1,11),(245,'Promocionar la participación de organizaciones no gubernamentales en el financiamiento para la construcción, ampliación y mejoramiento de vivienda.',55,1,11),(246,'Promover el financiamiento de desarrollos habitacionales con materiales y tecnologías que que reduzcan el consumo de energía eléctrica, emisión de CO2 y residuos contaminantes.',55,1,11),(247,'Promover el financiamiento de proyectos de desarrollos habitacionales que cumplan con la normatividad de desarrollo sustentable.',55,1,11),(248,'Establecer programas de acceso y financiamiento de viviendas sustentables o amigables con el medio ambiente.',56,1,11),(249,'Realizar acciones de vivienda con materiales duraderos, priorizando las familias en situación de pobreza y marginación.',56,1,11),(250,'Promover la investigación de nuevas propuestas para el uso de materiales alternativos y energías renovables para la construcción de viviendas.',56,1,11),(251,'Implementar programas de reubicación de viviendas asentadas en zonas de alto riesgo o no aptas para uso habitacional.',56,1,11),(252,'Promover acciones de prevención y mantenimiento de viviendas regulares con mayor exposición y vulnerabilidad a fenómenos naturales.',56,1,11),(253,'Consolidar la red de agua potable, drenaje y alcantarillado en zonas habitacionales que presenten mayor rezago.',57,1,11),(254,'Implementar acciones de electrificación que garanticen a la población el acceso a energía continua y suficiente.',57,1,11),(255,'Desarrollar acciones que permitan el acceso de la población a combustibles amigables con la salud y el medio ambiente.',57,1,11),(256,'Incentivar la participación del sector privado en la provisión de servicios básicos de calidad, suficientes y accesibles para las viviendas del estado.',57,1,11),(257,'Promover el desarrollo de nuevas opciones de financiamiento para constructores del sector privado que ofrezcan viviendas de bajo costo y con servicios básicos de calidad.',57,1,11),(258,'Promover asentamientos humanos en zonas seguras y con acceso a servicios básicos.',57,1,11),(259,'Fomentar el uso de materiales alternativos y energías renovables para dotar de servicios básicos a las viviendas.',57,1,11),(260,'Planear redes de infraestructura que permitan la ampliación de la cobertura de los servicios de agua potable, alcantarillado y electrificación con un enfoque de desarrollo sostenible y con prioridad en las zonas marginadas.',58,1,11),(261,'Promover una normativa que garantice el desarrollo de proyectos de viviendas seguras, dignas, saludables y amigables con el medio ambiente.',58,1,11),(262,'Poner en marcha la reubicación de asentamientos en condiciones de riesgo ante fenómenos naturales, focos de contaminación o riesgos derivados de la acción humana.',58,1,11),(263,'Organizar grupos comunitarios que favorezcan el desarrollo y el bienestar social.',59,1,10),(264,'Salvaguardar el patrimonio de las familias que habitan principalmente en zonas de riesgo.',59,1,10),(265,'Asesorar a la población en situación de vulnerabilidad y de comunidades indígenas sobre el derecho a prestaciones y garantías laborales.',59,1,10),(266,'Mejorar la cobertura y beneficios del sistema de seguridad social de los trabajadores al servicio de los poderes públicos estatales y de los municipios.',59,1,10),(267,'Elaborar campañas de afiliación al sistema de salud, principalmente a la población que vive en comunidades indígenas.',60,1,10),(268,'Crear ventanillas o campañas de difusión para asesorar a las personas sobre la adquisición de un seguro.',60,1,10),(269,'Promover un sistema de protección social universal de amplio alcance en el estado.',60,1,10),(270,'Promover acciones que incentiven la participación y bienestar del adulto mayor.',61,1,10),(271,'Promover afiliaciones a la seguridad social de personas adultas mayores en comunidades con alto grado de pobreza y/o marginación.',61,1,10),(272,'Promover la seguridad social de los adultos mayores para mejorar su calidad de vida.',61,1,10),(273,'Impulsar el desarrollo de espacios incluyentes en los municipios para la realización de actividades artísticas y culturales.',62,1,8),(274,'Adecuar la infraestructura cultural existente en los municipios del estado, garantizando su resiliencia y sostenibilidad, así como la accesibilidad de personas con discapacidad, adultos mayores y mujeres embarazadas.',62,1,8),(275,'Diseñar normas y lineamientos claros y transparentes para el uso adecuado y óptimo de la infraestructura cultural.',62,1,8),(276,'Optimizar espacios e infraestructura existente para la realización de actividades y eventos artísticos y culturales.',62,1,8),(277,'Implementar acciones, como circuitos culturales, que favorezcan  la descentralización de los servicios artísticos y culturales hacia zonas de Mérida con baja oferta cultural y municipios del interior del estado, garantizando la inclusión y accesibilidad.',63,1,8),(278,'Estimular la diversificación de la oferta cultural apoyando producciones de grupos independientes y emitiendo convocatorias incluyentes.',63,1,8),(279,'Incentivar la creación de productos y servicios artísticos y culturales, con enfoque de igualdad de género. ',63,1,8),(280,'Estimular el desarrollo y consolidación de niños y jóvenes creadores mediante recintos culturales infantiles, creación de compañías de danza y teatro infantil, así como la realización de eventos y festivales.',63,1,8),(281,'Incentivar proyectos y eventos culturales que busquen la transformación social y sensibilización en inclusión, igualdad y atención a grupos en situación de vulnerabilidad.',63,1,8),(282,'Diseñar un sistema de información cultural que permita medir cuantitativamente y cualitativamente la economía cultural e industrias creativas',64,1,8),(283,'Incorporar a las políticas públicas, programas y acciones la validación de la dimensión comercial de la cultura y la creatividad, y su articulación con tecnología, infraestructura, acceso a mercados, entre otros',64,1,8),(284,'Implementar acciones de vinculación entre el sector cultural e industrias creativas con el sector turístico y económico.',64,1,8),(285,'Motivar la innovación dentro de las industrias culturales y creativas, que estimulen a los artistas y creadores locales.',64,1,8),(286,'Utilizar herramientas de las Tecnologías de la Información y la Comunicación para acercar los eventos, productos y servicios culturales a la población.      ',65,1,12),(287,'Desarrollar acciones de sensibilización del valor del arte y la cultura para contribuir a crear nuevos públicos.       ',65,1,12),(288,'Propiciar una vinculación interinstitucional entre los tres órdenes de gobierno para impulsar el arte y la cultura.  ',65,1,12),(289,'Generar información que ayude a mejorar la realización de los eventos artísticos y culturales a partir de la opinión y participación incluyente de la población.',66,1,12),(290,'Implementar acciones de movilidad para facilitar el consumo de bienes y servicios culturales.',66,1,12),(291,'Impulsar la incorporación  de grupos artísticos de municipios y comunidades a la agenda cultural del estado',66,1,12),(292,'Incentivar el consumo de la población de eventos, productos y servicios culturales mediante apoyos o subvenciones.',66,1,12),(293,'Motivar la generación, edición y publicación de medios escritos (libros, revistas, periódicos, entre otros), procurando la producción incluyente y con contenido dirigido a grupos en situación de vulnerabilidad, así como la generación de obras inéditas en diferentes géneros literarios, de investigación y divulgación científica.',67,1,12),(294,'Crear colecciones incluyentes en formatos económicos.',67,1,12),(295,'Desarrollar acciones que garanticen la distribución de los libros editados y coeditados en formato impreso y digital abarcando todas las regiones del estado, así como el mercado nacional e internacional.',67,1,12),(296,'Promover la realización de ferias y festivales del libro y lectura en los municipios del estado.                                                                                                                                                                                            ',67,1,12),(297,'Reforzar las salas de lectura y bibliotecas en los municipios del estado con acciones de mantenimiento, equipamiento y acervo bibliográfico.',67,1,12),(298,'Estimular el acceso a la lectura en lugares no convencionales como áreas hospitalarias, cárceles, orfanatos, entre otros.',67,1,12),(299,'Desarrollar actividades de fomento a la lectura dirigidos a toda la población, pero con énfasis a niños, personas con discapacidad y grupos específicos que tengan limitaciones para acceder a medios escritos.  ',67,1,12),(300,'Estimular la investigación y difusión de las manifestaciones de la cultura tradicional en Yucatán.',68,1,10),(301,'Fomentar espacios de difusión en medios de comunicación de la cultura maya, su lengua, tradiciones, costumbres e historia.',68,1,10),(302,'Impulsar acciones de profesionalización para los gestores y artistas de la cultura e identidad yucateca en sus propias localidades.',68,1,10),(303,'Incentivar la difusión de la identidad cultural, tradiciones, historias y costumbres mediante agentes locales, preferentemente mujeres mayahablantes.',68,1,10),(304,'Incentivar el desarrollo de eventos incluyentes que conlleven al rescate de los juegos y deportes tradicionales.',68,1,10),(305,'Implementar acciones que promuevan el orgullo por la cultura tradicional.',68,1,10),(306,'Exponer las expresiones artísticas, tradiciones y costumbres en un ámbito internacional a través de intercambios, colaboraciones y fusiones artísticas.',68,1,10),(307,'Reestructurar la agenda cultural de las comunidades y colonias, implementando eventos y actividades en lengua maya.',68,1,10),(308,'Incentivar los eventos y actividades de cultura tradicional como trova, teatro regional, bailes, festividades, fiestas patronales, entre otros.',68,1,10),(309,' Establecer una vinculación entre los sectores cultural y educativo para implementar proyectos y programas educativos que favorezcan la preservación y desarrollo de las culturas populares y la cultura maya.',68,1,10),(310,'Estimular la creación de proyectos viables y autogestivos de la artesanía local.',69,1,10),(311,'Fomentar el interés por la creación artesanal en los jóvenes para preservar las costumbres y tradiciones.',69,1,10),(312,'Reforzar los canales de distribución y comercialización de productos artesanales en zonas estratégicas del estado.',69,1,10),(313,'Impulsar la creación de espacios físicos y virtuales para exposiciones y muestras artesanales.',69,1,10),(314,'Impartir talleres de formación y actualización artística garantizando la inclusión social y equidad.',70,1,11),(315,'Otorgar apoyos que incentiven la formación y profesionalización de nuevos artistas y creadores.',70,1,11),(316,'Consolidar los programas de educación y formación artística formal desde el grado inicial hasta posgrado con una perspectiva incluyente.',70,1,11),(317,'Implementar acciones que faciliten la empleabilidad de nuevos artistas.',70,1,11),(318,'Consolidar los centros de educación artística públicos y privados encargados de generar nuevos artistas.',70,1,11),(319,'Facilitar a los artistas y creadores el acceso a espacios incluyentes de expresión de las artes.',71,1,11),(320,'Estimular la creación de manifestaciones artísticas enfocadas en las artes.',71,1,11),(321,'Establecer esquemas de colaboración público-privada que permitan apoyar a compañías, artistas y creadores dedicados al teatro, artes escénicas, música, danza, artes visuales, multimedia  y demás manifestaciones artísticas contemporáneas.',71,1,11),(322,'Incentivar la profesionalización continua de los artistas y creadores mediante la vinculación de programas de profesionalización del sector privado y de los tres órdenes de gobierno.',71,1,11),(323,'Diagnosticar la calidad de la educación artística utilizando criterios y lineamientos pedagógicos de reconocida calidad nacional e internacional.',72,1,4),(324,'Reforzar la educación artística con enfoque intercultural e incluyente.',72,1,4),(325,'Promover la realización de actividades artísticas extraescolares.',72,1,4),(326,'Habilitar los Centros Culturales como un foro que ayude a la enseñanza y apreciación  del arte en la educación básica. ',72,1,4),(327,'Consolidar las capacidades docentes de las y los maestros de educación artística, haciendo hincapié en la adopción de enfoques pedagógicos actuales, administración eficiente del tiempo y nuevas estrategias de enseñanza-aprendizaje.',72,1,4),(328,'Crear espacios para el intercambio y crecimiento profesional de los docentes de educación artística. ',72,1,4),(329,'Motivar las manifestaciones artísticas de profesionales y profesionistas en el sistema educativo.',73,1,4),(330,'Incentivar la realización de eventos artísticos y culturales en instituciones educativas.',73,1,4),(331,'Estimular que los profesionales del arte participen con las escuelas de educación básica para mejorar los programas y procedimientos de impartición artística.',73,1,4),(332,'Promover los programas de educación superior en artes como opción de formación integral.',74,1,4),(333,'Apoyar los procesos de evaluación y acreditación de licenciaturas en artes en el estado.',74,1,4),(334,'Desarrollar acciones que garanticen el acceso incluyente a la formación artística.',74,1,4),(335,'Incentivar la labor social del estudiante en artes para que fomente la cultura y su valoración.',74,1,4),(336,'Implementar acciones que mejoren la calidad de la enseñanza en artes.',74,1,4),(337,'Proporcionar apoyos o estímulos para los estudiantes en artes para que motiven su permanencia y egreso.',74,1,4),(338,'Consolidar la formación de cuerpos académicos de educación superior en artes.',74,1,4),(339,'Gestionar apoyos y estímulos a las instituciones y escuelas que tengan programas de enseñanza superior de arte.',75,1,4),(340,'Estimular el emprendimiento y autoempleo de los estudiantes en artes.',75,1,4),(341,'Vincular a los estudiantes de educación superior en artes con el mercado laboral.',75,1,4),(342,'Fortalecer las capacidades de gestión y administrativas de las instituciones de educación superior en arte involucrando a la  sociedad civil principalmente en el patronazgo.',75,1,4),(343,'Conformar una instancia ciudadana con participación de distintos actores sociales, públicos y privados que coadyuve a promover, difundir y preservar el patrimonio cultural del estado.    ',76,1,11),(344,'Promover mecanismos de intercambio de información sobre el estado y ubicación del patrimonio cultural entre académicos, gestores e instituciones de la Administración Pública.',76,1,11),(345,'Promover en los municipios y comisarías la realización de eventos, exhibiciones y actividades que promuevan el conocimiento y  conservación del patrimonio cultural.',76,1,11),(346,'Actualizar la normatividad vigente en materia de protección y promoción del patrimonio cultural.',77,1,11),(347,'Sensibilizar a los ayuntamientos a que tengan una participación activa en la protección e integración de su patrimonio.',77,1,11),(348,'Gestionar la preservación de los acervos bibliográficos, hemerográficos, documentales y audiovisuales. ',77,1,11),(349,'Incentivar acciones y proyectos encaminados a la preservación del patrimonio cultural.',77,1,11),(350,'Proporcionar mantenimiento a museos que promuevan y difundan el patrimonio cultural.',77,1,11),(351,'Generar nuevos contenidos en la red de museos que promuevan el patrimonio cultural.',77,1,11),(352,'Crear esquemas de identificación de talentos deportivos a través de un equipo multidisciplinario así como incentivar el desarrollo y permanencia de los talentos deportivos con enfoque incluyente.',78,1,3),(353,'Proporcionar seguimiento y acompañamiento permanente a los talentos deportivos con enfoque incluyente.',78,1,3),(354,'Reforzar los programas de exhibición de las disciplinas deportivas tradicionales y de deporte adaptado en escuelas de nivel preescolar y primaria.',78,1,3),(355,'Establecer convenios de coordinación de impulso al deporte entre las escuelas y centros educativos que faciliten los entrenamientos de los atletas con un enfoque incluyente.',78,1,3),(356,'Diseñar metodologías deportivas que abarquen todas las etapas de formación de un deportista.',78,1,3),(357,'Proporcionar una atención integral a los deportistas de alto rendimiento con enfoque incluyente, y usando evidencia científica que coadyuve al desarrollo de los deportistas.',79,1,3),(358,'Consolidar las capacidades de médicos y entrenadores de los deportistas de alto rendimiento con un enfoque incluyente.',79,1,3),(359,'Crear programas de entrenamiento adecuados para los deportistas de alto rendimiento con un enfoque incluyente.',79,1,3),(360,'Gestionar infraestructura deportiva incluyente y de calidad para la práctica de deporte de alto rendimiento.',79,1,3),(361,'Diseñar esquemas financieros que sirvan como base para proporcionar estímulos a entrenadores y deportistas, en especial a los que ganen medallas en competencias de alto rendimiento.',79,1,3),(362,'Consolidar la infraestructura deportiva existente garantizando su sostenibilidad para la realización de eventos y actividades físicas incluyentes.',80,1,3),(363,'Promover la generación de espacios deportivos incluyentes y resilientes.',80,1,3),(364,'Crear convenios de colaboración con la iniciativa privada para realizar acciones de rescate y mantenimiento de espacios públicos, así como implementar programas de activación física.',80,1,3),(365,'Crear una campaña para la activación física en municipios aprovechando la infraestructura existente (parques y campos).',80,1,3),(366,'Motivar la práctica deportiva y activación física desde la infancia.',80,1,3),(367,'Promover la vinculación laboral entre profesionistas y especialistas del deporte con los programas de activación física.',80,1,3),(368,'Diseñar programas especiales de activación física de acuerdo con padecimientos de salud.',80,1,3),(369,'Promover estrategias de prevención de la salud con acciones que impulsen la activación física de las y los estudiantes de educación básica',80,1,3),(370,'Apoyar a diferentes actores que promuevan o fomenten el deporte recreativo.',81,1,3),(371,'Crear academias que promuevan la práctica de deportes de conjunto, con un enfoque incluyente y que abarque a todos los municipios del interior del estado.',81,1,3),(372,'Utilizar técnicas alternativas que generen el interés por el deporte.',81,1,3),(373,'Crear modelos de inclusión en la realización de actividades deportivas para personas con alguna discapacidad.',81,1,3),(374,'Motivar la realización de  torneos y eventos deportivos',81,1,3),(375,'Fomentar esquemas de traslado económico y seguro para los aficionados a eventos deportivos profesionales.',82,1,12),(376,'Promover que el sistema de transporte proporcione una atención prioritaria en eventos deportivos masivos.',82,1,12),(377,'Crear sinergias con instituciones públicas y privadas para la promoción de eventos deportivos.',82,1,12),(378,'Implementar acciones que faciliten el acceso incluyente y seguro a los eventos deportivos.',82,1,12),(379,'Implementar acciones que fomenten la identidad de la población con los equipos profesionales.',83,1,12),(380,'Crear alianzas con instituciones públicas y privadas para la realización de eventos deportivos.',83,1,12),(381,'Incentivar la creación de eventos deportivos profesionales procurando la participación de equipos o jugadores  nacionales e internacionales.',83,1,12),(382,'Considerar las áreas naturales protegidas en los programas de desarrollo urbano como instrumentos básicos del ordenamiento territorial.',84,1,15),(383,'Estimular la creación de consejos comunitarios de vigilancia en todas las áreas protegidas del estado.',84,1,15),(384,'Elaborar y dar seguimiento a programas de rehabilitación, reforestación y revegetación de los diversos ecosistemas presentes en las áreas naturales protegidas.',84,1,15),(385,'Administrar las áreas naturales protegidas estatales para garantizar su protección.',84,1,15),(386,'Promover el manejo sustentable de los recursos naturales endémicos que incrementen la reforestación.',84,1,15),(387,'Implementar acciones de conservación de la superficie con vegetación.',84,1,15),(388,'Realizar la vinculación con los tres órdenes de gobierno para implementar acciones de arborización con participación ciudadana, en las áreas naturales protegidas. ',84,1,15),(389,'Promover sistemas silvopastoriles  que permitan el uso sustentable del suelo.',85,1,15),(390,'Guiar la participación de los municipios en la protección y respeto de las zonas sujetas a conservación, promoviendo la vigilancia en los territorios de su competencia. ',85,1,15),(391,'Proteger y aprovechar de manera sustentable la biodiversidad en el estado.',85,1,15),(392,'Generar plataformas de comunicación para la difusión de la conservación y el desarrollo sustentable en el territorio. ',85,1,15),(393,'Reforzar la protección de animales de crianza, domésticos, de trabajo o de situación de calle.',85,1,15),(394,'Gestionar la creación de refugios de animales y veterinarias municipales',85,1,15),(395,'Promocionar campañas de educación y respeto hacia todos los animales en los municipios.',85,1,15),(396,'Establecer programas de rescate y atención de especies en peligro de extinción que habitan en el estado.',85,1,15),(397,'Plantear mecanismos de retribución económica que permitan el financiamiento de proyectos para la conservación de la naturaleza.',85,1,15),(398,'Promover una legislación en favor de la protección y bienestar animal.',86,1,15),(399,'Gestionar que los municipios cuenten con instrumentos de regulación ecológica que permitan la protección, preservación, restauración y aprovechamiento sustentable de los recursos naturales.',86,1,15),(400,'Promover la cultura del medio ambiente desde la edad escolar para generar conciencia.',86,1,15),(401,'Planificar el uso público de todos aquellos espacios protegidos que tengan entre sus objetivos facilitar el disfrute cultural, educativo y recreativo de la naturaleza.',86,1,15),(402,'Gestionar recursos y financiamientos a favor de programas de manejo sustentable de los recursos naturales.',86,1,15),(403,'Generar conocimientos en materia de gestión del ordenamiento ecológico territorial entre  los ayuntamientos.',86,1,15),(404,'Promover acciones que protejan el sistema kárstico del estado. ',86,1,15),(405,'Proponer una cultura forestal de sensibilización, organización y capacitación en los municipios.',86,1,15),(406,'Promover la investigación científica enfocada al conocimiento y protección de la biodiversidad y los recursos naturales del estado.',86,1,15),(407,'Dirigir la cooperación técnica ambiental con instituciones de educación superior, centros de investigación, organismos y agencias nacionales e internacionales.',86,1,15),(408,'Implementar mecanismos de control y vigilancia del uso de agroquímicos en la agricultura.',86,1,15),(409,'Impulsar la producción y uso de plantas nativas para la  arborización con principal atención a zonas prioritarias.',87,1,15),(410,'Promover la producción de plantas nativas que presten servicios ambientales a las comunidades.',87,1,15),(411,'Promover una mayor cobertura forestal a través de especies nativas.',87,1,15),(412,'Reforzar la normatividad legal aplicable a las acciones que contrarresten la deforestación en el estado. ',88,1,15),(413,'Realizar la vinculación con los tres órdenes de gobierno para implementar acciones de arborización de terrenos y edificios públicos con participación ciudadana.',88,1,15),(414,'Implementar programas enfocados a reducir la pérdida de cobertura forestal del estado. ',88,1,15),(415,'Regular el cambio de uso del suelo en terrenos forestales para su conservación y uso adecuado para evitar la degradación.',88,1,15),(416,'Elaborar diagnósticos para determinar cuáles son las áreas prioritarias para la conservación.',88,1,15),(417,'Impulsar la recuperación, restauración y reforestación de los ecosistemas que han sufrido algún cambio.',88,1,15),(418,'Reforzar los consejos ciudadanos para implementar acciones contra el cambio climático.',89,1,13),(419,'Promover la realización de estudios e investigaciones sobre posibles efectos derivados del cambio climático.',89,1,13),(420,'Promover entre la población la adopción de medidas de adaptación y mitigación ante el cambio climático.',89,1,13),(421,'Incorporar a los planes de estudio de todos los niveles educativos la enseñanza de medidas para la prevención, adaptación y mitigación de los efectos del cambio climático. ',89,1,13),(422,'Reforzar el fondo estatal de apoyo contra desastres naturales.',90,1,13),(423,'Plantear acciones para la concientización de la población que habita en zonas de riesgo de fenómenos meteorológicos.',90,1,13),(424,'Fomentar una cultura de prevención y respuesta eficaz ante desastres naturales en coordinación con los municipios del estado. ',90,1,13),(425,'Incorporar instrumentos para la gestión de riesgos que permitan accionar ante las posibles consecuencias de los fenómenos naturales adversos. ',90,1,13),(426,'Promover la restauración de las barreras naturales para disminuir los impactos de eventos meteorológicos extremos en la zona costera.',90,1,13),(427,'Poner en marcha mecanismos de mitigación con el sector agropecuario, industrial, comercial y de servicios, a fin de reducir sus emisiones de carbono.',91,1,13),(428,'Promover el uso de ecotecnias para reducir la huella ecológica y mejorar el aprovechamiento sustentable de los recursos naturales.',91,1,13),(429,'Generar incentivos económicos para la aplicación de modelos agropecuarios ecológicos y sostenibles. ',91,1,13),(430,'Promover prácticas que propicien la reducción de los gases de efecto invernadero.',91,1,13),(431,'Impulsar desde las compras y el consumo de la administración pública estatal, una economía baja en carbono.',91,1,13),(432,'Identificar y monitorear las fuentes de emisiones contaminantes.',92,1,13),(433,'Actualizar el  marco regulatorio vigente en materia de prevención y control de la contaminación atmosférica.',92,1,13),(434,'Sensibilizar a la ciudadanía sobre la calidad del aire, los efectos de la contaminación en la salud y en los ecosistemas, así como los riesgos por exposición.',92,1,13),(435,'Desarrollar un sistema integral de verificación de la calidad del aire que incluya el sistema de transporte y el sector industrial.',92,1,13),(436,'Promover la investigación y la innovación tecnológica como base de las políticas para mejorar la calidad del aire.',92,1,13),(437,'Establecer mecanismos para el monitoreo de la calidad del aire prioritariamente en los municipios más afectados por la contaminación. ',92,1,13),(438,'Promover el fortalecimiento y actualización de la legislación en materia hídrica en el estado.',93,1,6),(439,'Diseñar programas para la reutilización de las aguas residuales tratadas para uso general y en el sector industrial.',93,1,6),(440,'Identificar fuentes de financiamiento para fortalecer los sistemas de saneamiento y tratamiento de agua con visión a largo plazo.',94,1,6),(441,'Ampliar la infraestructura existente para el suministro de agua potable en el estado.',94,1,6),(442,'Establecer mecanismos de cooperación entre el gobierno estatal y la iniciativa privada, para desarrollar proyectos de materia de tratamiento de aguas residuales.',94,1,6),(443,'Establecer programas, procesos de mantenimiento y mejoramiento de las plantas de tratamiento de aguas residuales existentes.',94,1,6),(444,'Elaborar un plan de innovación tecnológica para el fomento al tratamiento de las descargas de aguas residuales.',95,1,6),(445,'Promover la regulación de las plantas de tratamiento residuales, para que incorporen las tecnologías que resulten más convenientes para la población.',95,1,6),(446,'Invertir en nuevas tecnologías que mejoren la calidad del agua tratada. ',95,1,6),(447,'Vincular a las universidades y centros de investigación para el desarrollo tecnológico en el mejoramiento del tratamiento de agua.',95,1,6),(448,'Desarrollar esquemas de economía circular para el cuidado del agua',95,1,6),(449,'Promover planes y normas que regulen el uso eficiente del agua.',96,1,6),(450,'Poner en marcha acciones para hacer más eficiente y mejorar la calidad en el servicio de potabilización del agua.',96,1,6),(451,'Desarrollar procesos de fortalecimiento y capacitación de los municipios para la gestión sustentable del agua.',96,1,6),(452,'Incrementar la captación y aprovechamiento del agua pluvial.',96,1,6),(453,'Promover en el sector empresarial, especialmente en la industria hotelera y de servicios turísticos, el uso eficiente del agua, reducción de emisiones contaminantes y reciclaje.',96,1,6),(454,'Promover la concientización de la población sobre el uso responsable y eficiente del agua así como el pago oportuno del servicio.',96,1,6),(455,'Promover prácticas sustentables en las actividades agrícolas eficientes en el uso del agua.',96,1,6),(456,'Estandarizar indicadores de medición de la calidad del agua en el manto acuífero. ',97,1,6),(457,'Implementar esquemas de vigilancia ciudadana del agua.',97,1,6),(458,'Promover la creación de un sistema de monitoreo e inspección de la calidad del agua a nivel estatal. ',97,1,6),(459,'Promover una cultura de sustentabilidad en torno al manejo integral de residuos desde la educación formal y no formal.',98,1,12),(460,'Organizar la gestión de los residuos sólidos y especiales de acuerdo con una lógica regional en los municipios, a fin de sumar las capacidades institucionales y hacer uso eficiente de los recursos.',98,1,12),(461,'Formular acciones que aumenten el valor de los residuos recolectados dentro de economías de escala.',98,1,12),(462,'Capacitar al sector empresarial, gubernamental y a la sociedad para la elaboración adecuada de sus planes de manejo de residuos.',98,1,12),(463,'Desarrollar esquemas de saneamiento y recuperación de sitios afectados por el inadecuado manejo de los residuos.',98,1,12),(464,'Estimular la participación de la población para elaborar iniciativas ciudadanas para el manejo integral de los residuos.',98,1,12),(465,'Promover la inversión privada en el manejo integral de los residuos sólidos y especiales.',98,1,12),(466,'Implementar mecanismos de monitoreo y evaluación del cumplimiento de los reglamentos y normas ambientales.',98,1,12),(467,'Regular el uso del plástico en el estado.',99,1,12),(468,'Promover en las empresas que fabrican bolsas y productos de plástico la adopción de tecnologías biodegradables',99,1,12),(469,'Incentivar a las empresas para que adopten una cultura de reducción de residuos.',99,1,12),(470,'Incentivar el uso de los empaques ambientalmente responsables en los establecimientos comerciales.',99,1,12),(471,'Reforzar y mejorar los esquemas de organización y comunicación dirigida a la reducción y aprovechamiento de los residuos.',99,1,12),(472,'Gestionar la infraestructura para aumentar el aprovechamiento y valorización de los residuos.',100,1,12),(473,'Diseñar campañas para la separación de residuos sólidos y la reutilización de materiales de desecho.',100,1,12),(474,'Fortalecer el marco jurídico, para establecer trabajo comunitario de recolección de residuos sólidos y limpieza de calles como sanción a quienes arrojan residuos sólidos en espacios públicos.',100,1,12),(475,'Incentivar y regular a la industria para el manejo sustentable de los residuos sólidos y especiales.',100,1,12),(476,'Promover el reciclaje inclusivo en los municipios.',100,1,12),(477,'Promover la innovación e investigación para eficientar la valorización de los residuos.',100,1,12),(478,'Promover proyectos en el sector empresarial que contribuyan al desarrollo tecnológico de energías limpias.',101,1,7),(479,'Vincular los diferentes sectores para la implementación conjunta de proyectos de eficiencia energética y energías limpias.',101,1,7),(480,'Promover la investigación y capacitación en torno a las energías renovables.',101,1,7),(481,'Promover proyectos de energías renovables en los ámbitos industrial y residencial.',102,1,7),(482,'Promover el desarrollo de inventarios de energías limpias en el estado. ',102,1,7),(483,'Favorecer la implementación de energías limpias en el gobierno estatal.',102,1,7),(484,'Promover la generación y gestión de energía distribuida y autónoma a través de fuentes renovables.',102,1,7),(485,'Promover con las autoridades competentes, la inclusión en la evaluación y autorización de proyectos de generación de energías renovables. ',102,1,7),(486,'Promover el uso de dispositivos compatibles con las energías limpias a la población.',103,1,7),(487,'Promover la operación de proyectos  de inversión privada de energías no contaminantes.',103,1,7),(488,'Establecer incentivos para que los sectores social y privado hagan uso de energías limpias. ',103,1,7),(489,'Establecer mecanismos de cooperación que ofrezcan alternativas viables con relación a los costos de insumos energéticos.',104,1,7),(490,'Promover proyectos científicos y tecnológicos, dirigidos a reducir la demanda energética e incrementar el uso de energías renovables.',104,1,7),(491,'Poner en marcha proyectos e inversiones dirigidas a un aprovechamiento sustentable de la energía en el estado.',104,1,7),(492,'Promover la acuacultura como medio para evitar la sobreexplotación de las especies marinas.',105,1,14),(493,'Reforzar la vigilancia del cumplimiento de los periodos de veda de las especies marinas.',105,1,14),(494,'Implementar programas de manejo y conservación de especies marinas en el estado.',105,1,14),(495,'Reforzar la regulación y vigilancia sobre la pesca recreativa y deportiva. ',105,1,14),(496,'Establecer programas de conservación y promover el rescate y cuidado de los manglares y playas de las zonas costeras.',106,1,14),(497,'Difundir campañas de limpieza de playas que fomenten la participación ciudadana.',106,1,14),(498,'Establecer programas de vigilancia permanente de las playas para evitar su contaminación. ',106,1,14),(499,'Reforzar programas de educación ambiental enfocados a la conservación costera. ',106,1,14),(500,'Implementar alternativas para la pesca, a fin de reducir la presión sobre especies submarinas en peligro o en riesgo. ',106,1,14),(501,'Promover programas y proyectos que favorezcan la restauración y conservación de la zona costera.',106,1,14),(502,'Reforzar el manejo adecuado de las zonas costeras protegidas.',106,1,14),(503,'Impulsar el desarrollo de infraestructura específica para optimizar el Sistema de Transporte Urbano.',107,1,11),(504,'Elaborar programas de capacitación para los prestadores de servicio de transporte público.',107,1,11),(505,'Establecer lineamientos que permitan castigar el acoso femenil dentro del sistema de transporte público.',108,1,11),(506,'Gestionar el incremento de las unidades de transporte público adecuadas para las personas con discapacidad.',108,1,11),(507,'Implementar acciones que prioricen al peatón y modifiquen la infraestructura de calles y banquetas, dando especial atención a personas con discapacidad.',109,1,11),(508,'Elaborar programas de ampliación de la infraestructura urbana para movilidad no motorizada.',109,1,11),(509,'Elaborar programas que promuevan el uso de medios de transporte  sustentables como alternativa a los medios de transporte motorizados. ',109,1,11),(510,'Formular programas de desarrollo urbano que contribuyan y fortalezcan la movilidad integral en todos los municipios del estado.',109,1,11),(511,'Promover esquemas de capacitación y cultura vial para operadores y usuarios del transporte público.',110,1,11),(512,'Adecuar las vialidades en zonas de alto riesgo para los peatones con enfoque incluyente.',110,1,11),(513,'Promover la realización de estudios y proyectos que contribuyan a mejorar la cultura vial y la reducción de accidentes.',110,1,11),(514,'Crear programas e instrumentos para mejorar la accesibilidad universal a corto, mediano y largo plazo.',111,1,11),(515,'Elaborar un plan de movilidad urbana sustentable bajo en carbono.',111,1,11),(516,'Reforzar el transporte interurbano de calidad y con accesibilidad universal.',111,1,11),(517,'Motivar el desarrollo de propuestas ciudadanas de movilidad asequible, segura y no contaminante, en los instrumentos de planeación.',111,1,11),(518,'Proponer esquemas integrales de movilidad urbana.',111,1,11),(519,'Fortalecer la legislación estatal en materia de movilidad sustentable.',111,1,11),(520,'Incentivar la transición del uso del automóvil hacia medios de transporte más sustentables.',111,1,11),(521,'Incorporar la conectividad urbana y la provisión de redes de transporte público como exigencia para nuevas urbanizaciones.',111,1,11),(522,'Revisar y actualizar los instrumentos normativos existentes en materia de movilidad urbana sustentable.',111,1,11),(523,'Facilitar el acceso a los métodos anticonceptivos de la población para el ejercicio de sus derechos sexuales y reproductivos.',112,1,5),(524,'Propiciar las condiciones para la atención integral, especializada y con perspectiva de género de salud de las mujeres, con énfasis en mujeres con alguna discapacidad, en situación de pobreza extrema o marginación.',112,1,5),(525,'Fortalecer los esquemas de atención con enfoque intercultural en el sector público para la detección y atención oportuna de las enfermedades que más afectan a las mujeres.',112,1,5),(526,'Facilitar el acceso a los servicios médicos y psicológicos a niñas, mujeres adultas y adultas mayores con discapacidad, en situación de pobreza extrema o marginación.',113,1,5),(527,'Impulsar campañas de prevención del embarazo adolescente, con un enfoque inclusivo y con atención especial en zonas marginadas y en el interior del estado.',113,1,5),(528,'Facilitar el acceso a servicios médicos y psicológicos a niñas y adolescentes embarazadas para garantizar su salud.',113,1,5),(529,'Sensibilizar sobre el paradigma de los nuevos modelos de masculinidad en la prevención del embarazo adolescente.',113,1,5),(530,'Impulsar convenios de colaboración y fomentar la coordinación con los sectores público, privado, social y académico para fortalecer la educación inclusiva, con atención especial  en comunidades alejadas.',114,1,5),(531,'Promover esquemas especiales de alfabetización para mujeres adolescentes y adultas.',114,1,5),(532,'Impulsar acciones afirmativas que permitan a las mujeres embarazadas o madres solteras continuar con su formación educativa.',114,1,5),(533,'Promover el enfoque de género en los procesos de diseño de programas educativos de todos los niveles de atención.',114,1,5),(534,'Impulsar acciones interinstitucionales en el ámbito educativo para la prevención del embarazo adolescente.  ',114,1,5),(535,'Facilitar apoyos e incentivos para fortalecer la permanencia escolar de las niñas y mujeres, con énfasis en zonas de alto riesgo de deserción educativa.',114,1,5),(536,'Promover la inclusión de mujeres estudiantes, docentes, personal administrativo y con discapacidad en el sector educativo, en especial en profesiones altamente masculinizadas.',115,1,5),(537,'Establecer escenarios propicios para la integración de las mujeres indígenas y mayahablantes a la educación. ',115,1,5),(538,'Fomentar acciones para eliminar estereotipos de género en la educación.',115,1,5),(539,'Implementar programas de capacitación que permitan a las mujeres fortalecer sus habilidades en el uso de tecnologías.',115,1,5),(540,'Crear una estrategia coordinada para combatir la pobreza y fomentar la inserción laboral de las mujeres.',116,1,5),(541,'Impulsar una bolsa de trabajo inclusiva para mujeres con discapacidad y adultas mayores.',116,1,5),(542,'Impulsar acciones en beneficio de mujeres con bajo nivel de escolaridad, madres solteras, mujeres adultas mayores o con discapacidad en beneficio de su autonomía financiera.',116,1,5),(543,'Implementar acciones que favorezcan las condiciones de competitividad para las mujeres emprendedoras y generadoras de empleo.',116,1,5),(544,'Promover redes comunitarias de mujeres productoras y comerciantes que fortalezcan el desarrollo económico.',116,1,5),(545,'Impulsar alianzas, entre el sector público y privado, que premien la responsabilidad social empresarial y permitan a las mujeres conciliar su vida familiar y laboral.',116,1,5),(546,'Promover un salario equitativo entre mujeres y hombres por trabajo de igual valor.',116,1,5),(547,'Promover apoyos para mujeres que presten cuidados no remunerados a personas dependientes conocidos como “cuidados prolongados”.',116,1,5),(548,'Promover redes que impulsen de manera focalizada el emprendimiento de las mujeres a través del acompañamiento, servicios eficientes y comercialización de sus productos.',116,1,5),(549,'Incrementar la participación política de las mujeres, especialmente para los puestos públicos de toma de decisiones e impartición de justicia.',117,1,5),(550,'Promover la corresponsabilidad de los hogares para facilitar la participación de las mujeres en la toma de decisiones familiares, educativas y económicas.',117,1,5),(551,'Promover la transversalización de la perspectiva de género en todos los ciclos de las políticas públicas.',117,1,5),(552,'Fortalecer las instituciones enfocadas a transversalizar  la perspectiva de género en la entidad.',117,1,5),(553,'Fomentar el empoderamiento de las mujeres para aumentar la resiliencia y adaptación al cambio climático.',117,1,5),(554,'Impulsar  el acceso de las mujeres a la información y participación en decisiones ambientales  y manejo sustentable de los recursos.',117,1,5),(555,'Capacitar a las y los titulares de las dependencias y entidades para la institucionalización e incorporación de la perspectiva de género.',118,1,5),(556,'Promover la incorporación de buenas prácticas para la igualdad laboral y no discriminación con el objetivo de que los sectores públicos y privados obtengan certificaciones en la materia.',118,1,5),(557,'Fortalecer a las instancias de las mujeres en los municipios para prevenir la violencia de género hacia las mujeres y la desigualdad entre mujeres y hombres.',118,1,5),(558,'Impulsar mecanismos para la prevención, atención y denuncia de la violencia sexual en instituciones educativas e instancias públicas y privadas que trabajen con niñas, niños y adolescentes.',118,1,5),(559,'Fortalecer las capacidades en el sistema educativo estatal para la atención de conductas de riesgo y prevención de violencia de género.',118,1,5),(560,'Impulsar que las empresas apliquen medidas para prevenir y erradicar el acoso laboral, la discriminación por razones de género y cualquier otra práctica que vulnere los derechos de las mujeres.',118,1,5),(561,'Promover la cultura de la denuncia a través de medios accesibles con especial atención en  personas con discapacidad y mayahablantes.',119,1,5),(562,'Fortalecer la participación ciudadana, así como de los medios de comunicación, para rechazar la normalización de la violencia en contra de las mujeres.',119,1,5),(563,'Fomentar campañas permanentes en contra del acoso y violencia contra las mujeres  en espacios públicos.',119,1,5),(564,'Fortalecer la protección de los derechos de las niñas y mujeres adolescentes en especial el derecho a una vida libre de violencia.',119,1,5),(565,'Promover el uso de las Tecnologías de la Información y la Comunicación para acercar los servicios de emergencia ante situaciones de violencia.',119,1,5),(566,'Generar campañas dirigidas a hombres que promuevan las masculinidades no violentas y el involucramiento activo en la prevención de la violencia contra las mujeres.',119,1,5),(567,'Promover la capacitación de los elementos de seguridad pública para que sus intervenciones en situaciones de violencia hacia las mujeres sean efectivas, apegadas a la ley y oportunas.',120,1,5),(568,'Facilitar la accesibilidad segura de las mujeres a los centros municipales de atención a la violencia contra las mujeres, en especial en las comunidades mayas.',120,1,5),(569,'Impulsar la capacitación del personal médico en la aplicación de las normas mexicanas dirigidas a brindar servicios de calidad y prevenir prácticas de discriminación o actos de violencia contra las mujeres.',120,1,5),(570,'Fortalecer los órganos estatales encargados de promover los derechos humanos de las mujeres y establecer acciones para la igualdad de género.',120,1,5),(571,'Impulsar los servicios itinerantes de primer contacto ante situaciones de violencia, especialmente en comunidades alejadas.',120,1,5),(572,'Promover acciones multidisciplinarias para la atención integral de las causas y efectos de la violencia de género',120,1,5),(573,'Impulsar la capacitación de los jueces de paz de los municipios en perspectiva de género, con énfasis en la atención de casos de violencia hacia las mujeres y violencia intrafamiliar.',121,1,5),(574,'Fortalecer la legislación estatal para que contribuya a la igualdad de oportunidades y al acceso de las mujeres a una vida libre de violencia y armonizarla con las normas generales y tratados internacionales.',121,1,5),(575,'Fortalecer el trabajo operativo a través de protocolos que eviten la revictimización de las mujeres en el sistema de justicia.',121,1,5),(576,'Fortalecer los servicios de defensoría de oficio con personal especializado en género y derechos humanos.',121,1,5),(577,'Impulsar redes interinstitucionales que generen datos con desagregación estadística por sexo y edad, para la toma de decisiones públicas en favor de las mujeres, en especial en el tema de prevención, atención, sanción y combate de violencia y defensa de los derechos.',122,1,5),(578,'Impulsar mecanismos de vinculación interinstitucional que fortalezca el banco de datos estatal sobre violencia para que sea alimentado por las instancias competentes.',122,1,5),(579,'Evaluar y certificar los registros estadísticos e informáticos que concentran datos sobre la violencia contra las mujeres. ',122,1,5),(580,'Estimular las habilidades y conocimientos técnicos y operativos para el trabajo de las y los jóvenes en situación de vulnerabilidad',123,1,10),(581,'Promover acciones de autoempleo y financiamiento que proyecten el desarrollo empresarial de la población en situación de vulnerabilidad.',123,1,10),(582,'Promover acuerdos y convenios en el sector público y grupos empresariales para la incorporación al empleo de personas en situación de vulnerabilidad, en especial de personas con discapacidad y adultas mayores.',123,1,10),(583,'Asesorar a la población en situación de vulnerabilidad sobre los derechos de los trabajadores para garantizar su protección laboral.',123,1,10),(584,'Fomentar acciones especiales para que la población con alguna discapacidad tenga acceso a empleo de calidad.',123,1,10),(585,'Instrumentar medidas que combatan el trabajo infantil y permitan el disfrute a los niños de los derechos de la niñez',123,1,10),(586,'Fortalecer las áreas gubernamentales encargadas de garantizar los derechos de las personas con alguna discapacidad o en situación de vulnerabilidad',123,1,10),(587,'Facilitar el acceso y la permanencia de personas con alguna discapacidad a una educación integral y de calidad.',124,1,10),(588,'Facilitar espacios culturales y deportivos incluyentes para el esparcimiento e interacción de los grupos en situación de vulnerabilidad.',124,1,10),(589,'Incentivar a organizaciones que elaboren proyectos o acciones de desarrollo comunitario, de combate a las desigualdades sociales y acceso incluyente.',124,1,10),(590,'Promover la participación de la sociedad civil en la implementación de acciones innovadoras que destacan la inclusión social al desarrollo comunitario.',124,1,10),(591,'Promover un sistema de asistencia y apoyo para personas en situación de dependencia, con énfasis en las que presenten carencia alimentaria.',124,1,10),(592,'Impulsar el desarrollo comunitario que permita la inclusión de los grupos en situación de  vulnerabilidad en el bienestar social',124,1,10),(593,'Fomentar programas de apoyo para personas en situación de vulnerabilidad que faciliten el acceso a la vivienda y servicios básicos.',124,1,10),(594,'Facilitar el acceso a la seguridad social y servicios de salud a personas con alguna discapacidad o en situación de vulnerabilidad.',124,1,10),(595,'Fortalecer los espacios públicos para que sean accesibles y que cumplan con los estándares de calidad e inclusión para las personas con alguna discapacidad.',125,1,10),(596,'Impulsar acciones de equipamiento en las unidades básicas de rehabilitación integral para personas con discapacidad. ',125,1,10),(597,'Fortalecer la infraestructura, equipamiento y tecnología asistiva para la población en situación de vulnerabilidad, con énfasis en las personas con alguna discapacidad.',125,1,10),(598,'Impulsar el uso de las Tecnologías de la Información y Comunicación para la asistencia a la población en situación de vulnerabilidad y/o dependencia.',125,1,10),(599,'Capacitar al personal de las instituciones públicas y privadas en temas de sensibilización y acompañamiento a la inclusión social de la población en situación de vulnerabilidad con énfasis en las personas con alguna discapacidad y de comunidades indígenas.',125,1,10),(600,'Reforzar el marco normativo vigente para aplicar sanciones más estrictas en casos de discriminación y violencia contra la mujer, así como a grupos en situación de vulnerabilidad',125,1,10),(601,'Fortalecer las capacidades del personal de las instituciones encargadas de la atención de la violencia hacia las mujeres, niñas, niños, adolescentes y otras en situación de vulnerabilida',125,1,10),(602,'Impulsar mecanismos educativos de concientización, que propicien la igualdad y la no discriminación hacia los grupos en situación de vulnerabilidad. ',126,1,10),(603,'Promover una cultura de tolerancia y no discriminación en todos los niveles educativos.',126,1,10),(604,'Promover la educación cívica y el respeto a la Ley en todas las esferas institucionales, con énfasis en la familia y escuelas.',126,1,10),(605,'Implementar campañas de difusión de los derechos civiles, políticos, económicos, sociales, culturales y ambientales.',126,1,10),(606,'Diseñar campañas de fomento para la inclusión social en la participación política del estado y el ejercicio pleno de los derechos.',126,1,10),(607,'Coordinar una vinculación efectiva entre los niveles de educación media superior y la educación superior para mejorar la absorción y la pertinencia de los programas educativos.',127,1,9),(608,'Impulsar mecanismos de difusión en línea que faciliten el conocimiento de la oferta educativa existente en el nivel superior.',127,1,9),(609,'Proveer de Tecnologías de la Información y la Comunicación a las instituciones de educación superior para fomentar la innovación de los métodos educativos.',127,1,9),(610,'Generar las condiciones adecuadas para que más programas educativos del nivel superior puedan ser impartidos en línea. ',127,1,9),(611,'Procurar la inversión en infraestructura física y equipamiento acorde a los requerimientos actuales de cada institución de educación superior.',127,1,9),(612,'Promocionar a las universidades como centros de capacitación certificados para la profesionalización basada en competencias laborales de calidad.',128,1,9),(613,'Impulsar programas de formación continua para personal de las empresas, con especial énfasis en las capacidades científicas y técnicas.',128,1,9),(614,'Generar alianzas entre las universidades, centros de investigación, instituciones tecnológicas e iniciativa privada para la formación de capital humano de calidad acorde a la demanda del mercado laboral.',128,1,9),(615,'Desarrollar una oferta de educación superior adaptada a la demanda de la industria 4.0 .',128,1,9),(616,'Impulsar bolsas de trabajo y seguimiento de egresados para la comunidad de estudiantes de nivel superior, a través de convenios de colaboración entre el sector privado y las instituciones de educación superior. ',128,1,9),(617,'Promover mecanismos de asesoría especializada del sector educativo hacia el sector privado, con especial énfasis en temas científicos y técnicos.',128,1,9),(618,'Vincular la participación de las universidades en la solución de problemas locales a través de la investigación aplicada.',128,1,9),(619,'Ampliar la cobertura de programas de fomento científico que beneficie a un mayor número de niñas, niños y jóvenes.',129,1,9),(620,'Implementar mecanismos de divulgación de la ciencia a la población en general que generen interés por la misma.',129,1,9),(621,'Diseñar programas de ciencias, tecnología, ingeniería y matemáticas para desarrollar las destrezas o habilidades de los estudiantes en estas disciplinas.',129,1,9),(622,'Diseñar planes de estudio adecuados a las vocaciones regionales actuales y emergentes.',130,1,9),(623,'Fortalecer los planes de estudio existentes para su actualización de acuerdo a las necesidades de los sectores económico, social y ambiental, y con enfoque de sostenibilidad.',130,1,9),(624,'Diseñar mecanismos que permitan flexibilizar los procesos de terminación y titulación en los programas educativos.',130,1,9),(625,'Establecer mecanismos para una adecuada formación, profesionalización y actualización docente en las Instituciones de educación superior a través de programas de ciencias, tecnología, ingeniería y matemáticas.',130,1,9),(626,'Fomentar la acreditación de programas y procesos eeducativos del nivel superior con base en estándares de calidad y pertinencia.',130,1,9),(627,'Promover canales de colaboración entre las instituciones de educación superior del estado con las instituciones del orden nacional e internacional.',131,1,9),(628,'Fortalecer los programas de idiomas y de vinculación al extranjero.',131,1,9),(629,'Facilitar la modernización y adaptación de las Instituciones de educación superior a las nuevas tecnologías y necesidades educativas.',131,1,9),(630,'Establecer esquemas adecuados para orientar los programas de posgrado en el estado hacia el cumplimiento de estándares de calidad reconocidos por organismos nacionales e internacionales.',131,1,9),(631,'Diseñar esquemas para fortalecer los programas de licenciatura a fin de contar con egresados del nivel con mejor calidad para su incorporación a estudios de posgrado.',131,1,9),(632,'Diseñar esquemas para fortalecer la formación de recursos humanos en el extranjero, que contribuyan a elevar la calidad de la planta docente de estudios de posgrado en el estado.',131,1,9),(633,'Diseñar esquemas para fortalecer los programas de tutorías existentes en las instituciones de educación superior a fin de garantizar su efectividad.',132,1,9),(634,'Promover en conjunto con el sector empresarial, mecanismos que permitan a los estudiantes, insertarse en la industria desde su formación en las instituciones de educación superior.',132,1,9),(635,'Fortalecer los programas de apoyos que contribuyan a evitar la deserción en la educación superior. ',132,1,9),(636,'Fortalecer de manera sostenible la normatividad de la gestión institucional para asegurar el funcionamiento pertinente de las instituciones de educación superior.',132,1,9),(637,'Favorecer la incorporación de organismos independientes en la evaluación de los programas educativos.',132,1,9),(638,'Diseñar mecanismos de capacitación y evaluación integral del desempeño docente que asegure la mejora continua.',132,1,9),(639,'Consolidar el Sistema de Investigación, Innovación y Desarrollo Tecnológico del Estado de Yucatán (SIIDETEY).',133,1,9),(640,'Incentivar las actividades de investigación y desarrollo en sectores estratégicos como agrobiotecnología, energías sustentables, salud, manejo de los recursos naturales entre otros.',133,1,9),(641,'Promover la formación de recursos humanos altamente calificados en el campo de la investigación y desarrollo tecnológico.',133,1,9),(642,'Establecer esquemas de apoyo financiero a proyectos de investigación científica y tecnológica.',133,1,9),(643,'Impulsar convenios de colaboración entre centros de investigación, instituciones de educación superior y empresas privadas para el desarrollo de tecnología.',134,1,9),(644,'Diseñar mecanismos de movilidad de recursos humanos hacia las instituciones de educación superior internacionales.',134,1,9),(645,'Estimular la participación del sector privado en las estrategias de movilidad internacional que se impulsen desde el estado, con énfasis en ciencia, tecnología , artes y humanidades.',134,1,9),(646,'Diseñar un sistema de estancias estudiantiles en empresas para la colaboración en proyectos de investigación y desarrollo.',134,1,9),(647,'Fortalecer los procesos de investigación y desarrollo tecnológico en los campos de artes y humanidades.',134,1,9),(648,'Sensibilizar a la población sobre la importancia del aprovechamiento científico y tecnológico en las artes y humanidades.',134,1,9),(649,'Impulsar el desarrollo de un clúster de innovación y desarrollo de Tecnologías de la Información y la Comunicación en el estado.',134,1,9),(650,'Gestionar fondos para la colaboración pública y privada en la implementación de proyectos científicos y tecnológicos.',135,1,9),(651,'Gestionar la transferencia de conocimientos y tecnología que permitan atender con mayor efectividad los problemas sociales.',135,1,9),(652,'Promover los avances y beneficios de la ciencia y tecnología en los municipios y en todos los niveles educativos.',135,1,9),(653,'Promover la formación de recursos humanos altamente calificados en el campo de la investigación, desarrollo científico, artes y humanidades.',135,1,9),(654,'Impulsar la investigación enfocada al sector salud para generar tecnología y biotecnología de vanguardia.',135,1,9),(655,'Proponer espacios para el intercambio entre ciencia, tecnología, sociedad y cultura.',136,1,9),(656,'Implementar esquemas de financiamiento para el fortalecimiento de infraestructura tecnológica.',136,1,9),(657,'Generar aciones que faciliten la atracción y retención de talento en sectores de alta complejidad económica.',136,1,9),(658,'Establecer mecanismos para incrementar el número de empresas e instituciones científicas y tecnológicas en el estado.',136,1,9),(659,'Desarrollar instrumentos de transferencia y difusión tecnológica en sectores estratégicos para el estado.',136,1,9),(660,'Incentivar a las empresas que generen investigación y desarrollo tecnológico en sus procesos de producción de manera sustentable y sostenible.',137,1,9),(661,'Otorgar facilidades a los investigadores e Instituciones de educación superior para gestionar y registrar sus invenciones.',137,1,9),(662,'Impulsar esquemas de sensibilización y difusión sobre la propiedad intelectual e industrial.',137,1,9),(663,'Generar acciones para la vinculación efectiva entre los centros de investigación, instituciones de educación superior y la industria, en torno a la generación de propiedad intelectual e industrial.',137,1,9),(664,'Estimular la generación y el aprovechamiento de invenciones o procesos novedosos en el sector público.',137,1,9),(665,'Consolidar el sistema de incubadoras en el estado mediante acciones de equipamiento e intercambio académico, científico y tecnológico.',138,1,9),(666,'Fortalecer el Parque Científico y Tecnológico del estado mediante esquemas efectivos de colaboración e impulso académico.',138,1,9),(667,'Estimular la inversión pública y privada en acciones de innovación, investigación científica y transferencia tecnológica.',138,1,9),(668,'Reforzar la consolidación de los ecosistemas de innovación, así como también, la infraestructura científica en zonas estratégicas del estado',138,1,9),(669,'Fortalecer las campañas de prevención del delito de forma inclusiva y sostenible con énfasis en zonas de mayor incidencia delictiva. ',139,1,16),(670,'Instrumentar acciones de manera coordinada con todos los órdenes de gobierno en materia de prevención del delito.',139,1,16),(671,'Diseñar sistemas de información estadística y geográfica para el mejoramiento de toma de decisiones en la prevención del delito.',139,1,16),(672,'Establecer operativos especiales para el combate a los delitos de robo a casa habitación, fraude, extorsión y robo parcial de vehículo.',139,1,16),(673,'Realizar acciones para la detección de portación de armas de fuego sin autorización y arma blanca.',139,1,16),(674,'Diseñar un programa de prevención social del delito que contemple las causas y particularidades de cada región, municipio y localidad.',139,1,16),(675,'Incentivar la participación ciudadana y de organizaciones para la prevención social del delito  que genere comunidades y ciudades resilientes.',139,1,16),(676,'Estimular la proximidad social entre las instituciones de seguridad y la ciudadanía para la detección oportuna de riesgos para su atención prioritaria.',139,1,16),(677,'Diseñar mecanismos de seguimiento a los requerimientos en materia de prevención social del delito derivados de la participación ciudadana.',139,1,16),(678,'Realizar actividades que fomenten la armonía comunitaria y la cohesión social en beneficio de la seguridad a nivel localidad.',139,1,16),(679,'Impulsar acciones específicas que promuevan la cultura de la paz, eviten la violencia en todos los niveles educativos.',139,1,16),(680,'Establecer programas integrales interinstitucionales de combate de adicciones con enfoque intercultural y de prevención del delito.',139,1,16),(681,'Capacitar a la población para la prevención, detección y denuncia de los delitos cibernéticos.',139,1,16),(682,'Reforzar las capacidades de los jueces de paz en el interior del estado para la aplicación de la mediación en conflictos de convivencia comunitaria.',140,1,16),(683,'Promover la aplicación de esquemas de mediación en el ámbito escolar para la resolución de conflictos.',140,1,16),(684,'Implementar modelos de mediación para la resolución de conflictos bajo el principio de igualdad de derechos.',140,1,16),(685,'Impulsar la instrumentación del servicio profesional de carrera policial.',141,1,16),(686,'Reforzar la capacitación inicial y continua de los policías estatales y municipales, así como su especialización.',141,1,16),(687,'Capacitar a mandos medios y altos dentro de nuevos modelos estratégicos para la investigación policial y el combate a la delincuencia.',141,1,16),(688,'Promover los programas de renivelación académica de los elementos policiales.',141,1,16),(689,'Establecer un programa de mejoramiento de las condiciones sociales, económicas y de vida de los policías del estado.',141,1,16),(690,'Impulsar campañas de seguridad vial y respeto a las normas de tránsito y vialidad.',142,1,16),(691,'Reforzar los operativos de vigilancia vial y de alcoholimetría para prevenir accidentes de tránsito.',142,1,16),(692,'Impulsar acciones para la modernización de la infraestructura de tránsito en materia de señalización y semaforización.',142,1,16),(693,'Promover la realización de pláticas de educación vial en las escuelas y entre las organizaciones civiles.',142,1,16),(694,'Reforzar la infraestructura, equipamiento y tecnología de las instituciones de seguridad, en beneficio de la población y visitantes del estado.',143,1,16),(695,'Reforzar las acciones de vigilancia en la entrada y salida del estado con aprovechamiento tecnológico.',143,1,16),(696,'Fortalecer las capacidades del sistema de videovigilancia en toda la entidad y sus carreteras con énfasis especial en zonas de mayor presencia delictiva.',143,1,16),(697,'Reforzar el estado de fuerza policial, así como sus capacidades  técnicas y habilidades con enfoque basado en derechos humanos para la atención de situaciones de auxilio a la población, especialmente en localidades y municipios de mayor incidencia delictiva.',143,1,16),(698,'Establecer nuevos esquemas para la prevención y combate de robos a casa  habitación y comercios.',143,1,16),(699,'Diseñar mecanismos eficientes de vigilancia policiaca en zonas de alto riesgo delictivo con especial énfasis en la protección de las mujeres y población en situación de vulnerabilidad.',143,1,16),(700,'Implementar acciones para el uso de nuevas Tecnologías de la Información y la Comunicación en materia de prevención y seguridad pública.',143,1,16),(701,'Establecer esquemas para la reinserción social efectiva de personas que han cometido algún tipo de delito.',143,1,16),(702,'Modernizar los centros de reinserción social del estado para garantizar el respeto de los  derechos humanos de las personas en detención.',143,1,16),(703,'Fortalecer los mecanismos de registro vehicular para contar con un padrón que ayude a la recuperación e identificación de vehículos involucrados en conflictos con la Ley.',144,1,16),(704,'Impulsar mecanismos para vigilar el cumplimiento de la Ley por parte de los elementos de los cuerpos de seguridad pública.',144,1,16),(705,'Impulsar acciones de infraestructura y equipamiento en materia de procuración de justicia.',145,1,16),(706,'Fortalecer los recursos humanos y capacidades técnicas de las instituciones de justicia, especialmente las relacionadas con las tareas de investigación y el ministerio público.',145,1,16),(707,'Fortalecer los mecanismos alternativos de solución de controversias a través de personal calificado y con perspectiva de género.',145,1,16),(708,'Consolidar el Sistema Acusatorio  Penal y el Sistema Oral de Justicia para agilizar su ejercicio en todas las áreas de derecho en especial en materia mercantil. ',145,1,16),(709,'Diseñar mecanismos administrativos para el control de reincidencias en materia de comisión de delitos.',145,1,16),(710,'Impulsar la simplificación de los procesos de denuncia para disminuir tiempos.',146,1,16),(711,'Mejorar el proceso de denuncia del delito para que mantenga parámetros de calidad en servicio y atención.',146,1,16),(712,'Impulsar el desarrollo del sistema de acceso a la información de estatus de personas en conflicto con la ley en los ministerios públicos.',146,1,16),(713,'Aplicar tecnologías de información para agilizar los procesos de denuncia.',146,1,16),(714,'Reforzar las capacidades de la defensoría legal en la entidad.',146,1,16),(715,'Ampliar los servicios de asesoría gratuita en otras materias como la civil, en especial para la población en situación de vulnerabilidad.',146,1,16),(716,'Facilitar la atención oportuna en los procesos de denuncia a mujeres víctimas de violencia doméstica o de género.',146,1,16),(717,'Adecuar los espacios físicos para la prestación de servicios de defensoría pública.',147,1,16),(718,'Instrumentar esquemas de capacitación en materia de procuración de justicia y defensoría legal con énfasis a grupos en situación de vulnerabilidad.',147,1,16),(719,'Promover campañas dirigidas a la cultura de respeto y difusión de derechos humanos.',147,1,16),(720,'Promover campañas de respeto a los valores humanos y principios de convivencia familiar.',147,1,16),(721,'Gestionar acciones de capacitación en lengua maya en el ámbito del Sistema de Justicia Penal.',147,1,16),(722,'Implementar acciones para profesionalización de peritos del Sistema de Justicia Penal.',147,1,16),(723,'Actualizar las leyes en materia de procuración de justicia para hacer eficiente su aplicación y desanimar la reincidencia delictiva.',148,1,16),(724,'Implementar acciones para el fortalecimiento de los juzgados en materia de procuración de justicia.',148,1,16),(725,'Mejorar los mecanismos legales para la calificación e identificación de delitos del fuero común.',148,1,16),(726,'Diseñar acciones para la reducción de la impunidad en casos de violencia familiar y de género.',148,1,16),(727,'Promover la presencia de policías ministeriales o investigadores en los municipios, en especial los de mayor incidencia delictiva.',149,1,16),(728,'Facilitar el acceso a los servicios de la Fiscalía y ministerios públicos a los ciudadanos del interior del estado.',149,1,16),(729,'Fortalecer la atención a víctimas del delito y la reparación del daño a las mismas.',149,1,16),(730,'Impulsar normas y  mecanismos que agilicen las notificaciones personales, garanticen la adecuada ejecución de las sentencias y reduzcan los tiempos y costos en la tramitación de juicios.',149,1,16),(731,'Establecer mecanismos claros para la rendición de cuentas y transparencia en los procesos de seguridad y justicia en beneficio de los derechos humanos.',150,1,16),(732,'Implementar acciones para difusión de datos abiertos a la ciudadanía en materia de seguridad y justicia con desagregación por género.',150,1,16),(733,'Promover campañas de difusión de la acciones implementadas  de la agenda gubernamental en materia de seguridad, justicia y gobernabilidad, así como de los resultados obtenidos.',150,1,16),(734,'Establecer acciones que fomenten la certeza jurídica de los habitantes en especial los relacionados al derecho a la identidad, el patrimonio y aquellos que condicionen acceso a otros derechos humanos.',151,1,16),(735,'Reforzar el derecho de propiedad de las mujeres.',151,1,16),(736,'Impulsar la modernización y actualización de los servicios relacionados al derecho a la identidad y el patrimonio de los habitantes.',151,1,16),(737,'Gestionar convenios con los municipios para el uso de recursos en coparticipación para  acciones que mejoren la calidad de vida de los habitantes .',152,1,16),(738,'Coadyuvar con los municipios en la implementación del modelo de Presupuesto basado en Resultados y del Sistema de Evaluación del Desempeño.',152,1,16),(739,'Fortalecer la coordinación en materia de protección civil, igualdad de género, inclusión social y otros temas vinculados con los derechos económicos, sociales, culturales y ambientales con los municipios.',152,1,16),(740,'Crear programas itinerantes que permitan a la población, especialmente la apartada geográficamente o con vulnerabilidad acceder a trámites y servicios relacionados con la seguridad, justicia y certeza jurídica.',153,1,16),(741,'Estimular capacidades e infraestructura para la descentralización de los servicios de seguridad, justicia y certeza jurídica.',153,1,16),(742,'Promover mecanismos de cooperación que permitan adaptar, adoptar e implementar las mejores prácticas internacionales para el logro de las metas de los Objetivos de Desarrollo Sostenible.',154,1,16),(743,'Fortalecer los instrumentos jurídicos estatales que contemplan la cooperación internacional.',154,1,16),(744,'Fortalecer a las instituciones estatales responsables de los asuntos nacionales e internacionales.',154,1,16),(745,'Gestionar el acercamiento entre autoridades internacionales y el gobierno del estado para fomentar la cooperación internacional.',155,1,16),(746,'Fomentar la inclusión de los municipios en las acciones de eventos de carácter internacional.',155,1,16),(747,'Desarrollar sistemas y aplicaciones inclusivas para la generación, conservación y gestión de la información pública.',156,1,17),(748,'Fortalecer las capacidades técnicas, financieras y normativas de los sistemas de información.',156,1,17),(749,'Desarrollar una política de datos abiertos que oriente la generación, sistematización y difusión de información.',156,1,17),(750,'Generar información pertinente, de calidad e incluyente que atienda las necesidades de los sectores público, privado, académico y social.',156,1,17),(751,'Establecer reglas de operación y padrones de beneficiarios claros, transparentes y consensuados de los bienes y servicios públicos.',156,1,17),(752,'Implementar catálogos que faciliten el registro, integración, consolidación y explotación de la información financiera, estadística y geográfica de la Administración Pública Estatal.',156,1,17),(753,' Implementar esquemas que promuevan el enfoque de derechos humanos en la implementación del gobierno abierto y el acceso a la información.',156,1,17),(754,'Desarrollar esquemas que faciliten la participación y corresponsabilidad de la ciudadanía en la vigilancia, control y evaluación del quehacer gubernamental.',157,1,17),(755,'Consolidar las políticas de transparencia en el quehacer gubernamental con el apoyo de los sectores privado, académico y social.',157,1,17),(756,'Implementar acciones que garanticen el derecho de acceso a la información y protección de datos personales conforme a los ordenamientos jurídicos aplicables.',157,1,17),(757,'Implementar herramientas tecnológicas con base en estándares internacionales para llevar a cabo contrataciones abiertas y que sean aplicables en las etapas de planeación, licitación, adjudicación, contratación e implementación.',157,1,17),(758,'Establecer incentivos para el uso y aprovechamiento de datos abiertos entre los sectores público, privado, académico y social.',157,1,17),(759,'Establecer mecanismos de supervisión y control de los recursos públicos con la participación de la ciudadanía.',158,1,16),(760,'Establecer mecanismos de vinculación con órganos estatales de control de otras entidades federativas para el intercambio de buenas prácticas y herramientas que faciliten la inspección o verificación de los recursos públicos.',158,1,16),(761,'Implementar un Código de Ética que rija la conducta ética y establezca un conjunto de valores y principios que dirijan el cumplimiento de los deberes y obligaciones de todos los servidores públicos del Gobierno del Estado de Yucatán.',158,1,16),(762,'Capacitar a los órganos de control interno asignados en las dependencias y entidades de la Administración Pública Estatal para mejorar la fiscalización de los recursos públicos.',158,1,16),(763,'Fortalecer la normatividad para los procesos de adquisiciones y actuación de los servidores públicos que participen en los mismos.',158,1,16),(764,'Desarrollar un sistema integral, transparente y accesible de las compras, concursos y licitaciones que realice el Gobierno del Estado.',158,1,16),(765,'Fortalecer la realización de auditorías y la publicación de resultados conforme a la norma aplicable.',158,1,16),(766,'Presentar las declaraciones patrimonial y de intereses de los servidores públicos de todos los niveles del Poder Ejecutivo del estado de Yucatán.',158,1,16),(767,'Promover la cultura de la legalidad y anticorrupción entre los sectores público, privado y social. ',159,1,16),(768,'Consolidar las Dependencias, Entidades y Órganos dedicados a prevenir y sancionar la corrupción atendiendo las obligaciones y responsabilidades en la normatividad vigente.',159,1,16),(769,'Implementar acciones que permitan identificar actos de corrupción en los trámites y servicios que presta el Gobierno del Estado a la población.',159,1,16),(770,'Establecer mecanismos transparentes de sanción a servidores públicos que incurran en actos de corrupción.',159,1,16),(771,'Reorientar la programación del presupuesto asegurando su  alineación con la planeación del desarrollo.',160,1,17),(772,'Promover la implementación del modelo de Presupuesto basado en Resultados y el Sistema de Evaluación del Desempeño en los municipios.',160,1,17),(773,'Consolidar los mecanismos de diseño e implementación de los programas presupuestarios.',160,1,17),(774,'Consolidar las capacidades institucionales para implementar el diseño basado en evidencia en los programas presupuestarios con enfoque a resultados.',160,1,17),(775,'Fortalecer las capacidades de las y los servidores públicos dedicados a la implementación de la gestión para resultados en el desarrollo y la incorporación de enfoques transversales al ciclo de la gestión pública. ',160,1,17),(776,'Mejorar los mecanismos para la evaluación social de proyectos de preinversión, priorizando la evaluación de aquellos que sean socialmente rentables, incluyentes y sostenibles.',160,1,17),(777,'Consolidar el Sistema de Seguimiento y Evaluación del Desempeño para la mejora de la gestión pública y la rendición de cuentas.',161,1,17),(778,'Evaluar el desempeño de los programas y proyectos de gobierno y su impacto en la población.',161,1,17),(779,'Presupuestar las políticas, programas y proyectos de la Administración Pública con base en el análisis de la información que resulte del seguimiento y evaluación.',161,1,17),(780,'Establecer  mecanismos de cooperación con organismos nacionales e internacionales para fortalecer la gestión pública estatal.',161,1,17),(781,'Desarrollar acciones que mejoren la calidad de la atención de los servidores públicos a la ciudadanía.',162,1,16),(782,'Establecer mecanismos de colaboración con organismos nacionales e internacionales que permitan  incorporar mejores prácticas en materia de gobernanza y mejora regulatoria.',162,1,16),(783,'Desarrollar estrategias de simplificación y digitalización de los trámites y servicios del estado con criterios claros y transparentes para su realización.',162,1,16),(784,'Impulsar el Sistema Estatal de Mejora Regulatoria así como sus herramientas',162,1,16),(785,'Reforzar las capacidades técnicas y profesionales de los servidores públicos de una manera incluyente.',162,1,16),(786,'Consolidar herramientas que evalúen el impacto económico y social generado por la normatividad estatal y municipal.',162,1,16),(787,'Actualizar el marco normativo en materia de mejora regulatoria.',162,1,16),(788,'Implementar la simplificación administrativa y reducción de cargas burocráticas.',163,1,16),(789,'Implementar procesos de innovación y gestión del conocimiento en las dependencias y entidades.',163,1,16),(790,'Desarrollar instrumentos de gobierno digital que impulsen la eficiencia y mejora de la Administración Pública Estatal.',163,1,16),(791,'Documentar los procesos y procedimientos de la Administración Pública con énfasis en los que impactan directamente a la ciudadanía; así como crear metodologías para asegurar la calidad en los procesos de la administración pública.',163,1,16),(792,'Modernizar la gestión de los bienes patrimoniales para optimizar el valor del patrimonio del Gobierno del Estado.',164,1,16),(793,'Desarrollar procesos de gestión del patrimonio vinculados integralmente a las distintas fases de la administración de los recursos.',164,1,16),(794,'Reforzar la gestión de los recursos humanos, garantizando la inclusión e igualdad,  mediante esquemas de contratación acorde a las necesidades de las Dependencias y Entidades, y mecanismos para evaluar e incentivar el desempeño de los servidores públicos.',164,1,16),(795,'Consolidar la base tributaria en el estado y los municipios.',165,1,17),(796,'Impulsar mecanismos que prevengan y sancionen la evasión fiscal.',165,1,17),(797,'Establecer mecanismos de simplificación de pago de obligaciones fiscales estatales, así como de productos, derechos y aprovechamientos, tomando como base las Tecnologías de la Información y la Comunicación.',165,1,17),(798,'Reforzar los mecanismos de relación y colaboración fiscal entre la Federación, el Gobierno del Estado y los municipios.',165,1,17),(799,'Establecer esquemas que permitan vincular determinados ingresos estatales hacia la ejecución de proyectos con alto impacto económico y social.',165,1,17),(800,'Desarrollar nuevos esquemas de recaudación fiscal.',165,1,17),(801,'Consolidar la capacidad recaudatoria de la Administración Pública Estatal para disminuir y erradicar la evasión fiscal.',165,1,17),(802,'Promover la austeridad en el gasto corriente para favorecer el gasto en capital humano e inversión.',166,1,17),(803,'Ordenar el sistema de pensiones de los trabajadores del Gobierno del Estado bajo los principios de sostenibilidad, viabilidad y responsabilidad financiera.',166,1,17),(804,'Implementar programas, proyectos y acciones focalizadas que potencialicen y aprovechen la inversión de los entes públicos y privados.',166,1,17),(805,'Administrar de forma eficiente y responsable la deuda pública.',166,1,17),(806,'Transferir oportunamente los recursos correspondientes a las entidades, municipios y organismos del Estado de Yucatán para el cumplimiento de sus objetivos y fines.',166,1,17),(807,'Establecer mecanismos que faciliten la integración de un presupuesto ciudadano, incluyente y que responda a las necesidades de desarrollo.',166,1,17),(808,'Establecer herramientas y protocolos para la toma de decisiones en materia presupuestal.',166,1,17),(809,'Supervisar que se cumplan las obligaciones de disciplina financiera.',166,1,17),(810,'Planificar la inversión conjunta público-privada que contemple proyectos estratégicos para la economía.',167,1,17),(811,'Optimizar el gasto en inversión pública para alcanzar las metas físicas y financieras en materia de infraestructura.',167,1,17),(812,'Diseñar un plan para la construcción y recuperación de espacios públicos de convivencia en las ciudades y comunidades del estado.',167,1,17),(813,'Desarrollar un programa de posicionamiento estratégico para las localidades que ofrecen espacios adecuados y atractivos.',167,1,17),(814,'Promover la creación y adecuación de infraestructura pública con énfasis en el cumplimiento de las disposiciones en materia de inclusión.',167,1,17),(815,'Generar parámetros e indicadores para mejorar la infraestructura de la obra pública en el estado.',167,1,17),(816,'Estimular vínculos con la sociedad civil para el desarrollo de la obra pública sostenible.',167,1,17),(817,'Impulsar y fortalecer el alcance de la red de drenaje y alcantarillado del estado.',167,1,17),(818,'Impulsar la conexión con las viviendas a la red pública en materia de desalojo de residuos. ',167,1,17),(819,'Construir carreteras para las localidades más apartadas del estado.',168,1,9),(820,'Reconstruir la carpeta asfáltica de las vialidades, priorizando aquellas que presenten un alto nivel de daño e inseguridad.',168,1,9),(821,'Promover la modernización de la infraestructura vial en el interior del estado.',168,1,9),(822,'Realizar trabajos de conservación en las vialidades rurales.',168,1,9),(823,'Desarrollar circuitos carreteros  que permitan la conectividad vial de acuerdo a su actividad económica: agrícola, ganadera, turística e industrial.',168,1,9),(824,'Impulsar esquemas innovadores de transporte público de acuerdo a las características de las ciudades.',168,1,9),(825,'Fortalecer la red existente de transporte público y promover el diseño universal.',168,1,9),(826,'Promover la construcción de nuevos tramos ferroviarios sostenibles.',169,1,9),(827,'Modernizar la red ferroviaria estatal de forma conjunta y coordinada con los distintos órdenes de gobierno.',169,1,9),(828,'Consolidar los centros logísticos multimodales para el movimiento de carga por ferrocarril.',169,1,9),(829,'Implementar acciones de desazolve de puertos y zonas de embarcación.',170,1,9),(830,'Promover acciones de conservación, adaptación integral y mejoramiento sostenible de la infraestructura aeroportuaria y portuaria, en coordinación con los diferentes órdenes de gobierno.',170,1,9),(831,'Desarrollar espacios para el almacenamiento y movimiento logístico de mercancías.',170,1,9),(832,'Consolidar la operación de medios de transporte, seguros y sostenibles.',170,1,9),(833,'Reforzar la infraestructura de almacenamiento existente de forma equilibrada en las regiones del estado.',170,1,9),(834,'Consolidar la infraestructura digital sostenible en las comunidades.',171,1,9),(835,'Proporcionar internet gratuito en lugares y espacios públicos.',171,1,9),(836,'Gestionar convenios de desarrollo con otros órdenes de gobierno para fortalecer el despliegue de la infraestructura de telecomunicaciones.',171,1,9),(837,'Realizar estudios para determinar las zonas de mayor necesidad de acceso a las redes y servicios de telecomunicación en el estado.',171,1,9),(838,'Instruir sobre el uso responsable del internet a través de la capacitación con enfoque de integralidad.',171,1,9),(839,'Reforzar la calidad y el óptimo desempeño de los servicios electrónicos del gobierno.',172,1,9),(840,'Diseñar espacios de almacenamiento, integración, intercambio y aprovechamiento de recursos digitales.',172,1,9),(841,'Facilitar el acceso a herramientas tecnológicas que favorezcan la modernización digital.',172,1,9),(842,'Promover la inversión para el desarrollo de infraestructura tecnológica digital sostenible.',172,1,9),(843,'Desarrollar lineamientos que ofrezcan oportunidades de desarrollo sostenible e incluyente.',173,1,9),(844,'Generar alianzas con las instituciones educativas de nivel superior para elaborar programas de desarrollo sostenible e incluyente.',173,1,9),(845,'Promover el desarrollo de programas educativos integrales apoyados por las empresas e instituciones del sector de telecomunicaciones.',173,1,9),(846,'Gestionar convenios con asociaciones civiles, industrias e instituciones que apoyen la alfabetización digital.',173,1,9),(847,'Desarrollar acciones integrales que maximicen los esfuerzos educativos en el servicio de la red digital incluyente.',173,1,9),(848,'Diseñar programas de ordenamiento territorial en condiciones adecuadas de seguridad física y patrimonial.',174,1,11),(849,'Realizar intervenciones que reduzcan la vulnerabilidad y riesgo de los asentamientos humanos en las comunidades de mayor marginación.',174,1,11),(850,'Instituir la perspectiva de género, la accesibilidad universal y la seguridad como componentes transversales de la planeación urbana.',174,1,11),(851,'Implementar acciones en colaboración con los municipios para la delimitación territorial.',174,1,11),(852,'Promover el crecimiento urbano vertical y la adaptación del territorio.',174,1,11),(853,'Reforzar la vinculación con los municipios para la elaboración de proyectos que garanticen la calidad del espacio público y la  inclusión de espacios verdes.',175,1,11),(854,'Establecer observatorios de planeación y ordenamiento territorial con enfoque de sostenibilidad.',175,1,11),(855,'Fortalecer programas institucionales en los municipios y con vinculación a las dependencias en materia de ordenamiento territorial.',175,1,11),(856,'Gestionar la actualización del marco normativo en materia de ordenamiento territorial y desarrollo urbano para la regulación sostenible del territorio.',175,1,11),(857,'Instruir a los municipios en materia de regulación ecológica que permita la protección, preservación, restauración y aprovechamiento de los recursos naturales.',176,1,11),(858,'Conservar los recursos naturales locales a través de lineamientos en materia urbanística sustentable.',176,1,11),(859,'Diseñar programas regionales y metropolitanos que propicien el desarrollo urbano de las ciudades y comunidades con base en su potencialidad de patrimonio natural y ecológico.',176,1,11),(860,'Identificar áreas de oportunidad que propicien la generación de inversiones en energías limpias.',176,1,11),(861,'Promover que los proyectos de infraestructura se apeguen a una planeación sostenible con rentabilidad financiera y de impacto socioeconómico.',177,1,11),(862,'Incorporar el enfoque de sostenibilidad y desarrollo urbano sustentable en la prestación de los servicios públicos.',177,1,11),(863,'Planificar adecuadamente el desarrollo de las zonas destinadas al progreso económico del estado en coordinación con los sectores público, privado, social y académico.',177,1,11),(864,'Promover acciones para la sustitución del uso de leña y carbón dentro de las viviendas.',177,1,11),(865,'Promover esquemas asequibles de financiamiento a la vivienda para los trabajadores del estado y grupos en situación de vulnerabilidad. ',177,1,11),(866,'Definir áreas de atención prioritarias que coordinen los esfuerzos federales, estatales y municipales para la promoción de la inversión privada.',178,1,0),(867,'Establecer una cartera de proyectos estratégicos de inversión pública con impacto regional para su gestión y financiamiento conjunto.',178,1,0),(868,'Fortalecer los mecanismos de carácter participativo en las decisiones de inversión pública a nivel regional para priorizar aquellas acciones que sean de mayor interés para las comunidades.',178,1,0),(869,'Proporcionar la colaboración entre los municipios para la provisión de servicios públicos desde una perspectiva regional.',178,1,0),(870,'Incluir la perspectiva regional en la definición de las políticas de seguridad alimentaria, considerando las capacidades endógenas de las comunidades para mejorar la calidad de vida.',179,1,0),(871,'Ampliar la cobertura regional en educación preescolar y superior, para disminuir el rezago educativo.',179,1,0),(872,'Promover acciones coordinadas en materia de desarrollo económico y social para el bienestar de la etnia maya.',179,1,0),(873,'Promover la atención regional equilibrada de los servicios de salud públicos mediante la provisión de espacios, infraestructura, equipamiento, insumos y personal para un servicio de calidad.',179,1,0),(874,'Acercar los servicios públicos a las comunidades mayas considerando una perspectiva intercultural que permita mejorar su calidad de vida.',179,1,0),(875,'Incrementar la oferta de actividades culturales en los municipios del estado.',180,1,0),(876,'Fortalecer los programas de apoyo a la promoción cultural a las actividades que se realicen en los municipios.',180,1,0),(877,'Crear un inventario del patrimonio cultural de las regiones del estado.',180,1,0),(878,'Fortalecer la infraestructura cultural con enfoque regional.',180,1,0),(879,'Promover el uso de medios alternos de movilidad para garantizar la reducción de emisiones de gases contaminantes.',181,1,0),(880,'Establecer programas de educación ambiental en todo el estado.',181,1,0),(881,'Crear un sistema de información regional, que permita realizar el seguimiento y la evaluación a las políticas ambientales a nivel regional y municipal.',181,1,0),(882,'Establecer mecanismos de conservación y promoción para el uso sostenible de los recursos naturales.',181,1,0),(883,'Potencializar las aptitudes geográficas del estado para el desarrollo de energías renovables.',181,1,0),(884,'Involucrar a las comunidades del interior del estado como un elemento indispensable en el desarrollo de programas para el combate al delito.',182,1,0),(885,'Incorporar en las acciones de prevención y persecución del delito sistemas de información y herramientas de análisis con enfoque territorial.',182,1,0),(886,'Fortalecer la cobertura de servicios de la infraestructura regional en materia de seguridad.',182,1,0),(887,'Realizar convenios de colaboración entre estado y los municipios para la implementación del PBR-SED y su orientación al cumplimiento de los ODS.',183,1,0),(888,'Asesorar y capacitar a los Ayuntamientos en la implementación del PBR-SED.',183,1,0),(889,'Evaluar los avances de los municipios del estado en la implementación del PBR-SED.',183,1,0),(890,'Asesorar y capacitar a los municipios en el cumplimiento Ley de Disciplina Financiera de las Entidades Federativas y los Municipios.',183,1,0),(891,'Armonizar los diversos instrumentos de planeación regional, particularmente entre el ordenamiento territorial y del desarrollo urbano para eficientar la planeación del desarrollo.',184,1,0),(892,'Fomentar la elaboración e implementación de los programas de ordenamiento ecológico local que integren un enfoque de manejo del paisaje para garantizar la compatibilidad de las diversas actividades que se desarrollan de acuerdo a la vocación del territorio.',184,1,0),(893,'Mejorar la infraestructura del transporte en el Estado considerando una perspectiva regional en su cobertura para eficientar la movilidad en las comunidades.',184,1,0),(894,'Incrementar la cobertura regional en el otorgamiento de trámites y servicios públicos estatales que permita descentralizar su provisión desde Mérida para un acceso eficiente de las comunidades.',184,1,0),(895,'Promover proyectos de inversión pública con impacto meso regional que permitan el desarrollo de las comunidades en el área de influencia de los mismos.',185,1,0),(896,'Favorecer el intercambio comercial y turístico en la península de Yucatán, para dinamizar la economía entre las regiones fronterizas.',185,1,0),(897,'Establecer mecanismos de colaboración para la atención de retos comunes en materia de desarrollo en la península.',185,1,0);

UNLOCK TABLES;

/*Table structure for table `localidad` */

DROP TABLE IF EXISTS `localidad`;

CREATE TABLE `localidad` (
  `iIdLocalidad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vLocalidad` varchar(255) NOT NULL,
  `iIdMunicipio` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdLocalidad`),
  KEY `FK_Localidad_Municipio` (`iIdMunicipio`),
  CONSTRAINT `FK_Localidad_Municipio` FOREIGN KEY (`iIdMunicipio`) REFERENCES `municipio` (`iIdMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `localidad` */

LOCK TABLES `localidad` WRITE;

UNLOCK TABLES;

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `iIdMunicipio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vClave` varchar(3) NOT NULL,
  `vMunicipio` varchar(100) NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

/*Data for the table `municipio` */

LOCK TABLES `municipio` WRITE;

insert  into `municipio`(`iIdMunicipio`,`vClave`,`vMunicipio`,`iActivo`) values (1,'001','Abalá',1),(2,'002','Acanceh',1),(3,'003','Akil',1),(4,'004','Baca',1),(5,'005','Bokobá',1),(6,'006','Buctzotz',1),(7,'007','Cacalchén',1),(8,'008','Calotmul',1),(9,'009','Cansahcab',1),(10,'010','Cantamayec',1),(11,'011','Celestún',1),(12,'012','Cenotillo',1),(13,'013','Conkal',1),(14,'014','Cuncunul',1),(15,'015','Cuzamá',1),(16,'016','Chacsinkín',1),(17,'017','Chankom',1),(18,'018','Chapab',1),(19,'019','Chemax',1),(20,'020','Chicxulub Pueblo',1),(21,'021','Chichimilá',1),(22,'022','Chikindzonot',1),(23,'023','Chocholá',1),(24,'024','Chumayel',1),(25,'025','Dzán',1),(26,'026','Dzemul',1),(27,'027','Dzidzantún',1),(28,'028','Dzilam de Bravo',1),(29,'029','Dzilam González',1),(30,'030','Dzitás',1),(31,'031','Dzoncauich',1),(32,'032','Espita',1),(33,'033','Halachó',1),(34,'034','Hocabá',1),(35,'035','Hoctún',1),(36,'036','Homún',1),(37,'037','Huhí',1),(38,'038','Hunucmá',1),(39,'039','Ixil',1),(40,'040','Izamal',1),(41,'041','Kanasín',1),(42,'042','Kantunil',1),(43,'043','Kaua',1),(44,'044','Kinchil',1),(45,'045','Kopomá',1),(46,'046','Mama',1),(47,'047','Maní',1),(48,'048','Maxcanú',1),(49,'049','Mayapán',1),(50,'050','Mérida',1),(51,'051','Mocochá',1),(52,'052','Motul',1),(53,'053','Muna',1),(54,'054','Muxupip',1),(55,'055','Opichén',1),(56,'056','Oxkutzcab',1),(57,'057','Panabá',1),(58,'058','Peto',1),(59,'059','Progreso',1),(60,'060','Quintana Roo',1),(61,'061','Río Lagartos',1),(62,'062','Sacalum',1),(63,'063','Samahil',1),(64,'064','Sanahcat',1),(65,'065','San Felipe',1),(66,'066','Santa Elena',1),(67,'067','Seyé',1),(68,'068','Sinanché',1),(69,'069','Sotuta',1),(70,'070','Sucilá',1),(71,'071','Sudzal',1),(72,'072','Suma',1),(73,'073','Tahdziú',1),(74,'074','Tahmek',1),(75,'075','Teabo',1),(76,'076','Tecoh',1),(77,'077','Tekal de Venegas',1),(78,'078','Tekantó',1),(79,'079','Tekax',1),(80,'080','Tekit',1),(81,'081','Tekom',1),(82,'082','Telchac Pueblo',1),(83,'083','Telchac Puerto',1),(84,'084','Temax',1),(85,'085','Temozón',1),(86,'086','Tepakán',1),(87,'087','Tetiz',1),(88,'088','Teya',1),(89,'089','Ticul',1),(90,'090','Timucuy',1),(91,'091','Tinum',1),(92,'092','Tixcacalcupul',1),(93,'093','Tixkokob',1),(94,'094','Tixmehuac',1),(95,'095','Tixpéhual',1),(96,'096','Tizimín',1),(97,'097','Tunkás',1),(98,'098','Tzucacab',1),(99,'099','Uayma',1),(100,'100','Ucú',1),(101,'101','Umán',1),(102,'102','Valladolid',1),(103,'103','Xocchel',1),(104,'104','Yaxcabá',1),(105,'105','Yaxkukul',1),(106,'106','Yobaín',1);

UNLOCK TABLES;

/*Table structure for table `objetivo` */

DROP TABLE IF EXISTS `objetivo`;

CREATE TABLE `objetivo` (
  `iIdObjetivo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vObjetivo` varchar(250) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`iIdObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `objetivo` */

LOCK TABLES `objetivo` WRITE;

UNLOCK TABLES;

/*Table structure for table `objetivoped` */

DROP TABLE IF EXISTS `objetivoped`;

CREATE TABLE `objetivoped` (
  `iIdObjetivoid` int(11) NOT NULL AUTO_INCREMENT,
  `vObjetivo` text NOT NULL,
  `iIdTema` int(11) NOT NULL,
  `iActivo` int(11) NOT NULL,
  PRIMARY KEY (`iIdObjetivoid`),
  KEY `FK_Objetivo_TemaPED` (`iIdTema`),
  CONSTRAINT `FK_Objetivo_TemaPED` FOREIGN KEY (`iIdTema`) REFERENCES `temaped` (`iIdTema`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `objetivoped` */

LOCK TABLES `objetivoped` WRITE;

insert  into `objetivoped`(`iIdObjetivoid`,`vObjetivo`,`iIdTema`,`iActivo`) values (1,'Aumentar la actividad comercial sostenible del estado',1,1),(2,'Incrementar la productividad de las empresas comerciales en el estado',1,1),(3,'Aumentar la competitividad del estado ',2,1),(4,'Incrementar la inversión extranjera en el estado',2,1),(5,'Incrementar la actividad económica sostenible del sector secundario',3,1),(6,'Incrementar la productividad del sector industrial sostenible',3,1),(7,'Aumentar el valor de los productos y servicios turísticos con enfoque de sostenibilidad en Yucatán',4,1),(8,'Incrementar la afluencia de visitantes a Yucatán',4,1),(9,'Incrementar la estadía turística en Yucatán',4,1),(10,'Incrementar la calidad del empleo en Yucatán ',5,1),(11,'Aumentar la productividad laboral en el estado',5,1),(12,'Aumentar la independencia económica de la población del estado de Yucatán',6,1),(13,'Mejorar la actividad económica del sector agropecuario con enfoque sostenible',7,1),(14,'Incrementar el valor de la producción del sector pecuario con enfoque de sostenibilidad',7,1),(15,'Incrementar el valor de la producción agrícola en el estado con enfoque de sostenibilidad',7,1),(16,'Incrementar el valor de la producción pesquera en el estado con enfoque de sostenibilidad',8,1),(17,'Incrementar el acceso incluyente y de calidad al Sistema Estatal de Salud',9,1),(18,'Mejorar la condición de salud de la población en el estado',9,1),(19,'Disminuir toda forma de desnutrición en la población del estado de Yucatán',10,1),(20,'Incrementar la seguridad e inocuidad alimentaria sostenible de la población del estado de Yucatán',10,1),(21,'Disminuir la pobreza y pobreza extrema en los pueblos indígenas de Yucatán',11,1),(22,'Disminuir el rezago educativo de la población del estado',12,1),(23,'Mejorar la calidad del sistema educativo estatal',12,1),(24,'Mejorar la calidad de la vivienda en Yucatán ',13,1),(25,'Mejorar los servicios básicos en las viviendas del estado',13,1),(26,'Incrementar el acceso a la seguridad social con enfoque de sostenibilidad de la población yucateca',14,1),(27,'Incrementar la producción de bienes y servicios culturales',15,1),(28,'Aumentar el consumo cultural y la participación de la población en espacios y eventos culturales',15,1),(29,'Preservar las tradiciones e identidad cultural',16,1),(30,'Incrementar las creaciones artísticas',17,1),(31,'Mejorar la cobertura de la educación artística en la educación básica con un enfoque integral e incluyente',18,1),(32,'Aumentar la formación de profesionales de las artes',18,1),(33,'Preservar el patrimonio cultural del estado',19,1),(34,'Mejorar el desempeño de los deportistas yucatecos en competencias de alto rendimiento',20,1),(35,'Aumentar la activación física de la población en todas las edades, grupos sociales y regiones del estado',20,1),(36,'Aumentar la presencia de la población en eventos deportivos profesionales',20,1),(37,'Preservar los recursos naturales protegidos del estado de Yucatán',21,1),(38,'Mejorar la protección del ecosistema terrestre del estado',21,1),(39,'Disminuir la vulnerabilidad del estado ante los efectos del cambio climático',22,1),(40,'Mejorar la calidad del aire en Yucatán',22,1),(41,'Mejorar el saneamiento de aguas residuales en Yucatán',23,1),(42,'Mejorar la calidad del agua en el estado ',23,1),(43,'Mejorar el manejo de los residuos en Yucatán',24,1),(44,'Reducir la generación de residuos en Yucatán',24,1),(45,'Incrementar la generación de energía no contaminante en Yucatán ',25,1),(46,'Mejorar el acceso a energías limpias en el estado ',25,1),(47,'Incrementar la protección del ecosistema marino del estado de Yucatán',26,1),(48,'Incrementar el acceso a sistemas de transporte seguros, asequibles y eficientes en Yucatán',27,1),(49,'Mejorar las condiciones de desplazamientos y accesibilidad en Yucatán',27,1),(50,'Reducir las brechas de género en salud',28,1),(51,'Reducir las brechas de género en educación',28,1),(52,'Incrementar la autonomía y empoderamiento de las mujeres',28,1),(53,'Reducir la incidencia de las violencias hacia las mujeres en el estado',28,1),(54,'Incrementar la igualdad de oportunidades de los grupos en situación de vulnerabilidad',29,1),(55,'Incrementar la formación de capital humano con competencias y habilidades productivas y técnicas',30,1),(56,'Mejorar la calidad de la educación superior en el estado',30,1),(57,'Incrementar el aprovechamiento del conocimiento científico y tecnológico en el estado',31,1),(58,'Fortalecer las condiciones para la innovación, ciencia y tecnología en el estado',31,1),(59,'Preservar altos niveles de paz en la entidad',32,1),(60,'Disminuir la incidencia delictiva en el estado',32,1),(61,'Mejorar el desempeño de las instituciones de procuración de justicia en el estado',33,1),(62,'Disminuir la impunidad en el estado',33,1),(63,'Mejorar la estabilidad de las instituciones y su apego al estado de derecho en Yucatán en beneficio de los derechos humanos, en especial de las personas en situación de vulnerabilidad',34,1),(64,'Aumentar la cooperación nacional e internacional de Yucatán',34,1),(65,'Mejorar la calidad, oportunidad y disponibilidad de la información para la toma de decisiones',35,1),(66,'Disminuir la incidencia de corrupción en la Administración Pública Estatal',35,1),(67,'Mejorar la calidad del gasto público con base en evidencia rigurosa',36,1),(68,'Mejorar la efectividad en la gestión pública  a través de la mejora  regulatoria',37,1),(69,'Mejorar la sostenibilidad de las finanzas públicas',38,1),(70,'Incrementar la inversión en obra pública sostenible y accesible',39,1),(71,'Incrementar la conectividad sostenible e incluyente en los municipios del estado',40,1),(72,'Incrementar el acceso a las redes y servicios de telecomunicaciones sostenibles e incluyentes en las ciudades y comunidades del estado',41,1),(73,'Mejorar la planeación territorial con un enfoque sostenible en el estado',42,1),(74,'Disminuir la desigualdad territorial en el acceso a los derechos económicos, sociales, culturales y ambientales entre de las regiones que conforman el estado de Yucatán',43,1),(75,'Disminuir la desigualdad meso regional en el acceso a los derechos económicos, sociales, culturales y ambientales en la península de Yucatán',43,1);

UNLOCK TABLES;

/*Table structure for table `ods` */

DROP TABLE IF EXISTS `ods`;

CREATE TABLE `ods` (
  `iIdOds` int(11) NOT NULL AUTO_INCREMENT,
  `iNumero` int(11) NOT NULL,
  `vOds` text NOT NULL,
  PRIMARY KEY (`iIdOds`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `ods` */

LOCK TABLES `ods` WRITE;

insert  into `ods`(`iIdOds`,`iNumero`,`vOds`) values (1,1,'FIN DE LA POBREZA'),(2,2,'HAMBRE CERO'),(3,3,'SALUD Y BIENESTAR'),(4,4,'EDUCACIÓN DE CALIDAD'),(5,5,'IGUALDAD DE GÉNERO'),(6,6,'AGUA LIMPIA Y SANEAMIENTO'),(7,7,'ENERGÍA ASEQUIBLE Y NO CONTAMINANTE'),(8,8,'TRABAJO DECENTE Y CRECIMIENTO ECONÓMICO'),(9,9,'INDUSTRIA, INNOVACIÓN E INFRAESTRUCTURA'),(10,10,'REDUCCIÓN DE LAS DESIGUALDADES'),(11,11,'CIUDADES Y COMUNIDADES SOSTENIBLES'),(12,12,'PRODUCCIÓN Y CONSUMO RESPONSABLES'),(13,13,'ACCIÓN POR EL CLIMA'),(14,14,'VIDA SUBMARINA'),(15,15,'VIDA DE ECOSISTEMAS TERRESTRES'),(16,16,'PAZ, JUSTICIA E INSTITUCIONES SÓLIDAS'),(17,17,'ALIANZAS PARA LOGRAR LOS OBJETIVOS');

UNLOCK TABLES;

/*Table structure for table `periodicidad` */

DROP TABLE IF EXISTS `periodicidad`;

CREATE TABLE `periodicidad` (
  `iIdPeriodicidad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vPeriodicidad` varchar(100) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdPeriodicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `periodicidad` */

LOCK TABLES `periodicidad` WRITE;

UNLOCK TABLES;

/*Table structure for table `poblacionobjetivo` */

DROP TABLE IF EXISTS `poblacionobjetivo`;

CREATE TABLE `poblacionobjetivo` (
  `iIdPoblacionObjetivo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vPoblacionObjetivo` varchar(255) NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdPoblacionObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `poblacionobjetivo` */

LOCK TABLES `poblacionobjetivo` WRITE;

UNLOCK TABLES;

/*Table structure for table `problemas` */

DROP TABLE IF EXISTS `problemas`;

CREATE TABLE `problemas` (
  `iId_problema` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre_problema` text,
  `tEstructura_problema` text,
  PRIMARY KEY (`iId_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `problemas` */

LOCK TABLES `problemas` WRITE;

insert  into `problemas`(`iId_problema`,`tNombre_problema`,`tEstructura_problema`) values (1,'Amlo no dio beca','eyAiY2xhc3MiOiAiR3JhcGhMaW5rc01vZGVsIiwKICAibm9kZURhdGFBcnJheSI6IFsgCnsiY2F0ZWdvcnkiOiJTb3VyY2UiLCAia2V5IjotMSwgImxvYyI6IjQxNiAxMTIuMjM4NTc2MjUwODQ2MDUiLCAidGV4dCI6IkFtbG8gbm8gZGlvIGJlY2EifSwKeyJrZXkiOi0yLCAibG9jIjoiMjI5LjEzOTUxNjE5OTQ3OTgzIDAiLCAidGV4dCI6ImFzYXMifSwKeyJjYXRlZ29yeSI6IkRlc2lyZWRFdmVudCIsICJrZXkiOi00LCAibG9jIjoiMjkwLjExMTQyNjAzNzk3MjM2IDE5My4yMzg1NzYyNTA4NDYxIiwgInRleHQiOiJuYXNhIn0sCnsiY2F0ZWdvcnkiOiJEZXNpcmVkRXZlbnQiLCAia2V5IjotNSwgImxvYyI6IjY5Mi41NzgwOTMyMTMyNjU3IDIwNC4yMzg1NzYyNTA4NDYxIiwgInRleHQiOiJTZXIgZmVvIn0sCnsidGV4dCI6ImFzYSIsICJsb2MiOiI0MjkuNjA2MTgzMzc0NzcyOCAwIiwgImtleSI6LTd9LAp7InRleHQiOiJhc2FzIiwgImxvYyI6IjYzMC4wNzI4NTA1NTAwNjU4IDAiLCAia2V5IjotOH0KIF0sCiAgImxpbmtEYXRhQXJyYXkiOiBbIAp7ImZyb20iOi0xLCAidG8iOi03LCAicG9pbnRzIjpbNDgxLjc4ODA4Mzk2MDI2MTUzLDExMi4zNTY5NTMzOTQ4MDI5Niw0NjQuMTE2NjYxMjg2Nzc4Myw5MS40ODE3NTgzMDQxNjMwNSw0NTMuMTY4NDg5Nzg1OTQ3Niw2NC42NDQzMzA0NjE0Mjg3MSw0NTEuNDA2OTkzNjExNDY2NiwzMS43NjMzMzM0MTU5ODUxMV19LAp7ImZyb20iOi0xLCAidG8iOi04LCAicG9pbnRzIjpbNTE0LjMxNDE0MTYxMjkwNjgsMTEyLjM2ODc1MDAwMjg4OTkxLDU1MC40OTQ3MTk1MDE2NTA2LDcyLjYwNDI3MzkxMjE1MDQyLDU4Ny41MzA5NTgyNTQ5NjUxLDQ1LjcxMDQ1NTc0NzI3NjI0LDYzMC4wNzI4NTA1NTAwNjU4LDI3LjEzMzM4MjAzMDM5MjA2M119LAp7ImZyb20iOi0xLCAidG8iOi01LCAicG9pbnRzIjpbNTc1LjM0MjU2MTUxMTc3NzEsMTQ4LjQzMDk0MDc2MDUwMTUzLDU5OS42NzcxNjI4OTQ1MDQ2LDE1My45MTQ5NDI1OTc4NjEzLDY0OS40NjMxNzUzNTM3OTU5LDE3My41MTAzMDQ2NDMzNzI2NSw3MDAuNzQ0MzYwMjMzNDE3MiwyMDQuNDgwMDk1NDI1NzEwM119LAp7ImZyb20iOi0xLCAidG8iOi00LCAicG9pbnRzIjpbNDcxLjMxNzQ1NDMzNTc4NTcsMTQ5LjMxMjc5MjgxMjUxMzM1LDQyNy4zNTAzMTM5MTkzNjE0LDE4MC4yOTkxMjA4MDQ5OTUyNSwzOTEuMDE5NjIxMDMxMzIwMywxOTYuNzk4Njk4MTI5OTc2NDMsMzQ4LjEwNjk1NzI3MDQ1MjYsMjA1LjgwMDE1MDMwODUzMzIzXX0sCnsiZnJvbSI6LTEsICJ0byI6LTIsICJwb2ludHMiOls0MzcuNTc1NDAzMzMyODA4MjYsMTEyLjU5MjU1NDE4MDkzODE0LDM5Mi41MzY0MTQzNjQ2MDY4LDk4LjgzOTYyMDA0Mjc1LDMzMy4xNzc0NzE1MDg5NjYzLDcwLjY5NzM5NjQxNDQ2NTIzLDI3Ny41ODM1ODc5NzkzMzgzLDMxLjc2MzMzMzQxNTk4NTExXX0KIF19');

UNLOCK TABLES;

/*Table structure for table `programa` */

DROP TABLE IF EXISTS `programa`;

CREATE TABLE `programa` (
  `iIdPrograma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vPrograma` varchar(250) NOT NULL,
  `vClave` varchar(5) NOT NULL,
  `iIdTipoPrograma` int(11) unsigned NOT NULL,
  `iIdInstitucion` int(11) unsigned NOT NULL,
  `iIdUsuario` int(11) unsigned NOT NULL COMMENT 'Usuario que captura el PP',
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `iFrm1` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm2` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm3` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm4` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm5` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm6` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm7` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm8` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm9` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm10` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm11` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm12` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm13` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm14` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm15` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm16` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm17` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm18` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm19` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm20` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  `iFrm21` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Incompleto, 1=Completo',
  PRIMARY KEY (`iIdPrograma`),
  KEY `FK_Programa_TipoPrograma` (`iIdTipoPrograma`),
  KEY `FK_Programa_Institucion` (`iIdInstitucion`),
  KEY `FK_Programa_Usuario` (`iIdUsuario`),
  CONSTRAINT `FK_Programa_Institucion` FOREIGN KEY (`iIdInstitucion`) REFERENCES `institucion` (`iIdInstitucion`),
  CONSTRAINT `FK_Programa_TipoPrograma` FOREIGN KEY (`iIdTipoPrograma`) REFERENCES `tipoprograma` (`iTipoPrograma`),
  CONSTRAINT `FK_Programa_Usuario` FOREIGN KEY (`iIdUsuario`) REFERENCES `usuario` (`iIdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programa` */

LOCK TABLES `programa` WRITE;

UNLOCK TABLES;

/*Table structure for table `programafuentefinanciamiento` */

DROP TABLE IF EXISTS `programafuentefinanciamiento`;

CREATE TABLE `programafuentefinanciamiento` (
  `iIdPrograma` int(11) unsigned NOT NULL,
  `iIdFuenteFinanciamiento` int(11) unsigned NOT NULL,
  `nAnio1` decimal(20,2) unsigned NOT NULL,
  `nAnio2` decimal(20,2) unsigned NOT NULL,
  `nAnio3` decimal(20,2) unsigned NOT NULL,
  `nAnio4` decimal(20,2) unsigned NOT NULL,
  `nAnio5` decimal(20,2) unsigned NOT NULL,
  PRIMARY KEY (`iIdPrograma`,`iIdFuenteFinanciamiento`),
  KEY `FK_ProgramaFF_Fuente` (`iIdFuenteFinanciamiento`),
  CONSTRAINT `FK_ProgramaFF_Fuente` FOREIGN KEY (`iIdFuenteFinanciamiento`) REFERENCES `fuentefinanciamiento` (`iIdFuenteFinanciamiento`),
  CONSTRAINT `FK_ProgramaFF_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programafuentefinanciamiento` */

LOCK TABLES `programafuentefinanciamiento` WRITE;

UNLOCK TABLES;

/*Table structure for table `programaindicador` */

DROP TABLE IF EXISTS `programaindicador`;

CREATE TABLE `programaindicador` (
  `iIdProgramaIdIndicador` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vIndicador` varchar(255) NOT NULL,
  `vDefinicion` text NOT NULL,
  `vAlgoritmo` varchar(100) NOT NULL,
  `vVariableA` varchar(255) NOT NULL,
  `vVariableAVerificacion` text NOT NULL,
  `vVariableB` varchar(255) NOT NULL,
  `vVariableBVerificacion` text NOT NULL,
  `vVariableC` varchar(255) NOT NULL,
  `vVariableCVerificacion` text NOT NULL,
  `vVariableD` varchar(255) NOT NULL,
  `vVariableDVerificacion` text NOT NULL,
  `vVariableE` varchar(255) NOT NULL,
  `vVariableEVerificacion` text NOT NULL,
  `iLineaBase` decimal(12,2) NOT NULL,
  `iUnidadLineaBase` int(11) unsigned NOT NULL,
  `dFechaLineaBase` date NOT NULL,
  `iMeta` decimal(12,2) NOT NULL,
  `iUnidadMeta` int(11) unsigned NOT NULL,
  `dFechaMeta` date NOT NULL,
  `vTipoAlgoritmo` varchar(100) NOT NULL,
  `iIdPeriodicidad` int(11) unsigned NOT NULL,
  `iIdTendencia` int(11) unsigned NOT NULL,
  `iIdAmbitoMedicion` int(11) unsigned NOT NULL,
  `iIdDimensionDesempenio` int(11) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdProgramaIdIndicador`),
  KEY `FK_ProgInd_UnidaBase` (`iUnidadLineaBase`),
  KEY `FK_ProgInd_UnidaMeta` (`iUnidadMeta`),
  KEY `FK_ProgInd_Periodicidad` (`iIdPeriodicidad`),
  KEY `FK_ProgInd_Tendencia` (`iIdTendencia`),
  KEY `FK_ProgInd_Ambito` (`iIdAmbitoMedicion`),
  KEY `FK_ProgInd_Dimension` (`iIdDimensionDesempenio`),
  KEY `FK_ProgInd_Programa` (`iIdPrograma`),
  CONSTRAINT `FK_ProgInd_Ambito` FOREIGN KEY (`iIdAmbitoMedicion`) REFERENCES `ambitomedicion` (`iIdAmbitoMedicion`),
  CONSTRAINT `FK_ProgInd_Dimension` FOREIGN KEY (`iIdDimensionDesempenio`) REFERENCES `dimensiondesempenio` (`iDimensionDesempenio`),
  CONSTRAINT `FK_ProgInd_Periodicidad` FOREIGN KEY (`iIdPeriodicidad`) REFERENCES `periodicidad` (`iIdPeriodicidad`),
  CONSTRAINT `FK_ProgInd_Programa` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`),
  CONSTRAINT `FK_ProgInd_Tendencia` FOREIGN KEY (`iIdTendencia`) REFERENCES `tendencia` (`iIdTendencia`),
  CONSTRAINT `FK_ProgInd_UnidaBase` FOREIGN KEY (`iUnidadLineaBase`) REFERENCES `unidadmedida` (`iIdUnidadMedida`),
  CONSTRAINT `FK_ProgInd_UnidaMeta` FOREIGN KEY (`iUnidadMeta`) REFERENCES `unidadmedida` (`iIdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programaindicador` */

LOCK TABLES `programaindicador` WRITE;

UNLOCK TABLES;

/*Table structure for table `proposito` */

DROP TABLE IF EXISTS `proposito`;

CREATE TABLE `proposito` (
  `iIdProposito` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `Proposito` varchar(255) NOT NULL,
  `vIndicador` text NOT NULL,
  `vMedioVerificacion` text NOT NULL,
  `vSupuesto` text NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `nMeta` decimal(12,2) DEFAULT NULL,
  `nLineaBase` decimal(12,2) DEFAULT NULL,
  `nMetaAnio1` decimal(12,2) DEFAULT NULL,
  `nMetaAnio2` decimal(12,2) DEFAULT NULL,
  `nMetaAnio3` decimal(12,2) DEFAULT NULL,
  `nMetaAnio4` decimal(12,2) DEFAULT NULL,
  `nMetaAnio5` decimal(12,2) DEFAULT NULL,
  `nMetaFinal` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`iIdProposito`),
  KEY `FK_Proposito_PP` (`iIdPrograma`),
  CONSTRAINT `FK_Proposito_PP` FOREIGN KEY (`iIdPrograma`) REFERENCES `programa` (`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `proposito` */

LOCK TABLES `proposito` WRITE;

UNLOCK TABLES;

/*Table structure for table `tamaniolocalidad` */

DROP TABLE IF EXISTS `tamaniolocalidad`;

CREATE TABLE `tamaniolocalidad` (
  `iIdTamanioLocalidad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vTamanioLocalidad` varchar(100) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdTamanioLocalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tamaniolocalidad` */

LOCK TABLES `tamaniolocalidad` WRITE;

insert  into `tamaniolocalidad`(`iIdTamanioLocalidad`,`vTamanioLocalidad`,`iActivo`) values (1,'De hasta 500',1),(2,'501-2500',1),(3,'2501-10,000',1),(4,'10,001-15,000',1),(5,'15,001-50,000',1),(6,'Más de 50,000',1);

UNLOCK TABLES;

/*Table structure for table `temaped` */

DROP TABLE IF EXISTS `temaped`;

CREATE TABLE `temaped` (
  `iIdTema` int(11) NOT NULL AUTO_INCREMENT,
  `vTema` varchar(100) NOT NULL,
  `iIdEje` int(11) unsigned NOT NULL,
  `iActivo` int(11) NOT NULL,
  PRIMARY KEY (`iIdTema`),
  KEY `FK_Tema_EjePED` (`iIdEje`),
  CONSTRAINT `FK_Tema_EjePED` FOREIGN KEY (`iIdEje`) REFERENCES `ejeped` (`iIdEje`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `temaped` */

LOCK TABLES `temaped` WRITE;

insert  into `temaped`(`iIdTema`,`vTema`,`iIdEje`,`iActivo`) values (1,'Desarrollo comercial y fortalecimiento de las empresas locales.',1,1),(2,'Competitividad e inversión extranjera.',1,1),(3,'Desarrollo industrial.',1,1),(4,'Impulso al turismo.',1,1),(5,'Capital humano generador de desarrollo y trabajo decente.',1,1),(6,'Fomento empresarial y al emprendimiento.',1,1),(7,'Desarrollo agropecuario.',1,1),(8,'Desarrollo pesquero.',1,1),(9,'Salud y bienestar',2,1),(10,'Hambre cero',2,1),(11,'Pueblos indígenas',2,1),(12,'Educación integral de calidad',2,1),(13,'Acceso a la vivienda',2,1),(14,'Seguridad social',2,1),(15,'Acceso universal a la cultura',3,1),(16,'Cultura tradicional',3,1),(17,'Bellas artes',3,1),(18,'Educación artística y cultural',3,1),(19,'Patrimonio cultural',3,1),(20,'Fomento al deporte',3,1),(21,'Conservación de recursos naturales ',4,1),(22,'Acción por el clima',4,1),(23,'Agua limpia y saneamiento',4,1),(24,'Manejo integral de residuos',4,1),(25,'Energía asequible y no Contaminante',4,1),(26,'Vida submarina',4,1),(27,'Movilidad sustentable',4,1),(28,'Igualdad de género',5,1),(29,'Inclusión social y atención a grupos en situación de  vulnerabilidad',5,1),(30,'Educación superior y enseñanza científica y técnica ',6,1),(31,'Conocimiento científico, tecnológico e innovación',6,1),(32,'Paz',7,1),(33,'Justicia',7,1),(34,'Gobernabilidad',7,1),(35,'Gobierno abierto y combate a la corrupción',8,1),(36,'Gestión para Resultados en el desarrollo',8,1),(37,'Mejora regulatoria e innovación de la gestión pública',8,1),(38,'Finanzas Sanas',8,1),(39,'Inversión pública',9,1),(40,'Conectividad y transporte',9,1),(41,'Infraestructura digital',9,1),(42,'Ordenamiento territorial',9,1),(43,'N/A',10,1);

UNLOCK TABLES;

/*Table structure for table `tendencia` */

DROP TABLE IF EXISTS `tendencia`;

CREATE TABLE `tendencia` (
  `iIdTendencia` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vTendencia` varchar(150) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdTendencia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tendencia` */

LOCK TABLES `tendencia` WRITE;

insert  into `tendencia`(`iIdTendencia`,`vTendencia`,`iActivo`) values (1,'Ascendente',1),(2,'Descendente',1),(3,'Rango',1);

UNLOCK TABLES;

/*Table structure for table `tipoinvolucrado` */

DROP TABLE IF EXISTS `tipoinvolucrado`;

CREATE TABLE `tipoinvolucrado` (
  `iIdTipoInvolucrado` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vTipoInvolucrado` varchar(255) NOT NULL,
  `iActivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdTipoInvolucrado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tipoinvolucrado` */

LOCK TABLES `tipoinvolucrado` WRITE;

insert  into `tipoinvolucrado`(`iIdTipoInvolucrado`,`vTipoInvolucrado`,`iActivo`) values (1,'Públicos',1),(2,'Privados',1),(3,'ONG',1),(4,'Otras categorias de involucradros',1);

UNLOCK TABLES;

/*Table structure for table `tipoprograma` */

DROP TABLE IF EXISTS `tipoprograma`;

CREATE TABLE `tipoprograma` (
  `iTipoPrograma` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vTipoPrograma` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iTipoPrograma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tipoprograma` */

LOCK TABLES `tipoprograma` WRITE;

insert  into `tipoprograma`(`iTipoPrograma`,`vTipoPrograma`,`iActivo`) values (1,'Federal',1),(2,'Estatal',1),(3,'Municipal',1),(4,'Otro',1);

UNLOCK TABLES;

/*Table structure for table `unidadmedida` */

DROP TABLE IF EXISTS `unidadmedida`;

CREATE TABLE `unidadmedida` (
  `iIdUnidadMedida` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vUnidadMedida` varchar(255) NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`iIdUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `unidadmedida` */

LOCK TABLES `unidadmedida` WRITE;

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `iIdUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vUsuario` varchar(100) NOT NULL,
  `vPassword` varchar(255) NOT NULL COMMENT 'Password códificado en SHA1',
  `vNombres` varchar(100) NOT NULL,
  `vPrimerApellido` varchar(100) NOT NULL,
  `vSegundoApellido` varchar(100) NOT NULL,
  `vCorreo` varchar(100) NOT NULL,
  `iIdInstitucion` int(11) unsigned NOT NULL,
  `iIdRol` int(10) unsigned NOT NULL,
  `iActivo` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1:Sí, 0:No',
  PRIMARY KEY (`iIdUsuario`),
  KEY `FK_Usuario_Inst` (`iIdInstitucion`),
  CONSTRAINT `FK_Usuario_Inst` FOREIGN KEY (`iIdInstitucion`) REFERENCES `institucion` (`iIdInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

UNLOCK TABLES;

/*Table structure for table `vinculacionotro` */

DROP TABLE IF EXISTS `vinculacionotro`;

CREATE TABLE `vinculacionotro` (
  `iIdProgramaPresupuestario` int(11) unsigned NOT NULL,
  `iIdPrograma` int(11) unsigned NOT NULL,
  `vObjetivo` varchar(255) NOT NULL,
  `iIdPoblacionObjetivo` int(11) unsigned NOT NULL,
  `iIdBienServicio` int(11) unsigned NOT NULL,
  `iIdCobertura` int(11) unsigned NOT NULL,
  `iIdUnidadCoordinadora` int(11) NOT NULL,
  `vDescripcionInterdependencias` text NOT NULL,
  `vTipo` varchar(255) NOT NULL COMMENT '"Complementario", "Posible duplicidad", "Otro (Especifique"',
  PRIMARY KEY (`iIdProgramaPresupuestario`,`iIdPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vinculacionotro` */

LOCK TABLES `vinculacionotro` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
