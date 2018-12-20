
-- Primero voy a cambiar el tipo de dato de bonificacion y total_ventas
-- de varchar a int

ALTER TABLE mydb.cliente ALTER COLUMN bonificacion TYPE INT
USING bonificacion::integer;

ALTER TABLE mydb.cliente ALTER COLUMN total_ventas TYPE INT
USING total_ventas::integer;


-- Trigger
CREATE FUNCTION boni() RETURNS trigger AS $boni$
	BEGIN
		IF NEW.total_ventas > 10 THEN
			UPDATE mydb.Cliente SET NEW.bonificacion = 10;
		END IF;

		IF NEW.total_ventas > 15 THEN
			UPDATE mydb.Cliente SET NEW.bonificacion = 15;	
		END IF;

		IF NEW.total_ventas > 20 THEN
			UPDATE mydb.Cliente SET NEW.bonificacion = 20;
		END IF;

		IF NEW.total_ventas > 30 THEN
			UPDATE mydb.Cliente SET NEW.bonificacion = 25;
		END IF;
	END;
$boni$ LANGUAGE plpgsql;

CREATE TRIGGER boni BEFORE INSERT OR UPDATE ON mydb.Cliente
	FOR EACH ROW EXECUTE PROCEDURE boni();
