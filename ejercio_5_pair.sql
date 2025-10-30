USE clase_2_60;

/* ALTER TABLE nombre_tabala
   ADD COLUMN nombre_col tipo_dato restriccion
   */

ALTER TABLE alumnas
  ADD COLUMN email VARCHAR(50);
  
  
  
  ALTER TABLE alumnas
    RENAME COLUMN email TO mail;

ALTER TABLE alumnas
 CHANGE mail email VARCHAR(35); 
 
 ALTER TABLE alumnas
 DROP COLUMN email;
 
 -- INSERCION:--
 
 INSERT INTO kahoot(id_kahoot,posicion,id_alumna,fecha)
   VALUE(2945, 3, 1, "2025-10-24");
   
  INSERT INTO alumnas
  VALUE(1, "nieves", "P", "60");
  
  SELECT *
  FROM alumnas;
INSERT INTO alumnas(id, nombre, apellido, promo)  
  VALUE ("1", "Natalia" "P", "60");

INSERT INTO alumnas(nombre, apellido, promo)
VALUE ("claudia","P", "60");

SELECT*
FROM alumnas;
 
 ALTER TABLE kahoot
	DROP FOREIGN KEY fk_kahoot_alumnas;
    
ALTER TABLE kahoot
	ADD CONSTRAINT fk_kahoot_alumnas
		FOREIGN KEY (id_alumna)
        REFERENCES alumnas(id)
        ON DELETE CASCADE;
        
        







  
  
  
 
 