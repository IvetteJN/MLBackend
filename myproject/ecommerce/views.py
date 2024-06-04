from rest_framework import status, viewsets, permissions, generics
from rest_framework.decorators import api_view, action
from rest_framework.response import Response
from django.db.models import Q
from rest_framework.generics import RetrieveAPIView
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
    
@api_view(['GET'])
def detalle_pedido_por_cliente(request, cliente_id):
    try:
        cliente = UsuarioCliente.objects.get(id_cliente=cliente_id)
    except UsuarioCliente.DoesNotExist:
        return Response({"message": "Cliente no encontrado"}, status=404)

    
    detalles_pedidos = DetallePedido.objects.filter(pedido__usuario_cliente=cliente).values(
        'pedido__usuario_cliente__id_cliente',
        'pedido__usuario_cliente__nombre',
        'pedido__direccion_envio__direccion',
        'pedido__estado_pedido',
        'pedido__fecha_pedido',
        'libro__titulo',
        'cantidad',
        'precio_total'
    )

    return Response({"detalles_pedidos": detalles_pedidos})

@api_view(['POST'])
def list_forma_envio(request):
    serializer = FormaEnvioSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FormaEnvioViewSet(viewsets.ModelViewSet):
    queryset = FormaEnvio.objects.all()
    serializer_class = FormaEnvioSerializer

@api_view(['POST'])
def list_forma_pago(request):
    serializer = FormaPagoSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FormaPagoViewSet(viewsets.ModelViewSet):
    queryset = FormaPago.objects.all()
    serializer_class = FormaPagoSerializer

@api_view(['POST'])
def list_pedido(request):
    serializer = PedidoSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PedidoViewSet(viewsets.ModelViewSet):
    queryset = Pedido.objects.all()
    serializer_class = PedidoSerializer

@api_view(['POST'])
def list_direccion(request):
    if request.method == 'POST':
        serializer = DireccionSerializer(data=request.data, many=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DireccionViewSet(viewsets.ModelViewSet):
    queryset = Direccion.objects.all()
    serializer_class = DireccionSerializer

