#!/usr/bin/env python3

from bot_functions import *
from steam.client import SteamClient, SteamID
import dota2
from dota2.client import Dota2Client
from dota2.enums import DOTA_GC_TEAM, DOTA_CM_PICK, EMatchOutcome
import logging
import sys

client = SteamClient()
dota = Dota2Client(client)

logging.basicConfig(format='[%(asctime)s] %(levelname)s %(name)s: %(message)s', level=logging.DEBUG)

room_name = sys.argv[1]
room_pass = sys.argv[2]

params = sys.argv[3:]
players = {}

for i in range(0, len(params), 2):
    player_id = params[i]
    team = params[i+1]
    players[int(player_id)] = {
        "team": team,
        "slot": None
    }


@client.on('logged_on')
def start_dota():
    dota.launch()

@dota.on('ready')
def on_dota_ready():
    manage_lobby(dota, client, room_name, room_pass, players)

@dota.on(dota2.features.Lobby.EVENT_LOBBY_CHANGED)
def lobby_update(lobby):
    manage_lobby_players(dota, lobby, players)

client.cli_login(username="dolextestbot", password="Dolexbot123098")
client.run_forever()

