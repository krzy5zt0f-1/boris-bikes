require_relative '../lib/docking_station'

RSpec.describe DockingStation do
	it {is_expected.to respond_to(:release_bike)}
	it "errors in no bike is available" do
		expect{subject.release_bike}.to raise_error "Error: No bikes available"
	end
	it "releases a bike if one is available" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end
	it "bike is working" do
		bike = Bike.new
		expect(bike.working?).to eq true
	end
	describe '#docking' do
		it "docks a bike to be returned when dock is empty" do
			# Arrange
			bike = Bike.new
			bikes = subject.instance_variable_get("@array_of_bikes")
			#Act
			subject.dock(bike)
			#Assert
			expect(bikes).to eq [bike]
		end
		it "errors when docking a bike ot a full dock" do
			subject.docking_capacity.times {subject.dock(Bike.new)}
			expect{subject.dock(Bike.new)}.to raise_error "Docking station at maximum capacity"
		end

	end
	describe '#show_bikes' do
		it "returns non-empty array of bikes" do
			# Arrange
			bike = Bike.new
			#Act
			subject.dock(bike)
			#Assert
			expect(subject.show_bikes.size).to eq 1
		end
	end
end
