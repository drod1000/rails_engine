Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/merchants/find_all', to: 'search_merchants#index'
      get '/merchants/find', to: 'search_merchants#show'
      get '/merchants/random', to: 'random_merchants#show'
      resources :merchants, only: [:index, :show]

      get '/customers/find_all', to: 'search_customers#index'
      get '/customers/find', to: 'search_customers#show'
      get 'customers/random', to: 'random_customers#show'
      resources :customers, only: [:index, :show]
    end
  end
end
