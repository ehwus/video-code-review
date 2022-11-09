# frozen_string_literal: true

Rails.application.routes.draw do
  resources :submissions do
    resources :reviews
  end

  get "/review_prompter/:owned_id", to: "review_prompter#index", as: "review_prompter"

  root "submissions#index"
end
