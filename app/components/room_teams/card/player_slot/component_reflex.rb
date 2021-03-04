# frozen_string_literal: true

class RoomTeams::Card::PlayerSlot::ComponentReflex < ApplicationReflex
  def enter
    morph :nothing
    @room = Room.find(element.dataset[:room])
    room_team = @room.room_teams.find(element.dataset[:team])
    position = element.dataset[:position]

    current_user.enter_on_room_team(room_team, position)
    update_room_component
  end

  def leave
    morph :nothing
    @room = Room.find(element.dataset[:room])
    current_user.leave_all_rooms
    update_room_component
  end

  private

  def update_room_component
    cable_ready["application-stream"].outer_html(
      selector: dom_id(@room),
      html: RoomsController.render(Rooms::PlayersCard::Component.new(room: @room), layout: false),
      permanent_attribute_name: "data-reflex-permanent"
    ).broadcast
  end
end
