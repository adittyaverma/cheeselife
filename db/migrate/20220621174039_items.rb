class Items < ActiveRecord::Migration[5.2]
  def change
  	create_table :items do |t|
      t.string :name
      t.string :desc
      t.decimal :price, precision: 10, scale: 2
      t.integer :aval_quantity
      t.string :food_type
      t.string :cuisine
      t.integer :menu_id
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
