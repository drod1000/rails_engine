# Rails Engine

rails_engine is an exercise in creating an internal API that serves up business anyltics. It features endpoints that return information on customers, merchants, invoices, invoice items and transactions.

This project was built as part of the Turing School Back End Engineering Curriculum. The spec can be found [here](http://backend.turing.io/module3/projects/rails_engine).

## Collaborators
Annie Wolff 

Daniel Rodriguez

# Setup

To run rails_engine on your own machine simply clone this repository by running:

`git clone git@github.com:wlffann/rails_engine.git`

You will also need the data from [Sales Engine](https://github.com/turingschool-examples/sales_engine). Clone this repository and copy the data by running:

`git clone https://github.com/turingschool-examples/sales_engine.git`

`cp -R sales_engine/data/ rails_engine/db/`

To set up your app and create your database, run:

`cd rails_engine`

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:test:prepare`

`rake db:seed`

This will give you a fully bundled app and a seeded database. Use the command `rspec` to run the test suite and start hitting endpoints!

# Available endpoints

## Merchants

### Records

`GET /api/v1/merchants`

`GET /api/v1/merchants/:id`

`GET /api/v1/merchants/find?parameters`

`GET /api/v1/merchants/find_all?parameters`

`GET /api/v1/merchants/random`

### Relationships

`GET /api/v1/merchants/:id/items`

`GET /api/v1/merchants/:id/invoices`

### Business Intelligence

`GET /api/v1/merchants/:id/revenue`

`GET /api/v1/merchants/:id/revenue?date=x`

`GET /api/v1/merchants/most_items?quantity=x`

`GET /api/v1/merchants/:id/customers_with_pending_invoices`

`GET /api/v1/merchants/:id/favorite_customer`

`GET /api/v1/merchants/revenue?date=x`

`GET /api/v1/merchants/most_revenue?quantity=x`

## Items

### Records

`GET /api/v1/items`

`GET /api/v1/items/:id`

`GET /api/v1/items/find?parameters`

`GET /api/v1/items/find_all?parameters`

`GET /api/v1/items/random`

### Relationships

`GET /api/v1/items/:id/invoice_items`

`GET /api/v1/items/:id/merchant`

### Business Intelligence

`GET /api/v1/items/:id/best_day`

`GET /api/v1/items/most_items?quantity=x`

`GET /api/v1/items/most_revenue?quantity=x`

## Invoices

### Records

`GET /api/v1/invoices`

`GET /api/v1/invoices/:id`

`GET /api/v1/invoices/find?parameters`

`GET /api/v1/invoices/find_all?parameters`

`GET /api/v1/invoices/random`

### Relationships

`GET /api/v1/invoices/:id/transactions`

`GET /api/v1/invoices/:id/invoice_items`

`GET /api/v1/invoices/:id/items`

`GET /api/v1/invoices/:id/customer`

`GET /api/v1/invoices/:id/merchant`

`GET /api/v1/invoice_items/:id/invoice`

## Invoice_Items

### Records

`GET /api/v1/invoice_items`

`GET /api/v1/invoice_items/:id`

`GET /api/v1/invoice_items/find?parameters`

`GET /api/v1/invoice_items/find_all?parameters`

`GET /api/v1/invoice_items/random`

### Relationships

`GET /api/v1/invoice_items/:id/invoice`

`GET /api/v1/invoice_items/:id/item`

## Transactions

### Records

`GET /api/v1/transactions`

`GET /api/v1/transactions/:id`

`GET /api/v1/transactions/find?parameters`

`GET /api/v1/transactions/find_all?parameters`

`GET /api/v1/transactions/random`

### Relationships

`GET /api/v1/transactions/:id/invoice`

## Customers

### Records

`GET /api/v1/customers`

`GET /api/v1/customers/:id`

`GET /api/v1/customers/find?parameters`

`GET /api/v1/customers/find_all?parameters`

`GET /api/v1/customers/random`

### Relationships

`GET /api/v1/customers/:id/invoices`

`GET /api/v1/customers/:id/transactions`

### Business Intelligence

`GET /api/v1/customers/:id/favorite_merchant`

