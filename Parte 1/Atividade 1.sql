CREATE DATABASE RH;

USE RH;

CREATE TABLE Colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    dataadmissao DATE NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    telefone VARCHAR(11),
    email VARCHAR(255) UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO Colaboradores (nome, dataadmissao, salario, telefone, email)
VALUES 
('João Silva', '2024-03-15', 1500.50, '11987654321', 'joao.silva@empresa.com'),
('Maria Oliveira', '2018-06-22', 4200.75, '11912345678', 'maria.oliveira@empresa.com'),
('Carlos Souza', '2021-09-10', 5000.00, '11876543210', 'carlos.souza@empresa.com'),
('Ana Costa', '2024-11-05', 1800.30, '11965432109', 'ana.costa@empresa.com'),
('Pedro Almeida', '2022-02-20', 4500.60, '11890765432', 'pedro.almeida@empresa.com');

SELECT  nome AS Nome,
		dataadmissao AS 'Data de admissão', 
        salario AS Salário, 
        telefone AS Telefone, 
        email AS Email
FROM Colaboradores 
WHERE salario > 2000
ORDER BY salario DESC;

SELECT  nome AS Nome,
		dataadmissao AS 'Data de admissão', 
        salario AS Salário, 
        telefone AS Telefone, 
        email AS Email
FROM Colaboradores 
WHERE salario < 2000
ORDER BY salario DESC;

UPDATE Colaboradores SET salario = 3000.86 WHERE id = 1;

