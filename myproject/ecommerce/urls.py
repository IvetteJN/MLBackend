<<<<<<< HEAD
from django.urls import path
from .views import RegistroView, LoginView

urlpatterns = [
    path('registro/', RegistroView.as_view(), name='registro'),
    path('login/', LoginView.as_view(), name='login'),
]
=======
from django.urls import path, include
from rest_framework import routers
from ecommerce import views

router = routers.DefaultRouter()
router.register(r'usuarios', views.UsuarioViewSet)

urlpatterns = [
     path('',include(router.urls))
]
>>>>>>> 11f96b1253f061576937f8227873de488156e8cd
