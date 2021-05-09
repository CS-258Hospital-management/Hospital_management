from django.urls import path
from .views import views_a
from .views import views_s
from .views import views_m
from .views import views_r


urlpatterns = [    path('home', views_m.home, name = 'home'),
    path('homeuser', views_a.homeuser, name = 'homeuser'),
    path('',views_m.adminlogin,name='adminlogin'),
    path('library', views_m.library, name = 'library'),
    path('userlogin', views_a.userlogin, name = 'userlogin'),
    path('userloginfill', views_a.userloginfill, name = 'userloginfill'),
    path('register', views_a.register, name = 'register'),
    path('userregister', views_a.userregister, name = 'userregister'),
    path('diabcategory',views_m.diabcategory,name = 'diabcategory'),
    path('bpcategory',views_m.bpcategory,name = 'bpcategory'),
    path('patientprofile',views_m.patientprofile,name = 'patientprofile'),
    path('doctorprofile',views_m.doctorprofile,name = 'doctorprofile'),
    path('pharm',views_m.pharm,name = 'pharm'),
    path('pres',views_m.pres,name = 'pres'),
    path('billing',views_m.billing,name = 'billing'),
    path('adlog',views_m.adlog,name = 'adlog'), 
    path('credfill',views_m.credfill,name = 'credfill'), 
    path('sugarfill',views_m.sugarfill,name = 'sugarfill'), 
    path('bpfill',views_m.bpfill,name = 'bpfill'), 
    path('patientprofile',views_m.patientprofile,name = 'patientprofile'), 

]

