Rails.application.routes.draw do
  get 'albums/new'
  get 'albums/create'
  get 'albums/index'
  get 'albums/show'
  get 'albums/update'
  get 'albums/destroy'
  get 'bands/new'
  get 'bands/create'
  get 'bands/index'
  get 'bands/show'
  get 'bands/update'
  get 'bands/destroy'
  get 'bands/new'
  get 'bands/create'
  resources :songs

resources :albums do
  resources :songs
end

resources :bands do
  resources :albums
end
  root 'songs#index'
  #mount Songs::SongsAPI => '/api/songs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
