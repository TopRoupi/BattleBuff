# frozen_string_literal: true

require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = create :room
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end
end
