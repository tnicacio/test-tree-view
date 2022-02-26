/* Diretor de Dev */
select * from "hierarchy" 
where upper(name) like upper('%Diretor de Dev%');
/*	
id	name			position_index	position_level	parent_id
2	Diretor de Dev	1;1				2				1
*/


/* Todos abaixo do Diretor de Dev, que possui position_index = '1;1'*/
select 	* 
from 	"hierarchy" h 
where 	position_index like concat('1;1', ';%');
/*	
id	name				position_index	position_level	parent_id
5	Gerente de Dev I	1;1;1			3				2
6	Gerente de Dev II	1;1;2			3				2
8	Analista Sistemas	1;1;2;1			4				6
9	Analista Negócios	1;1;2;2			4				6
10	Arquiteto			1;1;2;3			4				6
11	Cordenador AI		1;1;1;1			4				5
12	Cordenador AII		1;1;1;2			4				5
13	Analista Sistemas	1;1;1;1;1		5				11
14	Analista Negócios	1;1;1;1;2		5				11
15	Analista Sistemas	1;1;1;2;1		5				12
16	Analista Negócios	1;1;1;2;2		5				12
17	Arquiteto			1;1;1;2;3		5				12
*/


/* Todos no nível imediatamente abaixo do Diretor Dev, que possui id = 2 */
select 	* 
from 	"hierarchy" h
where 	parent_id = 2;
/*	
id	name				position_index	position_level	parent_id
5	Gerente de Dev I	1;1;1			3				2
6	Gerente de Dev II	1;1;2			3				2
*/


/* 
 * Todos os liderados do presidente até o 4o nível da árvore
 * O presidente possui position_index = '1'
 */
select 	* 
from 	"hierarchy" h 
where 	h.position_index like concat('1', ';%')
and		h.position_level <= 4;
/*	
id	name				position_index	position_level	parent_id
2	Diretor de Dev		1;1				2				1
3	Diretor de Sup		1;2				2				1
4	Diretor de Quali	1;3				2				1
5	Gerente de Dev I	1;1;1			3				2
6	Gerente de Dev II	1;1;2			3				2
7	Gerente de Sup I	1;2;1			3				3
8	Analista Sistemas	1;1;2;1			4				6
9	Analista Negócios	1;1;2;2			4				6
10	Arquiteto			1;1;2;3			4				6
11	Cordenador AI		1;1;1;1			4				5
12	Cordenador AII		1;1;1;2			4				5
*/


/* 
 * Todos os liderados do Gerente de Dev I até 2 níveis abaixo do nível dele.
 * Assumindo que possuímos as informações do Gerente de Dev I:
 * { id: 5, position_index: '1;1;1', position_level: 3, parent_id: 2 }
 */
select * 
from 	"hierarchy" h 
where 	h.position_index like concat('1;1;1', ';%')
and		h.position_level <= (3 + 2);
/*	
id	name				position_index	position_level	parent_id
11	Cordenador AI		1;1;1;1			4				5
12	Cordenador AII		1;1;1;2			4				5
13	Analista Sistemas	1;1;1;1;1		5				11
14	Analista Negócios	1;1;1;1;2		5				11
15	Analista Sistemas	1;1;1;2;1		5				12
16	Analista Negócios	1;1;1;2;2		5				12
17	Arquiteto			1;1;1;2;3		5				12
*/
