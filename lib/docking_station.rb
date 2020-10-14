require_relative './bike'

class DockingStation

	attr_reader :DEFAULT_CAPACITY

	def initialize(capacity = 20)
		@array_of_bikes = []
		@DEFAULT_CAPACITY = capacity
	end

	def release_bike
		if !empty?
			@array_of_bikes.each do | bike |
				if bike.working?
					@array_of_bikes.delete_at(@array_of_bikes.index(bike))
 					return bike
				else
					raise "Error: No working bikes available"
				end
			end
		else
			raise "Error: No bikes available"
		end
	end

	def dock(bike, condition = "working")
		if full?
			raise "Docking station at maximum capacity"
		else
			if condition == "broken"
				bike.bike_condition = "broken"
			end
			@array_of_bikes.push(bike)
		end
	end

	def show_bikes
		@array_of_bikes
	end

	private

	def full?
		if @array_of_bikes.size >= @DEFAULT_CAPACITY
			return true
		end
	end

	def empty?
		if @array_of_bikes.length == 0
			return true
		end
	end
end
