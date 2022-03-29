class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,null: false, foreign_key: true
      t.string :post,null: false
      t.integer :shipping_source_id,null: false
      t.string :address,null: false
      t.string :telephone_number,null: false 
      t.string :municipalities,null: false
      t.string :buliding_name
      t.timestamps
    end
  end
end
