# Generated by Django 4.2 on 2024-06-05 20:55

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import ecommerce.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('email', models.EmailField(max_length=150, unique=True)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Autor',
            fields=[
                ('id_autor', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_autor', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'autor',
            },
        ),
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id_categoria', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_categoria', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'categoria',
            },
        ),
        migrations.CreateModel(
            name='Direccion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('calle', models.CharField(max_length=255)),
                ('ciudad', models.CharField(max_length=100)),
                ('provincia', models.CharField(max_length=100)),
                ('codigo_postal', models.CharField(max_length=20)),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='direcciones', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'direccion',
            },
        ),
        migrations.CreateModel(
            name='FormaEnvio',
            fields=[
                ('id_forma_envio', models.AutoField(primary_key=True, serialize=False)),
                ('forma_envio', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'forma_envio',
            },
        ),
        migrations.CreateModel(
            name='FormaPago',
            fields=[
                ('id_forma_pago', models.AutoField(primary_key=True, serialize=False)),
                ('forma_pago', models.CharField(max_length=100)),
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
                ('precio', models.DecimalField(decimal_places=2, max_digits=10)),
                ('stock', models.IntegerField()),
                ('descripcion', models.TextField()),
                ('portada', models.ImageField(blank=True, null=True, upload_to=ecommerce.models.get_upload_path)),
                ('id_autor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.autor')),
                ('id_categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.categoria')),
            ],
            options={
                'db_table': 'libro',
            },
        ),
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('id_rol', models.AutoField(primary_key=True, serialize=False)),
                ('rol', models.TextField(default='Cliente')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='roles', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'rol',
            },
        ),
        migrations.CreateModel(
            name='Reseña',
            fields=[
                ('id_resena', models.AutoField(primary_key=True, serialize=False)),
                ('comentario', models.TextField()),
                ('calificacion', models.IntegerField()),
                ('fecha_resena', models.DateTimeField(auto_now_add=True)),
                ('libro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='resenas', to='ecommerce.libro')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='resenas_usuario', to=settings.AUTH_USER_MODEL)),
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
                ('direccion_envio', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='pedidos', to='ecommerce.direccion')),
                ('forma_envio', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='pedidos', to='ecommerce.formaenvio')),
                ('forma_pago', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='pedidos', to='ecommerce.formapago')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pedidos_pedido', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'pedido',
            },
        ),
        migrations.CreateModel(
            name='HistorialPedido',
            fields=[
                ('id_historial', models.AutoField(primary_key=True, serialize=False)),
                ('estado_pedido', models.CharField(max_length=50)),
                ('fecha_cambio', models.DateTimeField(auto_now_add=True)),
                ('pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='historiales', to='ecommerce.pedido')),
            ],
            options={
                'db_table': 'historial_pedido',
            },
        ),
        migrations.CreateModel(
            name='EstadoPedido',
            fields=[
                ('id_estado', models.AutoField(primary_key=True, serialize=False)),
                ('estado_pedido', models.CharField(default='En preparación', max_length=100)),
                ('id_pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='estados_pedido', to='ecommerce.pedido')),
            ],
            options={
                'db_table': 'estado_pedido',
            },
        ),
    ]
