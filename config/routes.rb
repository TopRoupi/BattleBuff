# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets
  resources :rooms
  resources :room_players

  root to: "rooms#index"
  post "/rooms/:id/start", to: "rooms#start", as: :start_room
  post "/rooms/:id/enter", to: "rooms#enter", as: :enter_room
  delete "/rooms/:id/leave", to: "rooms#leave", as: :leave_room

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
