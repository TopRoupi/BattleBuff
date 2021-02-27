# frozen_string_literal: true

class Rooms::ChatCard::Component < ApplicationComponent
  def initialize(room:)
    @room = room
  end
end
