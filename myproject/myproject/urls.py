from django.contrib import admin
from django.urls import path, include

urlpatterns = [
<<<<<<< HEAD
    path('', admin.site.urls),  
    path('api/', include('ecommerce.urls')),  
=======
    path('admin/', admin.site.urls),
    path('', include('ecommerce.urls')),
>>>>>>> 5df2083ca816fe1d95405ed8221ef65811c84b57
]