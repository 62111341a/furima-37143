class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.integer :goods_situation_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :shipping_source_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.text :goods_explanation, null: false
      t.string :goods, null: false
      t.timestamps
    end
  end
end

