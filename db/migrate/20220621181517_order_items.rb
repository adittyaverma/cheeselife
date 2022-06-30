class OrderItems < ActiveRecord::Migration[5.2]
  def change
  	create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :base_price, precision: 10, scale: 2
      t.decimal :vat, precision: 10, scale: 2

      t.timestamps
    end
  end
end
