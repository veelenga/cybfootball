Rails.application.routes.draw do
  resources :tournaments
  resources :teams
  resources :players

  root to: 'tournaments#index'
end
