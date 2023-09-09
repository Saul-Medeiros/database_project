CREATE SCHEMA oficina;
USE oficina;

CREATE TABLE Atendente(
    idAtendente INT NOT NULL AUTO_INCREMENT,
    setor VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    PRIMARY KEY (idAtendente),
    CONSTRAINT unique_atendente UNIQUE (matricula)
);

CREATE TABLE Cliente(
    idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    tipo ENUM('PJ', 'PF') NULL DEFAULT 'PF',
    perfil ENUM('normal', 'premium') NULL DEFAULT 'normal',
    PRIMARY KEY (idCliente),
    CONSTRAINT unique_atendente UNIQUE (CPF)
);

CREATE TABLE Atendimento(
    idAtendimento INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    tipo_atendimento VARCHAR(50) NOT NULL,
    idCliente INT NOT NULL,
    PRIMARY KEY (idAtendimento),
    CONSTRAINT fk_atendimento_cliente
      FOREIGN KEY (idCliente)
      REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Atendimento_Solicitado(
    idAtendente INT NOT NULL,
    idAtendimento INT NOT NULL,
    setor ENUM('sistemas', 'eletrônico', 'peças mecânicas') NULL DEFAULT 'peças mecânicas',
    setor_encaminhado VARCHAR(50) NULL DEFAULT 'null',
    data_criacao DATETIME NULL,
    PRIMARY KEY (idAtendente, idAtendimento),
    CONSTRAINT fk_atendimento_atendente
      FOREIGN KEY (idAtendente)
      REFERENCES Atendente(idAtendente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_atendente_atendimento
      FOREIGN KEY (idAtendimento)
      REFERENCES Atendimento(idAtendimento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Ordem_Servico(
    idAtendente INT NOT NULL,
    idAtendimento INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    prioridade ENUM('baixa', 'média', 'alta') NULL DEFAULT 'baixa',
    status ENUM('em andamento', 'recebido pelo setor técnico', 'aguardando peças', 'sem solução', 'concluído com sucesso', 'entregue ao cliente', 'finalizado') NULL DEFAULT 'em andamento',
    PRIMARY KEY (idAtendente, idAtendimento),
    CONSTRAINT fk_ordem_servico_atendimento
      FOREIGN KEY (idAtendente , idAtendimento)
      REFERENCES Atendimento_Solicitado(idAtendente, idAtendimento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);