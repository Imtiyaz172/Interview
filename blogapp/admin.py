from django.contrib import admin
from . import models
admin.site.site_header='Zaas Property'


# Register your models here.
class locationModel(admin.ModelAdmin):
    list_display    = ["Name", "Status"]
    search_fields   = ['Name']
    list_per_page   = 20
    list_filter     = ["Name", "Status"]

admin.site.register(models.location, locationModel)

class giftcardModel(admin.ModelAdmin):
    list_display    = ["code","amount", "Status"]
    search_fields   = ['code']
    list_per_page   = 20
    list_filter     = ["code", "Status"]

admin.site.register(models.giftcard, giftcardModel)




class productModel(admin.ModelAdmin):
    list_display    = ["name","new_price","company","view"]
    search_fields   = ['name']
    list_per_page   = 20
    list_filter     = ["Status"]

admin.site.register(models.product, productModel)




class user_regModel(admin.ModelAdmin):
    list_display    = ["Name",  "email"]
    search_fields   = ['Name']
    list_per_page   = 20
    

admin.site.register(models.user_reg, user_regModel)

class CartModel(admin.ModelAdmin):
    list_display    = ["user_reg","product", "quantity"]
    search_fields   = []
    list_per_page   = 40
    def product(self, instance):
        return instance.product.name
    def user_reg(self, instance):
        return instance.user_reg.Name
    
    

admin.site.register(models.Cart, CartModel)


class orderModel(admin.ModelAdmin):
    list_display    = ["price"]
    search_fields   = []
    list_per_page   = 40
    

admin.site.register(models.order, orderModel)

