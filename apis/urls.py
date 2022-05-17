"""FindExpeditors URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from apis import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('sign_up/', views.sign_up),
    path('groups/', views.groups_list),
    path('groups/<int:pk>', views.groups_details),
    path('permissions/', views.permissions_list),
    path('users/', views.users_list),
    path('users/<int:pk>', views.users_details),
    path('users_by_role/<int:role>', views.users_by_role),
    path('update_profile/', views.users_list),
    path('get_user/', views.get_user),
    path('states/', views.states_list),
    path('states/<int:pk>', views.states_details),
    path('districts/', views.districts_list),
    path('districts/<int:pk>', views.districts_details),
    path('cities/', views.cities_list),
    path('cities/<int:pk>', views.cities_details),
    path('get_states_districts_cities_list/', views.get_states_districts_cities_list),
    path('get_district_list_by_state/<int:state_id>', views.get_district_list_by_state),
    path('get_city_list_by_state/<int:state_id>', views.get_city_list_by_state),
    path('get_city_list_by_district/<int:district_id>', views.get_city_list_by_district),

]