from flask import Flask

#__name__> indicar si el archivo que estamos utilizamos es el archivo proncipal del proyecto, esto se ve en la terminal ya que si al correr el proyecto llamamos a este archivo su valor sera__main__caso contrario obtendra otro nombre
app = Flask(__name__)

@app.route('/',)
def manejar_ruta_inicio():
    return 'Bienvenido a mi API de Flask!'

@app.route('/registrar-usuario',methods=['POST'])
def manejar_registro_usuario():
    print(request.get_json()) # convierte el json
    return {
        'message': 'Usuario Registrado exitosamente'
    }


if __name__ == '__main__':
    # estamos en el archivo principal

    # levanta mi servidor de flask
    # si configuramos el parametro debug en True cada vez que hagamos algun cambio y guardamos se reinicia el servidor
    app.run(debug=True)