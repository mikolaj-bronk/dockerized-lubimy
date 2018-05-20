Rails.application.routes.draw do
  get 'albums/new'
  post 'albums/create'
  get 'albums/index'
  get 'albums/show'
  get 'albums/update'
  get 'albums/destroy'
  get 'bands/new'
  post 'bands/create'
  get 'bands/index'
  get 'bands/show'
  get 'bands/update'
  get 'bands/destroy'
  get 'index/index'
  post 'songs/create'
  get 'songs/index'
  get 'songs/show'
  get 'songs/update'
  get 'songs/destroy'

  resources :songs

resources :albums do
  resources :songs
end

resources :bands do
  resources :albums
end
  root 'index#index'
  #mount Songs::SongsAPI => '/api/songs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
