# frozen_string_literal: true

class RoomTeams::Card::PlayerSlot::Component < ApplicationComponent
  def initialize(position:, room_team:, room_player: nil)
    @position = position
    @room_player = room_player
    @room_team = room_team
    @room = room_team.room
    @player = room_player.user if room_player
  end
end
