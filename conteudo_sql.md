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


