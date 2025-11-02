DROP DATABASE IF EXISTS ENSINO;
CREATE DATABASE ENSINO;
USE ENSINO;

DROP TABLE IF EXISTS Estudante;
CREATE TABLE Estudante(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	NomeEstudante 	VARCHAR(20),
	Endereco		VARCHAR(50),
	Cidade			VARCHAR(50),
	CodigoPostal	INTEGER,
	DataNascimento	DATE
);

DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso (
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20),
	Duracao INTEGER,
	Tipo VARCHAR(40)
);

DROP TABLE IF EXISTS Accao;
CREATE TABLE Accao(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	Numero INTEGER,
	DataInicial DATE,
	DataFinal DATE,
	Coordenador VARCHAR(20),
	IDCurso INT,
	FOREIGN KEY (IDCurso) REFERENCES Curso(ID)
);

DROP TABLE IF EXISTS Inscricao;
CREATE TABLE Inscricao(
	DataInscricao DATE,
	ClassificacaoFinal DECIMAL
);

INSERT INTO Estudante
		(NomeEstudante, Endereco, Cidade, CodigoPostal, DataNascimento)
	VALUES
		('Antonio', 'Rua do Alecrim n.1', 'Albufeira', 3001, '1997-08-22'),
		('Beatriz', 'Rua do Beato, lote 2', 'Braga', 3002, '1997-02-23'),
		('Catarina', 'Praça da Constituição, n.3', 'Coimbra', 3003, '1998-08-10'),
		('Diogo', 'Avenida Dom Afonso, lote 4', 'Domelas', 3004, '1995-02-04'),
		('Eduardo', 'Praça de Espanha n.5', 'Évora', 3005, '2002-03-05'),
		('Filipa', 'Travessa da Ferreirinha, 6', 'Faro', 3006, '2004-02-29');

    
SELECT NomeEstudante, ID from Estudante;

SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
FROM information_schema.columns
WHERE TABLE_NAME = 'Estudante';

SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
FROM information_schema.columns
WHERE TABLE_NAME = 'Curso';


DESCRIBE Estudante;
DESCRIBE Curso;