Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
     namespace :v1 do
       resources :invoices, only: [:index, :show]
       resources :items, only: [:index, :show]
       resources :invoice_items, only: [:index]
     end
   end
end
