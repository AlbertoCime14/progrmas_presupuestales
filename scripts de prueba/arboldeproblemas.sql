CREATE TABLE `programas_presupuestales`.`problemas`(  
  `id_problema` INT NOT NULL AUTO_INCREMENT,
  `Nombre_problema` TEXT,
  `estructura_problema` TEXT DEFAULT '',
  PRIMARY KEY (`id_problema`)
);


INSERT INTO `problemas` (`id_problema`, `Nombre_problema`, `estructura_problema`) VALUES (NULL, 'Problema', '');
