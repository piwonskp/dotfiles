#!/usr/bin/python

import json
from websocket import create_connection


ws = create_connection("wss://api.pancernik.info/notifier")

colors = {True: "#00FF00", False: "#FF0000"}

color = colors[json.loads(ws.recv())['data']['stream']['status']]

print('\n\n{}'.format(color))

ws.close()
