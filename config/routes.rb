# frozen_string_literal: true

Rails.application.routes.draw do
  get "/vote/:token", to: "votes#show"
  namespace :admin do
    resources :fixtures
    resources :entries
    resources :contests
    resources :contestants
    resources :votes
  end
end
