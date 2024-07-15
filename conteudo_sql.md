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



create database db_hospital_marcella;
use db_hospital_marcella;

create table tb_medico(
med_id int primary key not null auto_increment,
med_crm int not null,
med_nome varchar (100) not null,
med_cpf varchar (20) not null,
med_especialidade varchar (50) not null,
med_data_nascimento date not null,
med_endereco varchar (200) not null,
med_telefone varchar (20)
);

create table tb_atestado(
ats_id int primary key not null auto_increment,
ats_resutados_riscos varchar (100),
ats_resutado varchar (100) not null,
ats_observacoes varchar (300),
ats_med_id int not null,
foreign key (ats_med_id) references tb_medico(med_id)
);

create table tb_resutado_exame(
rex_id int primary key not null auto_increment,
rex_tipo varchar (30) not null
);

create table tb_tipo_exame(
tex_id int primary key not null auto_increment,
tex_tipo varchar (50) not null
);

create table tb_exame(
exa_id int primary key not null auto_increment,
exa_especialidade varchar (50),
exa_data_realizacao date not null,
exa_rex_id int not null,
exa_tex_id int not null,
foreign key (exa_rex_id) references tb_resutado_exame(rex_id),
foreign key (exa_tex_id) references tb_tipo_exame(tex_id)
);


