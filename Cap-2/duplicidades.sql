--Para derectar duplicidade podemos utilizar de subconsultas

SELECT count(*)
FROM
(
  SELECT coluna_a, coluna_b, coluna_c, count(*) as records
  FROM tabela
  GROUP BY 1,2,3
) a
WHERE records > 1

--Para ver mais detalhes, podemos selecionar os registros que possuem duplicatas

SELECT records, count(*)
FROM
(
  SELECT coluna_a, coluna_b, coluna_c, count(*) as records
  FROM tabela
  GROUP BY 1,2,3
) a
WHERE records > 1

--Como alternativa de subconsultas, podemos usar o HAVING

SELECT coluna_a, coluna_b, coluna_c, count(*) as records
FROM tabela
GROUP BY 1,2,3
HAVING count(*) > 1

--Podemos também listar todos os campos e, em seguida, usar essas informações para detectar quais registros são problemáticos

SELECT * FROM
(
  SELECT coluna_a, coluna_b, coluna_c, count(*) as records
  FROM tabela
  GROUP BY 1,2,3
) a
WHERE records = 2;

--Uma maneira de remover duplicidade é usando a palavra chave DISTINCT

SELECT distinct a.customer_id, a.customer_name, a.customer_email
FROM customers a
JOIN transactions b on a.customer_id = b.customer_id;

--Temos também a opção de GROUP BY, mesmo sem ter uma agregação, esse operador pode ser utilizado

SELECT a.customer_id, a.customer_name, a.customer_email
FROM customers a
JOIN transactions b on a.customer_id = b.customer_id
GROUP BY 1,2,3;

--Outra possibilidade é executar uma agregação que retorne uma linha por entidade. Embora não seja uma desduplicação, tem efeito semelhante.

SELECT customer_id, min(transaction_date) as first_transaction_date, max(transaction_date) as last_transaction_date, count(*) as total_orders
FROM table
GROUP BY customer_id;
