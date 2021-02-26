class RoomTeam < ApplicationRecord
  belongs_to :room
  has_many :room_players
end
