Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
     namespace :v1 do
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
