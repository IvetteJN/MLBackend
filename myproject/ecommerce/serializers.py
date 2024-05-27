from rest_framework import serializers
from .models import UsuarioCliente, UsuarioAdministrador, Rol
from .models import HistorialPedido

class HistorialPedidoSerializer (serializers.ModelSerializer):
    class Meta:
        model= HistorialPedido
        fields='__all__'

class UsuarioClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = ('nombre', 'email', 'contrasena')

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
