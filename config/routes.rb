Rails.application.routes.draw do
  devise_for :users, skip: [:passwords, :sessions]
  as :user do
    post 'sign_in', to: 'sessions#create', as: :user_session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_user_session
    get 'settings', to: 'users#settings'
    patch 'update_password', to: 'users#update_password'
  end

  resources :tournaments
  resources :teams do
    put 'update_players', on: :member
  end
  resources :players do
    get 'autocomplete', on: :collection
  end

  root to: 'tournaments#index'
end
