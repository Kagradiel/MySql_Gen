CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE Produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    categoria VARCHAR(50),
    estoque INT,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO Produtos(nome, preco, categoria, estoque, descricao)
VALUES 
('Smartphone XYZ', 1999.99, 'Eletrônicos', 50, 'Smartphone com tela de 6.5 polegadas, câmera de 48MP e 128GB de armazenamento.'),
('Camiseta Básica', 49.90, 'Roupas', 150, 'Camiseta unissex de algodão, disponível em várias cores e tamanhos.'),
('Tênis Running', 299.99, 'Calçados', 80, 'Tênis confortável para corrida, com sola amortecida e design moderno.'),
('Cafeteira Elétrica', 129.90, 'Eletrodomésticos', 30, 'Cafeteira de 1,2L com sistema anti-gotejamento e filtros reutilizáveis.'),
('Fone de Ouvido Bluetooth', 149.90, 'Acessórios', 200, 'Fone de ouvido sem fio, com cancelamento de ruído e até 10 horas de bateria.'),
('Relógio Digital', 89.90, 'Acessórios', 120, 'Relógio digital com display LED, resistente à água e várias funções.'),
('Notebook UltraSlim', 3499.00, 'Eletrônicos', 40, 'Notebook leve e potente, com processador Intel i7 e 16GB de RAM.'),
('Livro "A Jornada"', 39.90, 'Livros', 75, 'Romance inspirador sobre superação e desenvolvimento pessoal.');

SELECT  nome  AS Nome,
		preco AS Preço, 
        categoria AS Categoria, 
        estoque AS 'Quantidade em estoque', 
        descricao AS 'Descrição do produto'
FROM Produtos
WHERE preco > 500
ORDER BY categoria;

SELECT  nome  AS Nome,
		preco AS Preço, 
        categoria AS Categoria, 
        estoque AS 'Quantidade em estoque', 
        descricao AS 'Descrição do produto'
FROM Produtos
WHERE preco < 500
ORDER BY categoria;

UPDATE Produtos 
SET preco = preco * 0.90 
WHERE categoria = 'Acessórios' AND id > 0;