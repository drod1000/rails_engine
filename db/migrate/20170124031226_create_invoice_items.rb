class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.string  :item_id
      t.string  :invoice_id
      t.integer :quantity
      t.integer :unit_price

      t.timestamps precision: 0
    end
  end
end
