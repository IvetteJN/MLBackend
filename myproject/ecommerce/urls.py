from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CarritoViewSet, HistorialPedidoSet, UsuarioClienteViewSet, UsuarioAdministradorViewSet, RolViewSet

router = DefaultRouter()
router.register(r'carrito', CarritoViewSet, basename='carrito')
router.register(r'historial-pedido', HistorialPedidoSet, basename='historial-pedido')
router.register(r'usuarios-cliente', UsuarioClienteViewSet, basename='usuarios-cliente')
router.register(r'usuarios-administrador', UsuarioAdministradorViewSet, basename='usuarios-administrador')
router.register(r'roles', RolViewSet, basename='roles')

urlpatterns = [
    path('', include(router.urls)),
]

