class ChangeIdToReferenceInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :item_id, :string
    remove_column :invoice_items, :invoice_id, :string
    add_reference :invoice_items, :item, index: true
    add_reference :invoice_items, :invoice, index: true
  end
end
