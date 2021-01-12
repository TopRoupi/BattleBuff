# frozen_string_literal: true

class RoomPlayer < ApplicationRecord
  belongs_to :room

  after_update_commit { broadcast_replace_to "room" }
end
