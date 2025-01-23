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

### fome - alunos.html
```html
 <form action="{{ url_for('editar_alunos') }}" method="get">
                <input type="hidden" name="aluno_id" value="{{ alu.alu_id }}">
                <input type="submit" value="Editar">
            </form>
```

### editar aluno html
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar alunos</title>
</head>
<body>
    <h1>Editar Informações</h1>
    <hr>

    <form action="{{url_for('editar_alunos')}}" method="post">
        <input type="hidden" name="aluno_id" value="{{ aluno.alu_id }}">
        <label>Nome:</label>
        <input type="text" name="nome" placeholder="{{aluno.alu_nome}}" value="{{aluno.alu_nome}}">
        <label>Matricula:</label>
        <input type="text" name="matricula" placeholder="{{aluno.alu_matricula}}" value="{{aluno.alu_matricula}}">
        <label>Email:</label>
        <input type="email" name="email" placeholder="{{aluno.alu_email}}" value="{{aluno.alu_email}}">
        <label>Data de nascimento:</label>
        <input type="date" name="data" value="{{aluno.alu_data_nascimento}}">
        <label>Curso:</label>
        <select name="curso">
            <option value="{{aluno.cur_nome}}" selected disabled>{{aluno.cur_nome}}</option>
            {% for curso in cursos %}
                <option value="{{curso.cur_id}}">{{curso.cur_nome}}</option>
            {% endfor %}
        </select>
        
        <input type="submit" value="Enviar">

    </form>
</body>
</html>
```
