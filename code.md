## php

<?php

function buscarBD($base, $tabela) {
    $con = new PDO("mysql:dbname=".$base.";localhost","root","");
    $stm = $con -> prepare ("select * from".$tabela.";");
    $stm ->execute();
    $dados = $stm ->fetchALL(PDO::FETCH_ASSOC);
    return $dados;

}
$dados = burcarBD('db_alunos_marcella','tb_alunos');

echo "Lista de dados <br>";
foreach ($dados as $value) {
    print_r($value);
    $value['alu_id']." - ".$value['alu_nome'];
    echo"<br><br>";
}

## python

import mysql.connector
from mysql.connector import Error

def exibir_tabela(nome_banco, nome_tabela, host='localhost', usuario='seu_usuario', senha='sua_senha'):
    try:
        # Conectar ao banco de dados
        conexao = mysql.connector.connect(
            host=host,
            database=nome_banco,
            user=usuario,
            password=senha
        )
        
        if conexao.is_connected():
            print(f'Conectado ao banco de dados: {nome_banco}')
            
            # Criar um cursor para executar consultas
            cursor = conexao.cursor()
            
            # Executar a consulta para obter todos os dados da tabela
            consulta = f'SELECT * FROM {nome_tabela}'
            cursor.execute(consulta)
            
            # Recuperar e exibir os resultados
            resultados = cursor.fetchall()
            
            if resultados:
                for linha in resultados:
                    print(linha)
            else:
                print(f'A tabela {nome_tabela} está vazia ou não existe.')
                
            # Fechar o cursor e a conexão
            cursor.close()
            conexao.close()
            
    except Error as e:
        print(f'Erro ao conectar ou executar consulta: {e}')

# Exemplo de uso
exibir_tabela('nome_do_banco_de_dados', 'nome_da_tabela')
