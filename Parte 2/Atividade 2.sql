CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,      
    nome VARCHAR(100) NOT NULL,    
    promocional BIT NOT NULL,                
    PRIMARY KEY (id)
);


CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT,       
    nome VARCHAR(255) NOT NULL,     
    preco DECIMAL(10, 2) NOT NULL,  
    tamanho VARCHAR(50),
    calorias DECIMAL(6,2),
    id_categoria BIGINT NOT NULL,   
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
    ON UPDATE CASCADE
);

INSERT INTO tb_categorias (nome, promocional) VALUES
('Tradicional', 0),
('Especial', 1),
('Vegetariana', 0),
('Vegana', 0),
('Doces', 1),
('Salgadas', 0),
('Sem Glúten', 0),
('Low Carb', 0),
('Premium', 1),
('Clássicas', 0);

INSERT INTO tb_pizzas (nome, preco, tamanho, calorias, id_categoria) VALUES
('Margherita', 29.90, 'Média', 750.00, 1),
('Calabresa', 34.90, 'Grande', 900.00, 1),
('Quatro Queijos', 39.90, 'Média', 850.00, 2),
('Portuguesa', 37.90, 'Grande', 950.00, 2),
('Vegetariana', 33.50, 'Média', 600.00, 3),
('Vegana Especial', 42.00, 'Média', 550.00, 4),
('Brigadeiro', 27.90, 'Pequena', 1200.00, 5),
('Frango com Catupiry', 35.90, 'Grande', 850.00, 6),
('Suprema Sem Glúten', 44.90, 'Média', 650.00, 7),
('Low Carb Fit', 49.90, 'Pequena', 400.00, 8),
('Trufada Premium', 79.90, 'Grande', 1200.00, 9),  
('Lobster Deluxe', 99.90, 'Grande', 1100.00, 9),   
('Golden Vegana', 89.90, 'Média', 800.00, 4),      
('Chocolate Belga Especial', 85.50, 'Média', 1500.00, 5), 
('Suprema Low Carb', 95.00, 'Pequena', 450.00, 8), 
('Diamante Negro', 89.90, 'Pequena', 1400.00, 5),  
('Frutos do Mar Deluxe', 92.00, 'Grande', 1150.00, 2),
('Pesto Gourmet', 82.50, 'Média', 780.00, 1),
('Carne Wagyu Especial', 120.00, 'Grande', 1350.00, 9),
('Quatro Queijos Trufados', 87.90, 'Média', 950.00, 2);

SELECT  tb_pizzas.nome AS Nome,
	    preco AS Preço,
        tamanho AS Tamanho,
        calorias AS Calorias,
        tb_categorias.nome as Categoria,
        CASE 
			WHEN tb_categorias.promocional = 1 THEN 'Sim'
			ELSE 'Não'
		END AS Promocional
FROM tb_pizzas 
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
WHERE preco > 45.00
ORDER BY preco;

SELECT  tb_pizzas.nome AS Nome,
	    preco AS Preço,
        tamanho AS Tamanho,
        calorias AS Calorias,
        tb_categorias.nome as Categoria,
        CASE 
			WHEN tb_categorias.promocional = 1 THEN 'Sim'
			ELSE 'Não'
		END AS Promocional
FROM tb_pizzas 
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
WHERE preco Between 50.00 AND 100.00
ORDER BY preco;

SELECT  tb_pizzas.nome AS Nome,
	    preco AS Preço,
        tamanho AS Tamanho,
        calorias AS Calorias,
        tb_categorias.nome as Categoria,
        CASE 
			WHEN tb_categorias.promocional = 1 THEN 'Sim'
			ELSE 'Não'
		END AS Promocional
FROM tb_pizzas 
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_pizzas.nome LIKE '%M%'
ORDER BY tb_pizzas.nome;

SELECT  tb_pizzas.nome AS Nome,
	    preco AS Preço,
        tamanho AS Tamanho,
        calorias AS Calorias,
        tb_categorias.nome as Categoria,
        CASE 
			WHEN tb_categorias.promocional = 1 THEN 'Sim'
			ELSE 'Não'
		END AS Promocional
FROM tb_pizzas 
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
ORDER BY tb_pizzas.nome;


SELECT  tb_pizzas.nome AS Nome,
	    preco AS Preço,
        tamanho AS Tamanho,
        calorias AS Calorias,
        tb_categorias.nome as Categoria,
        CASE 
			WHEN tb_categorias.promocional = 1 THEN 'Sim'
			ELSE 'Não'
		END AS Promocional
FROM tb_pizzas 
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE 'Doces'
ORDER BY tb_pizzas.nome;

