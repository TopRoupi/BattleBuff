# frozen_string_literal: true

class RoomTeams::Card::Component < ApplicationComponent
  def initialize(room_team:)
    @room_team = room_team
    @room = room_team.room
  end
end
