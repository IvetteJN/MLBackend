# ecommerce/serializers.py
from rest_framework import serializers
from .models import UsuarioCliente
from django.contrib.auth.hashers import make_password

class UsuarioClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCliente
        fields = ['id_cliente', 'nombre', 'email', 'contrasena']

    def create(self, validated_data):
        validated_data['contrasena'] = make_password(validated_data['contrasena'])
        return super(UsuarioClienteSerializer, self).create(validated_data)
