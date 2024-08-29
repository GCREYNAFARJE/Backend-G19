const funciones = importacion = require('./2_funciones')

let x = 'Giancarlo'

x = 'ramiro'
x = 'Juan'
x = 20
console.log('Hola')


function sumar(numero1, numero2) {
    const resultado = numero1 + numero2

    return resultado
}

const sumatoria = sumar(10,20)

console.log(sumatoria)

const resta = funciones.restar(50,30)
console.log(resta)