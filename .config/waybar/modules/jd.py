#!/usr/bin/python

import sys
import json
import websocket


COLORS = {True: "#00d69e", False: "#676E7D"}


def on_message(_, message):
    set_status(message)


def on_open(ws):
    set_status(ws.recv())

def get_status(msg):
    return json.loads(msg).get('data', {}).get('stream', {}).get('status')

def set_status(msg):
    status = get_status(msg)
    if status is None:
        return

    color = COLORS[status]
    print(f'<span color="{color}"></span>')
    sys.stdout.flush()


ws = websocket.WebSocketApp("wss://api.pancernik.info/notifier",
                            on_message=on_message)
ws.on_open = on_open

while True:
    ws.run_forever()
