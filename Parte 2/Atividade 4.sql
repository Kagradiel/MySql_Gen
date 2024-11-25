CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    corte VARCHAR(255) NOT NULL,
    premium BIT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(6, 2) NOT NULL,
    estoque INT NOT NULL,
    validade DATE, 
    categoria_id BIGINT NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
    ON UPDATE CASCADE
);

INSERT INTO tb_categorias (corte, premium) VALUES
('Cortes Bovinos', 1),
('Cortes Suínos', 0),
('Frangos', 0),
('Linguiças e Embutidos', 0),
('Cortes Especiais', 1),
('Outros Produtos', 0);


INSERT INTO tb_produtos (nome, preco, estoque, validade, categoria_id) VALUES
('Picanha Bovina', 79.90, 50, '2024-12-15', 1),
('Alcatra Bovina', 59.90, 30, '2024-12-10', 1),
('Fraldinha Bovina', 49.90, 40, '2024-12-05', 1),
('Maminha Bovina', 69.90, 25, '2024-12-20', 1),
('Contrafilé Bovina', 85.00, 15, '2024-12-18', 1),
('Coxão Mole Bovina', 42.00, 50, '2024-12-25', 1),
('Coxão Duro Bovina', 39.90, 60, '2024-12-30', 1),
('Filé Mignon Bovina', 99.90, 10, '2024-12-10', 5),
('Peito de Frango', 19.90, 100, '2024-12-12', 3),
('Coxa de Frango', 14.90, 120, '2024-12-14', 3),
('Linguiça Calabresa', 24.90, 150, '2024-12-30', 4),
('Linguiça Toscana', 22.00, 130, '2024-12-20', 4),
('Costela Suína', 42.90, 40, '2024-12-25', 2),
('Costela Bovina', 72.00, 20, '2024-12-27', 1),
('Pernil Suíno', 39.00, 35, '2024-12-18', 2),
('Peito de Peru', 54.90, 10, '2024-12-15', 3),
('Bacon', 15.90, 200, '2024-12-31', 4),
('Presunto de Frango', 13.90, 180, '2024-12-30', 3),
('Carne Moída Bovina', 29.90, 60, '2024-12-22', 1),
('Linguiça de Frango', 19.90, 90, '2024-12-25', 4);



SELECT  
    nome AS Nome,
    preco AS Preço,
    estoque AS Estoque,
    validade AS Validade,
    corte AS Categoria,
    CASE 
        WHEN premium = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Corte Premium'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE preco > 50.00
ORDER BY preco;

SELECT  
    nome AS Nome,
    preco AS Preço,
    estoque AS Estoque,
    validade AS Validade,
    corte AS Categoria,
    CASE 
        WHEN premium = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Corte Premium'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE preco BETWEEN 50.00 AND 150.00
ORDER BY preco;

SELECT  
    nome AS Nome,
    preco AS Preço,
    estoque AS Estoque,
    validade AS Validade,
    corte AS Categoria,
    CASE 
        WHEN premium = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Corte Premium'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE nome LIKE '%C%'
ORDER BY categoria;

SELECT  
    nome AS Nome,
    preco AS Preço,
    estoque AS Estoque,
    validade AS Validade,
    corte AS Categoria,
    CASE 
        WHEN premium = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Corte Premium'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
ORDER BY categoria;

SELECT  
    nome AS Nome,
    preco AS Preço,
    estoque AS Estoque,
    validade AS Validade,
    corte AS Categoria,
    CASE 
        WHEN premium = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Corte Premium'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE corte LIKE 'Frangos'
ORDER BY nome;
