SELECT count(medicamento) FROM farmacia;--1
SELECT MIN(idade) AS idade FROM usuarios;--2
SELECT MAX(idade) AS idade FROM usuarios;--3
SELECT AVG(idade) AS idade FROM usuarios WHERE idade >= 18;--4
SELECT categoria, count(*) as Quant, SUM(estoque) as somaestoque FROM farmacia WHERE categoria= 'blue' OR categoria='black' GROUP BY categoria;--5
SELECT categoria, count(*) as Quant, SUM(estoque) as somaestoque FROM farmacia WHERE categoria NOTNULL GROUP BY categoria;--6
SELECT categoria, count(*) as Quant, SUM(estoque) as somaestoque FROM farmacia WHERE categoria IS NOT NULL GROUP BY categoria;--7
SELECT SUM(estoque) FROM farmacia WHERE categoria IS NULL;--8
SELECT id || ' - ' || medicamento || ' - ' || COALESCE (categoria, 'Não possui') as MediamentoCategoria FROM farmacia ORDER BY id;--9
SELECT id || ' - ' || medicamento || ' (' || COALESCE (categoria, 'sem categoria') || ') ' as idmedicamentocategoria FROM farmacia ORDER BY id;--10
SELECT nome, idade, CAST(cadastro as date) FROM usuarios WHERE cadastro >= '2020' AND cadastro < '2021';--11
SELECT nome, idade, email, AGE(CAST(cadastro AS timestamp)) AS tempocad FROM usuarios WHERE idade < 18;--12
SELECT nome, idade, email, AGE(CAST(cadastro AS timestamp)) AS tempocad FROM usuarios WHERE idade >= 60;--13
SELECT categoria, count(*) as Quant, SUM(estoque) as somaestoque FROM farmacia GROUP BY categoria;--14
SELECT idade, COUNT(idade) AS quantidade FROM usuarios WHERE idade >= 18 GROUP BY idade;--15
SELECT categoria, count(*) as Quant, SUM(estoque) as somaestoque FROM farmacia WHERE categoria= 'blue' OR categoria='black' or categoria = 'red' GROUP BY categoria;--16