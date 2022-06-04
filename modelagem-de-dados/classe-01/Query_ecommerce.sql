CREATE DATABASE ecommerce;
create table if not exists categorias(
	id serial not null primary key,
	nome varchar(50) not null
);

create table if not exists produtos(
	id serial not null primary key,
	nome varchar(100)not null,
	descricao text not null,
	preco int not null,
	quantidade_em_estoque int,
	categoria_id int not null references categorias(id)
);

create table clientes(
	cpf char(11) not null primary key,
	nome varchar(150) not null
);

create table vendedores(
	cpf char(11) not null primary key,
	nome varchar(150) not null
);

create table pedidos(
	id serial not null primary key,
	valor int not null,
	cliente_cpf char(11) not null references clientes(cpf),
	vendedor_cpf char(11) not null references vendedores(cpf)
);


create table itens_do_pedido(
	id serial not null primary key,
	pedido_id int not null references pedidos(id),
	quantidade int not null,
	produto_id int not null references produtos(id)
);


alter table vendedores
add unique (cpf);

insert into categorias (nome) 
VALUES ('frutas'), ('verduras'),('massas'),('bebidas'),('utilidades');

select * from categorias;

insert into produtos(nome, descricao, preco, quantidade_em_estoque, categoria_id)
values 
('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1);
('Maça', 'Fonte de potássio e fibras', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C', 125, 88, 2),
('Acelga', 'NÃO CONTÉM GLÚTEN',	235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5,	3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria',	875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN, NÃO ALCOÓLICO', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN', 420, 90, 1);

insert into clientes (cpf,nome)
values
('67642869061','Antonio Oliveira'),
('63193310034','Ana Rodrigues'),
('75670505018','Maria da Conceição');

insert into vendedores (cpf,nome)
values
('82539841031','Rodrigo Sampaio'),
('23262546003','Beatriz Souza Santos'),
('28007155023','Carlos Eduardo');


select produtos.nome p, produtos.categoria_id c, categorias.nome
from produtos
left join categorias on produtos.categoria_id = categorias.id;



insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values 
(9650, '80371350042', '28007155023');

insert into itens_do_pedido (pedido_id, quantidade, produto_id)
values
(1, 1, 1), (1, 1, 10), (1, 6, 11), (1, 1, 15), (1, 5, 2);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 
WHERE nome = 'Mamão' OR nome = 'Refrigerante Pepsi 2l' OR nome = 'Escova dental';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 
WHERE nome = 'Cerveja Heineken 600ml';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 5 
WHERE nome = 'Maça';


insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values
(6460, '63193310034', '23262546003');
insert into itens_do_pedido (pedido_id, quantidade, produto_id)
values
(2, 10, 17), (2, 3, 18), (2, 5, 1), (2, 10, 5), (2, 2, 6);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 10 
WHERE nome = 'Manga' OR nome = 'Tomate';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 5 
WHERE nome = 'Mamão';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 
WHERE nome = 'Uva';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 
WHERE nome = 'Acelga';


insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values 
(4120, '75670505018', '82539841031');

insert into itens_do_pedido (pedido_id, quantidade, produto_id)
values
(3, 1, 13), (3, 6, 12), (3, 5, 17);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 
WHERE nome = 'Vassoura';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 5 
WHERE nome = 'Agua mineral sem gás';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 
WHERE nome = 'Manga';


insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values 
(9370, '75670505018', '82539841031');

insert into itens_do_pedido (pedido_id, quantidade, produto_id)
values
(4, 1, 16), (4, 6, 18), (4, 1, 7),(4, 3, 1), (4, 20, 5), (4, 2, 6);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 
WHERE nome = 'Balde para lixo 50l' OR nome = 'Macarrão parafuso';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 
WHERE nome = 'Acelga';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 
WHERE nome = 'Mamão';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 6 
WHERE nome = 'Uva';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 20 
WHERE nome = 'Tomate';


insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values
(8229, '67642869061', '82539841031');

insert into itens_do_pedido (pedido_id, quantidade, produto_id)
values
(5, 8, 18), (5, 1, 8), (5, 3, 17), (5, 8, 5), (5, 2, 11);

UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 1 
WHERE nome = 'Massa para lasanha';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 2 
WHERE nome = 'Cerveja Heineken 600ml';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 3 
WHERE nome = 'Mamão';
UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - 8 
WHERE nome = 'Uva' OR nome = 'Tomate';



SELECT categorias.nome AS nome_categoria, produtos.nome AS nome_produtos 
FROM produtos
JOIN categorias ON categorias.id = produtos.categoria_id
ORDER BY nome_categoria;



SELECT id, vendedores.nome AS nome_vendedor, clientes.nome AS nome_cliente 
FROM pedidos
JOIN vendedores ON vendedores.cpf = pedidos.vendedor_cpf
JOIN clientes ON clientes.cpf = pedidos.cliente_cpf;



SELECT categorias.nome AS categorias, produtos.nome as produtos, 
SUM(produtos.quantidade_em_estoque) as quantidade_em_estoque 
FROM categorias
JOIN produtos ON produtos.categoria_id = categorias.id
GROUP BY categorias.nome, produtos.nome
ORDER BY quantidade_em_estoque desc;



SELECT produtos.nome, SUM(itens_do_pedido.quantidade) AS quantidade_vendida 
FROM produtos
JOIN itens_do_pedido ON itens_do_pedido.produto_id = produtos.id
GROUP BY produtos.nome
ORDER BY quantidade_vendida desc;