# Generated by Django 2.0.1 on 2020-09-18 10:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0016_keywords_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor',
            name='email',
            field=models.EmailField(blank=True, max_length=254, null=True),
        ),
    ]
