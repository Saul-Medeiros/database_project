USE oficina;

INSERT INTO Cliente(nome, CPF, tipo, perfil)
VALUES ('Tesla', '23456567890', 'PJ', 'premium'),
       ('Microsoft', '34344456565', 'PJ', 'premium'),
       ('Meta', '34344454545', 'PJ', 'normal'),
       ('SpaceX', '34345677878', 'PJ', 'normal'),
       ('Google', '55555555555', 'PJ', 'premium'),
       ('Bill Gates', '34345567345', 'PF', 'premium'),
       ('Musk', '34345567890', 'PF', 'normal'),
       ('Mark', '12345678909', 'PF', 'normal');

INSERT INTO Atendimento(idCliente, descricao, tipo_atendimento)
VALUES (1, 'Manutenção do Sistema', 'Serviço'),
       (2, 'Trocando o Farol', 'Produto'),
       (3, 'Instalando novo sistema', 'Serviço'),
       (4, 'Troca de Peça', 'Serviço'),
       (5, 'Atualizando o computador de bordo', 'Serviço'),
       (6, 'Peças novas', 'Produto'),
       (7, 'Troca de ar', 'Serviço'),
       (8, 'Troca de escape', 'Serviço');

INSERT INTO Atendente(setor, matricula, cargo)
VALUES ('Sistemas', '12121', 'Técnico especialista'),
       ('Eletronico', '23232', 'Técnico especialista'),
       ('Sistemas', '34343', 'Técnico especialista'),
       ('Peças Mecanicas', '45454', 'Técnico especialista'),
       ('Eletronico', '56565', 'Técnico'),
       ('Sistemas', '67676', 'Técnico especialista'),
       ('Eletronico', '78787', 'Técnico'),
       ('Sistemas', '89898', 'Técnico especialista');

INSERT INTO Atendimento_Solicitado(idAtendente, idAtendimento, setor, data_criacao)
VALUES (1, 1, 'Peças Mecanicas', '2023-01-31'),
       (2, 2, 'Sistemas', '2022-02-07'),
       (3, 3, 'Sistemas', '2021-03-09'),
       (4, 4, 'Eletronico', '2020-04-18'),
       (5, 5, 'Sistemas', '2019-05-30'),
       (6, 6, 'Eletronico', '2018-06-12'),
       (7, 7, 'Peças Mecanicas', '2017-07-29'),
       (8, 8, 'Sistemas', '2016-08-14');

INSERT INTO Ordem_Servico(idAtendente, idAtendimento, descricao, prioridade, status)
VALUES (1, 1, 'Pane no Sistema de Bordo', 'alta', 'em andamento'),
       (2, 2, 'Central multimidea precisando de ajustes', 'média', 'recebido pelo setor técnico'),
       (3, 3, 'Troca no sistema de arrefecimento', 'baixa', 'aguardando peças'),
       (4, 4, 'Sistema de arrefecimento', 'alta', 'sem solução'),
       (5, 5, 'Travamento no sistema de multimidea', 'média', 'concluido com sucesso'),
       (6, 6, 'Novo computador de bordo', 'alta', 'entregue ao Cliente'),
       (7, 7, 'Instalando sistema', 'média', 'finalizado'),
       (8, 8, 'Troca de freios', 'baixa', 'em andamento');