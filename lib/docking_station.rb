require_relative './bike'

class DockingStation
	def initialize
		@array_of_bikes = []
	end
	def release_bike
		Bike.new
	end
	def dock(input)
		@array_of_bikes.push(input)
	end
	def show_bikes
		@array_of_bikes
	end
end
