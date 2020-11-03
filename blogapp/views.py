from django.shortcuts import render,redirect
from django.core.paginator import Paginator
from django.db.models import Q,F
from django.http import HttpResponse
from django.http import JsonResponse
from .import models
import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import messages
from django.conf import settings
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
import random, string, os
from django.contrib.auth.decorators import login_required
import hashlib, socket

from django.db.models import Sum
from blogapp.utils import render_to_pdf
from django.http import HttpResponse, JsonResponse


# Create your views here.


def products(request):
    if not request.session['id']:
        return redirect('/login/')
    if request.method == "POST":
        search        =  request.POST['name']
        blogsearch    = models.product.objects.filter( Status=True, name__icontains = search)
        if blogsearch:
            return render(request, "blogapp/shop.html",{ 'blogsearch' : blogsearch,})
        else:
            messages.warning(request, "No records found.Please try another")
    product     = models.product.objects.filter(Status=True).all()
    
    if request.session['location'] == "USA":
        
        productS     = models.product.objects.filter(Status=True).all()
        context={
        'productS' : productS,
    }
        return render(request, "blogapp/shop.html",context)


        


    paginator = Paginator(product, 6) # Show 6 contacts per page

    page = request.GET.get('page')
    try:
        product = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        product = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        product = paginator.page(paginator.num_pages)
    context={
        'product' : product,
        
    }
    return render(request, "blogapp/shop.html",context)




def product_detail(request, id):
    if not request.session['id']:
        return redirect('/login/')
    product     = models.product.objects.filter(id = id, Status=True).first()


        
    if request.method=="POST":
        quantity      = request.POST['quantity']
        price      = request.POST['price']
        if request.session.get('id'):
            user_cart = models.Cart.objects.create(
                user_reg_id = int(request.session['id']), product_id = product.id , quantity = quantity,price=price,
            )
            messages.success(request, "Cart Successfull")     
            
    if request.session['location'] == "USA":
        productS     = models.product.objects.filter(id = id,Status=True).first()
        context={
        'productS' : productS,
        }
        return render(request, "blogapp/single.html",context)

                    

    
    models.product.objects.filter(id = id).update(view =F('view') + 1)
    context={
        'product' : product,
    }
    return render(request, "blogapp/single.html",context)

def delete_prod(request,id):
        models.Cart.objects.filter(id=id).delete()
        return redirect("/cart")




def cart(request):
    if not request.session['id']:
        return redirect('/login/')
    user_cart      = models.Cart.objects.filter(status = True, user_reg_id = request.session['id']).order_by("-id")
    
    if request.is_ajax():
        print('prffsd ',request.GET.get('castomer_name'))
        models.order.objects.create(
            product_id = request.GET.get('product'),castomer_name = request.GET.get('castomer_name'),
            price = request.GET.get('price'), quantity = request.GET.get('quantity'), castomer_phone = request.GET.get('castomer_phone')
        )
        return JsonResponse("Order Completed", safe = False)

    elif request.method=="POST":
        quantity      = request.POST['quantity']
        if request.session.get('id'):
            user_cart = models.Cart.objects.filter(product_id = product.id).update(
                user_reg_id = int(request.session['id']) , quantity = quantity
            )
            messages.success(request, "Cart Updated")
   
    context={
    'user_cart'    : user_cart,
    # 'product'    : product,
    }
    
    

   
    return render(request, "blogapp/cart.html",context)


def update(request,id):
    if request.method=="POST":
        quantity  = request.POST['quantity']

        models.Cart.objects.filter(id=id).update(quantity = quantity)
        return redirect("/cart")
    else:
        context = {
            'cart': models.Cart.objects.get(id = id)
        }
        return render(request, 'blogapp/update.html',context)



def login(request):
    if request.method=="POST":
        Name     = request.POST['Name']
        password  = request.POST['password']

        new_md5_obj = hashlib.md5(password.encode())
        enc_pass    = new_md5_obj.hexdigest()
        user        = models.user_reg.objects.filter(Name = Name, password = enc_pass)
        if user:
            request.session['email'] = user[0].email
            request.session['id'] = user[0].id
            request.session['location'] = str(user[0].location)
            
            return redirect("/cart/")
    return render(request, "blogapp/login.html")



def user_register(request):
    if request.method=="POST":
        Name        = request.POST['Name']
        email       = request.POST['email']
        phone       = request.POST['phone']
        location       = int(request.POST[('location')])
        password    = request.POST['password']
        new_md5_obj     = hashlib.md5(password.encode())
        new_enc_pass    = new_md5_obj.hexdigest()
        cheak_email = models.user_reg.objects.filter(email = email)

        if not cheak_email:
            models.user_reg.objects.create(Name = Name, email = email, phone = phone,location_id=location, password = new_enc_pass)
            messages.success(request, "Registration Successfull")
            return redirect('/login/')
            
        else:
            messages.warning(request, "Already This Email has an Account")
    else:
        messages.warning(request, "")

    return render(request, "blogapp/reg.html")

# def contact(request):
#     form = ContactModelForm()
#     if request.is_ajax():
#         form = ContactModelForm(request.POST)
#         print(request.POST)
#         if form.is_valid():
#             form.save()
#             return JsonResponse({
#                 'message': 'success'
#             })
#     return render(request, 'blogapp/contact.html', {'form': form})



def logout(request):
    request.session['email'] = False
    request.session['id'] = False
    return redirect("/login/")



def salesman_daily_report(request):
    if not request.session['id']:
        return redirect('/login/')

    product = models.Cart.objects.filter(status = True, user_reg_id = request.session['id'])
    pdf = render_to_pdf('blogapp/pdf.html', {"product" : product})
    return HttpResponse(pdf, content_type='application/pdf')