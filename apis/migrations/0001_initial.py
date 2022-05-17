# Generated by Django 3.2.6 on 2022-05-17 13:45

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Origin',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null='True')),
            ],
            options={
                'db_table': 'origin',
                'default_permissions': (),
            },
        ),
        migrations.CreateModel(
            name='OTPVerification',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('email', models.CharField(max_length=255, null=True)),
                ('otp', models.IntegerField(null=True)),
            ],
            options={
                'db_table': 'otp_verification',
                'default_permissions': (),
            },
        ),
        migrations.CreateModel(
            name='State',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null='True')),
            ],
            options={
                'db_table': 'state',
                'default_permissions': (),
            },
        ),
        migrations.CreateModel(
            name='District',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null='True')),
                ('state', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='district_state', to='apis.state')),
            ],
            options={
                'db_table': 'district',
                'default_permissions': (),
            },
        ),
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null='True')),
                ('district', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='city_list', to='apis.district')),
                ('state', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='city_list', to='apis.state')),
            ],
            options={
                'db_table': 'city',
                'default_permissions': (),
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('phone_number', models.CharField(max_length=255, null='True', unique=True)),
                ('address', models.CharField(max_length=255, null='True')),
                ('address_pin_code', models.IntegerField(null=True)),
                ('image', models.ImageField(null='True', upload_to='user_images')),
                ('user_status', models.IntegerField(null=True)),
                ('dob', models.DateField(null=True)),
                ('profile_status', models.IntegerField(default=0, null=True)),
                ('gst_number', models.CharField(max_length=255, null='True')),
                ('address_city', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_address_city', to='apis.city')),
                ('address_district', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_address_district', to='apis.district')),
                ('address_state', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_address_state', to='apis.state')),
                ('city', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_city', to='apis.city')),
                ('district', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_district', to='apis.district')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('state', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, related_name='user_state', to='apis.state')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'auth_user',
                'permissions': (('add_staff', 'Can add staff'), ('change_staff', 'Can change staff'), ('delete_staff', 'Can delete staff'), ('view_staff', 'Can view staff'), ('add_state_distributor', 'Can add state distributor'), ('change_state_distributor', 'Can change state distributor'), ('delete_state_distributor', 'Can delete state distributor'), ('view_state_distributor', 'Can view state distributor'), ('add_district_distributor', 'Can add district distributor'), ('change_district_distributor', 'Can change district distributor'), ('delete_district_distributor', 'Can delete district distributor'), ('view_district_distributor', 'Can view district distributor'), ('add_city_distributor', 'Can add city distributor'), ('change_city_distributor', 'Can change city distributor'), ('delete_city_distributor', 'Can delete city distributor'), ('view_city_distributor', 'Can view city distributor'), ('add_jeweller', 'Can add jeweller'), ('change_jeweller', 'Can change jeweller'), ('delete_jeweller', 'Can delete jeweller'), ('view_jeweller', 'Can view jeweller'), ('add_customer', 'Can add customer'), ('change_customer', 'Can change customer'), ('delete_customer', 'Can delete customer'), ('view_customer', 'Can view customer'), ('use_staff_app', 'Can use staff app')),
                'default_permissions': (),
            },
        ),
    ]