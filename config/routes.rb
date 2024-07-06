Rails.application.routes.draw do
  resources :contacts
  # get 'home/index'
  get 'home/about'
  root 'home#index'
end
