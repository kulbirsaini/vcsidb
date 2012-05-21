Csidb::Application.routes.draw do
  get 'licenses/all', :to => 'licenses#all'
  get 'licenses/premium', :to => 'licenses#premium'
  get 'licenses/trial', :to => 'licenses#trial'
  resources :payments
  resources :countries
  resources :business_types
  resources :payment_gateways
  resources :servers
  post 'videoid' => 'licenses#expired'
  resources :licenses
  resources :clients
  devise_for :users
  root :to => 'home#index'
end
