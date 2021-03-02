# frozen_string_literal: true

class CreateLobbyJob < ApplicationJob
  queue_as :default

  def perform(room)
    players_params = ""

    room.room_teams.first.room_players.each do |player|
      id = player.user.uid.to_i #- 76561197960265728
      players_params += "#{id} rad "
    end

    room.room_teams.second.room_players.each do |player|
      id = player.user.uid.to_i #- 76561197960265728
      players_params += "#{id} dir "
    end

    puts "aaaaaaaaaaaa"
    players_params = "76561198110355561 rad"
    puts players_params
    `app/jobs/dota_bot/bot.py #{room.name} 123 #{players_params}`
  end
end
