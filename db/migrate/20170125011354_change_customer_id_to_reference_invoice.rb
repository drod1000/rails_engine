class ChangeCustomerIdToReferenceInvoice < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :customer_id, :string
    add_reference :invoices, :customer, index: true
  end
end
