# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rooms, only: [:index, :show]

  root to: "rooms#index"
  post "/rooms/:id/start", to: "rooms#start", as: :start_room

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
end
