Rails.application.routes.draw do
  resources :tournaments
  resources :teams do
    resources :players
  end
  resources :players

  root to: 'tournaments#index'
end
