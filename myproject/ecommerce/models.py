from django.db import models

class Rol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    rol = models.CharField(default='cliente', max_length=100)
    description = models.TextField(default='No description')

    class Meta:
        db_table = 'rol'

    def __str__(self):
        return f'{self.rol}'

class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre_categoria = models.CharField(max_length=100)

    class Meta:
        db_table = 'categoria'

    def __str__(self):
        return f'{self.nombre_categoria}'

class Autor(models.Model):
    id_autor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)

    class Meta:
        db_table = 'autor'

    def __str__(self):
        return f'{self.nombre}'

class UsuarioCliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    contrasena = models.CharField(max_length=255)

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
        if self.roles.filter(rol="Otorgar permisos").exists():
            usuario.roles.add(*roles)
            print(f"Permisos otorgados a {usuario.nombre}: {roles}")
        else:
            print("No tienes permisos para otorgar permisos.")

class Direccion(models.Model):
    id_direccion = models.AutoField(primary_key=True)
    usuario_cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE, null=True, blank=True, related_name='direcciones')
    direccion = models.CharField(max_length=255)
    ciudad = models.CharField(max_length=100)
    provincia = models.CharField('Provincia', max_length=100, default='Desconocido')
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


def get_upload_path(instance, filename):
    return f'libros/{instance.titulo}/{filename}'

class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    categoria = models.ForeignKey(Categoria, on_delete=models.RESTRICT)
    descripcion = models.TextField()
    portada = models.ImageField(upload_to=get_upload_path, null=True, blank=True)
    autor = models.ForeignKey(Autor, on_delete=models.RESTRICT, null=True, blank=True)

    class Meta:
        db_table = 'libro'

    def __str__(self):
        return f'{self.titulo}'

class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    usuario_cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE, null=True, blank=True, related_name='pedidos')
    estado_pedido = models.CharField(max_length=50)
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    direccion_envio = models.ForeignKey(Direccion, on_delete=models.SET_NULL, null=True, related_name='pedidos')
    forma_envio = models.ForeignKey(FormaEnvio, on_delete=models.SET_NULL, null=True, related_name='pedidos')
    forma_pago = models.ForeignKey(FormaPago, on_delete=models.SET_NULL, null=True, related_name='pedidos')

    class Meta:
        db_table = 'pedido'

    def __str__(self):
        return f'Pedido {self.id_pedido}'

class DetallePedido(models.Model):
    id_detalle = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, null=True, blank=True, related_name='detalles')
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE, related_name='detalles')
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    precio_total = models.DecimalField(max_digits=10, decimal_places=2)
    is_cart = models.BooleanField(default=True)

    class Meta:
        db_table = 'detalle_pedido'

    def __str__(self):
        return f'{self.cantidad} x {self.libro.titulo}'

class HistorialPedido(models.Model):
    id_historial = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, related_name='historiales')
    estado_pedido = models.CharField(max_length=50)
    fecha_cambio = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'historial_pedido'

    def __str__(self):
        return f'Historial {self.id_historial} - {self.estado_pedido}'

class Reseña(models.Model):
    id_resena = models.AutoField(primary_key=True)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE, related_name='resenas')
    usuario_cliente = models.ForeignKey(UsuarioCliente, on_delete=models.CASCADE, related_name='resenas')
    comentario = models.TextField()
    calificacion = models.IntegerField()
    fecha_resena = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'resena'

    def __str__(self):
        return f'Reseña {self.id_resena} - {self.calificacion}'
