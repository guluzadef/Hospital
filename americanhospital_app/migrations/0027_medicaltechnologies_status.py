# Generated by Django 2.0.1 on 2020-09-18 13:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0026_medicaltechnologies'),
    ]

    operations = [
        migrations.AddField(
            model_name='medicaltechnologies',
            name='status',
            field=models.CharField(default='1', max_length=1),
        ),
    ]
