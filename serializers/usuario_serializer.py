from marshmallow_sqlalchemy import SQLAlchemyAutoSchema, auto_field
# https://marshmallow.readthedocs.io/en/stable/marshmallow.validate.html
from marshmallow import validate # funciones que me ayudaran con validaciones adicionales
from models import UsuarioModel, TipoUsuario
from marshmallow_enum import EnumField
from marshmallow import Schema, fields

class RegistroSerializer(SQLAlchemyAutoSchema):

    tipoUsuario = EnumField(TipoUsuario)
    # xxxxx@xxxx.xxx
    correo = auto_field(validate=validate.Email(error='El correo no cumple con el formato correcto'))

    password = auto_field(load_only=True)

    class Meta:
        model = UsuarioModel

class LoginSerializer(Schema):
    correo = fields.Email(required=True)
    password = fields.String(required=True)
