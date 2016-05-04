Rails.application.routes.draw do
  root to: "welcome#index"

  resources :links, only: [:index]

  resources :users, only: [:new, :create]
end
