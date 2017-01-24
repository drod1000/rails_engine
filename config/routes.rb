Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'transactions/find_all', to: 'search_transactions#index'
      get '/transactions/find', to: 'search_transactions#show'
      get '/transactions/random', to: 'random_transactions#show'
      resources :transactions, only: [:index, :show]
      
      get '/merchants/find_all', to: 'search_merchants#index'
      get '/merchants/find', to: 'search_merchants#show'
      get '/merchants/random', to: 'random_merchants#show'
      resources :merchants, only: [:index, :show]
    end
  end
end
