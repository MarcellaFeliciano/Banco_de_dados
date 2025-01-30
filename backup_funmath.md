
@app.route('/trilha')
def Trilha():
    return render_template ('inicial_trilha.html')


```python
@app.route('/fases_trilha')
def Fases_trilha():
    return render_template('fases_trilha.html')

@app.route('/trilha_jogo')
def Trilha_jogo():
    return render_template('jogo_trilha.html')

   
@app.route('/questoes_trilha',methods=['POST', 'GET'])
def Questoes_trilha():
    fase = request.args.get('fase')

    if request.method == 'GET':
        # questao = int(request.args.get('questao'))
        response = make_response(render_template('jogo_trilha.html',pergunta=fases_trilha[int(fase)-1]['pergunta'],mensagem=''))
        response.set_cookie('fase_atual_trilha', str(fase))
        return response
        
    else:
        
        resposta = request.form.get('resp_trilha')
        fase_trilha = int(request.cookies.get('fase_atual_trilha',1))
        if resposta == fases_trilha[fase_trilha-1]['resposta']:
            correct = True
            response = make_response(render_template('fases_trilha.html', mensagem=''))
            response.set_cookie('fase_atual_trilha', str(fase_trilha))
            # fase_desbloqueada = int(request.cookies.get('fase_desbloqueada',1))
            return response
        else:
            false = False
            response = make_response(render_template('fases_trilha.html', mensagem=''))
            response.set_cookie('fase_atual_trilha', str(fase_trilha))
            return response
        
``
