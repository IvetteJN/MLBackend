from django.urls import path, include
from rest_framework.routers import DefaultRouter
from  ecommerce import views
from .views import CarritoViewSet, HistorialPedidoSet, UsuarioClienteViewSet, UsuarioAdministradorViewSet, RolViewSet

router = DefaultRouter()
<<<<<<< HEAD
router.register(r'carrito', CarritoViewSet, basename='carrito')
router.register(r'historial-pedido', HistorialPedidoSet, basename='historial-pedido')
=======
router.register(r'carrito', CarritoViewSet)
router.register(r'historial-pedido', HistorialPedidoSet)
>>>>>>> 5df2083ca816fe1d95405ed8221ef65811c84b57
router.register(r'api/roles', views.RolViewSet)
router.register(r'api/clientes', views.UsuarioClienteViewSet)
router.register(r'api/administradores', views.UsuarioAdministradorViewSet)
router.register(r'api/libros', views.LibroViewSet)
router.register(r'api/categoria', views.CategoriaViewSet)
router.register(r'api/autor', views.AutorViewSet)

urlpatterns = [
    path('', include(router.urls)),
<<<<<<< HEAD
    path('api/login/', views.login),
    path('api/registro/', views.registro_usuario, name='registro_usuario'),
    path('api/clientes/', views.registro_usuario, name='registro_usuario'),
    path('api/libros/', views.list_libro, name='list_libros'),
    path('api/categoria/', views.list_categoria, name='list_categoria'),
    path('api/autor/', views.list_autor, name='list_autor'),
=======
    path('login/', views.login),
    path('registro/', views.registro_usuario, name='registro_usuario'),
    path('clientes/', views.registro_usuario, name='registro_usuario'),
    path('libros/', views.list_libro, name='list_libros'),
    path('categoria/', views.list_categoria, name='list_categoria'),
    path('autor/', views.list_autor, name='list_autor'),
>>>>>>> 5df2083ca816fe1d95405ed8221ef65811c84b57
    
]