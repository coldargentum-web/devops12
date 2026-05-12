from flask import Flask, render_template, request, redirect, url_for
from shop import PetShop
import os

app = Flask(__name__)

# ИСПРАВЛЕНО: Теперь создаем объект PetShop без аргументов
petshop = PetShop()

@app.route('/')
def index():
    # Показываем IP сервера, чтобы видеть работу K8s
    server_ip = os.getenv('MY_POD_IP', 'Localhost')
    return render_template('index.html', server_ip=server_ip)

@app.route('/add_pet', methods=['GET', 'POST'])
def add_pet():
    if request.method == 'POST':
        name = request.form.get('name')
        price = request.form.get('price')
        petshop.add_item(name, price)
        return redirect(url_for('list_pets'))
    return render_template('add_pet.html')

@app.route('/pets')
def list_pets():
    items = petshop.get_all_items()
    return render_template('list_pets.html', items=items)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)