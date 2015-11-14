Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index, :show]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :index, :destroy]
  resources :cart, only: [:index, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :show, :update]
  resources :orders, only: [:create, :index, :show]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  get '/dashboard', to: "users#show"
  post '/checkout', to: "orders#new"

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  get '*unmatched_route', to: 'application#not_found'
end
