# Generated by Django 2.0.1 on 2020-09-18 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('americanhospital_app', '0014_remove_keywords_keyword'),
    ]

    operations = [
        migrations.AddField(
            model_name='keywords',
            name='name',
            field=models.CharField(default=True, max_length=255),
            preserve_default=False,
        ),
    ]
