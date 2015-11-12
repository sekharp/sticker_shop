Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index, :show]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :index, :destroy]
  resources :cart, only: [:index, :create]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  resources :users, only: [:new, :create]
  get '/dashboard', to: "users#show"
end
