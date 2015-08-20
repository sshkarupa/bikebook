Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#home'

  namespace :profile do
    resources :bikes, except: :show
  end
  resources :cities, only: :show
  resources :bikes, only: :show
  resources :phones, only: [:update, :show]
  get 'phones/send_sms', to: 'phones#send_sms'

  devise_for :users, controllers: { registrations: "registrations" }
end
