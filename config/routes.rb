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
      get '/customers/find_all', to: 'search_customers#index'
      get '/customers/find', to: 'search_customers#show'
      get 'customers/random', to: 'random_customers#show'
      resources :customers, only: [:index, :show]
      get '/invoices/find', to: 'search_invoices#show'
      get '/invoices/find_all', to: 'search_invoices#index'
      resources :invoices, only: [:index, :show]
      get '/items/find', to: 'search_items#show'
      get '/items/find_all', to: 'search_items#index'
      resources :items, only: [:index, :show]
      get '/invoice_items/find', to: 'search_invoice_items#show'
      get '/invoice_items/find_all', to: 'search_invoice_items#index'
      resources :invoice_items, only: [:index, :show]
    end
  end
end
