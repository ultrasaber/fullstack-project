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
  get 'songs/genre/:id', to: 'genre#songs', as: 'show_songs_by_genre'

  get 'songs/new', to: 'songs#by_new', as: 'show_new_songs'
  get 'songs/sale', to: 'songs#by_on_sale', as: 'show_songs_on_sale'

  get 'search/:query', to: 'search#search'
  get 'search', to: 'search#search', as: 'search'

  get 'usersettings', to: 'user_settings#index', as: 'user_settings'
  get 'usersettings/addresses/new', to: 'addresses#new', as: 'new_user_address'
  post 'usersettings/addresses/create', to: 'addresses#create', as: 'create_user_address'
  get 'usersettings/addresses/edit/:id', to: 'addresses#edit', as: 'edit_user_address'
  post 'usersettings/addresses/update/:id', to: 'addresses#update', as: 'update_user_address'
  get 'usersettings/addresses/delete/:id', to: 'addresses#delete', as: 'delete_user_address'

  get 'cart/add/:id', id: /\d+/, to: 'cart#add_to_cart', as: 'add_song_to_cart'
  get 'cart/remove/:id', id: /\d+/, to: 'cart#remove_from_cart', as: 'remove_song_from_cart'
  get 'cart', to: 'cart#index', as: 'show_cart'

  post 'checkout', to: 'cart#invoice', as: 'show_invoice'
  get 'checkout/completed/:address', to: 'cart#checkout', as: 'place_order'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
