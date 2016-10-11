Rails.application.routes.draw do
  resources :tournaments
  resources :teams
  resources :players do
    get 'search', on: :collection
  end

  root to: 'tournaments#index'
end
