# frozen_string_literal: true

class RoomTeams::Card::PlayerSlot::ComponentReflex < ApplicationReflex
  def lol
    morph :nothing
    cable_ready["application-stream"].text_content(selector: "#lol", text: rand(1000).to_s).broadcast
  end

  def enter
    morph :nothing
    @room = Room.find(element.dataset[:room])
    room_team = @room.room_teams.find(element.dataset[:team])
    position = element.dataset[:position]

    # leave_room
    RoomPlayer.create(room_team: room_team, user: current_user, position: position)
    # update_room_component
    cable_ready["application-stream"].outer_html(
      selector: "#room_#{@room.id}",
      html: ApplicationController.render(Rooms::PlayersCard::Component.new(room: @room), layout: false)
    )
    cable_ready.broadcast
  end

  def leave
    morph :nothing
    @room = Room.find(element.dataset[:room])
    leave_room
  end

  private

  def leave_room
    morph :nothing
    @room.room_players.find_by(user: current_user)&.destroy
  end

  def update_room_component
    cable_ready["application-stream"].outer_html(
      selector: "#room_#{@room.id}",
      html: ApplicationController.render(Rooms::PlayersCard::Component.new(room: @room), layout: false)
    )
    cable_ready.broadcast
  end
end
