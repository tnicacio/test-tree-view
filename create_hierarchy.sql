create table hierarchy (
	id serial primary key,
	name varchar(255),
	position_index text,
	parent_id numeric(19)
);

insert into hierarchy(id, name, position_index, parent_id) values 
(1, 'Presidente', '1', null),
(2, 'Diretor de Dev', '1;1', 1),
(3, 'Diretor de Sup', '1;2', 1),
(4, 'Diretor de Quali', '1;3', 1),
(5, 'Gerente de Dev I', '1;1;1', 2),
(6, 'Gerente de Dev II', '1;1;2', 2),
(7, 'Gerente de Sup I', '1;2;1', 3),
(8, 'Analista Sistemas', '1;1;2;1', 6),
(9, 'Analista Negócios', '1;1;2;2', 6),
(10, 'Arquiteto', '1;1;2;3', 6);

/* Diretor de Dev */
select * from "hierarchy" 
where upper(name) like upper('%Diretor de Dev%');

/* Todos abaixo do Diretor Dev */
select * from "hierarchy" 
where position_index like '1;1;%';

/* Todos no nível imediatamente abaixo do Diretor Dev */
select * from "hierarchy" 
where parent_id = 2;
