--CRUD
select * from usuarios;

create table usuarios(
	id_usuario serial,
	nome_usuario varchar (100)not null,
	idade_usuario smallint not null,
	email_usuario varchar (80) not null,
	senha_usuario varchar (8) not null
);
insert into usuarios(
	nome_usuario,
	data_nascimento,
	email_usuario,
	senha_usuario)
values('Tate I. Dean','1989-05-01','Nunc@etmagnis.edu','d3V25D6Y'),
	('Arsenio K. Harmon','1985-10-23','adipiscing.elit@turpis.com','m3T58S0C');
update usuarios set nome_usuario = 'Raja W. Coffey Thomas' where email_usuario = 'raja.feugiat@nonummy.com';
delete from usuarios where id_usuario = 5;
alter table usuarios add unique(email_usuario);
alter table usuarios add column situacao bool default true;
update usuarios set situacao = false where email_usuario = 'montes.nascetur@odiotristique.co.uk';
update usuarios set senha_usuario = 'k9P31H1O' where email_usuario = 'risus.Duis@eget.ca';
alter table usuarios drop column idade_usuario;
alter table usuarios add column data_nascimento date;
update usuarios set data_nascimento = '1991-09-29' where email_usuario = 'auctor@duiFuscediam.edu';
update usuarios set data_nascimento = '1988-11-02' where email_usuario = 'nec.metus.facilisis@vitaealiquet.edu';
delete from usuarios where data_nascimento is null;
alter table usuarios alter column data_nascimento set not null;