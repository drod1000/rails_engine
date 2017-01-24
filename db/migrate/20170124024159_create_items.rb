class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text    :name
      t.text    :description
      t.integer :unit_price
      t.string :merchant_id
      
      t.timestamps
    end
  end
end
