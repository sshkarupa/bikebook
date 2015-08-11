Rails.application.routes.draw do
  root 'pages#home'

  get 'bikes', to: 'bikes#index'
  resources :bikes

  devise_for :users
end
