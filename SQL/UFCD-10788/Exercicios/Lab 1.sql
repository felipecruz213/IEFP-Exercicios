DROP DATABASE IF EXISTS ENSINO;
CREATE DATABASE ENSINO;

USE ENSINO;

DROP TABLE IF EXISTS Estudante;
CREATE TABLE Estudante (
	ID 				INTEGER PRIMARY KEY AUTO_INCREMENT,
    NomeEstudante	VARCHAR(20),
    Endereco		VARCHAR(50),
    Cidade			VARCHAR(50),
    CodigoPostal	INTEGER,
    DataNascimento	DATE
);

DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso (
	ID 		INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nome 	VARCHAR(20),
	Duracao INTEGER,
	Tipo 	VARCHAR(40)
);

DROP TABLE IF EXISTS Accao; 
CREATE TABLE Accao (
    ID          INTEGER PRIMARY KEY AUTO_INCREMENT,  
    Numero      INTEGER,
    DataInicial DATE, 
    DataFinal   DATE,
    Coordenador VARCHAR(20),
    IDCurso     INTEGER NOT NULL,
    FOREIGN KEY (IDCurso) REFERENCES Curso(ID)
);

DROP TABLE IF EXISTS Inscricao; 
CREATE TABLE Inscricao(
	DataInscricao	    DATE,
    ClassificacaoFinal  DECIMAL
);

/*
CREATE TABLE TAB1 (
    ID_PARTE1   INTEGER NOT NULL,
    ID_PARTE2   VARCHAR(72)NOT NULL,
    CampoQQ     INTEGER,
    PRIMARY KEY TAB1_PK (ID_PARTE1, ID_PARTE2)
);

-- TAB1  1 <---> *  TAB2

CREATE TABLE TAB2(
    ID  DECIMAL(10,2) PRIMARY KEY,
    /* etc. * /
    IDTAB1_PARTE1   INTEGER NOT NULL,
    IDTAB1_PARTE2   VARCHAR(72)NOT NULL,
    CONSTRAINT TAB1_FK FOREIGN KEY (IDTAB1_PARTE1, IDTAB1_PARTE2) REFERENCES TAB1(ID_PARTE1, ID_PARTE2)
);
*/

/*********************************************

		POPULAR O MODELO DADOS
        
 *********************************************/

INSERT INTO Estudante 
	(NomeEstudante, Endereco, Cidade, CodigoPostal, DataNascimento)
VALUES
	('António', 'Rua do Alecrim, n. 1', 'Albufeira', 3001, '1997-08-22')
;

INSERT INTO Estudante 
	(NomeEstudante, Endereco, Cidade, CodigoPostal, DataNascimento)
VALUES
	('Beatriz', 'Rua do Beato, lote 2', 'Braga', 3002, '1997-02-23'),
	('Catarina', 'Praça da Consituição, n. 3', 'Coimbra', 3003, '1998-02-23'),
	('Diogo', 'Avenida Dom Afonso Lote 4', 'Domelas', 3004, '1995-02-04'),
	('Eduardo', 'Praça de Espanha, n. 5', 'Évora', 3005, '2002-03-05'),
	('Filipa', 'Travessa da Ferreirinha, 6', 'Faro', 3006, '2004-02-29')
;

SELECT NomeEstudante, ID FROM Estudante;
SELECT * FROM Estudante;

ALTER TABLE Estudante ADD COLUMN Nacionalidade VARCHAR(20);

UPDATE Estudante SET Nacionalidade = 'Portuguesa';
-- O Workbench deve "barrar" o comando anterior (e bem, para evitar
-- actualizações erróneas). Como alternativa podemos dar o comando 
-- seguinte para enganar o MySQL e actualizar as linhas todas:
--    UPDATE Estudante SET Nacionalidade = 'Portuguesa' WHERE ID > 0;
-- 

ALTER TABLE Estudante ADD COLUMN Apelido VARCHAR(50);

UPDATE Estudante SET Apelido = 'Américo' WHERE ID = 1;
UPDATE Estudante SET Apelido = 'Bastos' WHERE  ID = 2;
UPDATE Estudante SET Apelido = 'Coelho' WHERE  ID = 3;
UPDATE Estudante SET Apelido = 'Diniz' WHERE  ID = 4;
UPDATE Estudante SET Apelido = 'Esteves' WHERE  ID = 5;
UPDATE Estudante SET Apelido = 'Fernandes' WHERE ID = 6;

-- UPDATE Estudante SET Apelido = 'Américo' WHERE NomeEstudante = 'António';
-- UPDATE Estudante SET Apelido = 'Bastos' WHERE NomeEstudante = 'Beatriz';
-- UPDATE Estudante SET Apelido = 'Coelho' WHERE NomeEstudante = 'Catarina';
-- UPDATE Estudante SET Apelido = 'Diniz' WHERE NomeEstudante = 'Diogo';
-- UPDATE Estudante SET Apelido = 'Esteves' WHERE NomeEstudante = 'Eduardo';
-- UPDATE Estudante SET Apelido = 'Fernandes' WHERE NomeEstudante = 'Filipa';

UPDATE Estudante SET Cidade = 'Espinho' WHERE ID = 5;

DROP TABLE Estudante;
DROP TABLE Inscricao;
DROP TABLE Accao;
DROP TABLE Curso;

