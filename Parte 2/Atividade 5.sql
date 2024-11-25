CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo_material VARCHAR(255) NOT NULL,  
    durabilidade VARCHAR(255) NOT NULL,   
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(7, 2) NOT NULL,
    estoque INT NOT NULL,
    validade DATE, 
    categoria_id BIGINT NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
    ON UPDATE CASCADE
);

INSERT INTO tb_categorias (nome, tipo_material, durabilidade) VALUES
('Fios e Cabos', 'Elétrico', 'Longa vida'),
('Tijolos', 'Construção', 'Médio prazo'),
('Cimento', 'Construção', 'Longa vida'),
('Ferragens', 'Hidráulico', 'Médio prazo'),
('Tintas', 'Acabamento', 'Curto prazo');

INSERT INTO tb_produtos (nome, preco, estoque, validade, categoria_id) VALUES
('Cabo Elétrico 2mm', 10.90, 100, '2024-12-31', 1),
('Cabo Elétrico 4mm', 15.50, 80, '2024-12-31', 1),
('Tijolo Comum', 1.00, 500, '2025-01-01', 2),
('Tijolo Refratário', 3.50, 200, '2025-06-01', 2),
('Cimento CP 32', 30.00, 50, '2025-03-01', 3),
('Cimento CP 40', 35.00, 40, '2025-04-01', 3),
('Válvula de Descarga', 40.00, 150, '2025-02-28', 4),
('Tinta Acrílica', 50.00, 120, '2024-11-30', 5),
('Cabo Elétrico 6mm', 120.00, 50, '2025-05-01', 1),
('Cabo Elétrico 10mm', 200.00, 60, '2025-06-30', 1),
('Tinta Epóxi', 150.00, 40, '2025-08-01', 5),
('Tijolo Cerâmico', 150.00, 200, '2025-04-01', 2),
('Cimento CP 50', 160.00, 20, '2025-07-01', 3),
('Cimento CP 32', 110.00, 50, '2025-09-01', 3),
('Tinta Acrílica Fosca', 90.00, 100, '2024-12-15', 5),
('Válvula de Descarga 1.5', 130.00, 60, '2025-01-30', 4),
('Tinta PVA', 80.00, 120, '2025-02-28', 5),
('Tijolo Refratário Grande', 120.00, 80, '2025-06-15', 2);


SELECT  p.nome AS Nome,
		p.preco AS Preço,
        p.estoque AS Estoque,
        p.validade AS Validade,
		c.nome AS Categoria, 
        c.tipo_material AS Material, 
        c.durabilidade AS Durabilidade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco > 100.00
ORDER BY preco;

SELECT  p.nome AS Nome,
		p.preco AS Preço,
        p.estoque AS Estoque,
        p.validade AS Validade,
		c.nome AS Categoria, 
        c.tipo_material AS Material, 
        c.durabilidade AS Durabilidade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco BETWEEN 70.00 AND 150.00
ORDER BY preco;

SELECT  p.nome AS Nome,
		p.preco AS Preço,
        p.estoque AS Estoque,
        p.validade AS Validade,
		c.nome AS Categoria, 
        c.tipo_material AS Material, 
        c.durabilidade AS Durabilidade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.nome LIKE '%C%'
ORDER BY c.nome;

SELECT  p.nome AS Nome,
		p.preco AS Preço,
        p.estoque AS Estoque,
        p.validade AS Validade,
		c.nome AS Categoria, 
        c.tipo_material AS Material, 
        c.durabilidade AS Durabilidade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
ORDER BY c.nome;

SELECT  p.nome AS Nome,
		p.preco AS Preço,
        p.estoque AS Estoque,
        p.validade AS Validade,
		c.nome AS Categoria, 
        c.tipo_material AS Material, 
        c.durabilidade AS Durabilidade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.tipo_material = 'Hidráulico'
ORDER BY nome;


