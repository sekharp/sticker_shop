Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index]
  resources :categories, only: [:index, :show], param: :slug
  resources :cart_stickers, only: [:create, :index]
  resources :cart, only: [:index]
end
