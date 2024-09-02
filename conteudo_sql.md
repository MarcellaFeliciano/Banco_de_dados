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
## Select no MYSQL
```sql
select * from tb_nome;
```
### Operadores Matemáticos:
> = / >= / > / < / <= / != ou <>

### Operadores Lógicos
> AND / OR

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

## Select com filtros 2
```sql
-- Selecione todos os resultados de atletas do Brasil:
select * from atletismo_resultados where pais='Brasil';

-- Encontre os resultados dos eventos ocorridos após 10 de agosto de 2016.
select * from atletismo_resultados where ano > '2016';

-- Busque os resultados onde o atleta tem o gênero 'F' e a prova é '100m'.
select * from atletismo_resultados where modalidade='Feminino' and prova='100 metros rasos';

-- Encontre os resultados onde o atleta tem o gênero 'M' ou a prova é 'Maratona'.  (ou inclusivo - todos os homens e todos os homens e mulheres que fazem maratona)
select * from atletismo_resultados where modalidade='Masculino' or prova='Maratona';

-- Liste os resultados onde a posição é menor que 4 e a prova é 'Maratona' ou '5000m'.
select * from atletismo_resultados where posicao < 4 and prova='Maratona' or prova='200 metros rasos';

-- Encontre os resultados dos eventos ocorridos em 2020 e onde o país do atleta é 'USA' ou 'KEN'.
select * from atletismo_resultados where ano='2020' and pais='Estados Unidos' or pais='Quênia';

-- Encontre os resultados onde o tempo é menor que 10 segundos e a prova é '100m'.
select * from atletismo_resultados where tempo < 10.00 and prova='100 metros rasos';

-- Selecione os resultados de provas realizadas entre 5 de agosto de 2016 e 21 de agosto de 2016, e onde a posição é menor que 5.
-- select * from atletismo_resultados where data > '5 de agosto' and data < '21 de agosto' and ano='2016' and posicao < 5;

-- Liste os resultados de atletas do país 'JPN' que competiram em 2020 e cuja posição é menor que 8.
select * from atletismo_resultados where pais='Japão' and ano='2020' and posicao < 8;

-- Busque todos os resultados onde o atleta tem o gênero 'F' ou a prova é '200m', e a posição é menor que 4.
select * from atletismo_resultados where modalidade='Feminino' or prova='200 metros rasos' and posicao < 4;

-- Encontre os resultados onde o país do atleta é diferente de 'USA' ou 'JAM', e a posição é entre 1 e 3.
select * from atletismo_resultados where pais <> 'Estados Unidos' and pais <> 'Jamaica' and posicao >= 1 and posicao <= 3;

-- Selecione todos os resultados onde o atleta é 'Mo Farah' ou 'Usain Bolt', que competiram em eventos diferentes de '5000m' e '200m'.
select * from atletismo_resultados where (atleta_nome='Usain Bolt' or atleta_nome='Mo Farah') and prova <> '500 metros rasos' and prova <> '200 metros rasos';

-- Encontre os resultados dos eventos ocorridos em 2020 e onde o país do atleta é 'Jamaica' ou 'Canadá'.
select * from atletismo_resultados where ano='2020' and pais='Jamaica' or pais='Canadá';

-- Encontre os resultados onde o tempo é menor que 10 segundos e a prova é '100 metros rasos '  .
select * from atletismo_resultados where tempo < 10.00 and prova='100 metros rasos';

```

### ORDER BY e Operadores IN e IN NOT

```sql

-- Por padrão irá se ordenado pelo id
-- O 'order by' irá ordenar os dados pela condição/coluna que eu definir (sempre vem ao final) / para colocar em ordem decrescente = desc 
select * from atletismo_resultados order by atleta_nome;

-- Posso selecionar usando o where e ao final difinir o ordenamento 
select * from atletismo_resultados where (prova='100 metros rasos' and modalidade='Feminino') and (pais='Estados Unidos' or pais='Jamaica') order by atleta_nome desc;

-- Operadoror IN e NOT IN
select * from atletismo_resultados where posicao in (1,2,3) order by posicao;
select * from atletismo_resultados where (prova='Maratona' and posicao in (1,2,3)) order by posicao;
select * from atletismo_resultados where pais not in ('Estados Unidos', 'Quênia', 'Etiópia', 'Jamaica') order by posicao;
select * from atletismo_resultados where (pais not in ('Estados Unidos', 'Quênia', 'Etiópia', 'Jamaica') and ano='2020') order by posicao;

-- ordenar o podio (1,2,3) de todas as competições na modalidade feminino e masculino no ano de 2016 e 2020
select posicao, modalidade, prova, atleta_nome, pais, ano from atletismo_resultados where posicao in (1,2,3) order by prova;
```

## Atividade Banco de Dados - like e limit
```sql

-- Eu seleciono onde o nome do aluno que tem a letra A! Ordenando pela ordem alfabética e limitando em 5 valores!
select * from tb_alunos where alu_nome like '%a%' order by alu_nome limit 5;


-- A T I V I D A D E --

-- Liste todos os alunos do estado da Califórnia (CA).
select * from tb_alunos where alu_estado = 'CA';

-- Liste todos os alunos que moram em Los Angeles e são do gênero masculino.
select * from tb_alunos where alu_cidade='Los Angeles' and alu_genero='M';

-- Liste e todos os alunos cujo número da residência seja maior que 500.
select * from tb_alunos where alu_numero > 500 order by alu_numero;

-- Liste todos os alunos que moram em Nova York, Los Angeles ou Houston.
select * from tb_alunos where alu_cidade in ('New York', 'Los Angeles', 'Houston');

-- Liste todos os alunos que não moram em Nova York, Los Angeles ou Houston.
select * from tb_alunos where alu_cidade not in ('New York', 'Los Angeles', 'Houston');

-- Encontre todos os alunos cujos nomes começam com a letra 'J'.
select * from tb_alunos where alu_nome like 'J%';

-- Liste todos os alunos ordenados por data de matrícula em ordem decrescente.
select * from tb_alunos order by alu_data_matricula desc;

-- Liste todos os alunos do gênero feminino cujo número de residência seja menor que 500.
select * from tb_alunos where alu_genero='F' and alu_numero < 500;

-- Liste todos os alunos que moram em cidades que começam com "L" ou "B" e que estão nos estados de Califórnia ou Nova York.
select * from tb_alunos where (alu_cidade like 'L%' or alu_cidade like 'B%') and (alu_estado='CA' or alu_estado='NY');

-- Liste todos os alunos que não moram em Los Angeles ou Nova York, ordenados por nome em ordem alfabética.
select * from tb_alunos where alu_cidade not in ('Los Angeles','New York') order by alu_nome;

-- Encontre todos os alunos do gênero masculino cujo email contém "example.com".
select * from tb_alunos where alu_genero='M' and alu_email like '%example.com';

-- Liste todos os alunos que moram em Los Angeles, Nova York ou Houston e cujo número de residência seja maior que 100.
select * from tb_alunos where alu_cidade in ('Los Angeles', 'New York', 'Houston') and alu_numero > 100;

-- Liste todos os alunos que se matricularam em 2023, ordenados pela data de nascimento.
select * from tb_alunos where alu_data_matricula like '2023%' order by alu_data_nascimento;

-- Liste todos os alunos do gênero feminino que não moram em Califórnia, Nova York ou Texas. 
select * from tb_alunos where alu_genero='F' and alu_estado not in ('CA', 'NY', 'TX');

-- Liste todos os alunos do gênero masculino cujo nome começa com "L", o número da residência seja maior que 100, e moram na Califórnia.
select * from tb_alunos where (alu_genero='M' and alu_nome like 'L%') and (alu_numero > 100 and alu_estado='CA');

-- Liste todos os alunos que moram em cidades que começam com "S" ou "H", estão nos estados da Califórnia ou Nova York, e ordene os resultados pelo nome em ordem decrescente.
select * from tb_alunos where (alu_cidade like 'S%' or alu_cidade like 'H%') and (alu_estado='CA' or alu_estado='NY') order by alu_nome desc;

-- Liste todos os alunos do gênero feminino que moram em Nova York ou Los Angeles e cujo número de residência seja menor que 500.
select * from tb_alunos where (alu_genero='F' and alu_cidade in ('New York','Los Angeles')) and alu_numero < 500;
```
## Update e Delete

### Exemplo 1
```sql
use db_escola_marcella;

update tb_jogadores set jog_nome = 'Hugo' where jog_id=1;

select * from tb_jogadores;

delete from tb_jogadores where jog_id=1;
insert into tb_jogadores values (1, 'Hugo', '1994-02-01', 'M', 'Brazil', 'Atacante', '1', '10', '2023-08-01');

select * from tb_professores;

-- 1. **Atualização de E-mail:**  Altere o e-mail do professor "Anitta" para "anitta.silva@exemplo.com".
update tb_professores set pro_email='anitta.silva@exemplo.com' where pro_id=1;

-- 2. **Mudança de Departamento:**  Atualize o departamento dos professores que lecionam "Música" para "Moda".
update tb_professores set pro_departamento='Moda' where pro_departamento='Música';

-- 3. **Correção de Telefone:**  Corrija o número de telefone do professor cujo ID é 3 para "(11) 99999-8888".
update tb_professores set pro_telefone='(11) 99999-8888' where pro_id=3;

-- 4. **Ajuste de Salário:**  Reduza em 5% o salário dos professores que trabalham no departamento de "Moda".
update tb_professores set pro_salario=(pro_salario-(pro_salario*0.5)) where pro_departamento='Moda';

-- 5. **Atualização de Endereço:**  Atualize o endereço dos professores que moram na cidade "São Paulo" para "Rua Nova, 123".
update tb_professores set pro_rua='Rua Nova, 123' where pro_cidade='São Paulo';

-- 6. **Exclusão por Departamento:**  Delete todos os professores do departamento "Educação Física".
delete from tb_professores where pro_departamento='Educação Física';

-- 7. **Remoção de Professores Recém-Contratados:**  Remova todos os professores contratados após o ano de 2024.
delete from tb_professores where pro_data_contratacao > '2024';

-- 12. **Alteração de Data de Contratação:**  Corrija a data de contratação de "Marília Mendonça" para 2022-01-15.
update tb_professores set data_contratacao='2022-01-15' where pro_id=9;
```

### Exemplo 2

```sql
-- 1. Atualize o status para 'indisponível' e aumente o preço em 15% para produtos da categoria 'Cereais' ou 'bebidas' que têm `pro_quantidade_estoque` menor que 100 e `pro_preco` menor que 15.00.
update tb_produtos set pro_status='indisponível' where (pro_categoria='Cereais' or pro_categoria='Bebidas') and (pro_quantidade_estoque < 100) and (pro_preco < 15.00) ;
update tb_produtos set pro_preco = pro_preco + (pro_preco*0.15) where (pro_categoria='Cereais' or pro_categoria='Bebidas') and (pro_quantidade_estoque < 100) and (pro_preco < 15.00);

-- 2. Exclua todos os produtos com data de validade vencida e cujo preço é maior que 50.00 da tabela `tb_produtos`.
delete from tb_produtos where pro_data_validade < curdate() and pro_preco > 50.00;

-- 3. Aumente a quantidade em estoque em 50 unidades e defina a marca como 'Novo Produto' para produtos da categoria 'Produtos de Limpeza' que foram cadastrados há mais de 6 meses e cujo `pro_preco` é menor que 10.00
update tb_produtos set pro_quantidade_estoque = pro_quantidade_estoque+50, pro_marca = 'Novo Produto' where (pro_categoria='Produtos de Limpeza') and (pro_data_cadastro < curdate() - interval 6 month) and (pro_preco < 10.00);
update tb_produtos set pro_marca = 'Novo Produto' where (pro_categoria='Produtos de Limpeza') and (pro_data_cadastro < curdate() - interval 6 month) and (pro_preco < 10.00);

-- 4. Reduza o valor em 15 % de todos os produtos da categoria 'Chocolates' que têm `pro_quantidade_estoque` menor que 100 e foram cadastrados há mais de três meses e quinze dias.
update tb_produtos set pro_preco = pro_preco-(pro_preco*0.15) where (pro_categoria='Chocolates') and (pro_quantidade_estoque < 100) and (pro_data_cadastro < curdate() - interval 3 month - interval 15 day); 
select * from tb_produtos where (pro_categoria='Chocolates') and (pro_quantidade_estoque < 100) and (pro_data_cadastro < curdate() - interval 3 month - interval 15 day); 


-- 5. Aumente o preço em 20% e defina a data de validade como 3 meses a partir da data atual para produtos da categoria 'Alimentos' que têm `pro_quantidade_estoque` maior que 50 e `pro_data_validade` menor que a data atual.
update tb_produtos set pro_preco = pro_preco+(pro_preco*0.2), pro_data_validade = curdate() + interval 3 month where pro_categoria = 'Alimentos' and pro_quantidade_estoque > 50 and pro_data_validade < curdate();

-- 6. Exclua todos os produtos da categoria 'Produtos de Limpeza' que têm validade vencida, peso menor que 1kg e seja da marca Omo ou Ariel.
delete from tb_produtos where pro_categoria = 'Produtos de Limpeza' and pro_data_validade < curdate() and pro_peso < 1.00 and pro_marca in ('Omo', 'Ariel');
select * from tb_produtos where pro_categoria = 'Produtos de Limpeza' and pro_data_validade < curdate() and pro_peso < 1.00 and pro_marca in ('Omo', 'Ariel');
```


## JOIN - Junção de Tabelas

```sql
use db_escola_marcella;
select jog_id as Código_Jogador, jog_nome as Nome_Jogador, jog_nacionalidade as Nacionalidade, tim_nome as Nome_Time from tb_jogadores join tb_times on jog_time_id=tim_id;

select jog_id as Código_Jogador, jog_nome as Nome_Jogador, jog_data_nascimento as Data_Nascimento, jog_nacionalidade as Nacionalidade, tim_nome as Nome_Time
from tb_jogadores join tb_times on jog_time_id=tim_id where year(jog_data_nascimento) > 1990;


use db_ex02_marcella;
select liv_cod as Codigo_livro, liv_titulo as Titulo_livro, liv_cat_cod as Id_categoria, cat_nome as Nome_categoria, cat_cod as Id_categoria
from tb_livros join tb_categorias on liv_cat_cod=cat_cod where cat_nome = 'terror';

```

```sql
-- ATIVIDADE

-- 1 - Liste o nome de todas as disciplinas do curso Informática para Internet. ( IPI - cur_id = 5 / dis_cur_id = 5 )

select dis_id ,dis_nome as Nome_Disciplina, cur_nome, cur_id from tb_disciplinas join tb_cursos on dis_cur_id = cur_id where cur_id = 5;

-- 2 - Liste o nome de todos os alunos matriculados na disciplina Desenvolvimento de APIs. ( dis_id = 177 / dis_cur_id = 5 
-- ERRADA = select alu_id, alu_nome, dis_nome, cur_id from tb_alunos join tb_cursos on alu_cur_id = cur_id join tb_disciplinas on dis_cur_id = cur_id where dis_id in (120,177);

select mat_id, alu_id, alu_nome, dis_nome from tb_alunos join tb_matriculas on mat_alu_id = alu_id join tb_disciplinas on mat_dis_id = dis_id where dis_nome = 'Desenvolvimento de APIS';
;

-- 3 - Liste o nome dos professores das disciplinas do curso Redes de Computadores.
select pro_id, pro_nome, cur_id, cur_nome from tb_professores join tb_cursos on pro_cur_id = cur_id where cur_nome='Redes de Computadores';

select pro_id, pro_nome, cur_id, cur_nome, dis_nome from tb_professores join tb_disciplinas on dis_pro_id = pro_id join tb_cursos on pro_cur_id = cur_id where cur_nome='Redes de Computadores';
;
```

```sql
-- Liste o nome do aluno, o nome da disciplina e a nota, de todos os alunos matriculados.
select mat_id, alu_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id = alu_id join tb_disciplinas on mat_dis_id = dis_id join tb_notas on not_mat_id = mat_id;

-- Mostre a quantidade de alunos com nota superior a 5;

select count(*) as Quantidade_alunos_nota_maior_5 from tb_matriculas join tb_alunos on mat_alu_id = alu_id join tb_notas on not_mat_id = mat_id where not_valor > 5.00;

-- Liste o nome do aluno, o nome da disciplina e a nota, de todos os alunos com nota superior a 7 e matriculados em alguma das disciplinas  (Algoritmos e Estruturas de Dados, Computação em Nuvem e Banco de Dados);
select alu_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id = alu_id join tb_disciplinas on  mat_dis_id = dis_id join tb_notas on not_mat_id = mat_id where not_valor > 7.00 and dis_nome in ('Algoritmos e Estruturas de Dados', 'Computação em Nuvem', 'Banco de Dados');

-- Liste o nome do curso, nome do aluno, o nome da disciplina e a nota  de todos os alunos do curso Ciência da Computação ou Engenharia de Software, que estão com notas entre 4 e 8;
select alu_nome, cur_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id = alu_id join tb_disciplinas on mat_dis_id = dis_id 
join tb_notas on not_mat_id = mat_id join tb_cursos on alu_cur_id = cur_id where dis_nome in ('Ciência da Computação','Engenharia de Software') and (not_valor > 4 and not_valor <8);

-- Liste  o nome do professor, nome do curso, nome do aluno, o nome da disciplina e a nota de todos os alunos do Redes de Computadores ou Análise e Desenvolvimento de Sistemas, que começam com a letra (E ou C ou D ou G), e que estão com notas entre 3 e 9;
select pro_nome, cur_nome, alu_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id = alu_id join tb_disciplinas on mat_dis_id = dis_id join tb_professores on dis_pro_id=pro_id
join tb_notas on not_mat_id = mat_id join tb_cursos on alu_cur_id = cur_id where dis_nome in ('Redes de Computadores','Análise e Desenvolvimento de Sistemas') and 
(alu_nome like 'E%' or alu_nome like 'C%' or alu_nome like 'D%' or alu_nome like 'G%') and (not_valor > 3 and not_valor <9);
```


