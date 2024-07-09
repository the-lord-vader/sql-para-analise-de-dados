--Suponhamos que tivéssemos uma tabela customers, contendo nome, data de cadastramento, idade e outros atributos. Para criar um histograma por idade, faça o agrupamento(com group by) pelo campo numérico age e conte as ocorrências de customer_id:

SELECT age, count(customer_id) as customers
FROM customers
GROUP BY 1;

--Imagine uma base fictícia chamada orders, que tem data, identificador do cleinte(customer_id, identificador do pedido(order_ir e uma quantidade, vamos escrever uma consulta que retorne a distribuição de pedidos por cliente. Isso não pode ser resolvido com uma simples consulta, requer uma etapa de agregação intermediária, que pode ser executada com uma subconsulta. Primeiro conte o número de pedidos feitos por cada customer_id na subconsulta.

SELECT orders, count(*) as num_customers
FROM 
(
  SELECT customer_id, count(order_id) as orders
  FROM orders
  GROUP BY 1
) a
GROUP BY 1;

--Vamos criar uma coluna que retorna se o cliente já comprou maçã ou laranjas, independente da data da compra
SELECT customer_id, 
max(case
      when fruit = 'apple' then 1 else 0
    end) as bought_apple
,max(case
      when fruit = 'orange' then 1 else 0
    end) as bought_oranges
FROM tabela
