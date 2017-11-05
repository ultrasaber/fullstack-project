Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :genres
    resources :line_items
    resources :orders
    resources :provinces
    resources :songs
    resources :addresses

    root to: "users#index"
  end

  root to: "songs#index"
  get 'session/destroy', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
