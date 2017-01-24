class RemoveTimestampsMerchants < ActiveRecord::Migration[5.0]
  def change
    remove_column :merchants, :created_at, :timestamp
    remove_column :merchants, :updated_at, :timestamp
  end
end
