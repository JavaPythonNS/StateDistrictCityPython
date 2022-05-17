from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractUser
from django.utils import timezone
from django.core.validators import RegexValidator
from django.core.validators import validate_email
import uuid
import datetime

from django.utils.timezone import utc
from email.policy import default

# Create your models here.


class Origin(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, null="True")
    
    class Meta:
        db_table = 'origin'
        default_permissions = ()

class State(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, null="True")
    
    class Meta:
        db_table = 'state'
        default_permissions = ()
        
class District(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, null="True")
    state = models.ForeignKey(State, null="True", on_delete=models.CASCADE, related_name="district_state")
    
    class Meta:
        db_table = 'district'
        default_permissions = ()
        
class City(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, null="True")
    district = models.ForeignKey(District, null="True", on_delete=models.CASCADE, related_name="city_list")
    state = models.ForeignKey(State, null="True", on_delete=models.CASCADE, related_name="city_list")
    
    class Meta:
        db_table = 'city'
        default_permissions = ()

class UserManager(BaseUserManager):
    def create_user(self, email, password=None, first_name='', last_name='', **extra_fields):
        if not email:
            raise ValueError('Enter an email address')
        email = self.normalize_email(email)
        user = self.model(email=email, first_name=first_name, last_name=last_name, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        user = self.create_user(email, password=password)
        user.is_superuser = True
        user.is_staff = True
        user.save(using=self._db)
        return user

class User(AbstractUser):
    username = None
    email = models.EmailField(unique=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    phone_number = models.CharField(max_length=255, null="True", unique=True)
    city = models.ForeignKey(City, null="True", on_delete=models.CASCADE, related_name="user_city")
    district = models.ForeignKey(District, null="True", on_delete=models.CASCADE, related_name="user_district")
    state = models.ForeignKey(State, null="True", on_delete=models.CASCADE, related_name="user_state")
    address = models.CharField(max_length=255, null="True")
    address_city = models.ForeignKey(City, null="True", on_delete=models.CASCADE, related_name="user_address_city")
    address_district = models.ForeignKey(District, null="True", on_delete=models.CASCADE, related_name="user_address_district")
    address_state = models.ForeignKey(State, null="True", on_delete=models.CASCADE, related_name="user_address_state")
    address_pin_code = models.IntegerField(null=True)
    image = models.ImageField(upload_to = 'user_images', null="True")
    user_status = models.IntegerField(null=True)
    dob = models.DateField(null=True)
    profile_status = models.IntegerField(null=True,default=0)
    gst_number = models.CharField(max_length=255, null="True")
    
    objects = UserManager()
    pass

    def save(self, *args, **kwargs):
        self.is_active = True
        self.user_status = 1
#         self.profile_status =0
        super(User, self).save(*args, **kwargs)

    class Meta:
        db_table = 'auth_user'
        default_permissions = ()
        permissions = (('add_staff', 'Can add staff'), ('change_staff', 'Can change staff'), ('delete_staff', 'Can delete staff'), ('view_staff', 'Can view staff'),
                       ('add_state_distributor', 'Can add state distributor'), ('change_state_distributor', 'Can change state distributor'), ('delete_state_distributor', 'Can delete state distributor'), ('view_state_distributor', 'Can view state distributor'),
                       ('add_district_distributor', 'Can add district distributor'), ('change_district_distributor', 'Can change district distributor'), ('delete_district_distributor', 'Can delete district distributor'), ('view_district_distributor', 'Can view district distributor'),
                       ('add_city_distributor', 'Can add city distributor'), ('change_city_distributor', 'Can change city distributor'), ('delete_city_distributor', 'Can delete city distributor'), ('view_city_distributor', 'Can view city distributor'),
                       ('add_jeweller', 'Can add jeweller'), ('change_jeweller', 'Can change jeweller'), ('delete_jeweller', 'Can delete jeweller'), ('view_jeweller', 'Can view jeweller'),
                       ('add_customer', 'Can add customer'), ('change_customer', 'Can change customer'), ('delete_customer', 'Can delete customer'), ('view_customer', 'Can view customer'), ('use_staff_app', 'Can use staff app')
                       )
        
class OTPVerification(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.CharField(max_length=255, null=True)
    otp = models.IntegerField(null=True)
    
    class Meta:
        db_table = 'otp_verification'
        default_permissions = ()
    