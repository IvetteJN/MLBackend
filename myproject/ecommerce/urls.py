from django.urls import path, include
from rest_framework.routers import DefaultRouter
from  ecommerce import views



router = DefaultRouter()
router.register(r'historialPedidos',views.HistorialPedidoSet)
router.register(r'api/roles', views.RolViewSet)
router.register(r'api/clientes', views.UsuarioClienteViewSet)
router.register(r'api/administradores', views.UsuarioAdministradorViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api/login/', views.login),
    path('api/registro/', views.registro_usuario, name='registro_usuario'),
   
    ]