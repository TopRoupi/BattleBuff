class AddPositionToRoomPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :room_players, :position, :integer
  end
end
