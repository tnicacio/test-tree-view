create table hierarchy (
	id serial primary key,
	name varchar(255),
	position_index text,
	tree_level numeric(19),
	parent_id numeric(19)
);
/* position_level = (número de repetições do separador ; no campo position_index)+ 1 */

insert into hierarchy(id, name, position_index, tree_level, parent_id) values 
(1, 'Presidente', '1', 1, null),
(2, 'Diretor de Dev', '1;1', 2, 1),
(3, 'Diretor de Sup', '1;2', 2, 1),
(4, 'Diretor de Quali', '1;3', 2, 1),
(5, 'Gerente de Dev I', '1;1;1', 3, 2),
(6, 'Gerente de Dev II', '1;1;2', 3, 2),
(7, 'Gerente de Sup I', '1;2;1', 3, 3),
(8, 'Analista Sistemas', '1;1;2;1', 4, 6),
(9, 'Analista Negócios', '1;1;2;2', 4, 6),
(10, 'Arquiteto', '1;1;2;3', 4, 6),
(11, 'Cordenador AI', '1;1;1;1', 4, 5),
(12, 'Cordenador AII', '1;1;1;2', 4, 5),
(13, 'Analista Sistemas', '1;1;1;1;1', 5, 11),
(14, 'Analista Negócios', '1;1;1;1;2', 5, 11),
(15, 'Analista Sistemas', '1;1;1;2;1', 5, 12),
(16, 'Analista Negócios', '1;1;1;2;2', 5, 12),
(17, 'Arquiteto', '1;1;1;2;3', 5, 12);
