# frozen_string_literal: true

Rails.application.routes.draw do
  root "application#root"
  get "/vote/:token", to: "vote#vote", as: :show_vote
  patch "/vote/:token", to: "vote#cast_vote", as: :cast_vote
  namespace :admin do
    resources :fixtures
    resources :entries
    resources :contests do
      get :send_votes, to: "contests#send_votes"
    end
    resources :contestants
    resources :votes
  end
end
