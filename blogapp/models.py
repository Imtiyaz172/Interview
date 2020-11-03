from django.db import models
from imagekit.models import ImageSpecField # < import this
from imagekit.processors import ResizeToFill # < import this
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from django.utils.safestring import mark_safe 
import os

# Create your models here.



class product(models.Model):
    name       = models.CharField(max_length=250)
    image1     = models.ImageField(upload_to="product/",blank=True)
    company    = models.CharField(max_length=150,blank=True)
    new_price  = models.CharField(max_length=50)
    view       = models.IntegerField(default=0)
    Status     = models.BooleanField(default = True)

    def __str__(self):
        return self.name
    class Meta:
        verbose_name = 'product'
        verbose_name_plural = 'products' 



class location(models.Model):
    Name          = models.CharField(max_length=100)
    Status        = models.BooleanField(default = True)

    def __str__(self):
        return self.Name 
    class Meta:
        verbose_name = 'location'
        verbose_name_plural = 'location' 

class giftcard(models.Model):
    code          = models.CharField(max_length=100,unique=True)
    amount           = models.IntegerField()
    Status        = models.BooleanField(default = True)

    def __str__(self):
        return self.code 
    class Meta:
        verbose_name = 'giftcard'
        verbose_name_plural = 'giftcards' 




class user_reg(models.Model):
    Name          = models.CharField(max_length=100)
    email         = models.EmailField(max_length=250,blank=True)
    password      = models.CharField(max_length=100)
    phone         = models.CharField(max_length=100)
    location      = models.ForeignKey(location, on_delete=models.CASCADE,blank=True)
    Status        = models.BooleanField(default = True)

    def __str__(self):
        return self.Name 
    class Meta:
        verbose_name = 'user_reg'
        verbose_name_plural = 'user_reg' 




class Cart(models.Model):
    product        = models.ForeignKey(product, on_delete=models.CASCADE)
    user_reg       = models.ForeignKey(user_reg, on_delete=models.CASCADE,blank=True)
    quantity       = models.IntegerField()
    price          = models.IntegerField()
    add_date      = models.DateField(auto_now=True)
    status        = models.BooleanField(default=True)
    def line_total(self):
        return self.quantity * self.price
    def __str__(self):
        return str(self.product)
    class Meta:
        verbose_name='Cart'
        verbose_name_plural='Cart'

class order(models.Model):
    castomer_name  = models.CharField(max_length=100)
    castomer_phone  = models.CharField(max_length=100)
    product        = models.ForeignKey(product, on_delete=models.CASCADE, null=True)
    quantity       = models.IntegerField()
    price          = models.IntegerField()
    add_date      = models.DateField(auto_now=True)
    def __str__(self):
        return str(self.castomer_name)
    class Meta:
        verbose_name='order'
        verbose_name_plural='order'

