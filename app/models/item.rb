class Item < ApplicationRecord
	belongs_to :menu
	default_scope { where(status: true) }
	VAT = 5

	def calculate_vat
		( price * VAT ) / 100
	end
end