require_relative './bike'

class DockingStation
	attr_reader :DEFAULT_CAPACITY
	def initialize(capacity = 20)
		@array_of_bikes = []
		@DEFAULT_CAPACITY = capacity
	end
	def release_bike
		if empty?
			raise "Error: No bikes available"
		else
			@array_of_bikes.pop
		end
	end
	def dock(input)
		if full?
			raise "Docking station at maximum capacity"
		else
			@array_of_bikes.push(input)
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
