
## Conectar o BD ao python

```python
from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        database='db_escola',
        user='root',
        password='usbw'
    )
    return connection

@app.route('/')
def index():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    
    query = "SELECT * FROM tb_alunos"
    
    # Filtragem e Ordenação
    filter_by = request.args.get('filter_by', '')
    order_by = request.args.get('order_by', 'id')
    order_dir = request.args.get('order_dir', 'ASC')
    
    if filter_by:
        query += f" WHERE nome LIKE '{filter_by}%'"
    
    query += f" ORDER BY {order_by} {order_dir}"
    
    cursor.execute(query)
    alunos = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    return render_template('index.html', alunos=alunos, filter_by=filter_by, order_by=order_by, order_dir=order_dir)

if __name__ == '__main__':
    app.run(debug=True)

```
``



