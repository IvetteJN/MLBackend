from django.contrib import admin
from django.urls import path, include
from ecommerce import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/registro/', views.RegistroView.as_view(), name='registro'),
    path('api/login/', views.LoginView.as_view(), name='login'),
]
