# Generated by Django 2.0.1 on 2020-09-18 10:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0013_keywords'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='keywords',
            name='keyword',
        ),
    ]
