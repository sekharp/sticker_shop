Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :index]
  resources :cart, only: [:index]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  resources :users, only: [:new, :create]
  get '/dashboard', to: "users#show"

end
