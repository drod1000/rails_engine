class AddCreditCardExpirationToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :credit_card_expiration_date, :datetime
  end
end
