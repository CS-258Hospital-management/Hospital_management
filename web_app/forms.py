from django import forms

class SugarForm(forms.Form):
    userid = forms.IntegerField()
    testid = forms.IntegerField()

class bpForm(forms.Form):
    uid = forms.IntegerField()
    tid = forms.IntegerField()
