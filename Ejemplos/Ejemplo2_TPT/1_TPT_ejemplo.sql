
USE master;

GO

DROP DATABASE IF EXISTS Ejemplos_Ejemplo2_TPT_DB;

GO

CREATE DATABASE Ejemplos_Ejemplo2_TPT_DB;

GO

USE Ejemplos_Ejemplo2_TPT_DB;

GO

CREATE TABLE Figuras(
	Id INT IDENTITY(1,1),	
	Area DECIMAL(18,2),
	CONSTRAINT PK_Figuras PRIMARY KEY (Id)
);

CREATE TABLE Rectangulos(
	Id INT ,	
	Ancho DECIMAL(18,2),
	Largo DECIMAL(18,2),
	CONSTRAINT PK_Rectangulos PRIMARY KEY (Id),
	CONSTRAINT FK_Rectangulos_Figuras FOREIGN KEY (Id) 
		REFERENCES Figuras(Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Circulos(
	Id INT,	
	Radio DECIMAL(18,2),
	CONSTRAINT PK_Circulos PRIMARY KEY (Id),
	CONSTRAINT FK_Circulos_Figuras FOREIGN KEY (Id) 
		REFERENCES Figuras(Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

GO

INSERT INTO Figuras (Area)
VALUES
(5*5),					-- Rectángulo de lado 5
(5.00*10.00),			-- Rectángulo de 5x10
(3.1415*3.00*3.00),		-- Círculo de radio 3
(4.00*4.00),			-- Rectángulo de lado 4
(3.1415*6.00*6.00),		-- Círculo de radio 6
(3.1415*5.00*5.00);		-- Círculo de radio 5

INSERT INTO Rectangulos (Id, Ancho, Largo)
VALUES
(1, 5.00, 5.00),		-- Rectángulo (1) de lado 5
(2, 5.00, 10.00),		-- Rectángulo (2) de 5x10
(4, 4.00, 4.00);		-- Rectángulo (4) de lado 4x4

INSERT INTO Circulos (Id, Radio)
VALUES
(3, 3.00),				-- Círculo (3) de radio 3
(5, 6.00),				-- Círculo (5) de radio 6
(6, 5.00);				-- Círculo (6) de radio 5

GO

SELECT f.Id, 
		Tipo=CASE WHEN r.Id IS NOT NULL THEN 'Rectángulo'
		          WHEN c.Id IS NOT NULL THEN 'Círculo'
				  ELSE 'Desconocido'
			 END,
		f.Area, r.Ancho, r.Largo, c.Radio	
FROM Figuras f
LEFT JOIN Rectangulos r ON r.Id=f.Id
LEFT JOIN Circulos c ON c.Id=f.Id;

GO

USE master

