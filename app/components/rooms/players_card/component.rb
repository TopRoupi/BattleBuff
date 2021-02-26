# frozen_string_literal: true

class Rooms::PlayersCard::Component < ApplicationComponent
  def initialize(room:)
    @room = room
  end
end
