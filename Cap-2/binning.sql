--A discretização(binning) é útil no trabalho com valores contínuos. Em vez de ser usado o número de observações ou registros de cada valor que está sendo contado, intervalos de valores são agrupados, e esses grupos são chamados de bins ou bikcets.

--Podemos usar a instrução CASE para agrupar order_amount em três buckets.

SELECT
case 
  when order_amount <= 100 then 'up to 100'
  when order_amount <= 500 then '100 - 500'
  else '500+' 
end as amount_bin
,case 
  when order_amount <= 100 then 'up to 100'
  when order_amount <= 500 then '100 - 500'
  else '500+'
end as amount_category
,count(customers_id) as customers
from orders
GROUP BY 1,2;

--Podemos arredondar os calore dos bins com a função round

SELECT round(sales, -1) as bin
,count(customer_id) as customers
FROM table
GROUP BY 1;

--Outra opção é a função log, que retorna o logaritmo de um número, podem ser usados em conjuntos de dados em que os valores mais altos tenham ordem de magnitude maior doque os valores menores.
--Logaritmo é o expoente ao qual 10 deve ser elevado para produzir esse número.

SELECT log(sales) as bin
,count(customer_id) as customers
FROM table
GROUP BY 1;
