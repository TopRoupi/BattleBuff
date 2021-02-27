# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :room_teams
  has_many :room_players, through: :room_teams
  has_many :comments, as: :commentable

  after_commit :set_room_teams, on: :create

  private

  def set_room_teams
    2.times do
      room_teams << RoomTeam.create
    end
  end
end
