# Generated by Django 2.0.1 on 2020-09-18 11:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0017_doctor_email'),
    ]

    operations = [
        migrations.CreateModel(
            name='ToMail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(max_length=254)),
            ],
        ),
    ]
