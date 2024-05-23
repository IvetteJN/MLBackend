from rest_framework import serializers
from .models import UsuarioCliente, UsuarioAdministrador, Rol

class UsuarioClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = ('id_cliente', 'nombre', 'email', 'contrasena')

class UsuarioAdministradorSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioAdministrador
        fields = ('id_admin', 'usuario', 'contrasena')

class UsuarioClienteRegistroSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = ('nombre', 'email', 'contrasena')

class RolSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = ('id', 'nombre_rol')
