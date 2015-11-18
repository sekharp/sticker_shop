Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index, :show, :update]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :update, :index, :destroy]
  resources :cart, only: [:index]
  resources :users, only: [:new, :create, :update]
  resources :orders, only: [:create, :index, :show]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  get '/dashboard', to: "users#show"
  get '/dashboard/edit', to: "users#edit"
  put '/dashboard', to: "users#update"
  post '/checkout', to: "orders#create"

  namespace :admin do
    resources :dashboard, only: [:index, :show], param: :status
    resources :orders, only: [:update]
    resources :stickers, only: [:new, :create, :index, :edit, :update]
  end

  get '*unmatched_route', to: 'application#not_found'
end
