from django.contrib import admin
from .models import Libro, Categoria, Pedido, ItemPedido, Usuario

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('categoria',)

class LibroAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'autor', 'portada', 'descripcion', 'precio', 'stock')

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'correo_electronico', 'contrasena', 'direccion_envio')

class PedidoAdmin(admin.ModelAdmin):
    list_display = ('__str__',)

class ItemPedidoAdmin(admin.ModelAdmin):
    list_display = ('libro', 'pedido', 'cantidad')

admin.site.register(Libro, LibroAdmin)
admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(ItemPedido, ItemPedidoAdmin)
admin.site.register(Usuario, UsuarioAdmin)
