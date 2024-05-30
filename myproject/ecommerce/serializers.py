from rest_framework import serializers
from .models import UsuarioCliente, UsuarioAdministrador, Rol
from .models import HistorialPedido, DetallePedido

from .models import UsuarioCliente, UsuarioAdministrador, Rol, Libro, Autor
from .models import HistorialPedido, Categoria


class HistorialPedidoSerializer (serializers.ModelSerializer):
    class Meta:
        model = HistorialPedido
        fields = '__all__'

        model = HistorialPedido
        fields = '__all__'


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
        fields = ('id', 'rol')
        
class LibroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Libro
        fields = ['id_libro', 'titulo', 'portada', 'categoria','autor', 'descripcion', 'precio', 'stock']
        
class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ['id_categoria', 'nombre_categoria',]
        
class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ['id_autor', 'nombre']
        
class DetallePedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = DetallePedido
        fields = '__all__'