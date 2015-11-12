Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :index, :destroy]
  resources :cart, only: [:index, :create]
  resources :users, only: [:new, :create]
  resources :orders, only: [:create, :index]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  get '/dashboard', to: "users#show"
end
