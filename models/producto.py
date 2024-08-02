from instancias import conexion
from sqlalchemy import Column, types, ForeignKey

class ProductoModel(conexion.Model):
    id = Column(type_=types.Integer, primary_key=True, nullable=False, autoincrement=True)
    nombre = Column(type_=types.Text, nullable=False)
    descripcion = Column(type_=types.Text, nullable=True)
    precio = Column(type_=types.Float, nullable=False)
    disponibilidad = Column(type_=types.Boolean, default=True)

    categoriaId = Column(ForeignKey(column='categorias.id'), 
    type_=types.Integer, nullable=False, name='categoria_id')

    __tablename__ = 'productos'