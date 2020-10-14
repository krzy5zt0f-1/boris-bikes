require_relative './bike'

class DockingStation
	def initialize
		@array_of_bikes = []
	end
	def release_bike
		if @array_of_bikes.empty?
			raise "Error: No bikes available"
		else
			@array_of_bikes.pop
		end
	end
	def dock(input)
		@array_of_bikes.push(input)
	end
	def show_bikes
		@array_of_bikes
	end
end
