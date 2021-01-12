# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :room_players, dependent: :destroy

  after_commit :set_room_players, on: :create

  private

  def set_room_players
    10.times do
      room_players << RoomPlayer.create
    end
  end
end
