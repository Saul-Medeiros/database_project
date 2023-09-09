CREATE SCHEMA ecommerce;
USE ecommerce;

CREATE TABLE Fornecedor(
    idFornecedor INT NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    nome_social VARCHAR(255) NOT NULL,
    contato CHAR(11) NOT NULL,
    PRIMARY KEY (idFornecedor),
    CONSTRAINT unique_fornecedor UNIQUE (CNPJ)
);

CREATE TABLE Produto(
    idProduto INT NOT NULL AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    classificacao_para_criancas BOOL NULL,
    categoria ENUM('eletrônico', 'vestuário', 'brinquedos', 'alimentos') NOT NULL,
    avaliacao FLOAT NULL DEFAULT 0,
    tamanho VARCHAR(10) NULL,
    PRIMARY KEY (idProduto)
);

CREATE TABLE Cliente(
    idCliente INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(15) NOT NULL,
    inicial_s_nome CHAR(3) NULL,
    sobrenome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    PRIMARY KEY (idCliente),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);

CREATE TABLE Produto_Fornecedor(
    idFornecedor INT NULL,
    idProduto INT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (idFornecedor, idProduto),
    CONSTRAINT fk_fornecedor_fornecedor
      FOREIGN KEY (idFornecedor)
      REFERENCES Fornecedor(idFornecedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_produto_fornecedor
      FOREIGN KEY (idProduto)
      REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Pagamento(
    idPagamento INT NOT NULL,
    tipo_pagamento ENUM('boleto', 'cartão') NOT NULL,
    tempo_disponivel FLOAT NULL,
    PRIMARY KEY (idPagamento)
);

CREATE TABLE Pedido(
    idPedido INT NOT NULL,
    idCliente INT NOT NULL,
    idPagamento INT,
    status ENUM('processando', 'cancelado', 'confirmado') NULL DEFAULT 'processando',
    descricao VARCHAR(255) NULL,
    frete FLOAT NULL DEFAULT 10,
    pagamento_dinheiro BOOLEAN NULL DEFAULT false,
    PRIMARY KEY (idPedido),
    CONSTRAINT fk_pedido_cliente
      FOREIGN KEY (idCliente)
      REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT 
      fk_pedido_pagamento
      FOREIGN KEY (idPagamento)
      REFERENCES Pagamento(idPagamento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Produto_Pedido(
    idProduto INT NOT NULL,
    idPedido INT NOT NULL,
    quantidade INT NULL,
    status ENUM('processando', 'cancelado', 'confirmado') NULL DEFAULT 'processando',
    PRIMARY KEY (idProduto, idPedido),
    CONSTRAINT fk_produto_pedido
      FOREIGN KEY (idProduto)
      REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_pedido_produto
      FOREIGN KEY (idPedido)
      REFERENCES Pedido(idPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Estoque(
    idEstoque INT NOT NULL,
    localizacao VARCHAR(255) NULL,
    quantidade INT NULL DEFAULT 0,
    PRIMARY KEY (idEstoque)
);

CREATE TABLE local_estoque(
    idProduto INT NULL,
    idEstoque INT NULL,
    localizacao VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduto, idEstoque),
    CONSTRAINT fk_local_estoque_produto
      FOREIGN KEY (idProduto)
      REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_local_estoque_estoque
      FOREIGN KEY (idEstoque)
      REFERENCES Estoque(idEstoque)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Vendedor(
    idVendedor INT NOT NULL,
    CNPJ CHAR(15) NULL,
    CPF CHAR(11) NULL,
    nome_social VARCHAR(255) NOT NULL,
    nome_empresarial VARCHAR(255) NULL,
    contato CHAR(11) NULL,
    endereco VARCHAR(255) NULL,
    PRIMARY KEY (idVendedor),
    CONSTRAINT unique_cnpj_vendedor UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_vendedor UNIQUE (CPF)
);

CREATE TABLE Produto_Vendedor(
    idProduto INT NOT NULL,
    idVendedor INT NOT NULL,
    quantidade INT NULL DEFAULT 1,
    PRIMARY KEY (idProduto, idVendedor),
    CONSTRAINT fk_produto_produto
      FOREIGN KEY (idProduto)
      REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_vendedor_produto
      FOREIGN KEY (idVendedor)
      REFERENCES Vendedor(idVendedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

show tables;