from django.db import models

# https://docs.djangoproject.com/en/5.1/topics/db/models/

class Categoria(models.Model):
    id = models.AutoField(primary_key=True, unique=True, null=False)
    nombre = models.TextField(null=False)
    habilitado = models.BooleanField(default=True, null=False)


    class Meta:
        #https://docs.djangoproject.com/en/5.1/ref/models/options/
        db_table = 'categorias'
        # asi seria el ordenamiento para las categorias segun el nombre de manera ascendente
        # y si quisieramos descendente seria con el '-' al comienzo, es decir, '-nombre'
        ordering = ['nombre']

class Golosina(models.Model):
    id = models.AutoField(primary_key=True, unique=True, null=False)
    nombre = models.TextField(null=False)
    precio = models.FloatField(db_column='precio')
    imagen = models.ImageField(upload_to='imagenes', null=True)
    habilitado = models.BooleanField(default=True)
    

    # relacion entre dos tablas
    # on_delete > que va a suceder con los registros que tengan relacion con la categoria elimanada
    # CASCADE > elimina la categoria y elimina las golosinas
    categoria = models.ForeignKey(to=Categoria, db_column='categoria_id', on_delete=models.PROTECT)

    class Meta:
        db_table = 'galosinas'
        ordering = ['nombre', 'precio']
        # sirve para crear unicidad entre dos o más columnas
        # jamas el nombre y el precio pueden tener el mismo valor juntos 

        unique_together = [['nombre','precio']]
