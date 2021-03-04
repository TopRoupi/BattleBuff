# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build :user
  end

  test "#enter_on_room_team should create a new room_player in this room and user" do
    @user = create :user

    room = create :room

    @user.enter_on_room_team(room.room_teams.first, 1)

    assert_includes room.room_players, @user.room_players.last
  end

  test "#enter_on_toom_team should not create a new room_player if the user is already in any room_team" do
    @user = create :user

    room = create :room

    @user.enter_on_room_team(room.room_teams.first, 1)
    @user.enter_on_room_team(room.room_teams.first, 1)

    assert_equal 1, @user.room_players.count
  end


  test "#leave_all_rooms should delete all room_players with this user" do
    @user = create :user

    room1 = create :room
    room2 = create :room

    create :room_player, room_team: room1.room_teams.first, user: @user
    create :room_player, room_team: room1.room_teams.first, user: @user
    create :room_player, room_team: room1.room_teams.second, user: @user
    create :room_player, room_team: room2.room_teams.first, user: @user

    @user.leave_all_rooms

    assert_empty room1.room_players
    assert_empty room2.room_players
  end
end
