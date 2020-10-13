require_relative '../lib/docking_station'


RSpec.describe DockingStation do
	it {respond_to(:release_bike)}

	it "releases a bike" do
		bike = subject.release_bike
		expect(bike).to be_instance_of Bike
	end
	it "bike is working" do
		bike = subject.release_bike
		expect(bike.working?).to eq true
	end
	describe '#docking' do
		it "docks a bike to be returned" do
			# Arrange
			bike = subject.release_bike
			bikes = subject.instance_variable_get("@array_of_bikes")
			#Act
			subject.dock(bike)
			#Assert
			expect(bikes).to eq [bike]
		end
	end
	describe '#show_bikes' do
		it "returns non-empty array of bikes" do
			# Arrange
			bike = subject.release_bike
			#Act
			subject.dock(bike)
			#Assert
			expect(subject.show_bikes.size).to eq 1
		end
	end
end
