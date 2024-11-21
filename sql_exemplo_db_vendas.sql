
use db_vendas_marcella;
select * from tb_vendas_produtos;
select * from tb_vendas;
select * from tb_categorias;
select * from tb_produtos;
select * from tb_clientes;
-- ------------------------------group by com ou sem having--------------------------------

-- Qual é o total gasto por cada cliente em todas as suas compras?
select cli_nome, sum(ven_total) from tb_vendas join tb_clientes on ven_cli_id = cli_id group by ven_cli_id;

-- Quais produtos foram vendidos em mais de uma venda e quantas vezes cada um foi vendido?
select vpr_pro_id, count(vpr_ven_id) from tb_vendas_produtos group by vpr_pro_id having count(vpr_ven_id)>1;

-- Qual é a média de quantidade vendida por produto para cada categoria?
select avg(vpr_quantProduto), cat_nome from tb_vendas_produtos join tb_produtos on vpr_pro_id = pro_id join tb_categorias on pro_categoria_id = cat_id group by cat_id;

-- Quais clientes realizaram mais de uma compra?
-- Qual é a média de preço dos produtos vendidos em cada categoria?
-- Quais categorias tiveram um total de vendas superior a um valor específico?
-- Qual é a data e o valor da compra mais cara de cada cliente?
-- Quais produtos têm uma quantidade total vendida superior a um valor específico?
-- Qual foi a média de valor gasto em cada mês?
-- Quais clientes compraram produtos de categorias diferentes em suas compras?


-- ------------------------------Apenas com subconsultas--------------------------------


-- Qual é o nome do cliente que realizou a compra mais cara?
select cli_nome, ven_total from tb_vendas join tb_clientes on ven_cli_id=cli_id where ven_total = (select max(ven_total) from tb_vendas);

-- Quais produtos nunca foram vendidos?
select * from tb_produtos join tb_vendas_produtos on pro_id=vpr_pro_id where pro_id not in (select vpr_pro_id from tb_vendas_produtos);
select * from tb_produtos where pro_id not in (select vpr_pro_id from tb_vendas_produtos);

-- Quais clientes nunca realizaram uma compra?
select * from tb_clientes where cli_id not in (select ven_cli_id from tb_vendas);
select ven_cli_id from tb_vendas;

-- Qual é o nome e o e-mail do cliente que mais gastou em todas as suas compras?
-- Quais produtos foram vendidos pelo menor preço em relação ao seu preço original?
-- Qual é o segundo maior valor total de uma venda?
-- Quais são os nomes dos clientes que compraram apenas uma vez?
-- Quais categorias de produtos nunca foram vendidas?
-- Qual foi o mês com o maior valor total de vendas em todo o histórico?
-- Quais clientes compraram o produto mais caro vendido na loja?













-- Atividade 


-- 1. Qual o valor total de todas as vendas registradas no sistema?
select sum(ven_total) from tb_vendas;

--  2. Quantos produtos estão disponíveis em estoque?

select sum(pro_quantidade) from tb_produtos where pro_status = 'disponível';

 -- 3. Qual é o preço médio dos produtos cadastrados?
 select avg(pro_preco) from tb_produtos;
 
--  4. Quantos produtos estão indisponíveis em estoque?
select count(pro_nome) from tb_produtos where pro_status = 'indisponível';

--  5. Quantas vendas foram realizadas pelos clientes que começam com a letra A?
select count(cli_nome) from tb_vendas join tb_clientes on ven_cli_id=cli_id where cli_nome like 'A%';

 -- 6. Qual o nome e o preço do produto mais caro da categoria 'Eletrônicos'?
-- errado! select pro_nome, pro_preco from tb_produtos join tb_categorias on pro_categoria_id = cat_id where pro_preco = max(pro_preco) and cat_nome = 'Eletrônicos';
 select pro_nome, max(pro_preco) from tb_produtos join tb_categorias on pro_categoria_id = cat_id where cat_nome = 'Eletrônicos';
 
--  7. Qual é o nome e o preço do produto mais barato da categoria 'Brinquedos'?
select pro_nome, min(pro_preco) from tb_produtos join tb_categorias on pro_categoria_id = cat_id where cat_nome ='Brinquedos';


 -- 8. Quantos produtos diferentes foram vendidos em todas as vendas?
select count(distinct vpr_pro_id) from tb_vendas_produtos;
 
-- 9. Qual é a média de produtos vendidos por venda?
select avg(vpr_quantProduto) from tb_vendas_produtos;

--  10. Quantos clientes diferentes realizaram compras?
select count(distinct ven_cli_id) from tb_vendas;

-- 11. Qual é o valor médio das vendas realizadas?
select avg(ven_total) from tb_vendas;

-- 12. Qual é o total de produtos das categorias 'Móveis, Livros e Informática'?
select sum(pro_quantidade) from tb_produtos join tb_categorias on pro_categoria_id = cat_id where cat_nome in ('Móveis','Livros','Informática');

-- 13. Quantas vendas foram realizadas entre os dias 6 e 12 de outubro de 2024?
select count(ven_id) from tb_vendas where ven_data between '2024-10-06' and '2024-10-12';

 -- 14. Quantos produtos foram vendidos entre os dias 9 e 14 de outubro de 2024?
 select sum(vpr_quantProduto) from tb_vendas_produtos join tb_vendas on vpr_ven_id = ven_id where ven_data between '2024-10-09' and '2024-10-14';
 
--  15. Quais os nomes dos clientes que compraram entre os dias 4 e 10 de outubro de 2024?
select cli_nome from tb_clientes join tb_vendas on ven_cli_id = cli_id where ven_data between '2024-10-04' and '2024-10-10';

 -- 16. Quantos produtos que começam com a letra 'A' estão disponíveis e quantos estão indisponíveis?
select count(pro_nome) from tb_produtos where pro_nome like 'A%' and pro_status = 'disponível';
select count(pro_nome) from tb_produtos where pro_nome like 'A%' and pro_status = 'indisponível';


-- --------------- Group By ----------------------
-- 17. Exiba o nome da marca e a quantidade total de produtos vendidos por marca.
select pro_marca, sum(vpr_quantProduto) from tb_produtos join tb_vendas_produtos on vpr_pro_id = pro_id group by pro_marca;

-- 18. Lista o nome da categoria, quantidade de produtos distintos dessa categoria e o valor total de vendas da mesma.
select cat_nome, count(distinct pro_nome), count(vpr_ven_id) from tb_categorias join tb_produtos on pro_categoria_id = cat_id join tb_vendas_produtos on vpr_pro_id = pro_id group by cat_nome;

-- 19. Mostre o nome do cliente e valor total das compras de cada, ordenado pelo total em ordem decrescente.
select cli_nome, sum(ven_total) from tb_clientes join tb_vendas on ven_cli_id = cli_id group by ven_cli_id order by sum(ven_total) desc;

-- 20. Liste os produtos, sua quantidade em estoque e a quantidade vendida, ordenando pelos mais vendidos.
select pro_nome, pro_quantidade, sum(vpr_quantProduto) from tb_produtos join tb_vendas_produtos on vpr_pro_id = pro_id group by pro_id order by sum(vpr_quantProduto) desc;

-- 21. Exiba a data, número de vendas realizadas e a quantidade de produtos vendidos no dia. Exiba os últimos dez dias que ocorreram vendas.


-- 22. Mostre a data e a média do valor total das vendas realizadas por dia, de todos os dias, em ordem decrescente pelo valor médio.
-- 23. Exiba o preço médio dos produtos vendidos por categoria, ordenados de forma crescente pelo nome da categoria.
-- 24. Exiba o número de produtos diferentes vendidos em cada venda, exibindo também a data da venda.
-- 25. Lista os 5 produtos mais vendidos nos últimos 15 dias de vendas.
-- 26. Exiba os dados da última venda de cada cliente.
-- 27. Exiba os dados da venda mais cara de cada cliente.
-- 28.  Mostrar o valor total das vendas realizadas por marca de produto.

select * from tb_vendas_produtos;
select * from tb_vendas;
select * from tb_categorias;
select * from tb_produtos;
select * from tb_clientes;












-- Funções de agregação

select sum(ven_total) from tb_vendas; -- soma todas as colunas ven_total da tabela tb_vendas

select avg(ven_total) from tb_vendas; -- faz a média dos valores que estão na coluna ven_total da tabela tb_vendas

select max(ven_total) from tb_vendas; -- maior valor da coluna ven_total da tabela tb_vendas

select min(ven_total) from tb_vendas; -- menor valor da coluna ven_total da tabela tb_vendas

select max(pro_quantidade) from tb_produtos;

select sum(ven_total) from tb_vendas join tb_clientes on ven_cli_id = cli_id where cli_nome = "Ana Silva";

select sum(ven_total) from tb_vendas join tb_clientes on ven_cli_id = cli_id where cli_nome in ("Ana Silva", "João Santos");
select cli_nome, ven_total, ven_data from tb_vendas join tb_clientes on ven_cli_id = cli_id where cli_nome in ("Ana Silva", "João Santos");

select sum(vpr_quantProduto) from tb_vendas_produtos join tb_produtos on vpr_pro_id = pro_id where vpr_pro_id = 2;

select * from tb_vendas_produtos;
select * from tb_vendas;
select * from tb_categorias;
select * from tb_produtos;
select * from tb_clientes;

create database db_vendas_marcella;
use db_vendas_marcella;


CREATE TABLE tb_categorias (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,  
    cat_nome VARCHAR(50) NOT NULL            
);


CREATE TABLE tb_produtos (
    pro_id INT PRIMARY KEY AUTO_INCREMENT,         
    pro_nome VARCHAR(100) NOT NULL,                
    pro_descricao TEXT,                            
    pro_preco DECIMAL(10, 2) NOT NULL,           
    pro_quantidade INT NOT NULL,                   
    pro_data_cadastro DATETIME NOT NULL,           
    pro_status ENUM('disponível', 'indisponível') DEFAULT 'disponível', 
    pro_marca VARCHAR(50),                         
    pro_categoria_id INT,                          
    FOREIGN KEY (pro_categoria_id) REFERENCES tb_categorias(cat_id) 
);


INSERT INTO tb_categorias (cat_nome) VALUES
('Eletrônicos'),
('Roupas'),
('Livros'),
('Móveis'),
('Brinquedos'),
('Informática'),
('Esportes'),
('Eletrodomésticos'),
('Automotivo'),
('Beleza e Saúde');


INSERT INTO tb_produtos (pro_nome, pro_descricao, pro_preco, pro_quantidade, pro_data_cadastro, pro_status, pro_marca, pro_categoria_id) VALUES
('Smartphone XYZ', 'Smartphone com 128GB de armazenamento', 2999.99, 50, '2024-10-09 10:00:00', 'disponível', 'MarcaX', 1),
('Camiseta Polo', 'Camiseta polo 100% algodão', 79.90, 200, '2024-10-09 11:00:00', 'disponível', 'MarcaY', 2),
('Livro de Programação', 'Guia completo sobre programação em Python', 59.90, 150, '2024-10-09 12:00:00', 'disponível', 'Editora Z', 3),
('Sofá 3 Lugares', 'Sofá confortável para sala de estar', 1899.00, 20, '2024-10-09 13:00:00', 'disponível', 'MarcaA', 4),
('Carrinho de Brinquedo', 'Carrinho de brinquedo para crianças', 49.90, 100, '2024-10-09 14:00:00', 'disponível', 'MarcaB', 5),
('Notebook Gamer', 'Notebook com processador i7 e 16GB de RAM', 5499.90, 30, '2024-10-09 15:00:00', 'disponível', 'MarcaC', 6),
('Tênis de Corrida', 'Tênis leve e confortável para corridas longas', 399.90, 120, '2024-10-09 16:00:00', 'disponível', 'MarcaD', 7),
('Geladeira Frost Free', 'Geladeira com tecnologia Frost Free e 400L', 2999.00, 15, '2024-10-09 17:00:00', 'disponível', 'MarcaE', 8),
('Kit de Ferramentas', 'Kit com 100 peças para reparos automotivos', 299.90, 50, '2024-10-09 18:00:00', 'disponível', 'MarcaF', 9),
('Secador de Cabelo', 'Secador com tecnologia íon cerâmica', 149.90, 80, '2024-10-09 19:00:00', 'disponível', 'MarcaG', 10),

('Mouse Gamer', 'Mouse com 16000 DPI e 8 botões programáveis', 199.90, 150, '2024-10-09 20:00:00', 'disponível', 'MarcaH', 6),
('Monitor 24 Polegadas', 'Monitor Full HD com tecnologia IPS', 799.90, 80, '2024-10-09 20:10:00', 'disponível', 'MarcaI', 6),
('Teclado Mecânico', 'Teclado mecânico RGB com switches rápidos', 299.90, 120, '2024-10-09 20:20:00', 'disponível', 'MarcaJ', 6),
('Cadeira Gamer', 'Cadeira ergonômica com ajuste de altura', 999.90, 40, '2024-10-09 20:30:00', 'disponível', 'MarcaK', 6),
('Mochila para Notebook', 'Mochila resistente à água para notebooks de até 15.6 polegadas', 149.90, 100, '2024-10-09 20:40:00', 'disponível', 'MarcaL', 6),

('Bola de Futebol', 'Bola oficial de futebol, tamanho padrão', 99.90, 200, '2024-10-09 20:50:00', 'disponível', 'MarcaM', 7),
('Bicicleta Mountain Bike', 'Bicicleta para trilhas e estradas, aro 29', 2499.90, 30, '2024-10-09 21:00:00', 'disponível', 'MarcaN', 7),
('Luvas de Boxe', 'Par de luvas de boxe tamanho M', 199.90, 70, '2024-10-09 21:10:00', 'disponível', 'MarcaO', 7),
('Halteres Ajustáveis', 'Par de halteres ajustáveis com até 20kg', 399.90, 50, '2024-10-09 21:20:00', 'disponível', 'MarcaP', 7),
('Esteira Elétrica', 'Esteira dobrável com 12 programas de treino', 3499.90, 20, '2024-10-09 21:30:00', 'disponível', 'MarcaQ', 7),

('Fogão 4 Bocas', 'Fogão a gás com acendimento automático', 899.90, 25, '2024-10-09 21:40:00', 'disponível', 'MarcaR', 8),
('Aspirador de Pó', 'Aspirador portátil com filtro HEPA', 299.90, 60, '2024-10-09 21:50:00', 'disponível', 'MarcaS', 8),
('Micro-ondas 30L', 'Micro-ondas digital com funções pré-programadas', 499.90, 45, '2024-10-09 22:00:00', 'disponível',  'MarcaT', 8),
('Máquina de Lavar 12kg', 'Máquina de lavar com 12 programas de lavagem', 1999.90, 15, '2024-10-09 22:10:00', 'disponível', 'MarcaU', 8),
('Liquidificador 1000W', 'Liquidificador com jarra de vidro resistente', 199.90, 80, '2024-10-09 22:20:00', 'disponível', 'MarcaV', 8),

('Pneus Aro 16', 'Conjunto de 4 pneus para veículos de passeio', 1599.90, 40, '2024-10-09 22:30:00', 'disponível', 'MarcaW', 9),
('Capacete de Moto', 'Capacete aberto com viseira anti-risco', 399.90, 70, '2024-10-09 22:40:00', 'disponível', 'MarcaX', 9),
('Tapete Automotivo', 'Tapete emborrachado para carros, resistente à água', 99.90, 200, '2024-10-09 22:50:00', 'disponível', 'MarcaY', 9),
('Óleo de Motor 5W30', 'Óleo lubrificante sintético para motores', 59.90, 150, '2024-10-09 23:00:00', 'disponível', 'MarcaZ', 9),
('Jogo de Chaves Combinadas', 'Conjunto de 12 chaves combinadas de aço', 129.90, 100, '2024-10-09 23:10:00', 'disponível', 'MarcaAA', 9);


CREATE TABLE tb_clientes (
    cli_id INT PRIMARY KEY AUTO_INCREMENT,     -- Identificador único do cliente
    cli_nome VARCHAR(100) NOT NULL,            -- Nome completo do cliente
    cli_email VARCHAR(100) NOT NULL,           -- E-mail do cliente
    cli_telefone VARCHAR(20),                  -- Telefone de contato
    cli_endereco VARCHAR(200),                 -- Endereço completo do cliente
    cli_cpf VARCHAR(14) UNIQUE,                -- CPF do cliente, campo único
    cli_data_cadastro DATETIME NOT NULL        -- Data de cadastro do cliente
);


INSERT INTO tb_clientes (cli_nome, cli_email, cli_telefone, cli_endereco, cli_cpf, cli_data_cadastro) VALUES
('Ana Silva', 'ana.silva@example.com', '(11) 91234-5678', 'Rua A, 123, São Paulo, SP', '123.456.789-00', '2024-10-01 08:30:00'),
('João Santos', 'joao.santos@example.com', '(21) 99876-5432', 'Avenida B, 456, Rio de Janeiro, RJ', '987.654.321-00', '2024-10-01 09:00:00'),
('Maria Oliveira', 'maria.oliveira@example.com', '(31) 92345-6789', 'Praça C, 789, Belo Horizonte, MG', '456.789.123-00', '2024-10-01 09:30:00'),
('Carlos Pereira', 'carlos.pereira@example.com', '(41) 93456-7890', 'Rua D, 1011, Curitiba, PR', '321.654.987-00', '2024-10-01 10:00:00'),
('Fernanda Costa', 'fernanda.costa@example.com', '(51) 94567-8901', 'Avenida E, 1213, Porto Alegre, RS', '789.123.456-00', '2024-10-01 10:30:00'),

('Ricardo Almeida', 'ricardo.almeida@example.com', '(61) 95678-9012', 'Rua F, 1415, Brasília, DF', '654.321.098-00', '2024-10-01 11:00:00'),
('Juliana Rocha', 'juliana.rocha@example.com', '(71) 96789-0123', 'Praça G, 1617, Salvador, BA', '123.789.456-00', '2024-10-01 11:30:00'),
('Felipe Mendes', 'felipe.mendes@example.com', '(81) 97890-1234', 'Avenida H, 1819, Recife, PE', '456.123.789-00', '2024-10-01 12:00:00'),
('Camila Lima', 'camila.lima@example.com', '(91) 98901-2345', 'Rua I, 2021, Belém, PA', '321.456.987-00', '2024-10-01 12:30:00'),
('Lucas Ferreira', 'lucas.ferreira@example.com', '(11) 90012-3456', 'Praça J, 2223, Fortaleza, CE', '789.654.321-00', '2024-10-01 13:00:00');



CREATE TABLE tb_vendas (
    ven_id INT PRIMARY KEY AUTO_INCREMENT,      -- Identificador único da venda
    ven_data DATETIME NOT NULL,                 -- Data e hora da venda
    ven_total DECIMAL(10, 2) NOT NULL,          -- Valor total da venda
    ven_cli_id INT,                         -- Chave estrangeira para o cliente que realizou a compra
    FOREIGN KEY (ven_cli_id) REFERENCES tb_clientes(cli_id)  -- Relacionamento com a tabela de clientes
);
INSERT INTO tb_vendas (ven_data, ven_total, ven_cli_id) VALUES
('2024-10-02 14:30:00', 2999.90, 1),  -- Venda do cliente Ana Silva
('2024-10-03 10:15:00', 79.90, 2),    -- Venda do cliente João Santos
('2024-10-04 12:45:00', 59.90, 3),    -- Venda do cliente Maria Oliveira
('2024-10-05 16:00:00', 999.90, 4),   -- Venda do cliente Carlos Pereira
('2024-10-06 18:30:00', 1999.90, 5),   -- Venda do cliente Fernanda Costa
('2024-10-07 09:20:00', 149.90, 6),    -- Venda do cliente Ricardo Almeida
('2024-10-08 11:05:00', 399.90, 7),    -- Venda do cliente Juliana Rocha
('2024-10-08 13:15:00', 2499.90, 8),   -- Venda do cliente Felipe Mendes
('2024-10-09 15:00:00', 899.90, 9),    -- Venda do cliente Camila Lima
('2024-10-09 17:30:00', 199.90, 10),    -- Venda do cliente Lucas Ferreira
('2024-10-10 10:00:00', 499.90, 1),    -- Venda do cliente Ana Silva
('2024-10-11 14:20:00', 299.90, 2),    -- Venda do cliente João Santos
('2024-10-12 09:30:00', 899.90, 3),    -- Venda do cliente Maria Oliveira
('2024-10-13 12:00:00', 149.90, 4),    -- Venda do cliente Carlos Pereira
('2024-10-14 16:45:00', 2499.90, 5),   -- Venda do cliente Fernanda Costa
('2024-10-15 18:10:00', 99.90, 6),     -- Venda do cliente Ricardo Almeida
('2024-10-16 11:15:00', 1199.90, 7),    -- Venda do cliente Juliana Rocha
('2024-10-17 13:40:00', 1799.90, 8),    -- Venda do cliente Felipe Mendes
('2024-10-18 15:25:00', 999.90, 9),     -- Venda do cliente Camila Lima
('2024-10-19 17:55:00', 299.90, 10);    -- Venda do cliente Lucas Ferreira


CREATE TABLE tb_vendas_produtos (
    vpr_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único da venda de um produto
    vpr_ven_id INT NOT NULL,                        -- Chave estrangeira para a tabela de vendas
    vpr_pro_id INT NOT NULL,                        -- Chave estrangeira para o produto vendido
    vpr_quantProduto INT NOT NULL,            -- Quantidade do produto vendido
    vpr_precoProduto DECIMAL(10, 2) NOT NULL,      -- Preço unitário do produto na venda
    FOREIGN KEY (vpr_ven_id) REFERENCES tb_vendas(ven_id),  -- Relacionamento com a venda
    FOREIGN KEY (vpr_pro_id) REFERENCES tb_produtos(pro_id) -- Relacionamento com o produto
);
select * from tb_vendas;
select * from tb_vendas_produt;

INSERT INTO tb_vendas_produtos (vpr_ven_id, vpr_pro_id, vpr_quantProduto, vpr_precoProduto) VALUES(1, 1, 1, 199.90);


INSERT INTO tb_vendas_produtos (vpr_ven_id, vpr_pro_id, vpr_quantProduto, vpr_precoProduto) VALUES
(1, 1, 1, 199.90),
(1, 2, 1, 999.90),  -- Venda 1: 1 unidade do Produto 2 (Monitor 24 Polegadas)

(2, 3, 1, 79.90),    -- Venda 2: 1 unidade do Produto 3 (Teclado Mecânico)

(3, 4, 1, 59.90),    -- Venda 3: 1 unidade do Produto 4 (Cadeira Gamer)

(4, 5, 1, 999.90),   -- Venda 4: 1 unidade do Produto 5 (Mochila para Notebook)

(5, 6, 2, 149.90),    -- Venda 5: 2 unidades do Produto 6 (Bola de Futebol)

(6, 7, 1, 199.90),    -- Venda 6: 1 unidade do Produto 7 (Bicicleta Mountain Bike)

(7, 8, 1, 399.90),    -- Venda 7: 1 unidade do Produto 8 (Luvas de Boxe)

(8, 9, 1, 2499.90),   -- Venda 8: 1 unidade do Produto 9 (Esteira Elétrica)

(9, 10, 3, 199.90),   -- Venda 9: 3 unidades do Produto 10 (Fogão 4 Bocas)

(10, 11, 1, 299.90),   -- Venda 10: 1 unidade do Produto 11 (Aspirador de Pó)

(11, 12, 1, 499.90),   -- Venda 11: 1 unidade do Produto 12 (Micro-ondas 30L)

(12, 13, 1, 1999.90),  -- Venda 12: 1 unidade do Produto 13 (Máquina de Lavar 12kg)

(13, 14, 1, 199.90),   -- Venda 13: 1 unidade do Produto 14 (Liquidificador 1000W)

(14, 15, 4, 1599.90),  -- Venda 14: 4 unidades do Produto 15 (Pneus Aro 16)

(15, 16, 1, 399.90);    -- Venda 15: 1 unidade do Produto 16 (Capacete de Moto)




