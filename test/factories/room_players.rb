# frozen_string_literal: true

FactoryBot.define do
  factory :room_player do
    association :room_team
    association :user
  end
end
