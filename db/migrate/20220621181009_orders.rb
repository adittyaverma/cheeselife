class Orders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
      t.string :status
      t.integer :user_id
      t.integer :rest_id
      t.decimal :base_price, precision: 10, scale: 2
      t.decimal :vat, precision: 10, scale: 2
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :cashback, precision: 10, scale: 2
      t.decimal :delivery_fee, precision: 10, scale: 2
      t.decimal :grand_total, precision: 10, scale: 2
      t.integer :driver_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
