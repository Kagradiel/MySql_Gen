CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    receita BIT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    estoque INT NOT NULL,
    id_categorias BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categorias) REFERENCES tb_categorias(id)
    ON UPDATE CASCADE
);


INSERT INTO tb_categorias (tipo, receita) VALUES
('Medicamento', 1),  
('Cosmetico', 0),    
('Suplemento', 0),   
('Higiene', 0),      
('Farmacêutico', 1), 
('Bem-estar', 0);    

INSERT INTO tb_produtos (nome, tamanho, preco, estoque, id_categorias) VALUES
('Paracetamol', '500mg', 9.90, 100, 1),  
('Ibuprofeno', '400mg', 15.50, 50, 1),  
('Pomada para dor', '30g', 12.00, 75, 1), 
('Shampoo Hidratante', '200ml', 18.90, 120, 2), 
('Condicionador Fortalecedor', '250ml', 22.50, 60, 2), 
('Suplemento de Vitamina C', '60 cápsulas', 29.90, 200, 3), 
('Multivitamínico', '30 cápsulas', 39.90, 150, 3), 
('Creme para mãos', '50g', 10.50, 80, 2),  
('Desodorante Spray', '150ml', 13.00, 200, 4), 
('Sabonete Líquido', '250ml', 7.90, 300, 4), 
('Papel higiênico', '4 rolos', 6.50, 500, 4), 
('Pomada para assaduras', '40g', 9.90, 90, 4), 
('Cabelos Cacheados Creme', '200g', 20.00, 110, 2), 
('Álcool em Gel', '500ml', 5.99, 200, 4), 
('Protetor Solar', '100ml', 35.90, 60, 2), 
('Máscara Capilar', '300g', 28.00, 50, 2), 
('Suplemento de Magnésio', '120 cápsulas', 45.00, 80, 3), 
('Suplemento Whey Protein', '900g', 149.90, 40, 3), 
('Aspirina', '500mg', 7.50, 100, 1), 
('Antigripal', '20 comprimidos', 19.90, 150, 1); 


SELECT  
    nome AS Nome,
    preco AS Preço,
    tamanho AS Tamanho,
    estoque AS Estoque,
    tipo AS Categoria,
    CASE 
        WHEN receita = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Precisa de Receita'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
WHERE preco > 50.00
ORDER BY nome;

SELECT  
    nome AS Nome,
    preco AS Preço,
    tamanho AS Tamanho,
    estoque AS Estoque,
    tipo AS Categoria,
    CASE 
        WHEN receita = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Precisa de Receita'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
WHERE preco BETWEEN 5.00 AND 60.00
ORDER BY nome;

SELECT  
    nome AS Nome,
    preco AS Preço,
    tamanho AS Tamanho,
    estoque AS Estoque,
    tipo AS Categoria,
    CASE 
        WHEN receita = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Precisa de Receita'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
WHERE nome LIKE '%C%'
ORDER BY nome;

SELECT  
    nome AS Nome,
    preco AS Preço,
    tamanho AS Tamanho,
    estoque AS Estoque,
    tipo AS Categoria,
    CASE 
        WHEN receita = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Precisa de Receita'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
ORDER BY nome;

SELECT  
    nome AS Nome,
    preco AS Preço,
    tamanho AS Tamanho,
    estoque AS Estoque,
    tipo AS Categoria,
    CASE 
        WHEN receita = 1 THEN 'Sim'
        ELSE 'Não'
    END AS 'Precisa de Receita'
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
WHERE tipo LIKE 'Cosmetico'
ORDER BY nome;


