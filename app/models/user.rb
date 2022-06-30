class User < ApplicationRecord
	has_secure_password

	# has_many :orders
	has_many :user_orders, class_name: 'Order', foreign_key: :user_id
  has_many :rest_orders, class_name: 'Order', foreign_key: :rest_id
  
  validates :email, presence: true, uniqueness: { scope: :role } , if: -> {role == 'restaurant'}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: { scope: :role }, if: -> {role == 'user'}
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  scope :drivers, ->() { where(role: 'driver') }
end
