Csidb::Application.routes.draw do
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
