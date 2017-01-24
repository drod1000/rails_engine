Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
     namespace :v1 do
       get '/invoices/find', to: 'search_invoices#show'
       get '/invoices/find_all', to: 'search_invoices#index'
       resources :invoices, only: [:index, :show]
       get '/items/find', to: 'search_items#show'
       resources :items, only: [:index, :show]
       get '/invoice_items/find', to: 'search_invoice_items#show'
       resources :invoice_items, only: [:index, :show]
     end
   end
end
