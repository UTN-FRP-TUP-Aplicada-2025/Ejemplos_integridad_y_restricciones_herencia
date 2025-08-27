
USE master;


GO

DROP DATABASE IF EXISTS Ejemplos_Ejemplo1_TPH_DB;

GO

CREATE DATABASE Ejemplos_Ejemplo1_TPH_DB;

GO

USE Ejemplos_Ejemplo1_TPH_DB;

GO

CREATE TABLE Figuras(
	Id INT PRIMARY KEY IDENTITY(1,1),	
	Tipo INT NOT NULL, -- 1: Cuadrado, 2: Rectángulo, 3: Círculo
	Area DECIMAL(18,2),
	Ancho DECIMAL(18,2),
	Largo DECIMAL(18,2),
	Radio DECIMAL(18,2)

);

GO

INSERT INTO Figuras (Tipo, Area, Ancho, Largo, Radio)
VALUES
(1, 5.00*5.00, 5.00, 5.00, NULL),		-- Rectángulo de 5x5
(1, 5.00*10.00, 5.00, 10.00, NULL),		-- Rectángulo de 5x10
(2, 3.1415*3.0*3.0, NULL, NULL, 3.00),	-- Círculo de radio 3
(1, 16.00, 4.00, 4.00, NULL),			-- Rectángulo de 4x4
(2, 3.1415*4.0*4.0, NULL, NULL, 4.0),	-- Círculo de radio 6
(2, 3.1415*5.0, NULL, NULL, 5.00);		-- Círculo de radio 5

GO

SELECT Id, 
	   Tipo = CASE Tipo 
				  WHEN 1 THEN 'Rectángulo' 
				  WHEN 2 THEN 'Círculo' 
				  ELSE 'Desconocido' 
			  END,
	   Area, Ancho, Largo, Radio
FROM Figuras;

GO

USE master

