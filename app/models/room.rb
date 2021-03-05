# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :room_teams, dependent: :destroy
  has_many :room_players, through: :room_teams
  has_many :comments, as: :commentable
  enum state: [:waiting, :progress, :finished], _default: "waiting"

  after_commit :set_room_teams, on: :create
  after_commit :auto_create_rooms, on: :update

  private

  def set_room_teams
    2.times do
      room_teams << RoomTeam.create
    end
  end

  def auto_create_rooms
    Room.create(name: "room") if Room.waiting.count < 1
  end
end
