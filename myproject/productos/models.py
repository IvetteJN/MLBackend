from django.db import models



class Producto(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    portada = models.ImageField('Portada', upload_to='portadas/', default='No disponible')
    
    descripcion = models.CharField('Descripcion', max_length=100, default='No disponible')
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()

    def __str__(self):
        return self.nombre