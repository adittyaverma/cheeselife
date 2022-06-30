class SetDefaultValues < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :orders, :base_price, 0.0
  	change_column_default :orders, :vat, 0.0
  	change_column_default :orders, :discount, 0.0
  	change_column_default :orders, :cashback, 0.0
  	change_column_default :orders, :delivery_fee, 0.0
  	change_column_default :orders, :grand_total, 0.0
  	change_column_default :order_items, :base_price, 0.0
  	change_column_default :order_items, :vat, 0.0
  end
end
