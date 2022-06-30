class Order < ApplicationRecord
	has_many :order_items

	enum status: [:draft, :placed, :payment_received, :out_for_delivery, :delivered]

	def create_order(items)
		Order.transaction do
			rest_id = []
			price = 0.0
			vat = 0.0
			items.each do |item, quantity|
				item = Item.find_by_id(item)
				
				raise ActiveRecord::RecordNotFound unless item
				item_price = item.price * quantity
				item_vat = item.calculate_vat * quantity
				order_item = self.order_items.new(quantity: quantity, item_id: item.id, base_price: item_price, vat: item_vat)
				raise unless order_item.save!
				price += item_price
				vat += item_vat
				rest_id << item.menu.user_id
			end
			
			self.rest_id = rest_id.first
			self.base_price = price
			self.vat = vat
			self.grand_total = get_grand_total

			if rest_id.uniq.count > 1
				ActiveRecord::Rollback
				raise 'Please choose items from same restaurant'
			end

			self.save!
		end
	end

	private

	def get_grand_total
		base_price + vat + delivery_fee - discount
	end
end