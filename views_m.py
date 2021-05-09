
from django.shortcuts import render, redirect
from django import forms
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm
from django.db import connection
from django.contrib import messages
import sys
import base64
from datetime import datetime
from datetime import date
from django.http import HttpResponse
from django.template.loader import get_template
import smtplib

# Create your views here.

def home(request):
    return render(request, 'web_app/index.html')

def library(request):
    return render(request, 'web_app/index.html')

def adminlogin(request):
    return render(request, 'web_app/adminlogin.html')

def adlog(request):
    return render(request, 'web_app/adlog.html')        

def diabcategory(request):
    return render(request, 'web_app/diabcategory.html')

def credfill(request):
    if request.method=='GET':
        email = request.GET["usemail"]
        passw = request.GET["password"]
        cursor = connection.cursor()
        cursor.execute("""SELECT * FROM users WHERE email=%s AND password=%s AND role='admin'""",(email,passw))       
        row = cursor.fetchall()
        users=[]
        data={
            'users':None
        }
        a = cursor.rowcount
        if a!=0:
           return render(request,'web_app/adminbase.html')
        else:
             messages.success(request,'enter correct credentials!!')
             return render(request, 'web_app/adlog.html')

def sugarfill(request):
    if request.method=='GET':
        userid = request.GET["uid"]
        testi = request.GET["tid"]
        sl = request.GET["suglevel"]
        ppsl = request.GET["ppsl"]
        il = request.GET["insulinlevels"]
        now = datetime.now()
        now = now.strftime("%Y-%m-%d")
        cursor = connection.cursor()
        try:
             cursor.execute("""SELECT * FROM users WHERE userid=%s """,[userid])       
             row = cursor.fetchall()
             a = cursor.rowcount
             if a!=0:
            
               cursor.execute("""INSERT INTO sugartests VALUES (%s,%s,%s,%s,%s,%s)""",(userid,testi,sl,ppsl,il,now))      
               return render(request, 'web_app/success.html')
             else:
                messages.success(request,'enter correct credentials!!')
                return render(request, 'web_app/diabcategory.html')    
        finally:
            cursor.close()            

def bpfill(request):
    if request.method=='GET':
        userid = request.GET["uid"]
        testi = request.GET["tid"]
        sp = request.GET["systpres"]
        dp = request.GET["diapress"]
        now = datetime.now()
        now = now.strftime("%Y-%m-%d")
        cursor = connection.cursor()
        try:
             cursor.execute("""SELECT * FROM users WHERE userid=%s """,[userid])       
             row = cursor.fetchall()
             a = cursor.rowcount
             if a!=0:
            
               cursor.execute("""INSERT INTO bptests VALUES (%s,%s,%s,%s,%s)""",(userid,testi,sp,dp,now))      
               return render(request, 'web_app/success.html')
             else:
                 messages.success(request,'enter correct credentials!!')
                 return render(request, 'web_app/bpcategory.html')    
        finally:
            cursor.close()            
       
def bpcategory(request):
    return render(request, 'web_app/bpcategory.html') 

def patientprofile(request):
    return render(request, 'patientprofile.html')        
    
def doctorprofile(request):
    return render(request, 'web_app/doctorprofile.html') 

def pharm(request):
    return render(request, 'web_app/pharm.html')  

def billing(request):
    return render(request, 'web_app/billing.html')  

def pres(request):
    return render(request, 'web_app/pres.html')             

