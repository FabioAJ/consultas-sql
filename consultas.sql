/*
Nome do autor: Fábio Augusto Amaro Jaime
Data de criação do arquivo: 31/12/2018
Objetivo sucinto do arquivo: guardar resoluções de exercicios de banco de dados.
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r 
*/

-- cria um banco de dados --
create database cadastro;

-- usa o banco de dados --
use cadastro;

-- cria uma tabela --
create table pessoas (
nome varchar(30),
idade tinyint(3),
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);

-- Deleta um banco de dados --
drop database cadastro;

-- cria um banco de dados utf8 --
create database cadastro
default character set utf8
default collate utf8_general_ci;

-- cria tabela utf8 --
create table `pessoas` (
id int not null auto_increment,
`nome` varchar(30) not null,
`nascimento` date,
`sexo` enum('M','F'),
`peso` decimal(5,2),
`altura` decimal(3,2),
`nacionalidade` varchar(20) default 'Brasil',
primary key (id)
)default charset = utf8;

-- coloca o valor na tabela pessoas --
insert into `pessoas`
(nome,nascimento,sexo,peso,altura,nacionalidade)
values
('Godofredo','1984-01-02','M','78.5','1.83','Brasil');

-- mostra os valores da tabela pessoas --
select * from pessoas;

-- coloca o valor na tabela pessoas * mais facil --
insert into `pessoas` values
(default,'Jorge','2004-07-13','M','85.7','1.95',default),
(default,'Jorgin','2019-01-03','M','5.5','0.20','Brasil');

-- descreve as pessoas --
desc pessoas;

-- adiciona uma coluna --
alter table pessoas
add column profissao varchar(10);

-- exclui uma coluna --
alter table pessoas
drop column profissao;

-- adiciona uma coluna apos o nome --
alter table pessoas
add column profissao varchar(10) after nome;

-- adiciona uma coluna no primeiro lugar --
alter table pessoas
add codigo int first;

-- aumenta o tamanho de caraacteres --
alter table pessoas
modify column profissao varchar(20);

-- muda para not null uma coluna que é toda not null colocando um default --
alter table pessoas
modify column profissao varchar(20) not null default '';

-- muda o nome de uma coluna --
alter table pessoas
change column profissao prof varchar(20);

-- muda o nome de uma tabela --
alter table pessoas
rename to gafanhotos;

-- descreve --
desc gafanhotos;

-- nova tabela se ela nao existir --
create table if not exists cursos (

`nome` varchar(30) not null unique,
`descricao` text,
`carga` int unsigned,
`totaulas` int unsigned,
`ano` year default '2016'

) default charset = utf8;

-- descreve --
desc cursos;

-- adiciona um id --
alter table cursos
add column idcurso int first;

-- adiciona uma chave primaria --
alter table cursos
add primary key (idcurso);

-- teste de exclusao de tabelas --
create table if not exists teste (

nome varchar(10),
id int,
idade int

);

-- exclui se existir --
drop table if exists cursos;

-- insere registros no cursos --
INSERT INTO cursos VALUES
('1','HTML4','Curso de HTML5', '40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10','Youtuber','Gerar polêmica e ganhar inscritos','5','2','2018');


-- muda os registros do curso identificando o id --
update cursos
set nome = 'HTML5'
where idcurso = '1';

update cursos
set nome = 'PHP',ano = '2015'
where idcurso = '4';

update cursos
set nome = 'Java',ano = '2015',carga = '40'
where idcurso = '5'
limit 1;

-- muda todos os registros com o ano 2018 *PERIGOSO* --
update cursos
set ano = '2050'
where ano = '2018';

-- muda todos os registros com o ano 2018 *PERIGOSO MAS MUDA SOMENTE 1 LINHA* --
update cursos
set ano = '2050'
where ano = '2018'
limit 1;

-- deleta os registros indentificando o id --
delete from cursos
where idcurso = '8';

delete from cursos
where idcurso = '9';

delete from cursos
where idcurso = '10';

-- deleta todos registros --
truncate table cursos;

-- mostra os campos com ordenacao de nome  DESC = DESCENDENTE ASC = CRESENTE -- 
select * from cursos
order by nome desc;

-- mostra somente os parametros que quiser --
select nome, ano, carga from cursos
order by nome desc;

-- mostra os que o ano for igual --
select * from cursos
where ano = '2016'
order by nome desc;

-- com operadores diferentes --
select * from cursos
where ano <= '2016'
order by nome desc;

-- dentre x e y --
select * from cursos
where ano between '2016' and '2020'
order by nome desc, ano desc;

-- em --
select * from cursos
where ano in ('2016', '2018', '2014')
order by ano asc;

-- e --
select * from cursos
where carga > 35 and totaulas < 30;

-- ou --
select * from cursos
where carga > 35 or totaulas < 30;

-- like e % --
select * from cursos
where nome like '%a%';

-- not like e % --
select * from cursos
where nome not like '%a%';

-- _ exige que tenha 1 caractere --
select * from cursos
where nome like 'ph%p_';

-- distinct --
select distinct nacionalidade from gafanhotos
order by nacionalidade;

-- count --
select count(*) from cursos
where carga > 40;

-- max --
select max(totaulas) from cursos where ano = '2016';

-- min --
select nome, min(totaulas) from cursos where ano = '2016';

-- sum = soma --
select sum(totaulas) from cursos;

-- avg = media --
select avg(totaulas) from cursos;

-- Exercicios curso em video --

-- #1 --
select nome from gafanhotos
where sexo = 'F';

-- #2 --
select * from gafanhotos 
where nascimento between '2000-01-01' and '2015-12-31';

-- #3 --
select nome from gafanhotos 
where sexo = 'M' and profissao = 'Programador';

-- #4 --
select * from gafanhotos 
where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

-- #5 --
select nome, nacionalidade from gafanhotos 
where sexo = 'M' and nome like '%_Silva%' and nacionalidade not like 'Brasil' and peso < '100';

-- #6 --
select max(altura) from gafanhotos
where nacionalidade = 'Brasil';

-- #7 --
select avg(peso) from gafanhotos;

-- #8 --
select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade not like 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- #9 --
select count(nome) from gafanhotos
where sexo = 'F' and altura > '1,90';

-- destinção --
select distinct carga from cursos
order by carga;

-- agrupamento e having --
select carga, count(nome) from cursos
group by carga
having count(nome) > 3;

-- agrupamento por ano --
select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*) desc;

-- acima da media --
select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

-- exercicios curso em video --

-- #1 --
select profissao,count(*) from gafanhotos
group by profissao;

-- #2 --
select sexo,count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

-- #3 --
select nacionalidade,count(*) from gafanhotos
where nacionalidade not like 'Brasil'
group by nacionalidade
having count(nacionalidade) > '3';

-- #4 --
select altura,count(*) from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos);

-- chave estrangeira --
alter table gafanhotos
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);
	
desc gafanhotos;
desc cursos;
select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1';

-- so apaga quando nao há relação --
delete from cursos
where idcurso = '6';

-- usando inner join, on e as --
select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

-- usando left outer join --
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

-- nova tabela com chaves estrangeiras --
create table gafanhoto_assiste_curso (
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key (id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key (idcurso) references cursos(idcurso)
)default charset = utf8;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2');

-- usando join --
select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c
on a.idcurso = c.idcurso;

/*
Exercicios do 1 ao 20 do site https://www.sqlteaching.com/
*/

/*
Lesson 1: SELECT *
*/
select * from family_members;

/*
Lesson 2: SELECT specific columns
*/
SELECT name,species FROM family_members;


/*
Lesson 3: WHERE ... Equals
*/
select id,name,gender,species,num_books_read
from family_members where species='dog';
 
/*
Lesson 4: WHERE ... Greater than
*/
select * from family_members where  num_books_read > 190;

/*
Lesson 5: WHERE ... Greater than or equal
*/
select * from family_members where  num_books_read >= 180;
 
/*
Lesson 6: AND
*/
select id,name,gender,species,height_cm
from friends_of_pickles where  height_cm < 45 AND species = 'dog';

/*
Lesson 7: OR
*/
SELECT * FROM friends_of_pickles WHERE height_cm < 45 OR species = 'dog';

/*
Lesson 8: IN
*/
SELECT * FROM friends_of_pickles WHERE species NOT IN ('cat', 'dog');

/*
Lesson 9: DISTINCT
*/
select distinct species from friends_of_pickles where height_cm > 50;

/*
Lesson 10: ORDER BY
*/
select * from friends_of_pickles 
order by height_cm desc;

/*
Lesson 11: LIMIT # of returned rows
*/
select id, name,gender,species,max (height_cm) height_cm from friends_of_pickles
order by height_cm 
limit 1;

/*
Lesson 12: COUNT(*)
*/
select count(*) from friends_of_pickles;

/*
Lesson 13: COUNT(*) ... WHERE
*/
select count(*) from friends_of_pickles WHERE species = 'dog'

/*
Lesson 14: SUM
*/
select sum(num_books_read) from family_members;

/*
Lesson 15: AVG
*/
select avg(num_books_read) from family_members;

/*
Lesson 16: MAX and MIN
*/
select max(num_books_read) from family_members;

/*
Lesson 17: GROUP BY
*/
select max(height_cm),species from friends_of_pickles 
group by species;

/*
Lesson 18: Nested queries
*/
select * from family_members  where num_books_read = (select max(num_books_read) from family_members);

/*
Lesson 19: NULL
*/
select * from family_members where favorite_book not like 'null';

/*
Lesson 20: Date
*/
select * from celebs_born 
where birthdate > '1980-01-9';

/*
Exercicios do 21 ao 31 do site https://www.sqlteaching.com/
*/

/*
Lesson 21: Inner joins
*/
select character.name,character_actor.actor_name
from character join character_actor
on character.id = character_actor.character_id;

/*
Lesson 22: Multiple joins
*/
select c.name,a.name from character c 
join character_actor ca 
on c.id = ca.id
join actor a
on a.id = actor_id;

/*
Lesson 23: Joins with WHERE
*/
select character.name,tv_show.name from character join character_tv_show
on character.id =character_tv_show.character_id
join tv_show
on character_tv_show.tv_show_id = tv_show_id 
where character.name = 'Doogie Howser' and tv_show.name = 'Doogie Howser, M.D.' 
and character.name != 'Willow Rosenberg' and  tv_show.name != 'How I Met Your Mother';

/*
Lesson 24: Left joins
*/
select c.name, a.name from character c left join character_actor ca
on c.id = ca.character_id
left join actor a
on a.id = ca.actor_id;

/*
Lesson 25: Table alias
*/
select c.name, a.name 
from character as c 
left join character_actor AS ca
on c.id = ca.character_id
left join actor AS a
on a.id = ca.actor_id;

/*
Lesson 26: Column alias
*/
select c.name AS character,a.name AS actor
from character c 
left join character_actor ca
on c.id = ca.character_id
left join actor a
on a.id = ca.actor_id;

/*
Lesson 27: Self joins
*/
select epy.name AS employee_name,bos.name AS boss_name
from employees AS epy join employees AS bos 
on epy.boss_id = bos.id;

/*
Lesson 28: LIKE
*/
SELECT * FROM robots 
WHERE name LIKE "%200%";

/*
Lesson 29: CASE
*/
SELECT *, CASE WHEN species = 'human' THEN "talk"
WHEN species = 'cat'
THEN 'meow'
ELSE 'bark' END AS sound
FROM friends_of_pickles;

/*
Lesson 30: SUBSTR
*/
SELECT * FROM robots 
WHERE SUBSTR(location, -4,14) like '%NY';

/*
Lesson 31: COALESCE
*/
SELECT name, COALESCE(tank,gun,sword) as weapon FROM fighters; 












