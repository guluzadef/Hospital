# Generated by Django 2.0.1 on 2020-09-12 23:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0009_auto_20200910_1726'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImagePages',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='imagepage/')),
            ],
        ),
    ]
