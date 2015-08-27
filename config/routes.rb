Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#home'

  namespace :profile do
    resources :bikes, except: :show
    get 'bikes/moderation', to: 'bikes#moderation'
    put 'bikes/moderation/:id', to: 'bikes#moderation_update'
  end
  resources :cities, only: :show
  resources :bikes, only: :show
  resources :phones, only: :update

  get 'phones/send_sms', to: 'phones#send_sms'
  get 'phones/show_user_phone/:id', to: 'phones#show_user_phone'

  resources :feedback, only: [:create, :new]

  devise_for :users, controllers: { registrations: "registrations" }
end
