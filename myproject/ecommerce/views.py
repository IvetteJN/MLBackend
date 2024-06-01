from rest_framework import status, viewsets, permissions
from rest_framework.decorators import api_view, action
from rest_framework.response import Response
from django.db.models import Q
from rest_framework.generics import RetrieveAPIView
from .models import UsuarioCliente, UsuarioAdministrador, Rol, HistorialPedido, DetallePedido, Libro, Categoria, Autor
from .serializers import UsuarioClienteSerializer, UsuarioAdministradorSerializer, RolSerializer, HistorialPedidoSerializer, DetallePedidoSerializer, LibroSerializer, CategoriaSerializer, AutorSerializer
from .models import (Categoria, Autor, UsuarioCliente, UsuarioAdministrador,
                     Direccion, FormaEnvio, FormaPago, Pedido, HistorialPedido,
                     Reseña, Libro, DetallePedido, Rol)
from .serializers import (CategoriaSerializer, AutorSerializer, UsuarioClienteSerializer,
                          UsuarioAdministradorSerializer, DireccionSerializer, FormaEnvioSerializer,
                          FormaPagoSerializer, LibroSerializer, PedidoSerializer, DetallePedidoSerializer,
                          HistorialPedidoSerializer, ReseñaSerializer, RolSerializer)


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


@api_view(['POST'])
def list_libro(request):
    serializer = LibroSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class LibroViewSet(viewsets.ModelViewSet):
    queryset = Libro.objects.all()
    serializer_class = LibroSerializer
    
    def get_queryset(self):
        queryset = super().get_queryset()
        termino = self.request.query_params.get('termino', None)
        categoria = self.request.query_params.get('categoria', None)
        
        if termino:
            queryset = queryset.filter(Q(titulo__icontains=termino) | Q(descripcion__icontains=termino))
        
        if categoria:
            queryset = queryset.filter(categoria__nombre_categoria=categoria)
        
        return queryset



@api_view(['POST'])
def list_categoria(request):
    serializer = CategoriaSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CategoriaViewSet(viewsets.ModelViewSet):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer
    
    
@api_view(['POST'])
def list_autor(request):
    serializer = AutorSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class AutorViewSet(viewsets.ModelViewSet):
    queryset = Autor.objects.all()
    serializer_class = AutorSerializer
    