Rails.application.routes.draw do
  devise_for :users, skip: [:passwords, :sessions]
  as :user do
    post 'sign_in', to: 'sessions#create', as: :user_session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_user_session
    get 'settings', to: 'users#settings'
    get 'update_password', to: 'users#settings'
    patch 'update_password', to: 'users#update_password'
  end

  resources :tournaments do
    resources :groups, shallow: true
  end

  resources :groups do
    member do
      put 'update_teams'
      get 'search_teams'
    end
  end

  resources :teams do
    put 'update_players', on: :member
  end

  resources :players do
    get 'autocomplete', on: :collection
  end

  resources :faqs, except: [:show] do
    put 'order', on: :collection
  end

  get 'sitemap.xml', to: 'sitemap#index', defaults: { format: 'xml' }

  resources :pages, except: [:index, :show]
  get '/:id', to: 'pages#show', as: :to_page

  root to: 'tournaments#index'
end
