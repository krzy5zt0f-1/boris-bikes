require_relative './bike'

class DockingStation
	attr_reader :docking_capacity
	def initialize
		@array_of_bikes = []
		@docking_capacity = 20
	end
	def release_bike
		if @array_of_bikes.empty?
			raise "Error: No bikes available"
		else
			@array_of_bikes.pop
		end
	end
	def dock(input)
		if @array_of_bikes.size < @docking_capacity
			@array_of_bikes.push(input)
		else
			raise "Docking station at maximum capacity"
		end
	end
	def show_bikes
		@array_of_bikes
	end
end
