--O postgres tem a função de arry unnest que pode ser usada para despivotar dados
--em uma tabela onde temos as colunas year_1980, year_1990, year_2000 e year_2010, podemos tranformar essas colunas em linhas da seguinte forma:

select country,
unnest(array['1980','1990','2000','2010'] as year,
unnest(array['year_1980','year_1990','year_2000','year_2010'] as population
from country_populations;

--como resultado, teríamos uma coluna chamada country, outra year e outra chamada population, simplificando a leitura dos dados
