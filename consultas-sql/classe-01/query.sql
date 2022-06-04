SELECT id, compositor FROM musicas;--1
SELECT id, compositor, tempo FROM musicas WHERE tempo / 60 < 400;--2
SELECT id, compositor, tempo FROM musicas WHERE tempo  BETWEEN 47 AND 123;--3
SELECT * FROM musicas WHERE compositor IS NOT NULL AND tempo / 60 < 500 AND compositor != 'Bach';--4
SELECT id, compositor, tempo FROM musicas WHERE compositor = 'Mozart' OR compositor = 'Bach';--5
SELECT * FROM musicas ORDER BY id DESC;--6
SELECT * FROM musicas ORDER BY tempo DESC;--7
SELECT * FROM musicas ORDER BY tempo DESC LIMIT 5;--8
SELECT * FROM musicas ORDER BY tempo ASC LIMIT 10;--9
SELECT * FROM musicas ORDER BY tempo ASC LIMIT 10 OFFSET 5;--10
SELECT * FROM musicas ORDER BY id ASC LIMIT 10 OFFSET 10*4;--11
SELECT * FROM musicas ORDER BY id ASC LIMIT 12 OFFSET 12*6;--12
SELECT DISTINCT compositor FROM musicas WHERE compositor NOTNULL;--13
SELECT DISTINCT compositor, composicao FROM musicas WHERE compositor NOTNULL AND composicao NOTNULL;--14
SELECT * FROM musicas WHERE compositor LIKE '%Bra%';--15
SELECT * FROM musicas WHERE ritmo LIKE '%troppo';--16
SELECT * FROM musicas WHERE composicao ILIKE '%quartet%';--17
SELECT * FROM musicas WHERE composicao NOT ILIKE '%quintet%';--18