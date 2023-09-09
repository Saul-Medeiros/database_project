USE ecommerce;

-- ---------------------------
-- consulta simples
-- ---------------------------
SELECT * FROM Cliente;
SELECT * FROM Fornecedor;
SELECT * FROM local_estoque;

-- ------------------------------------------------------
-- consulta com manipulação de resultados e AS Statement
-- ------------------------------------------------------
SELECT CONCAT(primeiro_nome, ' ', inicial_s_nome, '. ', sobrenome) AS cliente, endereco FROM Cliente;

-- mostra o nome do produto e uma informação para caso seja classificado para crianças ou não
SELECT nome_produto AS produto, categoria,
(
    CASE 
    WHEN classificacao_para_criancas = false THEN 'para maiores'  
    ELSE 'para todas as idades'
    END
) AS 'classificação'
FROM Produto;

-- ----------------------------
-- consulta com subqueries
-- ----------------------------
-- pedidos de clientes de Shibuya
SELECT * FROM Pedido p
WHERE idCliente IN
(
    SELECT idCliente FROM Cliente
    WHERE endereco = 'Shibuya'
)

-- pedidos com pagamento em boleto
SELECT * FROM Pedido p
WHERE idPagamento NOT IN
(
    SELECT idPagamento FROM Pagamento
    WHERE tipo_pagamento = 'cartão'
)

-- -------------------------------
-- consulta em multiplas tabelas (WHERE e JOIN Statement)
-- -------------------------------
SELECT CONCAT(c.primeiro_nome, ' ', c.sobrenome) AS cliente, pa.tipo_pagamento, pe.status
FROM Cliente c, Pagamento pa, Pedido pe
WHERE c.idCliente = pe.idCliente AND pa.idPagamento = pe.idPagamento;

-- realiza a mesma consulta do exemplo acima
SELECT CONCAT(c.primeiro_nome, ' ', c.sobrenome) AS cliente, pa.tipo_pagamento, pe.status
FROM Cliente c
INNER JOIN Pedido pe
ON c.idCliente = pe.idCliente
INNER JOIN Pagamento pa
ON pa.idPagamento = pe.idPagamento;

-- ----------------------------
-- GROUP BY e ORDER BY
-- ----------------------------
SELECT CONCAT(primeiro_nome, ' ', sobrenome) AS Cliente, endereco FROM Cliente
WHERE endereco = 'Shibuya'
ORDER BY primeiro_nome DESC;

-- melhores produtos por categoria
SELECT nome_produto AS 'melhor avaliado', categoria, COUNT(*) AS qtd_categoria, avaliacao as 'avaliação mais alta'
FROM Produto
GROUP BY categoria
HAVING COUNT(*) >= 1
ORDER BY avaliacao DESC;