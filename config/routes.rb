Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
     namespace :v1 do
       get '/invoices/find', to: 'search_invoices#show'
       resources :invoices, only: [:index, :show]
       get '/items/find', to: 'search_items#show'
       resources :items, only: [:index, :show]
       resources :invoice_items, only: [:index, :show]
     end
   end
end
