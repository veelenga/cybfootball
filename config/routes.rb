Rails.application.routes.draw do
  resources :tournaments
  resources :teams do
    member do
      put 'update_players'
    end
  end
  resources :players

  root to: 'tournaments#index'
end
