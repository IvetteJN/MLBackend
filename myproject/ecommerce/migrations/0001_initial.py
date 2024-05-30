# Generated by Django 4.2 on 2024-05-29 15:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Autor',
            fields=[
                ('id_autor', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'autor',
            },
        ),
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id_categoria', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_categoria', models.CharField(max_length=100, unique=True)),
            ],
            options={
                'verbose_name': 'Categoría',
                'verbose_name_plural': 'Categorías',
                'db_table': 'categoria',
            },
        ),
        migrations.CreateModel(
            name='Direccion',
            fields=[
                ('id_direccion', models.AutoField(primary_key=True, serialize=False)),
                ('direccion', models.CharField(max_length=255)),
                ('ciudad', models.CharField(max_length=100)),
                ('provincia', models.CharField(default='Desconocido', max_length=100, verbose_name='Provincia')),
                ('codigo_postal', models.CharField(max_length=20)),
                ('pais', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'direccion',
            },
        ),
        migrations.CreateModel(
            name='FormaEnvio',
            fields=[
                ('id_forma_envio', models.AutoField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'forma_envio',
            },
        ),
        migrations.CreateModel(
            name='FormaPago',
            fields=[
                ('id_forma_pago', models.AutoField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'forma_pago',
            },
        ),
        migrations.CreateModel(
            name='Libro',
            fields=[
                ('id_libro', models.AutoField(primary_key=True, serialize=False)),
                ('titulo', models.CharField(max_length=255)),
                ('portada', models.ImageField(default='No disponible', upload_to='portadas/', verbose_name='Portada')),
                ('descripcion', models.CharField(default='No disponible', max_length=100, verbose_name='Descripcion')),
                ('precio', models.DecimalField(decimal_places=2, max_digits=10)),
                ('stock', models.IntegerField()),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.categoria')),
            ],
            options={
                'db_table': 'libro',
            },
        ),
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rol', models.CharField(max_length=100)),
                ('description', models.TextField(default='No description')),
            ],
            options={
                'db_table': 'rol',
            },
        ),
        migrations.CreateModel(
            name='UsuarioCliente',
            fields=[
                ('id_cliente', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('contrasena', models.CharField(max_length=255)),
                ('roles', models.ManyToManyField(to='ecommerce.rol')),
            ],
            options={
                'db_table': 'usuario_cliente',
            },
        ),
        migrations.CreateModel(
            name='UsuarioAdministrador',
            fields=[
                ('id_admin', models.AutoField(primary_key=True, serialize=False)),
                ('usuario', models.CharField(max_length=100, unique=True)),
                ('contrasena', models.CharField(max_length=255)),
                ('roles', models.ManyToManyField(to='ecommerce.rol')),
            ],
            options={
                'db_table': 'usuario_administrador',
            },
        ),
        migrations.CreateModel(
            name='Reseña',
            fields=[
                ('id_resena', models.AutoField(primary_key=True, serialize=False)),
                ('comentario', models.TextField()),
                ('calificacion', models.IntegerField()),
                ('fecha_resena', models.DateTimeField(auto_now_add=True)),
                ('libro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.libro')),
                ('usuario_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.usuariocliente')),
            ],
            options={
                'db_table': 'resena',
            },
        ),
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id_pedido', models.AutoField(primary_key=True, serialize=False)),
                ('estado_pedido', models.CharField(max_length=50)),
                ('fecha_pedido', models.DateTimeField(auto_now_add=True)),
                ('direccion_envio', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.direccion')),
                ('forma_envio', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.formaenvio')),
                ('forma_pago', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.formapago')),
                ('usuario_cliente', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ecommerce.usuariocliente')),
            ],
            options={
                'db_table': 'pedido',
            },
        ),
        migrations.CreateModel(
            name='HistorialPedido',
            fields=[
                ('id_historial', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.IntegerField()),
                ('estado_pedido', models.CharField(max_length=50)),
                ('fecha_cambio', models.DateTimeField(auto_now_add=True)),
                ('pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.pedido')),
            ],
            options={
                'db_table': 'historial_pedido',
            },
        ),
        migrations.AddField(
            model_name='direccion',
            name='usuario_cliente',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ecommerce.usuariocliente'),
        ),
        migrations.CreateModel(
            name='DetallePedido',
            fields=[
                ('id_detalle', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.IntegerField()),
                ('precio_unitario', models.DecimalField(decimal_places=2, max_digits=10)),
                ('precio_total', models.DecimalField(decimal_places=2, max_digits=10)),
                ('libro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.libro')),
                ('pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.pedido')),
            ],
            options={
                'db_table': 'detalle_pedido',
            },
        ),
        migrations.CreateModel(
            name='LibroAutor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('autor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.autor')),
                ('libro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.libro')),
            ],
            options={
                'db_table': 'libro_autor',
                'unique_together': {('libro', 'autor')},
            },
        ),
    ]
