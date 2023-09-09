USE ecommerce;

INSERT INTO Cliente(primeiro_nome, inicial_s_nome, sobrenome, CPF, endereco)
VALUES ('Satoru', 'C', 'Gojo', '12345678900', 'Shibuya'),
       ('Suguru', 'S', 'Geto', '98765432100', 'Shibuya'),
       ('Itadori', 'K', 'Yuuji', '12312312300', 'Tokyo'),
       ('Megumi', 'Z', 'Fushiguro', '45645645600', 'Tokyo'),
       ('Nobara', 'C', 'Kugisaki', '78978978900', 'Kyoto');

INSERT INTO Produto(nome_produto, classificacao_para_criancas, categoria, avaliacao, tamanho)
VALUES ('PC Gamer', false, 'eletrônico', 8.5, 'Grande'),
       ('Calça', true, 'vestuário', 4.8, 'Médio'),
       ('Bola', true, 'brinquedos', 2.2, 'Pequeno'),
       ('Notebook', false, 'eletrônico', 2.1, 'Médio'),
       ('Transformers', true, 'brinquedos', 1.9, 'Único');

INSERT INTO Pagamento(idPagamento, tipo_pagamento, tempo_disponivel)
VALUES (1, 'boleto', 200),
       (2, 'cartão', 1000),
       (3, 'cartão', 900),
       (4, 'boleto', 400),
       (5, 'cartão', 850);

INSERT INTO Pedido(idPedido, idCliente, idPagamento, status, descricao, frete, pagamento_dinheiro)
VALUES (1, 1, 1, 'Processando', 'Pedido 1', 16.5, true),
       (2, 2, 2, 'confirmado', 'Pedido 2', 12.2, false),
       (3, 3, 3, 'cancelado', 'Pedido 3', 30.2, false),
       (4, 4, 4, 'confirmado', 'Pedido 4', 20.0, true),
       (5, 5, 5, 'Processando', 'Pedido 5', 40.0, false);

INSERT INTO Estoque(idEstoque, localizacao, quantidade)
VALUES (1, 'Estoque 1', 200),
       (2, 'Estoque 2', 100),
       (3, 'Estoque 3', 400),
       (4, 'Estoque 4', 175),
       (5, 'Estoque 5', 600);

INSERT INTO Fornecedor(idFornecedor, CNPJ, nome_social, contato)
VALUES (1, '11116666611111', 'Fornecedor 1', '11115555511'),
       (2, '22228888822222', 'Fornecedor 2', '22222777772'),
       (3, '33333444443333', 'Fornecedor 3', '33333999993'),
       (4, '44888884444444', 'Fornecedor 4', '44444222224'),
       (5, '55555522222555', 'Fornecedor 5', '55555444445');

INSERT INTO Vendedor(idVendedor, CNPJ, CPF, nome_social, nome_empresarial, contato, endereco)
VALUES (1, '111111111111111', '11111111100', 'Vendedor 1', 'Vendedor A', '61991919191', 'Rua 01, 769'),
       (2, '222222222222222', '22222222200', 'Vendedor 2', 'Vendedor B', '61992929292', 'Rua 02, 345'),
       (3, '333333333333333', '33333333300', 'Vendedor 3', 'Vendedor C', '61993939393', 'Rua 03, 543'),
       (4, '444444444444444', '44444444400', 'Vendedor 4', 'Vendedor D', '61994949494', 'Rua 04, 454'),
       (5, '555555555555555', '55555555500', 'Vendedor 5', 'Vendedor E', '61995959595', 'Rua 05, 676');

INSERT INTO Produto_Vendedor(idProduto, idVendedor, quantidade)
VALUES (1, 1, 10),
       (2, 1, 5),
       (3, 2, 8),
       (4, 2, 15),
       (5, 3, 3);

INSERT INTO Produto_Pedido(idProduto, idPedido, quantidade, status)
VALUES (1, 1, 2, 'confirmado'),
       (2, 1, 1, 'cancelado'),
       (3, 2, 3, 'confirmado'),
       (4, 2, 1, 'processando'),
       (5, 3, 5, 'confirmado');

INSERT INTO local_estoque(idProduto, idEstoque, localizacao)
VALUES (1, 1, 'Estoque 1, Compartimento 01'),
       (2, 2, 'Estoque 2, Compartimento 02'),
       (3, 3, 'Estoque 3, Compartimento 03'),
       (4, 4, 'Estoque 4, Compartimento 04'),
       (5, 5, 'Estoque 5, Compartimento 05');

INSERT INTO Produto_Fornecedor(idFornecedor, idProduto, quantidade)
VALUES (1, 1, 100),
       (2, 1, 200),
       (3, 2, 60),
       (4, 3, 170),
       (5, 3, 80);