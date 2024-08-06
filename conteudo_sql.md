# Aula de Banco de Dados

## Criar Base de Dados

```sql
create database db_ex01_marcella;
```

## Ativar Base de Dados
```sql
use db_ex01_marcella;
```

## Apagar Base de Dados
```sql
drop database db_ex01_marcella;
```

> create database db_ex02_marcella; use db_ex02_marcella;

## Exemplo 1
```sql
create table tb_autores(
aut_cod int primary key not null auto_increment,
aut_nome varchar (45) not null
);
```
```sql
create table tb_categorias(
cat_cod int primary key not null auto_increment,
cat_nome varchar (45) not null,
cat_descricao varchar (45) not null
);
```
```sql
create table tb_livros(
liv_cod int primary key not null auto_increment,
liv_titulo varchar (45) not null, 
liv_aut_cod int not null,
liv_cat_cod int not null,
foreign key (liv_aut_cod) references tb_autores(aut_cod),
foreign key (liv_cat_cod) references tb_categorias(cat_cod)
);
```

## Exemplo 2

```sql

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

```
```sql
select * from tb_funcionarios;
insert into tb_funcionarios values (default,'Maria','004.005.006-05');

alter table tb_funcionarios add column fun_teste int not null;
select * from tb_funcionarios;
```

## Exemplo 3

```sql
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

create table tb_exame_tem_atestado(
exates_exa_id int not null,
exates_ats_id int not null,
foreign key (exates_exa_id) references tb_exame(exa_id),
foreign key (exates_ats_id) references tb_atestado(ats_id),

primary key (exates_exa_id, exates_ats_id)
);

create table tb_cargo(
car_id int primary key not null auto_increment,
car_nome varchar (45) not null
);

create table tb_riscos_ocupacionais(
rio_id int primary key not null auto_increment,
rio_nome varchar (45) not null
);


create table tb_cargo_tem_risco_operacional(
carisc_car_id int not null,
carisc_rio_id int not null,
foreign key (carisc_car_id) references tb_cargo(car_id),
foreign key (carisc_rio_id) references tb_riscos_ocupacionais(rio_id),
primary key (carisc_car_id, carisc_rio_id)
);

create table tb_empresa(
emp_id int primary key not null auto_increment,
emp_cnpj varchar (20) not null,
emp_nome_fantasia varchar (50),
emp_endereco varchar (200) not null,
emp_telefone varchar (20) not null,
emp_emp_id int not null,
foreign key (emp_emp_id) references tb_empresa(emp_id)
);

create table tb_empresa_tem_exame(
empexa_exa_id int not null,
empexa_emp_id int not null,
foreign key (empexa_exa_id) references tb_exame(exa_id),
foreign key (empexa_emp_id) references tb_empresa(emp_id),
primary key (empexa_exa_id, empexa_emp_id)
);



create table tb_funcionario(
fun_id int primary key not null auto_increment,
fun_nome varchar (100) not null,
fun_cpf varchar (20) not null,
fun_data_nascimento date not null,
fun_endereco varchar (200) not null,
fun_telefone varchar (20) not null,

fun_car_id int not null,
fun_emp_id int not null,
foreign key (fun_car_id) references tb_cargo(car_id),
foreign key (fun_emp_id) references tb_empresa(emp_id)

);
 
create table tb_funcionario_tem_exame(
fuexa_exa_id int not null,
fuexa_fun_id int not null,
foreign key (fuexa_exa_id) references tb_exame(exa_id),
foreign key (fuexa_fun_id) references tb_funcionario(fun_id),
primary key (fuexa_exa_id, fuexa_fun_id)
);
```
# ALTER
## Exemplo 4 

```sql
create database DB_loja_marcella;
use DB_loja_marcella;

create table produto(
codigo int primary key not null auto_increment,
descri varchar (45) not null,
valor varchar (45)
);

alter table produto rename TB_produto;
alter table tb_produto drop column codigo;
alter table tb_produto add column pro_cod int primary key not null auto_increment;
alter table tb_produto change column descri pro_descri varchar (45);
alter table tb_produto change column valor pro_valor float;


create table cliente(
numero int primary key not null auto_increment,
Nome int not null,
cpf int,
profissao float
);

alter table cliente rename tb_cliente;
alter table tb_cliente change column numero cli_cod int;
alter table tb_cliente change column Nome cli_nome varchar (45);
alter table tb_cliente change column cpf cli_cpf varchar (45);
alter table tb_cliente change column profissao cli_profis varchar (45);


create table funcionario(
cod int,
nome int,
cpf varchar (45)
);

alter table funcionario rename tb_funcionario;
alter table tb_funcionario change column cod fun_cod int primary key not null auto_increment;
alter table tb_funcionario change column nome fun_nome varchar (45) not null;
alter table tb_funcionario change column cpf fun_cpf varchar (45);


create table pedido(
idpedido int primary key not null auto_increment,
cliente varchar (45),
produto int,
funcionario varchar (45)
);

alter table pedido rename tb_pedido;
alter table tb_pedido change column idpedido ped_cod int;
alter table tb_pedido change column cliente ped_cli_cod int not null;
alter table tb_pedido change column produto ped_pro_cod int not null;
alter table tb_pedido change column funcionario ped_fun_cod int not null ;

alter table tb_pedido add foreign key (ped_cli_cod) references tb_cliente(cli_cod);
alter table tb_pedido add foreign key (ped_pro_cod) references tb_produto(pro_cod);
alter table tb_pedido add foreign key (ped_fun_cod) references tb_funcionario(fun_cod);


```

## Insert into e Select
```sql
use db_ex02_marcella;

select * from tb_autores; 
# buscar todas as informações da tabela autores - o * representa/expecifica as colunas!

select aut_nome, aut_cod from tb_autores;

# quando eu não defino o nome da coluna eu preciso adicionar o valor de todas as colunas
insert into tb_autores values (default, 'popó');

# adiciona de forma especifica os valores as colunas que não podem ser nulas (not null) / o autoincremento é definido automa
insert into tb_autores (aut_nome) values ('Marella');

insert into tb_categorias values (default, 'Harry Potter', 'muito legal'),(default, 'Percy Jackson', 'muito divertido');
select * from tb_categorias;

UPDATE tb_categorias
SET cat_nome = 'terror', cat_descricao = 'Muito ruim'
WHERE cat_cod = 3;


# quando a chave é estrangeira eu presiso usar o id do cliente que eu estou atribuindo o telefone

select * from tb_livros;
insert into tb_livros values (default, 'harry potter', 1, 1);

```
## Selecionar com filtros
```sql
select * from tb_alunos;
select count(*) from tb_alunos where alu_genero='F';
select alu_nome, alu_data_nascimento from tb_alunos where alu_bairro='Beverly Hills';
select * from tb_alunos where alu_bairro='centro' or alu_bairro='Beverly Hills';

select * from tb_alunos where alu_genero='M' and alu_estado='CA';

# A ORDEM IMPORTA  - SELECIONA TODOS DO ESTADO DE 'NY' E SELECIONA TODOS DO BAIRRO 'HOLLYWOOD' SE O GENERO FOR 'M'
select * from tb_alunos where alu_estado='NY' or alu_bairro='Hollywood' and alu_genero='M';
select * from tb_alunos where alu_genero='F' and alu_cep='10001';

select * from tb_jogadores where jog_nacionalidade='Brasil';
select * from tb_jogadores where jog_nacionalidade='Brasil' and jog_posicao='Atacante';
select count(*) from tb_jogadores where jog_nacionalidade='Brasil' and jog_posicao='Atacante' or jog_posicao='Goleiro';

select * from tb_times;

insert into tb_times values(default, 'Botafogo', 'Rio de Janeiro', 'RJ', 'Brasil');
insert into tb_jogadores values('Tiquinho Soares', '1996-08-30', 'M', 'Brasil', 'Atacante', 9, 9, '2023-08-01');

# assim eu tenho as duas tabelas para filtrar!
select * from tb_jogadores, tb_times where tim_id=jog_time_id;

select * from tb_jogadores, tb_times where tim_id=jog_time_id and tim_nome='Palmeiras';
```
