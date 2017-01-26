Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :transactions do
        get '/find_all', to: 'search_transactions#index'
        get '/find', to: 'search_transactions#show'
        get '/random', to: 'random_transactions#show'
        get '/:id/invoice', to: 'transaction_invoice#index'
      end
      resources :transactions, only: [:index, :show]

      namespace :merchants do
        get '/find_all', to: 'search_merchants#index'
        get '/find', to: 'search_merchants#show'
        get '/random', to: 'random_merchants#show'
        get '/:id/favorite_customer', to: 'merchants_top_customer#show'
        get '/revenue', to: 'merchants_revenue#index'
        get '/most_revenue', to: 'merchants_top_by_revenue#index'
        get '/most_items', to: 'merchants_most_items#index'
        get '/:id/items', to: 'merchant_items#index'
        get '/:id/invoices', to: 'merchant_invoices#index'
        get '/:id/revenue', to: 'merchants_revenue#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/find_all', to: 'search_customers#index'
        get '/find', to: 'search_customers#show'
        get '/random', to: 'random_customers#show'
        get '/:id/invoices', to: 'customer_invoices#index'
        get '/:id/transactions', to: 'customer_transactions#index'
        get '/:id/favorite_merchant', to: 'customer_favorite_merchant#show'
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'search_invoices#show'
        get '/find_all', to: 'search_invoices#index'
        get '/:id/transactions', to: 'invoice_transactions#index'
        get '/:id/invoice_items', to: 'invoice_invoice_items#index'
        get '/:id/items', to: 'invoices_items#index'
        get '/:id/customer', to: 'invoice_customer#show'
        get '/:id/merchant', to: 'invoice_merchant#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search_items#show'
        get '/find_all', to: 'search_items#index'
        get '/most_revenue', to: 'items_top_by_revenue#index'
        get '/most_items', to: 'items_most_items#index'
        get '/:id/merchant', to: 'items_merchant#show'
        get '/:id/invoice_items', to: 'items_invoice_items#index'
        get '/:id/best_day', to: 'item_best_day#show'
      end
      
      resources :items, only: [:index, :show]
      get '/invoice_items/find', to: 'search_invoice_items#show'
      get '/invoice_items/find_all', to: 'search_invoice_items#index'
      get '/invoice_items/:id/invoice', to: 'invoice_items_invoice#show'
      get '/invoice_items/:id/item', to: 'invoice_items_item#show'
      resources :invoice_items, only: [:index, :show]
    end
  end
end
