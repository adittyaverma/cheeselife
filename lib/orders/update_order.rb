module Orders
	class UpdateOrder
	
		def initialize(order, status)
	  	@order = order
	  	@status = status
	  end

	  def update_order
	  	case @status
	  	when 'placed'
	  		# do something
  		when 'payment_received'
  			# calculate ETA
  			# can integrate map api to calculate the ETA
  			@order.eta = rand(100..5000)
  			@order.driver_id = User.drivers.pluck(&:id).sample # this can be calculated based on availability
  			#send sms
			when 'out_for_delivery'
				# do something
			when 'delivered'
				# do something
			else
				raise 'Not a valid status'
			end
			@order.status = @status
			@order.save!
	  		
	  end

	  def calculate_eta
	  	
	  end

	  def get_available_driver
	  	
	  end
	end
end
