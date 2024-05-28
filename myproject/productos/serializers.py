from rest_framework import serializers
from .models import Producto

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ['id_libro', 'titulo', 'portada', 'descripcion', 'precio', 'stock']