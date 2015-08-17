Rails.application.routes.draw do
  get 'cities/show'

  root 'pages#home'

  namespace :profile do
    resources :bikes, except: :show
  end
  resources :cities, only: :show

  resources :bikes, only: :show

  devise_for :users
end
