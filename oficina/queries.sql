USE oficina;

-- Recuperações simples com SELECT Statement
SELECT * FROM Cliente;

SELECT descricao as 'Descrição', tipo_atendimento as 'Tipo de Atendimento'
FROM Atendimento;

-- Filtros com WHERE Statement
SELECT nome, tipo
FROM Cliente
WHERE perfil = 'premium';

SELECT matricula, setor
FROM Atendente
WHERE cargo = 'Técnico especialista';

-- Crie expressões para gerar atributos derivados
SELECT CONCAT(cargo, ' em ', setor) AS 'Função'
FROM Atendente
WHERE cargo LIKE '%especialista%';

-- Defina ordenações dos dados com ORDER BY
SELECT idAtendente, setor, DATE(data_criacao) as 'Data de Criação'
FROM Atendimento_Solicitado
ORDER BY data_criacao ASC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT setor, COUNT(*) AS 'Quantidade de Solicitações', DATE(data_criacao) AS 'Solicitação mais Recente'
FROM Atendimento_Solicitado
GROUP BY setor
HAVING count(*) >= 1
ORDER BY data_criacao DESC;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT atd.idAtendente, cargo as 'Cargo do Atendente', ats.setor as 'Setor da Solicitação', descricao as 'Descrição', tipo_atendimento as 'Tipo de Atendimento', c.nome as Cliente, DATE(data_criacao) as 'Data de Solicitção'
FROM Atendente atd
INNER JOIN Atendimento_Solicitado ats
ON atd.idAtendente = ats.idAtendente
INNER JOIN Atendimento atm
ON atm.idAtendimento = ats.idAtendimento
INNER JOIN Cliente c
ON atm.idCliente = c.idCliente;
