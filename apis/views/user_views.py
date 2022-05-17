from django.shortcuts import redirect, render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from apis.models import *
from apis.serializers import *
from common.common import *
from rest_framework.permissions import IsAuthenticated
from django.db import transaction
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
import uuid
from django.core.mail import EmailMultiAlternatives
from django.core.mail import EmailMessage
import json
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.tokens import default_token_generator


# Create your views here.

## ================================SignUp================================ ##
@api_view(['POST'])
def sign_up(request):
    serializer = UserRegisterSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET','POST', 'PUT'])
def users_list(request):
    if request.method == 'GET':
        users = User.objects.all().order_by('-date_joined')
        serializer = UserSerializer(users,many=True).data    
        return Response(serializer)

    elif(request.method == 'POST'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
    elif request.method == 'PUT':
        user = request.user
        serializer = UserSerializer(user, request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            user = User.objects.get(id = serializer.data['id'])
            serializer = UserSerializer(user, context = {'depth': 1 })
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET','PUT','DELETE'])
def users_details(request,pk):
    try:
        user = User.objects.get(pk=pk)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = UserSerializer(user, request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        user.delete()
#         user.objects.update()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    
@api_view(['GET'])
def users_by_role(request, role):
    if role > 6:
        users = User.objects.filter(groups__id__gte = role)
    else:
        users = User.objects.filter(groups__id = role)
    serializer = UserSerializer(users,many=True)
    return Response(serializer.data)

## ================================GetUser================================ ##
@api_view(['GET'])
@permission_classes([IsAuthenticated])
@transaction.atomic
def get_user(request):
    serializer = UserSerializer(request.user, context = {'depth': 1 })
    return Response(serializer.data)
