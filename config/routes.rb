Rails.application.routes.draw do
  require 'sidekiq/web'
  # mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'
  get '/current_user', to: 'current_user#index'
  get 'alerts', to: 'user_alerts#index'
  post 'alert/create', to: 'user_alerts#create'
  get 'btc_price', to: 'price_detectors#current_price'
  delete 'alert/destroy/:id', to: 'user_alerts#destroy'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
