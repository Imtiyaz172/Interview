# Generated by Django 2.0.3 on 2020-11-02 12:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blogapp', '0011_remove_order_user_reg'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='castomer_name',
            field=models.CharField(default=12, max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='order',
            name='castomer_phone',
            field=models.CharField(default=12, max_length=100),
            preserve_default=False,
        ),
    ]