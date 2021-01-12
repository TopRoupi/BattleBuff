# frozen_string_literal: true

class CreateRoomPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :room_players do |t|
      t.string :dota_id
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
