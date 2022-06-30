class Menu < ApplicationRecord
	has_many :items
	belongs_to :user
	default_scope { where(status: true) }
end