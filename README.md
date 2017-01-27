# Rails Engine

rails_engine is an exercise in creating an internal API that serves up business anyltics. It features endpoints that return information on customers, merchants, invoices, invoice items and transactions.

This project was built as part of the Turing School Back End Engineering Curriculum. The spec (containing all of the endpoints that can be reached) can be found [here](http://backend.turing.io/module3/projects/rails_engine).

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


## Collaborators
Annie Wolff 

Daniel Rodriguez
