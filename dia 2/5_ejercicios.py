#1. Se tiene la siguiente informacion
data = [{
    'nombre': 'Backend',
    'categoria': 'Intermedio',
    'requisitos': ['Python', 'Flask', 'Django'],
    'ubicaciones': [
        {
            'ciudad': 'arequipa',
            'departamento': 'arequipa'
        },
        {
            'ciudad': 'trujillo',
            'departamento': 'la libertad'
        }
    ]
}, {
    'nombre': 'Frontend',
    'categoria': 'Basico',
    'requisitos': ['Html', 'Css', 'React'],
    'ubicaciones': [
        {
            'ciudad': 'huacho',
            'departamento': 'lima'
        },
        {
            'ciudad': 'ilo',
            'departamento': 'moquegua'
        },
        {
            'ciudad': 'juliaca',
            'departamento': 'puno'
        }
    ]
}]

# Se desea obtener la siguiente informacion : las el 'nombre: ...., ubicaciones: [DEPARTAMENTOS]
# nombre: Backend, ubicaciones: 'arequipa', 'la libertad'
# nombre: frontend, ubicaciones: 'lima', 'moquegua', 'puno'

for requerimiento in data:
    print(f'nombre: {requerimiento['nombre']}, ubicaciones: ')

# se tiene la lista de invitados a una fiesta
invitados = ['Juan', 'Pedro', 'Mario', 'Luigi', 'Jhon', 'Ricardo', 'Beatriz']


# se puede ingresar el nombre por la consola y se debe validar si el usuario esta o no esta invitado, se tiene que validar sin importar mayusculas o minusculas, es decir, si se escribe 'RICARDO' esta invitado o si se escribe 'RiCaRdO' tambien