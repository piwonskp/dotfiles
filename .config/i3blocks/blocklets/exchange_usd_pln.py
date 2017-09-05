#!/usr/bin/python

import requests


response = requests.get('http://api.fixer.io/latest', params={'base': 'USD'}).json()
print('{} PLN'.format(response['rates']['PLN']))

