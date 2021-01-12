# frozen_string_literal: true

class CreateLobbyJob < ApplicationJob
  queue_as :default

  def perform(room)
    players_params = ""

    room.room_players.first(5).select { |n| n.dota_id }.each do |player|
      players_params += "#{player.dota_id} rad "
    end

    room.room_players.last(5).select { |n| n.dota_id }.each do |player|
      players_params += "#{player.dota_id} dir "
    end

    `app/jobs/dota_bot/bot.py #{room.name} 123 #{players_params}`
  end
end
