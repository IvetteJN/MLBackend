from django.urls import path, include
from rest_framework.routers import DefaultRouter
from ecommerce import views
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

router = DefaultRouter()
router.register(r'historialPedidos', views.HistorialPedidoSet)
router.register(r'api/roles', views.RolViewSet)
router.register(r'api/clientes', views.UsuarioClienteViewSet)
router.register(r'api/administradores', views.UsuarioAdministradorViewSet)
router.register(r'api/libros', views.LibroViewSet)
router.register(r'api/categoria', views.CategoriaViewSet)
router.register(r'api/autor', views.AutorViewSet)
router.register(r'api/formaEnvio', views.FormaEnvioViewSet)
router.register(r'api/formaPago', views.FormaPagoViewSet)
router.register(r'api/pedido', views.PedidoViewSet)
router.register(r'api/direccion', views.DireccionViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api/login/', views.login),
    path('api/registro/', views.registro_usuario, name='registro_usuario'),
    path('api/libros/', views.list_libro, name='list_libros'),
    path('api/autor/', views.list_autor, name='list_autor'),
    path('api/categoria/', views.list_categoria, name='list_categoria'),
    path('api/cliente/<int:cliente_id>/detalle-pedido/', views.detalle_pedido_por_cliente, name='detalle_pedido_por_cliente'),
    path('api/formaEnvio/', views.list_forma_envio, name='list_forma_envio'),
    path('api/formaPago/', views.list_forma_pago, name='list_forma_pago'),
    path('api/pedido/', views.list_pedido, name='list_pedido'),
    path('api/direccion/', views.list_direccion, name='list_direccion'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)