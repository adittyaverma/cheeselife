class AddLatLongToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :lat, :decimal, precision: 8, scale: 6
  	add_column :users, :long, :decimal, precision: 9, scale: 6
  	add_column :orders, :eta, :decimal, precision: 10, scale: 0
  end
end
