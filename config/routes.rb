Rails.application.routes.draw do
  root 'pages#home'

  get 'bikes', to: 'bikes#index'

  get 'profile', to: 'profile#index'

  namespace :profile do
    resources :bikes, except: :show
  end

  resources :bikes, only: :show

  devise_for :users
end
