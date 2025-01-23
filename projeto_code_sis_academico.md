``` python
@app.route('/editar_alunos', methods=['POST','GET'])
def editar_alunos():
    cursor = mysql.connection.cursor()
    if request.method == 'GET':
        alu_id = request.args.get('aluno_id')
        cursor.execute('SELECT * FROM tb_alunos JOIN tb_cursos ON alu_cur_id = cur_id WHERE alu_id = (%s)', (alu_id,))
        aluno = cursor.fetchone()
        cursor.execute('SELECT * FROM tb_cursos')
        cursos = cursor.fetchall()
        return render_template('editar_alunos.html', aluno = aluno, cursos=cursos)
    
    else:
        id = request.form['aluno_id']
        nome = request.form['nome']
        matricula = request.form['matricula']
        email = request.form['email']
        data_nascimento = request.form['data']
        curso = request.form.get('curso')
        cursor.execute('UPDATE tb_alunos SET alu_nome = (%s), alu_matricula = (%s), alu_email = (%s), alu_data_nascimento = (%s), alu_cur_id = (%s) WHERE alu_id = (%s)', (nome, matricula, email, data_nascimento, curso, id))
        
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('alunos'))
``` 
