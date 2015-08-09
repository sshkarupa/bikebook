Rails.application.routes.draw do
  get 'profile', to: 'profile#index'

  root 'pages#home'

  devise_for :users
end
