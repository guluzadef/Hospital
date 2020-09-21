# Generated by Django 2.0.1 on 2020-09-12 23:42

import cloudinary.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0010_imagepages'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagepages',
            name='image',
            field=cloudinary.models.CloudinaryField(max_length=255, verbose_name='image'),
        ),
    ]
