class OrderItem < ApplicationRecord
	# has_many :items
	belongs_to :order

	# default_scope { where(status: true) }
end