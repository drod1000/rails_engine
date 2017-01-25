class AddReferencesTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :invoice, index: true
  end
end
