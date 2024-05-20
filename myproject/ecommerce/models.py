from django.db import models
from django.utils import timezone

# usuarios

class UsuarioCliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    correo_electronico = models.EmailField(unique=True)
    contrasena = models.CharField(max_length=255)

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class UsuarioAdministrador(models.Model):
    id_admin = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=255, unique=True)
    contrasena = models.CharField(max_length=255)

    def __str__(self):
        return self.usuario

# direccion

class Direccion(models.Model):
    id_direccion = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE)
    direccion = models.TextField()
    ciudad = models.CharField(max_length=255)
    estado = models.CharField(max_length=255)
    codigo_postal = models.CharField(max_length=20)
    pais = models.CharField(max_length=255)

    def __str__(self):
        return f'{self.direccion}, {self.ciudad}, {self.pais}'

#usuario_administrador - usuario_cliente

class UsuarioClienteAdministrador(models.Model):
    administrador = models.ForeignKey(UsuarioAdministrador, on_delete=models.CASCADE)
    usuario_cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('administrador', 'usuario_cliente')

    def __str__(self):
        return f'{self.administrador.usuario} - {self.usuario_cliente.nombre}'

# libro, categoria, autor, libro-autor

class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)
    autor = models.ManyToManyField('Autor', through='LibroAutor')
    
    class Meta:
        db_table = 'libro'
        verbose_name = 'Libro'
        verbose_name_plural = 'Libros'

    def __str__(self):
        return self.titulo

class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    categoria = models.CharField(max_length=100, unique=True)

    class Meta:
        db_table = 'categoria'
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'

    def __str__(self):
        return self.nombre

class Autor(models.Model):
    id_autor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)

    class Meta:
        db_table = 'autor'
        verbose_name = 'Autor'
        verbose_name_plural = 'Autores'

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class LibroAutor(models.Model):
    id = models.AutoField(primary_key=True)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    autor = models.ForeignKey(Autor, on_delete=models.CASCADE)

    class Meta:
        db_table = 'libro_autor'
        verbose_name = 'Libro-Autor'
        verbose_name_plural = 'Libros-Autores'

    def __str__(self):
        return f'{self.libro.titulo} - {self.autor.nombre} {self.autor.apellido}'

# reseña

class Resena(models.Model):
    id_resena = models.AutoField(primary_key=True)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    usuario = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE)
    comentario = models.TextField()
    calificacion = models.IntegerField()
    fecha_resena = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.libro.titulo} - {self.usuario.nombre}'


# usuario_administrador - libro

class LibroAdministrador(models.Model):
    administrador = models.ForeignKey(UsuarioAdministrador, on_delete=models.CASCADE)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('administrador', 'libro')

    def __str__(self):
        return f'{self.administrador.usuario} - {self.libro.titulo}'

# pedido, detalle_pedido, historial pedido

from django.db import models
from .models import Libro, UsuarioCliente

class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE, default=1) 
    estado_pedido = models.CharField(max_length=100, default='Pendiente')
    fecha_pedido = models.DateTimeField(default=timezone.now, editable=False)

    class Meta:
        db_table = 'pedido'
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'

    def __str__(self):
        return f'Pedido {self.id_pedido} - {self.cliente.nombre}'

class DetallePedido(models.Model):
    id_detalle = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    precio_total = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = 'detalle_pedido'
        verbose_name = 'Detalle de Pedido'
        verbose_name_plural = 'Detalles de Pedidos'

    def __str__(self):
        return f'Detalle - Pedido {self.pedido.id_pedido} - {self.libro.titulo}'

class HistorialPedido(models.Model):
    id_historial = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    estado_pedido = models.CharField(max_length=100, default='Pendiente')
    fecha_cambio = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.pedido.id_pedido} - {self.estado_pedido}'
