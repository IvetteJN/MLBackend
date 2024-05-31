from rest_framework import serializers
from .models import UsuarioCliente, UsuarioAdministrador, Rol, Libro, Autor, Categoria, HistorialPedido, DetallePedido

class HistorialPedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistorialPedido
        fields = '__all__'

class UsuarioClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = '__all__'

class UsuarioAdministradorSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioAdministrador
        fields = '__all__'

class UsuarioClienteRegistroSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = '__all__'

class RolSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = '__all__'


class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = '__all__'

class LibroSerializer(serializers.ModelSerializer):
    id_libro = serializers.ReadOnlyField()

    class Meta:
        model = Libro
        fields = '__all__'

class DetallePedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = DetallePedido
        fields = '__all__'