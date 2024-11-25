CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    duracao INT NOT NULL, 
    categoria_id BIGINT NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
    ON UPDATE CASCADE
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Java', 'Curso de programação Java, desde o básico até o avançado'),
('Python', 'Curso de programação Python, com foco em automação e análise de dados'),
('Desenvolvimento Web', 'Curso de desenvolvimento para web utilizando HTML, CSS, JS e frameworks'),
('Design Gráfico', 'Curso de design gráfico, edição de imagens e criação de layouts'),
('Marketing Digital', 'Curso sobre estratégias de marketing digital, SEO, anúncios pagos, etc.');


INSERT INTO tb_cursos (nome, descricao, preco, duracao, categoria_id) VALUES
('Introdução ao Java', 'Curso introdutório sobre Java, focado em lógica de programação', 400.00, 40, 1),
('Java Avançado', 'Curso avançado de Java, cobrindo tópicos como design patterns, JPA, Spring', 950.00, 100, 1),
('Python para Iniciantes', 'Curso de Python para iniciantes, com foco em sintaxe e estrutura de dados', 300.00, 30, 2),
('Automação com Python', 'Curso para automatizar tarefas com Python, como scraping e automação de sistemas', 700.00, 60, 2),
('Desenvolvimento Web Básico', 'Curso básico de desenvolvimento para web, abordando HTML, CSS e JS', 350.00, 40, 3),
('Desenvolvimento Web Avançado', 'Curso avançado de desenvolvimento web com React, Node.js e MongoDB', 850.00, 80, 3),
('Fundamentos do Design Gráfico', 'Curso sobre fundamentos do design gráfico, tipografia, cores, composição', 500.00, 50, 4),
('Marketing Digital para Iniciantes', 'Curso para iniciantes no marketing digital, cobrindo SEO, mídias sociais e anúncios pagos', 600.00, 45, 5);


SELECT c.id, 
       c.nome AS Nome, 
       c.descricao AS Descrição, 
       c.preco AS Preço, 
       CONCAT(c.duracao, ' horas') AS 'Carga horaria', 
       cat.nome AS Categoria, 
       cat.descricao AS Descrição
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE c.preco > 500.00
ORDER BY c.preco DESC;

SELECT c.id, 
       c.nome AS Nome, 
       c.descricao AS Descrição, 
       c.preco AS Preço, 
       CONCAT(c.duracao, ' horas') AS 'Carga horaria', 
       cat.nome AS Categoria, 
       cat.descricao AS Descrição
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE c.preco BETWEEN 600.00 AND 1000.00
ORDER BY c.preco;


SELECT c.id, 
       c.nome AS Nome, 
       c.descricao AS Descrição, 
       c.preco AS Preço, 
       CONCAT(c.duracao, ' horas') AS 'Carga horaria', 
       cat.nome AS Categoria, 
       cat.descricao AS Descrição
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE c.nome LIKE '%J%'
ORDER BY c.nome;


SELECT c.id, 
       c.nome AS Nome, 
       c.descricao AS Descrição, 
       c.preco AS Preço, 
       CONCAT(c.duracao, ' horas') AS 'Carga horaria', 
       cat.nome AS Categoria, 
       cat.descricao AS Descrição
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
ORDER BY c.nome;

SELECT c.id, 
       c.nome AS Nome, 
       c.descricao AS Descrição, 
       c.preco AS Preço, 
       CONCAT(c.duracao, ' horas') AS 'Carga horaria', 
       cat.nome AS Categoria, 
       cat.descricao AS Descrição
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome = 'Java'
ORDER BY c.preco DESC;

