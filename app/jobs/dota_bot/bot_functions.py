from steam.client import SteamID

def ready_players(players):
    ready_players = 0
    for _, data in players.items():
        if data["slot"] is not None:
            ready_players += 1
    return ready_players

def invite_players(dota, players):
    ids = [ p_id for p_id, _ in players.items() ]
    for player_id in ids:
        dota.invite_to_lobby(int(player_id))

def create_lobby(dota, name, password):
    dota.abandon_current_game()
    dota.sleep(1)
    dota.leave_practice_lobby()
    dota.sleep(1)
    dota.create_tournament_lobby(password= password, tournament_game_id=None, tournament_id=0, options={
        'allow_cheats': True,
        'visibility': 0,
        'server_region': 10, #10-> Brazil
        'game_mode': 1, # 2-> CAPTAINS MODE, 1-> ALL PICK
        'game_name': name,
        'fill_with_bots': True,
        'dota_tv_delay': 2,
        'pause_setting': 1
    })
    dota.sleep(1)
    dota.join_practice_lobby_team()
    dota.sleep(1)
    dota.channels.join_lobby_channel()
    dota.sleep(1)

def slot_to_team(team_slot):
    if team_slot == 4:
        return "nil"
    if team_slot == 0:
        return "rad"
    if team_slot == 1:
        return "dir"

def end_bot(dota, client):
    dota.abandon_current_game()
    dota.leave_practice_lobby()
    client.disconnect()
    dota.exit()
    exit()

def manage_lobby_players(dota, lobby, players):
    if lobby.match_outcome:
        print('a')
        print(lobby)
        if lobby.match_outcome == 2:
            print( "match_result ", "rad")
            print(" match_id ", lobby.match_id)
            dota.exit()
            exit()
        if lobby.match_outcome == 3:
            print(" match_result ", "dire")
            print(" match_id ", lobby.match_id)
            dota.exit()
            exit()
    else:
        print('b')

    for member in lobby.all_members:
        if member.id not in players:
            dota.practice_lobby_kick(SteamID(member.id).as_32)
        elif slot_to_team(member.team) == "nil":
            players[member.id]["slot"] = None
        elif players[member.id]["team"] != slot_to_team(member.team):
            players[member.id]["slot"] = None
            dota.practice_lobby_kick_from_team(SteamID(member.id).as_32)
        else:
            players[member.id]["slot"] = "correct"

def manage_lobby(dota, client, room_name, room_pass, players):
    create_lobby(dota, room_name, room_pass)
    dota.sleep(1)
    invite_players(dota, players)
    dota.sleep(10)
    # if ready_players(players) < 10:
    #     end_bot(dota, client)
    dota.launch_practice_lobby()
    dota.sleep(5)
    # end_bot(dota, client)
