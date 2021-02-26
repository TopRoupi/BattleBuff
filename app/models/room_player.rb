class RoomPlayer < ApplicationRecord
  belongs_to :user
  belongs_to :room_team
end
