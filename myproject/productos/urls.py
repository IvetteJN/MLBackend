from django.urls import path
from .views import CreateProductoView, ListProductoView, RetrieveProductoView, UpdateProductoView, DeleteProductoView

urlpatterns = [
    path('productos/', ListProductoView.as_view(), name='list_productos'),
    path('productos/create/', CreateProductoView.as_view(), name='create_producto'),
    path('productos/<int:pk>/', RetrieveProductoView.as_view(), name='retrieve_producto'),
    path('productos/<int:pk>/update/', UpdateProductoView.as_view(), name='update_producto'),
    path('productos/<int:pk>/delete/', DeleteProductoView.as_view(), name='delete_producto'),
]