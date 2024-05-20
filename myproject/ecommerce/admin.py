from django.contrib import admin
from .models import Libro, Categoria, Pedido, DetallePedido, UsuarioCliente, Autor, Direccion, HistorialPedido, Resena, LibroAutor, UsuarioAdministrador, UsuarioClienteAdministrador, LibroAdministrador

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('categoria',)

class AutorAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido')

class LibroAutorInline(admin.TabularInline):
    model = LibroAutor

class LibroAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'display_autores', 'precio', 'stock', 'categoria')
    inlines = [LibroAutorInline]

    def display_autores(self, obj):
        return ', '.join([autor.nombre_completo() for autor in obj.autor.all()])

    display_autores.short_description = 'Autor(es)'

class UsuarioClienteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'correo_electronico', 'contrasena')

class UsuarioAdministradorAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'contrasena')

class PedidoAdmin(admin.ModelAdmin):
    list_display = ('id_pedido', 'cliente', 'estado_pedido', 'fecha_pedido')

class DetallePedidoAdmin(admin.ModelAdmin):
    list_display = ('id_detalle', 'pedido', 'libro', 'cantidad', 'precio_unitario', 'precio_total')

class HistorialPedidoAdmin(admin.ModelAdmin):
    list_display = ('id_historial', 'pedido', 'estado_pedido', 'fecha_cambio')

class DireccionAdmin(admin.ModelAdmin):
    list_display = ('id_direccion', 'usuario', 'direccion', 'ciudad', 'estado', 'codigo_postal', 'pais')

class ResenaAdmin(admin.ModelAdmin):
    list_display = ('id_resena', 'libro', 'usuario', 'calificacion', 'fecha_resena')

class LibroAdministradorAdmin(admin.ModelAdmin):
    list_display = ('administrador', 'libro')

admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Autor, AutorAdmin)
admin.site.register(Libro, LibroAdmin)
admin.site.register(UsuarioCliente, UsuarioClienteAdmin)
admin.site.register(UsuarioAdministrador, UsuarioAdministradorAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(DetallePedido, DetallePedidoAdmin)
admin.site.register(HistorialPedido, HistorialPedidoAdmin)
admin.site.register(Direccion, DireccionAdmin)
admin.site.register(Resena, ResenaAdmin)
admin.site.register(LibroAdministrador, LibroAdministradorAdmin)
