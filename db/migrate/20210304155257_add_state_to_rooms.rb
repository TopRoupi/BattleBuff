class AddStateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :state, :integer
  end
end
