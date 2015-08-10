Rails.application.routes.draw do

  root 'pages#home'

  get 'ads', to: 'ads#index'
  resources :ads

  get 'profile', to: 'profile#index'

  devise_for :users
end
