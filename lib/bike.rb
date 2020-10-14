class Bike
	attr_accessor :bike_condition

	def initialize
		@bike_condition = "working"
	end

	def working?
		if @bike_condition == "working"
			return true
		else
			return false
		end
	end
end
