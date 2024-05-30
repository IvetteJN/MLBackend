from django.urls import path, include
from rest_framework.routers import DefaultRouter
from  ecommerce import views

router = DefaultRouter()
router.register(r'historialPedidos',views.HistorialPedidoSet)
router.register(r'api/roles', views.RolViewSet)
router.register(r'api/clientes', views.UsuarioClienteViewSet)
router.register(r'api/administradores', views.UsuarioAdministradorViewSet)
router.register(r'api/libros', views.LibroViewSet)
router.register(r'api/categoria', views.CategoriaViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api/login/', views.login),
    path('api/registro/', views.registro_usuario, name='registro_usuario'),
    path('api/clientes/', views.registro_usuario, name='registro_usuario'),
    # path('productos/create/', CreateProductoView.as_view(), name='create_producto'),
    path('api/libros/', views.list_libro, name='list_libros'),
    path('api/categoria/', views.list_categoria, name='list_categoria'),
    
]