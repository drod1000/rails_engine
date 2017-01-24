require 'csv'

Merchant.delete_all
Customer.delete_all
Item.delete_all
Invoice.delete_all
Transaction.delete_all
InvoiceItem.delete_all

CSV.foreach('db/data/merchants.csv', headers:true) do |row|
  Merchant.create!(id: row["id"],
                  name: row["name"], 
                  created_at: row["created_at"], 
                  updated_at: row["updated_at"])
end

CSV.foreach('db/data/customers.csv', headers:true) do |row|
  Customer.create!(id: row["id"],
                  first_name: row["first_name"],
                  last_name: row["last_name"],
                  created_at: row["created_at"],
                  updated_at: row["updated_at"])
end

CSV.foreach('db/data/items.csv', headers:true) do |row|
  Item.create!(id: row["id"],
              name: row["name"],
              unit_price: row["unit_price"],
              merchant_id: row["merchant_id"],
              description: row["description"],
              created_at: row["created_at"],
              updated_at: row["updated_at"])
end

CSV.foreach('db/data/invoices.csv', headers:true) do |row|
  Invoice.create!(id: row["id"],
                  customer_id: row["customer_id"],
                  merchant_id: row["merchant_id"],
                  status: row["status"],
                  created_at: row["created_at"],
                  updated_at: row["updated_at"])
end

CSV.foreach('db/data/invoice_items.csv', headers:true) do |row|
  InvoiceItem.create!(id: row["id"],
                      item_id: row["item_id"],
                      invoice_id: row["invoice_id"],
                      quantity: row["quantitiy"].to_i,
                      unit_price: row["unit_price"].to_i,
                      created_at: row["created_at"],
                      updated_at: row["updated_at"])
end

CSV.foreach('db/data/transactions.csv', headers:true) do |row|
  Transaction.create!(id: row["id"],
                      invoice_id: row["invoice_id"],
                      result: row["result"],
                      credit_card_number: row["credit_card_number"],
                      credit_card_expiration_date: row["credit_card_expiration_date"],
                      created_at: row["created_at"], 
                      updated_at: row["updated_at"])
end