class CreateRoomPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :room_players do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
