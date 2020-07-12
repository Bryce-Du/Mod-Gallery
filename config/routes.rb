Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#main"
  get "/about", to: "static#about"
  # Session Routes
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get '/auth/github/callback', to: 'sessions#create'
  # User Routes
  get "/signup", to: "users#new", as: "users"
  post "/signup", to: "users#create"
  resources :users, only: [:show, :destroy]
  # Resources
  resources :users do
    resources :mods, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :mods do
      resources :comments, only: [:create, :update, :destroy]
    end
  end
  resources :games do
    resources :categories, only: :index
    resources :categories do
      resources :mods, only: :index
    end
    resources :mods, only: [:index, :show]
  end
  post "/mod/:id/download", to: "mods#download", as: "download"
  patch "/mod/:id/endorse", to: "mods#endorse", as: "endorse"
end
