USE ecommerce_refinado;

-- Quantos pedidos foram feitos por cada cliente?
SELECT CONCAT(primeiro_nome, ' ', sobrenome) as cliente, COUNT(*) as 'número de pedidos'
FROM Cliente c
INNER JOIN Pedido p
ON c.idCliente = p.idCliente
GROUP BY cliente
ORDER BY COUNT(*) DESC;

-- Algum vendedor também é fornecedor?
SELECT Vendedor.nome_social, nome_empresarial
FROM Vendedor, Fornecedor
WHERE Vendedor.CNPJ = Fornecedor.CNPJ;

-- Relação de produtos fornecedores e estoques
SELECT p.nome_produto as produto, f.nome_social as fornecedor, e.quantidade
FROM Produto p, Fornecedor f, Estoque e
WHERE p.idProduto IN
(
    SELECT le.idProduto
    FROM Local_Estoque le
    WHERE le.idEstoque = e.idEstoque
)
AND idProduto IN
(
    SELECT pf.idProduto
    FROM Produto_Fornecedor pf
    WHERE pf.idFornecedor = f.idFornecedor
);

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT nome_social, nome_produto
FROM Fornecedor, Produto
WHERE idFornecedor IN
(
    SELECT idFornecedor
    FROM Produto_Fornecedor
    WHERE idProduto = Produto.idProduto
);