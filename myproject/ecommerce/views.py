<<<<<<< HEAD
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from ecommerce.models import UsuarioCliente
from ecommerce.serializers import UsuarioClienteSerializer
from django.contrib.auth import authenticate

class RegistroView(APIView):
    def post(self, request):
        serializer = UsuarioClienteSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({"mensaje": "Usuario creado correctamente"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        contrasena = request.data.get('contrasena')
        user = authenticate(request, username=email, password=contrasena)
        if user is not None:
            token, created = Token.objects.get_or_create(user=user)
            return Response({"token": token.key}, status=status.HTTP_200_OK)
        return Response({"error": "Credenciales no válidas"}, status=status.HTTP_400_BAD_REQUEST)
=======
from rest_framework import viewsets
from .models import Usuario
from .serializer import UsuarioSerializer

class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer
>>>>>>> 11f96b1253f061576937f8227873de488156e8cd
