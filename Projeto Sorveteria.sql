CREATE DATABASE sorveteria;
USE sorveteria;

CREATE TABLE cliente (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(45) UNIQUE,
    nome VARCHAR(155) NOT NULL,
    idendereco INT NOT NULL
);

CREATE TABLE endereco (
    idendereco INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR (45) NOT NULL,
    bairro VARCHAR (45) NOT NULL,
    cidadeEstado VARCHAR (45) NOT NULL,
    logradouro VARCHAR (155) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT fk_cliente_endereco FOREIGN KEY (idendereco) REFERENCES endereco (idendereco);

CREATE TABLE produto (
    idproduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    data_validade DATE NOT NULL,
    data_fabricacao DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE formaPagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE pedido (
    idpedido INT PRIMARY KEY AUTO_INCREMENT,
    idPagamento INT NOT NULL,
    idcliente INT NOT NULL,
    idproduto INT NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT fk_cliente_Pagamento FOREIGN KEY (idPagamento) REFERENCES formaPagamento (idPagamento);
ALTER TABLE pedido ADD CONSTRAINT fk_cliente_cliente FOREIGN KEY (idcliente) REFERENCES cliente (idcliente);
ALTER TABLE pedido ADD CONSTRAINT fk_cliente_produto FOREIGN KEY (idproduto) REFERENCES produto (idproduto);

INSERT INTO endereco (cep, bairro, cidadeEstado, logradouro)
VALUES ('60767-702', 'Mondubim', 'Fortaleza, CE', 'Rua 01'),
('60752-010', 'Mondubim', 'Fortaleza, CE', 'Avenida 01'),
('60767-725', 'Mondubim', 'Fortaleza, CE', 'Rua 1'),
('60544-760', 'Siqueira', 'Fortaleza, CE', 'Rua 01'),
('60544-763', 'Siqueira', 'Fortaleza, CE', 'Rua 02'),
('60544-766', 'Siqueira', 'Fortaleza, CE', 'Rua 03'),
('61905-430', 'Novo Maracanaú', 'Maracanaú, CE', 'Rua 1'),
('61905-530', 'Novo Maracanaú', 'Maracanaú, CE', 'Rua 10'),
('61905-540', 'Novo Maracanaú', 'Maracanaú, CE', 'Rua 11');

INSERT INTO cliente (cpf, nome, idendereco)
VALUES ('0001', 'João Silva', 1),
('0002', 'Maria Costa', 1),
('0003', 'Pedro Soares', 2),
('0004', 'Leonardo Silva', 3),
('0005', 'Ana Soares', 4),
('0006', 'Patricia Costa', 4),
('0007', 'Pedro Silva', 5),
('0008', 'Otavio Soares', 6),
('0009', 'João Costa', 7),
('0010', 'Davi Silva', 8),
('0011', 'John Silva', 9),
('0012', 'João Maria', 1),
('0013', 'Mário da Costa', 2),
('0014', 'Pedro Leonardo', 3),
('0015', 'Will Bank', 4),
('0016', 'Weberson Inácio', 5),
('0017', 'Jair Silva', 6),
('0018', 'Vitor Melo', 7),
('0019', 'Guilherme Soares', 8),
('0020', 'Gustavo Lima', 9),
('0021', 'Pedro Nascimento', 9);

INSERT INTO formapagamento (descricao)
VALUES ('Cartão de Crédito'),
('Cartão de Débito'),
('PIX'),
('Dinheiro'),
('Vale alimentação');

INSERT INTO produto (nome, data_validade, data_fabricacao, valor)
VALUES ('Picolé Limão', '2022-11-01', '2022-03-31', 5.99),
('Picolé Morango', '2022-11-01', '2022-03-31', 5.99),
('Picolé Chocolate', '2022-11-01', '2022-10-01', 5.99),
('Picolé Ovomaltine', '2022-11-01', '2022-10-01', 5.99),
('Pote Morango ', '2022-05-10', '2022-11-01', 10.99),
('Pote Limão', '2022-05-10', '2022-03-31', 10.99),
('Pote Limão', '2022-05-10', '2022-06-10', 10.99),
('Pote Limão', '2022-12-01', '2022-06-10', 10.99),
('Açai', '2022-12-01', '2022-06-10', 14.99);

INSERT INTO pedido (idPagamento, idcliente, idproduto)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(3, 6, 6),
(2, 7, 7),
(1, 8, 8),
(4, 9, 9),
(5, 10, 9),
(2, 11, 8),
(3, 12, 7),
(1, 13, 4),
(1, 2, 5),
(1, 4, 6),
(2, 5, 1),
(2, 6, 2),
(3, 10, 3),
(3, 10, 3),
(3, 10, 6),
(3, 4, 9),
(4, 6, 8),
(4, 5, 5);

2)

/* 1- Quantos clientes tem cadastrado no banco de dados? */

SELECT COUNT(idcliente) AS Quantidade_Clientes FROM cliente;

/* 2- Qual o faturamento total da empresa? */

SELECT SUM(valor) AS Faturamento FROM pedido INNER JOIN produto ON pedido.idproduto = produto.idproduto;

/* 3- Quantos clientes moram em Maracanaú? */

SELECT COUNT(CidadeEstado) AS clientesMaracanau FROM endereco INNER JOIN cliente ON endereco.idendereco = cliente.idendereco WHERE cidadeEstado LIKE 'Maracanaú%';

/* 4- Quais produtos cada cliente comprou? */

SELECT cliente.nome, produto.nome FROM pedido INNER JOIN cliente ON pedido.idcliente = cliente.idcliente INNER JOIN produto ON pedido.idproduto = produto.idproduto;

/* 5- Quais produtos irão vencer após o dia 20/09/2022? */

SELECT nome FROM produto WHERE data_validade>'2022-09-02';

/* 6- Quais produtos foram fabricados no dia 01/11/2022? */

SELECT nome FROM produto WHERE data_fabricacao='2022-11-01';

/* 7- Quantos clientes pagaram por meio do PIX? */

SELECT COUNT(idPagamento) AS Pagamento_PIX FROM pedido WHERE idPagamento = 3;

/* 8- Qual seria o valor dos produtos se for aplicado 10% de desconto? */

SELECT nome, (valor-valor*0.10) AS Valor_10porcentoDesconto FROM produto;

9- Quais os produtos comprados por Pedro Soares?

SELECT cliente.nome, produto.nome 
FROM pedido 
INNER JOIN produto ON pedido.idproduto = produto.idproduto 
INNER JOIN cliente ON pedido.idcliente = cliente.idcliente WHERE cliente.nome = 'Pedro Soares';
