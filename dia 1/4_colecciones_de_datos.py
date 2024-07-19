
#Lista (List) (arreglo)
frutas = ['manzana', "platano", 'papaya', "granadilla"]

print(frutas[0])

frutas.append('uva')
print(frutas)

# elimina el valor de la lista segun su indice ademas retorna el valor 
fruta_eliminada = frutas.pop(0)

# si tenemos dos o mas veces el valor repetido solo eliminara la primera concordancia
# si no existe ningun elemento conese valor lanzara un error
frutas.remove('papaya')

# no se puede utilizar un indice que no existe  para reemplazar un elemento

print(fruta_eliminada)
print(frutas)
