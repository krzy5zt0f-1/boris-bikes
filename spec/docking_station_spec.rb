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

	it "docks a broken bike and holds on to" do
		bike = Bike.new
		subject.dock(bike, "broken")
		expect{subject.release_bike}.to raise_error "Error: No working bikes available"
	end

	describe '#docking' do
		it "docks a bike to be returned when dock is empty and no condition is given" do
			# Arrange
			bike = Bike.new
			bikes = subject.instance_variable_get("@array_of_bikes")
			#Act
			subject.dock(bike)
			#Assert
			expect(bikes).to eq [bike]
		end

		it "errors when docking a bike ot a full dock" do
			subject.DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
			expect{subject.dock(Bike.new)}.to raise_error "Docking station at maximum capacity"
		end

		it "stores the condition of the bike when broken" do
			bike = Bike.new
			subject.dock(bike, "broken")
			expect(bike.bike_condition).to eq "broken"
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

	describe '#initialize' do
		it "sets global variable for capacity when provide" do
			subject = DockingStation.new(50)
			expect(subject.DEFAULT_CAPACITY).to eq 50
		end
	end
end
