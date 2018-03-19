from django import forms


class CounterForm(forms.Form):
    number = forms.IntegerField(label='Input increment', required=True, max_value=10, min_value=1)
