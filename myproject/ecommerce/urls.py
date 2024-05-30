from django.urls import path, include
from rest_framework.routers import DefaultRouter
from  ecommerce import views
from .views import CarritoViewSet, HistorialPedidoSet, UsuarioClienteViewSet, UsuarioAdministradorViewSet, RolViewSet

router = DefaultRouter()
router.register(r'carrito', CarritoViewSet)
router.register(r'historial-pedido', HistorialPedidoSet)
router.register(r'api/roles', views.RolViewSet)
router.register(r'api/clientes', views.UsuarioClienteViewSet)
router.register(r'api/administradores', views.UsuarioAdministradorViewSet)
router.register(r'api/libros', views.LibroViewSet)
router.register(r'api/categoria', views.CategoriaViewSet)
router.register(r'api/autor', views.AutorViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('login/', views.login),
    path('registro/', views.registro_usuario, name='registro_usuario'),
    path('clientes/', views.registro_usuario, name='registro_usuario'),
    path('libros/', views.list_libro, name='list_libros'),
    path('categoria/', views.list_categoria, name='list_categoria'),
    path('autor/', views.list_autor, name='list_autor'),
    
]