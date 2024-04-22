CREATE DATABASE Mercado;

go use Mercado;

go
CREATE TABLE Fornecedor 
(
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    cnpj VARCHAR(15),
    endereco VARCHAR(80)
  );

go
CREATE TABLE Produto 
(
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(200)
  );

go
CREATE TABLE Fornecedor_Produto 
(
    cod_fornecedor INT FOREIGN KEY REFERENCES Fornecedor (codigo),
    cod_produto INT FOREIGN KEY REFERENCES Produto (codigo)
  );

go
CREATE TABLE Loja 
(
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    cnpj VARCHAR(15)
  );

go
CREATE TABLE Cliente 
(
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(80)
  );

go
CREATE TABLE Venda 
(
    num_nfiscal VARCHAR(50) PRIMARY KEY,
    data DATE,
    valor_total FLOAT,
    cod_loja INT FOREIGN KEY REFERENCES Loja (codigo),
    cod_cliente INT FOREIGN KEY REFERENCES Cliente (codigo)
  );

go
CREATE TABLE Produto_Venda 
(
    cod_produto INT FOREIGN KEY REFERENCES Produto (codigo),
    num_nfiscal VARCHAR(50) FOREIGN KEY REFERENCES Venda (num_nfiscal),
    valor_total FLOAT,
    cod_loja INT FOREIGN KEY REFERENCES Loja (codigo),
    cod_cliente INT FOREIGN KEY REFERENCES Cliente (codigo)
  );