Rails.application.routes.draw do
  root to: "welcome#index"

  resources :links, only: [:index, :create]

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
