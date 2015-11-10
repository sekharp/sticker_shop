Rails.application.routes.draw do
  root to: "stickers#index"

  resources :stickers, only: [:index]
  
  resources :categories do
    resources :stickers, only: [:index]
  end
end
