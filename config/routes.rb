Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Session Routes
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # User Routes
  get "/signup", to: "users#new", as: "users"
  post "/signup", to: "users#create"
  resources :users, only: [:show, :edit, :update, :destroy]
end
