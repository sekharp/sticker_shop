Rails.application.routes.draw do
  root to: "stickers#index"

  resources :categories do
    resources :stickers, only: [:index]
  end
end
