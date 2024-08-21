from django.shortcuts import render

def paginaPrueba(request):
    print(request)
    data = [{
        "id": 1,
        "nombre": "Importados",
        "habilitados": True
    },{
        "id":2,
        "nombre":"Nacionales",
        "habilitados": False
    }]
    usuario = 'Giancarlo'
    return render(request, 'prueba.html', {"data": data, "usuario": usuario})
