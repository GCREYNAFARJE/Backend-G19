function restar(numero1, numero2){
    return numero1 -numero2
}

// Funciones anonimas
// se almacena en una variable

const multiplicacion = (numero1,  numero2) => {
    return numero1 * numero2
}

// en una funcion anonima si solamente voy a tener una linea de coldigo y esa linea la voy a retornar 

const division = (numero1, numero2) => numero1 / numero2

const saludo ='hola'

module.exports = {
    restar: restar,
    multiplicacion: multiplicacion,
    division: division,
    saludo: saludo
}
