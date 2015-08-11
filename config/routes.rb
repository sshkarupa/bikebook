Rails.application.routes.draw do

  root 'pages#home'

  get 'adverts', to: 'adverts#index'
  resources :adverts

  get 'profile', to: 'profile#index'

  devise_for :users
end
