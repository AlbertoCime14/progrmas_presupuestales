/*Data for the table `municipio` */
insert  into `municipio`(`iIdMunicipio`,`vClave`,`vMunicipio`,`iActivo`) values (1,'001','Abalá',1),(2,'002','Acanceh',1),(3,'003','Akil',1),(4,'004','Baca',1),(5,'005','Bokobá',1),(6,'006','Buctzotz',1),(7,'007','Cacalchén',1),(8,'008','Calotmul',1),(9,'009','Cansahcab',1),(10,'010','Cantamayec',1),(11,'011','Celestún',1),(12,'012','Cenotillo',1),(13,'013','Conkal',1),(14,'014','Cuncunul',1),(15,'015','Cuzamá',1),(16,'016','Chacsinkín',1),(17,'017','Chankom',1),(18,'018','Chapab',1),(19,'019','Chemax',1),(20,'020','Chicxulub Pueblo',1),(21,'021','Chichimilá',1),(22,'022','Chikindzonot',1),(23,'023','Chocholá',1),(24,'024','Chumayel',1),(25,'025','Dzán',1),(26,'026','Dzemul',1),(27,'027','Dzidzantún',1),(28,'028','Dzilam de Bravo',1),(29,'029','Dzilam González',1),(30,'030','Dzitás',1),(31,'031','Dzoncauich',1),(32,'032','Espita',1),(33,'033','Halachó',1),(34,'034','Hocabá',1),(35,'035','Hoctún',1),(36,'036','Homún',1),(37,'037','Huhí',1),(38,'038','Hunucmá',1),(39,'039','Ixil',1),(40,'040','Izamal',1),(41,'041','Kanasín',1),(42,'042','Kantunil',1),(43,'043','Kaua',1),(44,'044','Kinchil',1),(45,'045','Kopomá',1),(46,'046','Mama',1),(47,'047','Maní',1),(48,'048','Maxcanú',1),(49,'049','Mayapán',1),(50,'050','Mérida',1),(51,'051','Mocochá',1),(52,'052','Motul',1),(53,'053','Muna',1),(54,'054','Muxupip',1),(55,'055','Opichén',1),(56,'056','Oxkutzcab',1),(57,'057','Panabá',1),(58,'058','Peto',1),(59,'059','Progreso',1),(60,'060','Quintana Roo',1),(61,'061','Río Lagartos',1),(62,'062','Sacalum',1),(63,'063','Samahil',1),(64,'064','Sanahcat',1),(65,'065','San Felipe',1),(66,'066','Santa Elena',1),(67,'067','Seyé',1),(68,'068','Sinanché',1),(69,'069','Sotuta',1),(70,'070','Sucilá',1),(71,'071','Sudzal',1),(72,'072','Suma',1),(73,'073','Tahdziú',1),(74,'074','Tahmek',1),(75,'075','Teabo',1),(76,'076','Tecoh',1),(77,'077','Tekal de Venegas',1),(78,'078','Tekantó',1),(79,'079','Tekax',1),(80,'080','Tekit',1),(81,'081','Tekom',1),(82,'082','Telchac Pueblo',1),(83,'083','Telchac Puerto',1),(84,'084','Temax',1),(85,'085','Temozón',1),(86,'086','Tepakán',1),(87,'087','Tetiz',1),(88,'088','Teya',1),(89,'089','Ticul',1),(90,'090','Timucuy',1),(91,'091','Tinum',1),(92,'092','Tixcacalcupul',1),(93,'093','Tixkokob',1),(94,'094','Tixmehuac',1),(95,'095','Tixpéhual',1),(96,'096','Tizimín',1),(97,'097','Tunkás',1),(98,'098','Tzucacab',1),(99,'099','Uayma',1),(100,'100','Ucú',1),(101,'101','Umán',1),(102,'102','Valladolid',1),(103,'103','Xocchel',1),(104,'104','Yaxcabá',1),(105,'105','Yaxkukul',1),(106,'106','Yobaín',1);
/*Data for the table `lugarimplementacionpsimilar` */
insert  into `lugarimplementacionpsimilar`(`iIdLugar`,`vDescripcion`) values (1,'Federación'),(2,'Otro estado'),(3,'Otro país');
/*Data for the table `tipoactor` */
insert  into `tipoactor`(`iIdTipoActor`,`vNombreTipo`) values (1,'Públicos'),(2,'Privados'),(3,'ONG'),(4,'Otras Categorías de involucrados');
/*Data for the table `posicion` */
insert  into `posicion`(`iIdPosicion`,`vNombrePosicion`) values (1,'A favor'),(2,'Indiferente'),(3,'En contra');

/*Data for the table `importancia` */

insert  into `importancia`(`iIdImportancia`,`vNombreImportancia`) values (1,'Alta'),(2,'Regular'),(3,'Baja');
/*Data for the table `derecsoccul` */

insert  into `derecsoccul`(`iIdDerEcSocCul`,`vNombre`) values (1,'Derecho económico'),(2,'Derecho al empleo'),(3,'Derecho a un salario digno'),(4,'Derecho al sindicalismo'),(5,'Derecho de huelga'),(6,'Derecho social'),(7,'Derecho a la salud'),(8,'Derecho a la vivienda'),(9,'Derecho a la seguridad social'),(10,'Derecho a la alimentación'),(11,'Derecho a la educación'),(12,'Derecho cultural'),(13,'Derecho de acceso a bienes y servicios culturales'),(14,'Derecho a la ciencia'),(15,'Derecho ambiental'),(16,'Derecho al agua'),(17,'Derecho a un medio ambiente adecuado y saludable');
/*Data for the table `tipoprograma` */

insert  into `tipoprograma`(`iIdTipoPrograma`,`vNombre`) values (1,'Universal'),(2,'Focalizado'),(3,'Bajo demanda'),(4,'Otro');

/*Data for the table `grupoedad` */

insert  into `grupoedad`(`iIdGrupoEdad`,`vClasificacion`) values (1,'0 a 1 año'),(2,'0 a 5 años'),(3,'1 a 3 años'),(4,'3 a 5 años'),(5,'6 a 11 años'),(6,'10 a 24 años'),(7,'12 a 15 años'),(8,'12 a 29 años'),(9,'14 a 29 años'),(10,'15 a 17 años'),(11,'16 a 18 años'),(12,'16 a 65 años'),(13,'18 a 21 años'),(14,'18 a 23 años'),(15,'18 a 24 años'),(16,'18 a 65 años'),(17,'30 a 65 años'),(18,'más de 65 años'),(19,'Otro\r\n');

/*Data for the table `definicionpoblacion` */

insert  into `definicionpoblacion`(`iIdDefinicion`,`vNombre`) values (1,'PoblacionReferencia'),(2,'PoblacionPotencial'),(3,'PoblacionObjetivo'),(4,'PoblacionPostergada'),(5,'Poblacion2020'),(6,'Poblacion2021'),(7,'Poblacion2022'),(8,'Poblacion2023'),(9,'Poblacion2024');
/*Data for the table `criteriofocalizacion` */

insert  into `criteriofocalizacion`(`iIdCriterioFoc`,`vNombre`) values (1,'Nivel de ingreso'),(2,'Sexo'),(3,'Grupo etario'),(4,'Condición de hablante de lengua indígena'),(5,'Ubicación geográfica'),(6,'Otros criterios (especificar)');



/*Data for the table `ejeped` */

insert  into `ejeped`(`iIdeje`,`vEje`) values (1,'Yucatán con Economía Inclusiva'),(2,'Yucatán con Calidad de Vida y Bienestar Social '),(3,'Yucatán Cultural con Identidad para el Desarrollo'),(4,'Yucatán Verde y Sustentable'),(5,'Igualdad de género oportunidades y no discriminación'),(6,'Innovación, conocimiento y tecnología'),(7,'Paz, Justicia y Gobernabilidad'),(8,'Gobierno Abierto, Eficiente y Finanzas Sanas'),(9,'Ciudades y Comunidades Sostenibles'),(10,'Desarrollo regional');

/*Data for the table `institucion` */

insert  into `institucion`(`iIdInstitucion`,`vInstitucion`,`iIdEje`,`iActivo`) values (1,'seplan',1,1);

/*Data for the table `usuario` */

insert  into `usuario`(`iIdUsuario`,`vUsuario`,`tPassword`,`vNombres`,`vPrimerApellido`,`vSegundoApellido`,`vCorreo`,`iIdInstitucion`,`iIdRol`,`iActivo`) values (1,'Admin','password','Alberto','cime','castellanos','orland_998@hotmail.com',1,1,1),(2,'prueba','password','carlos','cauich','alvarez','admin@gmail.com',1,1,1);