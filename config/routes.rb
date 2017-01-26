Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'transactions/find_all', to: 'search_transactions#index'
      get '/transactions/find', to: 'search_transactions#show'
      get '/transactions/random', to: 'random_transactions#show'
      get '/transactions/:id/invoice', to: 'transaction_invoice#index'
      resources :transactions, only: [:index, :show]
      get '/merchants/find_all', to: 'search_merchants#index'
      get '/merchants/find', to: 'search_merchants#show'
      get '/merchants/random', to: 'random_merchants#show'
      get '/merchants/:id/favorite_customer', to: 'merchants_top_customer#show'
      get '/merchants/most_revenue', to: 'merchants_top_by_revenue#index'
      get '/merchants/most_items', to: 'merchants_most_items#index'
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/:id/invoices', to: 'merchant_invoices#index'
      get '/merchants/:id/revenue', to: 'merchants_revenue#show'
      resources :merchants, only: [:index, :show]
      get '/customers/find_all', to: 'search_customers#index'
      get '/customers/find', to: 'search_customers#show'
      get 'customers/random', to: 'random_customers#show'
      get '/customers/:id/invoices', to: 'customer_invoices#index'
      get '/customers/:id/transactions', to: 'customer_transactions#index'
      get 'customers/:id/favorite_merchant', to: 'customer_favorite_merchant#show'
      resources :customers, only: [:index, :show]
      get '/invoices/find', to: 'search_invoices#show'
      get '/invoices/find_all', to: 'search_invoices#index'
      get '/invoices/:id/transactions', to: 'invoice_transactions#index'
      get '/invoices/:id/invoice_items', to: 'invoice_invoice_items#index'
      get '/invoices/:id/items', to: 'invoices_items#index'
      get '/invoices/:id/customer', to: 'invoice_customer#show'
      get '/invoices/:id/merchant', to: 'invoice_merchant#show'
      resources :invoices, only: [:index, :show]
      get '/items/find', to: 'search_items#show'
      get '/items/find_all', to: 'search_items#index'
      get '/items/most_items', to: 'items_most_items#index'
      get '/items/:id/merchant', to: 'items_merchant#show'
      get '/items/:id/invoice_items', to: 'items_invoice_items#index'
      resources :items, only: [:index, :show]
      get '/invoice_items/find', to: 'search_invoice_items#show'
      get '/invoice_items/find_all', to: 'search_invoice_items#index'
      get '/invoice_items/:id/invoice', to: 'invoice_items_invoice#show'
      get '/invoice_items/:id/item', to: 'invoice_items_item#show'
      resources :invoice_items, only: [:index, :show]
    end
  end
end
