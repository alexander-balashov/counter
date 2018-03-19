# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Counter(models.Model):
  class Meta():
    db_table = "counter"
  total = models.IntegerField(default='0')
