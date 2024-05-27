from rest_framework import status, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import UsuarioCliente, UsuarioAdministrador, Rol, HistorialPedido
from .serializers import UsuarioClienteSerializer, UsuarioAdministradorSerializer, RolSerializer, HistorialPedidoSerializer
from django.shortcuts import render

class HistorialPedidoSet(viewsets.ModelViewSet):
    queryset=HistorialPedido.objects.all()
    serializer_class= HistorialPedidoSerializer



@api_view(['POST'])
def login(request):
    email = request.data.get('email')
    contrasena = request.data.get('contrasena')

    if not email or not contrasena:
        return Response({'error': 'Por favor proporciona email y contraseña'}, status=status.HTTP_400_BAD_REQUEST)

    # Lógica de autenticación para usuario cliente
    try:
        user = UsuarioCliente.objects.get(email=email, contrasena=contrasena)
        serializer = UsuarioClienteSerializer(user)
        return Response(serializer.data)
    except UsuarioCliente.DoesNotExist:
        pass

    # Lógica de autenticación para usuario administrador
    try:
        user = UsuarioAdministrador.objects.get(usuario=email, contrasena=contrasena)
        serializer = UsuarioAdministradorSerializer(user)
        return Response(serializer.data)
    except UsuarioAdministrador.DoesNotExist:
        return Response({'error': 'Usuario o contraseña incorrectos'}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def registro_usuario(request):
    serializer = UsuarioClienteSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UsuarioClienteViewSet(viewsets.ModelViewSet):

    queryset = UsuarioCliente.objects.all()
    serializer_class = UsuarioClienteSerializer

class UsuarioAdministradorViewSet(viewsets.ModelViewSet):

    queryset = UsuarioAdministrador.objects.all()
    serializer_class = UsuarioAdministradorSerializer

class RolViewSet(viewsets.ModelViewSet):
    queryset = Rol.objects.all()
    serializer_class = RolSerializer