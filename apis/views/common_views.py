from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from apis.models import *
from apis.serializers import *
from common.common import *
import json
import ast
from django.core.paginator import Paginator
from rest_framework.permissions import IsAuthenticated
from django.db import transaction
from django.db.models import Max,Min


# Create your views here.


## ================================Permission================================ ##
@api_view(['GET'])
def permissions_list(request):
    permissions = Permission.objects.all().order_by('id')
    serializer = PermissionSerializer(permissions,many=True)
    return Response(serializer.data)

## ================================Groups================================ ##
@api_view(['GET','POST'])
def groups_list(request):
    if request.method == 'GET':
        groups = Group.objects.all().order_by('id')
        serializer = GroupSerializer(groups,many=True)
        return Response(serializer.data)

    elif(request.method == 'POST'):
        serializer = GroupSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET','PUT','DELETE'])
def groups_details(request,pk):
    try:
        group = Group.objects.get(pk=pk)
    except Group.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = GroupSerializer(group)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = GroupSerializer(group, request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        group.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

## ================================State================================ ##
@api_view(['GET','POST'])
def states_list(request):
    if request.method == 'GET':
        states = State.objects.all()
        serializer = StateSerializer(states,many=True)
        return Response(serializer.data)

    elif(request.method == 'POST'):
        serializer = StateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET','PUT','DELETE'])
def states_details(request,pk):
    try:
        state = State.objects.get(pk=pk)
    except State.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = StateSerializer(state)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = StateSerializer(state, request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        state.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
## ================================District================================ ##
@api_view(['GET','POST'])
def districts_list(request):
    if request.method == 'GET':
        districts = District.objects.all()
        serializer = DistrictSerializer(districts,many=True)
        return Response(serializer.data)

    elif(request.method == 'POST'):
        serializer = DistrictSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET','PUT','DELETE'])
def districts_details(request,pk):
    try:
        district = District.objects.get(pk=pk)
    except District.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = DistrictSerializer(district)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = DistrictSerializer(district, request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        district.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
## ================================City================================ ##
@api_view(['GET','POST'])
def cities_list(request):
    if request.method == 'GET':
        cities = City.objects.all()
        serializer = CitySerializer(cities, many=True)
        return Response(serializer.data)

    elif(request.method == 'POST'):
        serializer = CitySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET','PUT','DELETE'])
def cities_details(request,pk):
    try:
        city = City.objects.get(pk=pk)
    except City.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = CitySerializer(city)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = CitySerializer(city, request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(getFirstError(serializer.errors),status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        city.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
## ================================City================================ ##
@api_view(['GET'])
def get_states_districts_cities_list(request):
    states = State.objects.all()
    states_serializer = StateSerializer(states, many=True)
    districts = District.objects.all()
    districts_serializer = DistrictSerializer(districts, many=True)
    cities = City.objects.all()
    cities_serializer = CitySerializer(cities, many=True)
    return Response({"states_list" : states_serializer.data, "districts_list" : districts_serializer.data, "cities_list" : cities_serializer.data})


## ================================GetDistrictListByState================================ ##
@api_view(['GET','PUT','DELETE'])
def get_district_list_by_state(request, state_id):
    district_list = District.objects.filter(state_id=state_id)
    serializer = DistrictSerializer(district_list, many = True)
    return Response(serializer.data)

## ================================GetCityListByState================================ ##
@api_view(['GET','PUT','DELETE'])
def get_city_list_by_state(request, state_id):
    city_list = City.objects.filter(state_id=state_id)
    serializer = CitySerializer(city_list, many = True)
    return Response(serializer.data)

## ================================GetCityListByState================================ ##
@api_view(['GET','PUT','DELETE'])
def get_city_list_by_district(request, district_id):
    city_list = City.objects.filter(district_id=district_id)
    serializer = CitySerializer(city_list, many = True)
    return Response(serializer.data)
    