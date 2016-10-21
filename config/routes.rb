Rails.application.routes.draw do
  resources :tournaments
  resources :teams do
    put 'update_players', on: :member
  end
  resources :players do
    get 'autocomplete', on: :collection
  end

  root to: 'tournaments#index'
end
