CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT,
    classe VARCHAR(30) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_classes (classe, arma) VALUES ('Iniciante', 'Arma de treinamento');

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    atk INT NOT NULL,
    def INT NOT NULL,
    id_classe BIGINT NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
    ON UPDATE CASCADE
);


INSERT INTO tb_classes (classe, arma) VALUES 
('Guerreiro', 'Espada Longa'),
('Mago', 'Cajado Arcano'),
('Arqueiro', 'Arco Composto'),
('Assassino', 'Adagas Duplas'),
('Paladino', 'Martelo Sagrado'),
('Necromante', 'Cetro das Sombras'),
('Monge', 'Manoplas de Combate'),
('Bardo', 'Lira Mágica'),
('Druida', 'Bastão da Natureza'),
('Mercenário', 'Machado de Batalha');


INSERT INTO tb_personagens (nome, nivel, atk, def, id_classe) VALUES
('Thalion', 5, 2000, 2300, 2),
('Eryndor', 10, 1200, 1000, 3),
('Lyanna', 8, 2000, 1300, 4),
('Kaelthas', 12, 500, 300, 1),
('Aurelia', 15, 2500, 500, 5),
('Morgrim', 7, 1100, 1700, 6),
('Zenthar', 9, 1300, 400, 7),
('Sylvina', 11, 900, 600, 8),
('Faelar', 6, 1400, 1000, 9),
('Draven', 14, 3000, 200, 10),
('Carl', 99, 9980, 9995, 2);


SELECT nome AS Nome,
	   nivel AS Nivel,
       atk AS 'Poder de Ataque',
       def AS 'Poder de Defesa',
       classe AS Classe,
       arma AS Arma
FROM tb_personagens 
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE atk > 2000
ORDER BY atk DESC;

SELECT nome AS Nome,
	   nivel AS Nivel,
       atk AS 'Poder de Ataque',
       def AS 'Poder de Defesa',
       classe AS Classe,
       arma AS Arma
FROM tb_personagens 
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE def BETWEEN 1000 AND 2000 
ORDER BY def DESC;

SELECT nome AS Nome,
	   nivel AS Nivel,
       atk AS 'Poder de Ataque',
       def AS 'Poder de Defesa',
       classe AS Classe,
       arma AS Arma
FROM tb_personagens 
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE nome LIKE '%c%'
ORDER BY nome;

SELECT nome AS Nome,
	   nivel AS Nivel,
       atk AS 'Poder de Ataque',
       def AS 'Poder de Defesa',
       classe AS Classe,
       arma AS Arma
FROM tb_personagens 
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
ORDER BY nome;

SELECT nome AS Nome,
	   nivel AS Nivel,
       atk AS 'Poder de Ataque',
       def AS 'Poder de Defesa',
       classe AS Classe,
       arma AS Arma
FROM tb_personagens 
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE classe LIKE 'Guerreiro'
ORDER BY nivel DESC;
