

-- Ejercicio 3 - Table per Concrete Class (TPC)

USE master;

GO

DROP DATABASE IF EXISTS Ejemplos_Ejemplo3_TPC_DB;

GO

CREATE DATABASE Ejemplos_Ejemplo3_TPC_DB;

GO

USE Ejemplos_Ejemplo3_TPC_DB;

GO

CREATE TABLE Rectangulos(
	Id INT IDENTITY(1,1),	
	Area DECIMAL(18,2),
	Ancho DECIMAL(18,2),
	Largo DECIMAL(18,2),
	CONSTRAINT PK_Rectangulos PRIMARY KEY(Id)
);

CREATE TABLE Circulos(
	Id INT IDENTITY(1,1),	
	Area DECIMAL(18,2),
	Radio DECIMAL(18,2),
	CONSTRAINT PK_Circulos PRIMARY KEY(Id)
);

GO

INSERT INTO Rectangulos ( Area, Ancho, Largo)
VALUES
(25.00, 5.00, 5.00),			-- Rectángulo de lado 5
(50.00, 5.00, 10.00),			-- Rectángulo de 5x10
( 4.00*4.00, 4.00, 4.00);		-- Rectángulo de lado 4

INSERT INTO Circulos ( Area, Radio)
VALUES
( 3.1415*3.0*3.0, 3.00),		-- Círculo de radio 3
( 3.1415*6.0 , 6.00),			-- Círculo de radio 6
( 3.1415*5.0 , 5.00);			-- Círculo de radio 5

GO

-- Consulta de las figuras

-- emulando la consulta del TPH

SELECT  ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Id,
		Tipo=CASE WHEN f.Id_Rectangulo IS NOT NULL THEN 'Rectángulo'
		          WHEN f.Id_Circulo IS NOT NULL THEN 'Círculo'
				  ELSE 'Desconocido'
			 END,
		f.Area, f.Ancho, f.Largo, f.Radio	
FROM (
		SELECT r.Area, r.Id AS Id_Rectangulo, r.Ancho, r.Largo, NULL AS Id_Circulo, NULL AS Radio
		FROM Rectangulos r

		UNION

		SELECT c.Area, NULL AS Id_Rectangulo, NULL AS Ancho, NULL AS Largo, c.Id AS Id_Circulo, c.Id AS Radio
		FROM Circulos c
	) f
ORDER BY Id;

GO

USE master

