from django.db import models


class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre_categoria = models.CharField(max_length=100, unique=True)

    class Meta:
        db_table = 'categoria'
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'

    def __str__(self):
        return self.nombre_categoria


class Autor(models.Model):
    id_autor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)

    class Meta:
        db_table = 'autor'

    def __str__(self):
        return f'{self.nombre}'


class Rol(models.Model):
    rol = models.CharField(max_length=100)
    description = models.TextField(default='No description')

    class Meta:
        db_table = 'rol'

    def __str__(self):
        return self.rol


class UsuarioCliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    contrasena = models.CharField(max_length=255)
    roles = models.ManyToManyField(Rol)

    class Meta:
        db_table = 'usuario_cliente'

    def __str__(self):
        return f'{self.nombre}'


class UsuarioAdministrador(models.Model):
    id_admin = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=100, unique=True)
    contrasena = models.CharField(max_length=255)
    roles = models.ManyToManyField(Rol)

    class Meta:
        db_table = 'usuario_administrador'

    def __str__(self):
        return self.usuario

    def otorgar_permisos(self, usuario, roles):
        # Verificar si el administrador tiene permiso para otorgar permisos
        if self.roles.filter(name="Otorgar permisos").exists():
            usuario.roles.add(*roles)
            print(f"Permisos otorgados a {usuario.nombre}: {roles}")
        else:
            print("No tienes permisos para otorgar permisos.")


class Direccion(models.Model):
    id_direccion = models.AutoField(primary_key=True)
    usuario_cliente = models.ForeignKey(
        UsuarioCliente, on_delete=models.CASCADE, null=True, blank=True)
    direccion = models.CharField(max_length=255)
    ciudad = models.CharField(max_length=100)
    provincia = models.CharField(
        'Provincia', max_length=100, default='Desconocido')
    codigo_postal = models.CharField(max_length=20)
    pais = models.CharField(max_length=100)

    class Meta:
        db_table = 'direccion'

    def __str__(self):
        return self.direccion


class FormaEnvio(models.Model):
    id_forma_envio = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=100)

    class Meta:
        db_table = 'forma_envio'

    def __str__(self):
        return self.descripcion


class FormaPago(models.Model):
    id_forma_pago = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=100)

    class Meta:
        db_table = 'forma_pago'

    def __str__(self):
        return self.descripcion


class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    portada = models.ImageField(
        'Portada', upload_to='portadas/', default='No disponible')
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    descripcion = models.CharField(
        'Descripcion', max_length=1000, default='No disponible')
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    autor = models.ForeignKey(Autor, on_delete=models.SET_NULL, null=True)

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
        return f'{self.libro.titulo} - {self.autor.nombre}'


class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    usuario_cliente = models.ForeignKey(
        UsuarioCliente, on_delete=models.CASCADE, null=True, blank=True)
    estado_pedido = models.CharField(max_length=50)
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    direccion_envio = models.ForeignKey(
        Direccion, on_delete=models.SET_NULL, null=True)
    forma_envio = models.ForeignKey(
        FormaEnvio, on_delete=models.SET_NULL, null=True)
    forma_pago = models.ForeignKey(
        FormaPago, on_delete=models.SET_NULL, null=True)

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
    estado_pedido = models.CharField(max_length=50)
    fecha_cambio = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'historial_pedido'

    def __str__(self):
        return f'Historial {self.id_historial} - {self.estado_pedido}'


class Reseña(models.Model):
    id_resena = models.AutoField(primary_key=True)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    usuario_cliente = models.ForeignKey(
        UsuarioCliente, on_delete=models.CASCADE)
    comentario = models.TextField()
    calificacion = models.IntegerField()
    fecha_resena = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'resena'

    def __str__(self):
        return f'Reseña {self.id_resena} - {self.calificacion}'