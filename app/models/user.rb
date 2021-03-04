# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:steam]

  has_many :comments
  has_many :room_players
  has_many :room_teams, through: :room_players

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "#{Devise.friendly_token[0, 20]}@#{auth.provider}"
      user.avatar_url = auth["info"]["image"]
      user.profile_url = auth["info"]["urls"]["Profile"]
      user.nickname = auth["info"]["nickname"]
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def enter_on_room_team(room_team, position)
    leave_all_rooms
    RoomPlayer.create(room_team: room_team, user: self, position: position)
  end

  def leave_all_rooms
    room_players.joins(:room_team).where("room_teams.room_id" => Room.waiting).destroy_all
  end
end
