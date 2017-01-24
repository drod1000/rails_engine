class ChangeResultToCitextTransactions < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
    change_column :transactions, :result, :citext
  end
end
