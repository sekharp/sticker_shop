Rails.application.routes.draw do
  root to: "stickers#index"
  get '/categories/:title', to: "stickers#all"
  resources :stickers, only: [:index]
  resources :categories do
    resources :stickers, only: [:index]
  end
  resources :cart_stickers, only: [:create, :index]
end
