# Generated by Django 2.0.1 on 2020-09-22 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0033_auto_20200922_1602'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='keywords',
            field=models.TextField(blank=True, null=True),
        ),
    ]