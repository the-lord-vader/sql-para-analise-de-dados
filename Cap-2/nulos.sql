--Para lifar com valores nulos podemos usar a instrução CASE
case when num_orders is null then 0 else num_orders end

case when address is null then 'unknown' else address end

--Temos também a função colaesce que recebve dois argumentos e retorna o primeiro que não é nulo
coalesce(num_orders, 0)

coalesce(address, 'unknown')

--A função nullif recebe dois números, se eles não forem iguais, retorna o primeiro, se eles forem iguais retorna nulo
nullif(6, 7) --retorna 6

nullif(6, 6) --retorna nulo

--Podemos filtrar os nulos na clausula where
where coluna_a is null

where coluna_b is not null
