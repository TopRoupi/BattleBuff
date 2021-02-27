# frozen_string_literal: true

class RoomTeams::Card::PlayerSlot::ComponentReflex < ApplicationReflex
  def enter
    morph :nothing
    @room = Room.find(element.dataset[:room])
    room_team = @room.room_teams.find(element.dataset[:team])
    position = element.dataset[:position]

    leave_room
    player = RoomPlayer.create(room_team: room_team, user: current_user, position: position)
    update_room_component
    cable_ready["application-stream"].console_log(message: "current_user = #{current_user.id} player = #{player.user.id}").broadcast
  end

  def leave
    morph :nothing
    @room = Room.find(element.dataset[:room])
    leave_room
    update_room_component
  end

  private

  def leave_room
    morph :nothing
    @room.room_players.find_by(user: current_user)&.destroy
  end

  def update_room_component
    cable_ready["application-stream"].outer_html(
      selector: dom_id(@room),
      html: ApplicationController.render(Rooms::PlayersCard::Component.new(room: @room), layout: false)
    ).broadcast
  end
end
