# Aula de Banco de Dados

'''

create database db_ex01_marcella;
use db_ex01_marcella;
drop database db_ex01_marcella;

create database db_ex02_marcella;
use db_ex02_marcella;

create table tb_autores(
aut_cod int primary key not null auto_increment,
aut_nome varchar (45) not null
);
create table tb_categorias(
cat_cod int primary key not null auto_increment,
cat_nome varchar (45) not null,
cat_descricao varchar (45) not null
);

create table tb_livros(
liv_cod int primary key not null auto_increment,
liv_titulo varchar (45) not null, 
liv_aut_cod int not null,
liv_cat_cod int not null,
foreign key (liv_aut_cod) references tb_autores(aut_cod),
foreign key (liv_cat_cod) references tb_categorias(cat_cod)
);




create table tb_funcionarios(
fun_cod int primary key not null auto_increment,
fun_nome varchar (50) not null,
fun_cpf varchar (14)
);
create table tb_telFun(
tlf_cod int primary key not null auto_increment,
tlf_numero varchar (45),
tlf_fun_cod int not null,
foreign key (tlf_fun_cod) references tb_funcionarios(fun_cod)
);

select * from tb_funcionarios;

'''


create database db_ex01_marcella;
use db_ex01_marcella;
drop database db_ex01_marcella;

create database db_ex02_marcella;
use db_ex02_marcella;

create table tb_autores(
aut_cod int primary key not null auto_increment,
aut_nome varchar (45) not null
);
create table tb_categorias(
cat_cod int primary key not null auto_increment,
cat_nome varchar (45) not null,
cat_descricao varchar (45) not null
);

create table tb_livros(
liv_cod int primary key not null auto_increment,
liv_titulo varchar (45) not null, 
liv_aut_cod int not null,
liv_cat_cod int not null,
foreign key (liv_aut_cod) references tb_autores(aut_cod),
foreign key (liv_cat_cod) references tb_categorias(cat_cod)
);




create table tb_funcionarios(
fun_cod int primary key not null auto_increment,
fun_nome varchar (50) not null,
fun_cpf varchar (14)
);
create table tb_telFun(
tlf_cod int primary key not null auto_increment,
tlf_numero varchar (45),
tlf_fun_cod int not null,
foreign key (tlf_fun_cod) references tb_funcionarios(fun_cod)
);

select * from tb_funcionarios;
insert into tb_funcionarios values (default,'Maria','004.005.006-05');

alter table tb_funcionarios add column fun_teste int not null;
select * from tb_funcionarios;

