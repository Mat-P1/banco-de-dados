/* 1° Construa um script DDL para criar uma tabela clientes e adicionar as colunas: id_cliente, nome, idade, dt_nascimento, telefone. */

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(155) NOT NULL,
    idade int NOT NULL,
    dt_nascimento DATE NOT NULL,
    telefone VARCHAR(25) NOT NULL
);

/* 2° Construa um script DDL para criar uma tabela produtos e adicionar as colunas: idProduto, nome, preco, dtFabricacao, dtValidade. */

create table produtos(
    idProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(55) NOT NULL,
    preco FLOAT NOT NULL,
    dtFabricacao DATE NOT NULL,
    dtValidade DATE NOT NULL
);

/* 3° Construa um script DDL para alterar o nome das tabelas clientes e produtos para cliente e produto respectivamente. */

RENAME TABLE clientes TO cliente;
RENAME TABLE produtos TO produto;

/* 4° Crie um script para excluir a coluna dtFabricacao da tabela produto. */

ALTER TABLE produto DROP COLUMN dtFabricacao;

/* 5° Crie um script para alterar o tipo de dados da coluna preco para decimal. */

ALTER TABLE produto MODIFY COLUMN preco DECIMAL NOT NULL;

/* 6° Crie um script para adicionar uma coluna CEP na tabela cliente. */

ALTER TABLE cliente ADD COLUMN CEP VARCHAR(25) NOT NULL;

/* 7° Crie um script para alterar o nome da coluna id_cliente para idCliente na tabela cliente. */

ALTER TABLE cliente CHANGE COLUMN id_cliente idCliente INT NOT NULL AUTO_INCREMENT;

/* 8° Crie um script para alterar o nome da coluna dt_nascimento para dtNascimento na tabela cliente. */

ALTER TABLE cliente CHANGE COLUMN dt_nascimento dtNascimento DATE NOT NULL;

/* 9°  Crie um script para visualizar todos os databases de um servidor mysql.*/

SHOW DATABASES;

/* Biblioteca

Construa um banco de dados para um sistema de controle e gerenciamento de  empréstimos de livros de uma biblioteca acadêmica conforme as características  abaixo: 
∙ A biblioteca dispõe de livros, também denominados títulos. 
  Estes possuem  nome, autores e editoras. Cada título pertence a uma área de conhecimento  e possui um código único de identificação. 
∙ Cada título possui vários exemplares. Cada exemplar possue um código  único de identificação. 
∙ Cada título pode ter vários autores e um mesmo autor pode ter escrito vários títulos. Um autor possue código, nome, telefone e endereço. 
∙ As editoras possuem código, nome, telefone e endereço. 
∙ As áreas de conhecimento possuem código e uma descrição. 
∙ Usuários, que podem ser alunos, professores ou funcionários, tomam livros  emprestados por uma semana. 
  A data de empréstimo é importante no  processo. Cada usuário possui um código, nome, telefone e endereço. 
∙ Cada título possui várias palavras-chave e uma palavra-chave pode estar  ligada a vários títulos. Uma palavra-chave possui código e descrição. */

CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE titulos (
    ISBN INT PRIMARY KEY NOT NULL,
    nome VARCHAR(155) NOT NULL
);

CREATE TABLE exemplar (
    idExemplar INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

ALTER TABLE exemplar ADD ISBN INT NOT NULL UNIQUE;
ALTER TABLE exemplar ADD FOREIGN KEY (ISBN) REFERENCES titulos(ISBN);

CREATE TABLE autor (
    codAutor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(155) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(155) NOT NULL
);

CREATE TABLE autorTitulos (
    ISBN INT NOT NULL,
    codAutor INT NOT NULL,
    PRIMARY KEY (ISBN, codAutor)
);

ALTER TABLE autorTitulos ADD CONSTRAINT fk_autorTitulos__titulos FOREIGN KEY (ISBN) REFERENCES titulos (ISBN);
ALTER TABLE autorTitulos ADD CONSTRAINT fk_autorTitulos__autor FOREIGN KEY (codAutor) REFERENCES autor (codAutor);

CREATE TABLE editora (
    codEditora INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(155) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(155) NOT NULL
);

ALTER TABLE titulos ADD codEditora INT NOT NULL UNIQUE;
ALTER TABLE titulos ADD FOREIGN KEY (codEditora) REFERENCES editora(codEditora);

CREATE TABLE areaConhecimento (
    idAreaConhecimento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) not null
);

ALTER TABLE titulos ADD idAreaConhecimento INT NOT NULL UNIQUE;
ALTER TABLE titulos ADD FOREIGN KEY (idAreaConhecimento) REFERENCES areaConhecimento(idAreaConhecimento);

CREATE TABLE palavrachave (
    idPalavrachave INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(55) not null
);

CREATE TABLE palavrachaveTitulos (
    ISBN INT NOT NULL,
    idPalavrachave INT NOT NULL,
    PRIMARY KEY (ISBN, idPalavrachave)
);

ALTER TABLE palavrachaveTitulos ADD CONSTRAINT fk_palavrachaveTitulos__titulos FOREIGN KEY (ISBN) REFERENCES titulos (ISBN);
ALTER TABLE palavrachaveTitulos ADD CONSTRAINT fk_palavrachaveTitulos__palavrachave FOREIGN KEY (idPalavrachave) REFERENCES palavrachave (idPalavrachave);

CREATE TABLE usuario (
    codUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(155) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(155) NOT NULL
);

CREATE TABLE emprestimo (
    codUsuario INT NOT NULL,
    idExemplar INT NOT NULL,
    PRIMARY KEY (codUsuario, idExemplar),
    dtEmprestimo DATE NOT NULL
);

ALTER TABLE emprestimo ADD CONSTRAINT fk_emprestimo__usuario FOREIGN KEY (codUsuario) REFERENCES usuario (codUsuario);
ALTER TABLE emprestimo ADD CONSTRAINT fk_emprestimo__exemplar FOREIGN KEY (idExemplar) REFERENCES exemplar (idExemplar);
