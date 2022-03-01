class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category, null: false
      t.integer :goods_situation, null: false
      t.integer :delivery_charge, null: false
      t.integer :shipment_source, null: false
      t.integer :shipping_day, null: false
      t.timestamps
    end
  end
end
