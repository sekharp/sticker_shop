Rails.application.routes.draw do
  root to: "stickers#index"
  resources :stickers, only: [:index]
end
