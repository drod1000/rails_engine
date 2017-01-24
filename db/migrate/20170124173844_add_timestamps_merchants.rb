class AddTimestampsMerchants < ActiveRecord::Migration[5.0]
  def change
    change_table(:merchants) { |t| t.timestamps precision: 0}
  end
end
