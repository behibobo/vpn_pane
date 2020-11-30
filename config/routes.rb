Rails.application.routes.draw do
  resources :plans
  root to: "home#index"
  get 'payment_fail', to: "payments#payment_fail"
  post 'payment_return', to: "payments#payment_return"

  namespace :admin do
    resources :plans
    resources :servers
    get 'ping_servers', to: "servers#ping"
    get 'dashboard', to: "dashboard#index"
    resources :customers, only: [:index, :show]
    resources :accounts, only: [:index, :show]
  end

  namespace :api do
    get 'servers', to: "api#servers"
    post 'connect', to: "api#connect"
    post 'disconnect', to: "api#disconnect"
    post 'auth', to: "api#auth"
  end

end
