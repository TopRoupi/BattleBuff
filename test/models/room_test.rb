# frozen_string_literal: true

require "test_helper"

class RoomTest < ActiveSupport::TestCase
  setup do
    @room = build :room
  end

  test "#auto_create_rooms should create a new room if there is no waiting rooms" do
    @room.save

    @room.update(state: :progress)

    assert_equal 1, Room.waiting.count
  end

  test "#auto_create_rooms should not create a new room if there is already a waiting room" do
    @room.save

    @room.update(name: "a")

    assert_equal 1, Room.waiting.count
  end
end
