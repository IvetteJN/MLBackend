from rest_framework import serializers
from .models import (Categoria, Autor, UsuarioCliente, UsuarioAdministrador,
                     Direccion, FormaEnvio, FormaPago, Pedido, HistorialPedido,
                     Reseña, Libro, DetallePedido, Rol)



class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ['nombre_categoria']

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ['nombre']

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

class DireccionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Direccion
        fields = '__all__'

class FormaEnvioSerializer(serializers.ModelSerializer):
    class Meta:
        model = FormaEnvio
        fields = '__all__'

class FormaPagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = FormaPago
        fields = '__all__'

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ['nombre_categoria']

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ['nombre']

class LibroSerializer(serializers.ModelSerializer):
    categoria = serializers.StringRelatedField()
    autor = serializers.StringRelatedField(allow_null=True)

    class Meta:
        model = Libro
        fields = '__all__'

class PedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pedido
        fields = '__all__'

class DetallePedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = DetallePedido
        fields = '__all__'

class HistorialPedidoSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistorialPedido
        fields = '__all__'

class ReseñaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reseña
        fields = '__all__'

class RolSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = '__all__'
