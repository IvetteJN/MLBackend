from django.contrib import admin
from django.urls import path, include
<<<<<<< HEAD
from ecommerce import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/registro/', views.RegistroView.as_view(), name='registro'),
    path('api/login/', views.LoginView.as_view(), name='login'),
=======

urlpatterns = [
    path('admin/', admin.site.urls),
    #URL aqui portadas 
    #+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    path('ecommerce/v1/',include('ecommerce.urls'))
>>>>>>> 11f96b1253f061576937f8227873de488156e8cd
]
