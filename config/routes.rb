# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets
  resources :rooms
  resources :room_players

  post "/rooms/:id/start", to: "rooms#start", as: :start_room
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
