Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#main"
  # Session Routes
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get '/auth/github/callback', to: 'sessions#create'
  # User Routes
  get "/signup", to: "users#new", as: "users"
  post "/signup", to: "users#create"
  resources :users, only: [:show, :edit, :update, :destroy]
  # Resources
  resources :users do
    resources :mods, only: [:new, :create]
  end
  resources :mods, only: [:show]
  resources :games do
    resources :categories
    resources :mods, only: [:index]
  end
end
