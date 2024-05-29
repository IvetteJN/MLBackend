from django.db import models

class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre_categoria = models.CharField(max_length=100, unique=True)

    class Meta:
        db_table = 'categoria'
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'

    def __str__(self):
        return self.categoria

class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    portada = models.ImageField('Portada', upload_to='portadas/', default='No disponible')
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    descripcion = models.CharField('Descripcion', max_length=100, default='No disponible')
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()

    class Meta:
        db_table = 'libro'

    def __str__(self):
        return self.titulo

class LibroAutor(models.Model):
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    autor = models.ForeignKey(Autor, on_delete=models.CASCADE)

    class Meta:
        db_table = 'libro_autor'
        unique_together = (('libro', 'autor'),)

    def __str__(self):
        return f'{self.libro.titulo} - {self.autor.nombre} {self.autor.apellido}'

class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    usuario_cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE, null=True, blank=True)
    estado_pedido = models.CharField(max_length=50)
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    direccion_envio = models.ForeignKey(Direccion, on_delete=models.SET_NULL, null=True)
    forma_envio = models.ForeignKey(FormaEnvio, on_delete=models.SET_NULL, null=True)
    forma_pago = models.ForeignKey(FormaPago, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = 'pedido'

    def __str__(self):
        return f'Pedido {self.id_pedido}'

class DetallePedido(models.Model):
    id_detalle = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    precio_total = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = 'detalle_pedido'

    def __str__(self):
        return f'{self.cantidad} x {self.libro.titulo}'

class HistorialPedido(models.Model):
    id_historial = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
