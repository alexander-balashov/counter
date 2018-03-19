# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, render_to_response, redirect
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404
from django.template.context_processors import csrf
from forms import CounterForm
from models import Counter

def home(request):

    obj, created = Counter.objects.get_or_create(
        id=1,
        defaults={'total': 0},
    )
    mdict = {}
    mdict.update(csrf(request))
    mdict['counter'] = obj
    mdict['numberField'] = CounterForm
    return render_to_response('form.html', mdict)

def addincrement(request):
    if request.POST:
        form = CounterForm(request.POST)
        if form.is_valid():
            try:
                counter = Counter.objects.get(id=1)
                counter.total = counter.total + form.cleaned_data['number']
                counter.save()
            except ObjectDoesNotExist:
                raise Http404
    return redirect('/')
