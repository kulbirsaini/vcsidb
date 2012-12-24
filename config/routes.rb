Csidb::Application.routes.draw do
  get 'licenses/all', :to => 'licenses#all'
  get 'licenses/premium', :to => 'licenses#premium'
  get 'licenses/trial', :to => 'licenses#trial'
  get 'clients/all', :to => 'clients#all'
  get 'clients/expired', :to => 'clients#expired'
  get 'servers/all', :to => 'servers#all'
  post 'videoid' => 'licenses#expired'
  resources :payments
  resources :countries
  resources :business_types
  resources :payment_gateways
  resources :servers
  resources :licenses
  resources :clients
  devise_for :users
  root :to => 'home#index'
end
