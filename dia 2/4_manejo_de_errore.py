informacion = input('Por favor ingresa tu nombre: ')

try:
   print(informacion + 10)
   print(informacion)
except TypeError:
    # solo cuando error sea de tipo TypeError ingresara aca
    print('Hubo un error!!!')
except ZeroDivisionError:
    print('No se puede dividir entre 0!')
except Exception as e:
    print(type(e)) # obtener que tipo de error es en el except generico
    print('Ocurrio otro error!')

