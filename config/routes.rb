Rails.application.routes.draw do
  devise_for :users

  resources :numbers
  root 'home#show'
end
