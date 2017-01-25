class ChangeMerchantIdToReferenceInvoice < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :merchant_id, :string
    add_reference :invoices, :merchant, index: true
  end
end
