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
  get 'songs/:id', to: 'songs#show', id: /\d+/, as: 'show_song'

  get 'songs/albumcover/:id', to: 'album_cover#show', as: 'edit_album_cover'
  post 'songs/albumcover/update/:id', to: 'album_cover#update', as: 'update_album_cover'
  get 'songs/albumcover/delete/:id', to: 'album_cover#delete', as: 'delete_album_cover'

  get 'search/:query', to: 'search#search'
  get 'search', to: 'search#search', as: 'search'

  get 'usersettings', to: 'user_settings#index', as: 'user_settings'
  get 'usersettings/addresses/new', to: 'addresses#new', as: 'new_user_address'
  post 'usersettings/addresses/create', to: 'addresses#create', as: 'create_user_address'
  get 'usersettings/addresses/edit/:id', to: 'addresses#edit', as: 'edit_user_address'
  post 'usersettings/addresses/update/:id', to: 'addresses#update', as: 'update_user_address'
  get 'usersettings/addresses/delete/:id', to: 'addresses#delete', as: 'delete_user_address'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
