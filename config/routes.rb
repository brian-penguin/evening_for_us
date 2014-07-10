Rails.application.routes.draw do
  devise_for :users

  resources :numbers, only:[:index, :new, :create, :destroy]

  root 'home#show'

  post '/places/search' => 'places#search'
  get '/messages/new' => 'messages#new'
end
