from rest_framework import status, viewsets, permissions
from rest_framework.decorators import api_view, action
from rest_framework.response import Response
from .models import UsuarioCliente, UsuarioAdministrador, Rol, HistorialPedido, DetallePedido, Libro
from .serializers import UsuarioClienteSerializer, UsuarioAdministradorSerializer, RolSerializer, HistorialPedidoSerializer, DetallePedidoSerializer




class HistorialPedidoSet(viewsets.ModelViewSet):
    queryset = HistorialPedido.objects.all()
    serializer_class = HistorialPedidoSerializer

@api_view(['POST'])
def login(request):
    email = request.data.get('email')
    contrasena = request.data.get('contrasena')

    if not email or not contrasena:
        return Response({'error': 'Por favor proporciona email y contraseña'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = UsuarioCliente.objects.get(email=email, contrasena=contrasena)
        serializer = UsuarioClienteSerializer(user)
        return Response(serializer.data)
    except UsuarioCliente.DoesNotExist:
        pass

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

class CarritoViewSet(viewsets.ModelViewSet):
    queryset = DetallePedido.objects.filter(is_cart=True)
    serializer_class = DetallePedidoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return self.queryset.filter(pedido__usuario_cliente=self.request.user)

    @action(detail=False, methods=['post'])
    def agregar(self, request):
        libro_id = request.data.get('libro_id')
        cantidad = request.data.get('cantidad', 1)
        libro = Libro.objects.get(id=libro_id)
        precio_unitario = libro.precio

        detalle_pedido, created = DetallePedido.objects.get_or_create(
            libro=libro,
            is_cart=True,
            defaults={
                'cantidad': cantidad,
                'precio_unitario': precio_unitario,
                'precio_total': precio_unitario * cantidad,
            }
        )
        if not created:
            detalle_pedido.cantidad += cantidad
            detalle_pedido.precio_total = detalle_pedido.precio_unitario * detalle_pedido.cantidad
            detalle_pedido.save()

        serializer = self.get_serializer(detalle_pedido)
        return Response(serializer.data)

    @action(detail=False, methods=['post'])
    def eliminar(self, request):
        libro_id = request.data.get('libro_id')
        libro = Libro.objects.get(id=libro_id)

        try:
            detalle_pedido = DetallePedido.objects.get(libro=libro, is_cart=True)
            detalle_pedido.delete()
            return Response(status=204)
        except DetallePedido.DoesNotExist:
            return Response({"error": "Item no encontrado en el carrito"}, status=404)
