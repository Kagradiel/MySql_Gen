CREATE DATABASE escola;

USE escola;

CREATE TABLE estudantes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    media decimal(3,1),
    datanascimento DATE NOT NULL,
    matricula INT(30) NOT NULL,
    curso VARCHAR(35) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO estudantes (nome, media, datanascimento, matricula, curso, email)
VALUES 
('João Silva', 8.5, '2000-05-15', 2023001, 'Engenharia Civil', 'joao.silva@email.com'),
('Maria Oliveira', 9.2, '1999-08-22', 2023002, 'Medicina', 'maria.oliveira@email.com'),
('Carlos Souza', 7.6, '2001-02-10', 2023003, 'Direito', 'carlos.souza@email.com'),
('Ana Santos', 8.0, '1998-11-30', 2023004, 'Arquitetura', 'ana.santos@email.com'),
('Pedro Costa', 6.9, '2000-12-18', 2023005, 'Psicologia', 'pedro.costa@email.com'),
('Juliana Lima', 9.0, '2001-06-07', 2023006, 'Biologia', 'juliana.lima@email.com'),
('Lucas Pereira', 5.8, '1999-03-25', 2023007, 'Engenharia Mecânica', 'lucas.pereira@email.com'),
('Fernanda Rodrigues', 9.5, '2000-09-14', 2023008, 'Design Gráfico', 'fernanda.rodrigues@email.com');



SELECT  nome AS Nome,
		media AS Media,
		datanascimento AS 'Data de Nascimento',
        matricula AS 'Numero de Matrícula',
        curso AS Curso,
        email AS Email
FROM estudantes
WHERE media > 7.0
ORDER BY media DESC;

SELECT  nome AS Nome,
		media AS Media,
		datanascimento AS 'Data de Nascimento',
        matricula AS 'Numero de Matrícula',
        curso AS Curso,
        email AS Email
FROM estudantes
WHERE media < 7.0
ORDER BY media DESC;

ALTER TABLE estudantes ADD COLUMN aprovacao VARCHAR(9);

UPDATE estudantes 
SET aprovacao = 
	CASE
		WHEN media > 7.0 THEN 'Aprovado'
        ELSE 'Reprovado'
	END
WHERE id > 0;
    
SELECT  nome AS Nome,
		media AS Media,
		datanascimento AS 'Data de Nascimento',
        matricula AS 'Numero de Matrícula',
        curso AS Curso,
        email AS Email,
        aprovacao AS Aprovação
FROM estudantes
ORDER BY media DESC;