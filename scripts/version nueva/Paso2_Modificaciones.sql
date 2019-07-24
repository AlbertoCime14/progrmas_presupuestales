/*Adicion del campo no activo a la tabla programa` */
ALTER TABLE `programaspresupuestales`.`programas`   
  ADD COLUMN `iActivo` INT(11) DEFAULT 1;
/*Adicion del campo no aplica a la tabla programa` */
ALTER TABLE `programaspresupuestales`.`programas`   
  ADD COLUMN `iAplica` INT(11) DEFAULT 1;
/*Adicion del campo no aplica a la tabla programa_similares` */
  ALTER TABLE `programaspresupuestales`.`programassimilares`   
  ADD COLUMN `iAplica` INT(1) UNSIGNED DEFAULT 1  NOT NULL AFTER `iIdPrograma`;
/*Adicion del campo vEspecificarOtro a la tabla confprogramadersoccul, este campo sirve para guardar la espeficacion del "otro", cuando el usuario seleccione el campo otro del catalogo derechos socioales, culturales y economicos, el usuario tiene que espeficar ese otro y lo guardara en ese campo creado, que pertenece a la tabla configuracion, puede ser un campo vacio ` */
ALTER TABLE `programaspresupuestales`.`confprogramadersoccul`   
  ADD COLUMN `vEspecificarOtro` VARCHAR(255) NULL AFTER `iIdPrograma`;
/*Adicion de la relacion de los municipios con municipios de incidencia` */

ALTER TABLE `programaspresupuestales`.`municipiosincidencia`  
  ADD CONSTRAINT `FkIdMunicipioI` FOREIGN KEY (`IidMunicipio`) REFERENCES `programaspresupuestales`.`municipio`(`iIdMunicipio`) ON UPDATE RESTRICT ON DELETE RESTRICT;
/*Adicion de la relacion de los municipios con lugar de implementacion` */

ALTER TABLE `programaspresupuestales`.`lugarimplementacion`  
  ADD CONSTRAINT `FkIdMunicipioIm` FOREIGN KEY (`iIdmunicipio`) REFERENCES `programaspresupuestales`.`municipio`(`iIdMunicipio`) ON UPDATE RESTRICT ON DELETE RESTRICT;

  /*Adicion de la relacion de los municipios con la cobertura geografica` */
  ALTER TABLE `programaspresupuestales`.`coberturageografica`  
  ADD CONSTRAINT `FkMunicipioCg` FOREIGN KEY (`iIdmunicipio`) REFERENCES `programaspresupuestales`.`municipio`(`iIdMunicipio`) ON UPDATE RESTRICT ON DELETE RESTRICT;


  /* la tabla `cuantificacionpoblacion` en el campo tEspecificacionGrupo puede ser nulo, este caso pasa cuando el usuario selecciona el grupo edad de otro y la especificacion de ese otro se guarda en este campo */

ALTER TABLE `programaspresupuestales`.`cuantificacionpoblacion`   
  CHANGE `tEspecificacionGrupo` `tEspecificacionGrupo` TEXT CHARSET utf8 COLLATE utf8_general_ci NULL;

  /* la tabla `criteriosfocalizacion complemento` en el campo tOtroCriterio puede ser nulo, este caso pasa cuando el usuario selecciona en la lista de crterios el campo "otros criterios" y la especificacion de ese otro se guarda en este campo */
ALTER TABLE `programaspresupuestales`.`criteriosfocalizacioncomplemento`   
  ADD COLUMN `tOtroCriterio` TEXT NULL AFTER `iIdCriterioFoc`;
/*Adicion del campo no aplica a la tabla programa_similares` */
ALTER TABLE `programaspresupuestales`.`unidadmedida`   
  ADD COLUMN `vNota` VARCHAR(255) NULL AFTER `vNombre`,
  ADD COLUMN `iActivo` TINYINT(1) DEFAULT 1  NULL AFTER `vNota`;
/*Adicion del campo nombre a la tabla bienes y servicios` */
ALTER TABLE `programaspresupuestales`.`bienesservicios`   
  ADD COLUMN `vNombreServicio` VARCHAR(255) NOT NULL AFTER `iIdPrograma`;
/*Adicion del campo iActivo a la tabla bienes y servicios` */
ALTER TABLE `programaspresupuestales`.`bienesservicios`   
  ADD COLUMN `iActivo` TINYINT(1) UNSIGNED DEFAULT 1  NOT NULL AFTER `iIdPrograma`;

/* 11 de julio del 2019, modificacion de la tabla focalizacion complemento, ya que puedes ser nulos` */
ALTER TABLE `programaspresupuestales`.`criteriosfocalizacioncomplemento`   
  CHANGE `tLiga` `tLiga` TEXT CHARSET utf8 COLLATE utf8_general_ci NULL,
  CHANGE `tArchivo` `tArchivo` TEXT CHARSET utf8 COLLATE utf8_general_ci NULL;

/* 11 de julio del 2019, modificacion de la llave foranea` */


ALTER TABLE `programaspresupuestales`.`criteriosfocalizacioncomplemento` 
  ADD CONSTRAINT `FkPrograma` FOREIGN KEY (`iIdPrograma`) REFERENCES `programaspresupuestales`.`programas`(`iIdPrograma`),
  DROP FOREIGN KEY `FkProgramaCr`;


/* 18 de julio, agreacion del campo fecha de creacion del programa presupuestal` */
ALTER TABLE `programaspresupuestales`.`programas`   
  ADD COLUMN `dFechaCaptura` DATE NOT NULL AFTER `iAplica`;

/* 18 de julio, agreacion del campo aplica a la tabla configuracion del programa previo` */
ALTER TABLE `programaspresupuestales`.`confprogramasprevios`   
  ADD COLUMN `iAplica` TINYINT(1) NOT NULL AFTER `iIdProgramaPrevio`;


/* 19 de julio, agreacion del campo aplica a la tabla configuracion del programa previo` */
ALTER TABLE `programaspresupuestales`.`confprogramasprevios`   
  ADD COLUMN `tPoblacionObjetivo` TEXT NOT NULL  COMMENT 'Agregado para la poblacion objetivo' AFTER `iAplica`,
  ADD COLUMN `tArchivo` TEXT NULL  COMMENT 'Agregado para subir el archivo' AFTER `tPoblacionObjetivo`,
  ADD COLUMN `tLiga` TEXT NULL  COMMENT 'Agregado para poner la liga del archivo' AFTER `tArchivo`,
  ADD COLUMN `tResultadoEvaluacion` TEXT NOT NULL  COMMENT 'Agregado para poner el resultado de la evaluacion' AFTER `tLiga`,
  ADD COLUMN `iActivo` TINYINT(1) DEFAULT 1  NOT NULL  COMMENT 'Agregado para manejar el borrado logico' AFTER `tResultadoEvaluacion`;

/* 23 de julio, agreacion del campo activo a la tabla cuantificacion` */
ALTER TABLE `programaspresupuestales`.`cuantificacionpoblacion`   
  ADD COLUMN `iActivo` TINYINT(1) UNSIGNED DEFAULT 1  NOT NULL AFTER `iIdPrograma`;
/* 24 de julio, agreacion del campo vNombre a la tabla otros criterios */
ALTER TABLE `programaspresupuestales`.`otroscriterios`   
  ADD COLUMN `VnombreCriterio` VARCHAR(255) NOT NULL AFTER `iIdCriterio`;
