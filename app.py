from flask import Flask
from instancias import conexion
from dotenv import load_dotenv
from os import environ
from models import *
from flask_migrate import Migrate

load_dotenv()

app = Flask(__name__)
print(environ.get('DATABASE_URL2'))
app.config['SQLALCHEMY_DATABASE_URI']=environ.get('DATABASE_URL2')

conexion.init_app(app)

Migrate(app,conexion)

if __name__ == '__main__':
    app.run(debug=True)