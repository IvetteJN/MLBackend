from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Producto
from .serializers import ProductoSerializer

class CreateProductoView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ProductoSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            producto = serializer.save()
            return Response(data=ProductoSerializer(producto).data, status=status.HTTP_201_CREATED)
        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ListProductoView(APIView):
    def get(self, request):
        productos = Producto.objects.all()
        serializer = ProductoSerializer(productos, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

class RetrieveProductoView(APIView):
    def get(self, request, pk):
        try:
            producto = Producto.objects.get(id_libro=pk)
            serializer = ProductoSerializer(producto)
            return Response(data=serializer.data, status=status.HTTP_200_OK)
        except Producto.DoesNotExist:
            return Response(data={"error": "Producto no encontrado"}, status=status.HTTP_404_NOT_FOUND)

class UpdateProductoView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ProductoSerializer

    def put(self, request, pk):
        try:
            producto = Producto.objects.get(id_libro=pk)
        except Producto.DoesNotExist:
            return Response(data={"error": "Producto no encontrado"}, status=status.HTTP_404_NOT_FOUND)

        serializer = self.serializer_class(producto, data=request.data, partial=True)
        if serializer.is_valid():
            producto = serializer.save()
            return Response(data=ProductoSerializer(producto).data, status=status.HTTP_200_OK)
        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class DeleteProductoView(APIView):
    permission_classes = [IsAuthenticated]

    def delete(self, request, pk):
        try:
            producto = Producto.objects.get(id_libro=pk)
            producto.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        except Producto.DoesNotExist:
            return Response(data={"error": "Producto no encontrado"}, status=status.HTTP_404_NOT_FOUND)