from .models import *
from rest_framework import serializers
from common.common import *
from rest_framework import status
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate
from django.contrib.auth.models import update_last_login
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import Group
import random
from django.db.models import Q
import pandas as pd
from django.contrib.auth.models import Permission
from _datetime import date
from multiprocessing.sharedctypes import synchronized

class OriginSerializer(serializers.ModelSerializer):
    class Meta:
        model = Origin
        fields = '__all__'

class StateSerializer(serializers.ModelSerializer):
    class Meta:
        model = State
        fields = '__all__'
        
class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'
        
class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = '__all__'

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = '__all__'
        
class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permission
        fields = '__all__'
        
class UserCountSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        
class UserSerializer(serializers.ModelSerializer):
    
    def __init__(self, *args, **kwargs):
        depth = kwargs.get('context', {}).get('depth', None)
        self.Meta.depth = depth
        super(UserSerializer, self).__init__(*args, **kwargs)
    
    def validate(self, data):
        if 'groups' in data:
            if str(data['groups'][0]) == "State Distributor":
                doesExist = False
                try:
                    if 'id' in self.initial_data:
                        User.objects.exclude(id = self.initial_data['id']).get(state_id = data['state'], groups__name = data['groups'][0])
                    else:
                        User.objects.get(state_id = data['state'], groups__name = data['groups'][0])
                    doesExist = True
                except Exception as e:
                    print(e)
                    doesExist = False
                if doesExist:
                    raise CustomValidation('User already exist for selected state','error', status_code=status.HTTP_400_BAD_REQUEST)
                    
            if str(data['groups'][0]) == "District Distributor":
                doesExist = False
                try:
                    if 'id' in self.initial_data:
                        User.objects.exclude(id = self.initial_data['id']).get(state_id = data['state'], district_id = data['district'], groups__name = data['groups'][0])
                    else:
                        User.objects.get(state_id = data['state'], district_id = data['district'], groups__name = data['groups'][0])
                    doesExist = True
                except:
                    doesExist = False
                if doesExist:
                    raise CustomValidation('User already exist for selected district','error', status_code=status.HTTP_400_BAD_REQUEST)
                
            if str(data['groups'][0]) == "City Distributor":
                doesExist = False
                try:
                    if 'id' in self.initial_data:
                        User.objects.exclude(id = self.initial_data['id']).get(state_id = data['state'], district_id = data['district'], city_id = data['city'], groups__name = data['groups'][0])
                    else:
                        User.objects.get(state_id = data['state'], district_id = data['district'], city_id = data['city'], groups__name = data['groups'][0])
                    doesExist = True
                except:
                    doesExist = False
                if doesExist:
                    raise CustomValidation('User already exist for selected city','error', status_code=status.HTTP_400_BAD_REQUEST)
        
        
        if 'password' in data:
            data['password'] = make_password(data['password'])
        return data
    
    def create(self, validated_data):
        
        if "user_targets" in validated_data:
            user_targets = validated_data.pop("user_targets")
        else:
            user_targets = None
        if 'groups' in validated_data:
            groups = validated_data.pop("groups")
            user_permissions = validated_data.pop("user_permissions")
        else:
            groups = None
        user = User.objects.create(**validated_data)
        if groups is not None:
            for g in groups:
                my_group = Group.objects.get(name=g)             
                my_group.user_set.add(user)
        return user
    
    def update(self, instance, validated_data):
        
        if "user_targets" in validated_data:
            user_targets = validated_data.pop("user_targets")
        else:
            user_targets = None
        if 'groups' in validated_data:
            groups = validated_data.pop("groups")
        else:
            groups = None
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        if 'image' in validated_data:
            User.objects.get(id=instance.id).image.delete(save=True)
        instance.save()
        if groups is not None:
            for g in groups:
                my_group = Group.objects.get(name=g)             
                my_group.user_set.add(instance)
        return instance

    class Meta:
        model = User
        fields = '__all__'
        
class UserRegisterSerializer(serializers.ModelSerializer):
    
    token = serializers.SerializerMethodField('get_token')
    
    def get_token(self, obj):
        try:
            user_with_token = Token.objects.get(user=obj)
        except:
            user_with_token = None
        
        if user_with_token is None:
            token1 = Token.objects.create(user=obj)
            token = token1.key
        else:
            Token.objects.get(user=obj).delete()
            token1 = Token.objects.create(user=obj)
            token = token1.key
        return token
    
    def validate(self, data):
        if 'email' not in data:
            raise CustomValidation('email field is required','error', status_code=status.HTTP_400_BAD_REQUEST)
        if 'password' not in data:
            raise CustomValidation('password field is required','error', status_code=status.HTTP_400_BAD_REQUEST)
        if 'phone_number' not in data:
            raise CustomValidation('phone_number field is required','error', status_code=status.HTTP_400_BAD_REQUEST)
        data['password'] = make_password(data['password'])
        return data
    
    class Meta:
        model = User
        fields = ('id', 'email', 'phone_number', 'password', 'groups', 'token')
        
