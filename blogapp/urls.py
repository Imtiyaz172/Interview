
from django.urls import path
from . import views

urlpatterns = [
    path('', views.login),
    path('store/',views.products),
    path('store/<int:id>',views.product_detail),
    path('cart/', views.cart),
    path('delete/<int:id>', views.delete_prod),
    path('update/<int:id>', views.update),
    path('logout/', views.logout),
    path('reg/', views.user_register),
    path('login/', views.login),
    path('pdf/', views.salesman_daily_report),

]
