Rails.application.routes.draw do
  root 'pages#home'

  namespace :profile do
    resources :bikes, except: :show
  end

  resources :bikes, only: :show

  devise_for :users
end
