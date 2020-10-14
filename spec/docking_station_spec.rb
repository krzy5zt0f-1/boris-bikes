require_relative '../lib/docking_station'

RSpec.describe DockingStation do
#let(:bike) {double( :bike, :bike_condition => "broken")}
let(:bike) {double(:bike, :working? => true, :bike_condition => "working")}
let(:broken_bike) {double(:broken_bike, :working? => false, :bike_condition => "broken")}

	it {is_expected.to respond_to(:release_bike)}

	it "errors in no bike is available" do
		expect{subject.release_bike}.to raise_error "Error: No bikes available"
	end

	it "releases a bike if one is available" do
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end

	it "bike is working" do
		allow(bike).to receive(:working?).and_return(true)
		expect(bike.working?).to eq true
	end

	it "docks a broken bike and holds on to it" do
		allow(broken_bike).to receive(:bike_condition=)
		allow(broken_bike).to receive(:bike_condition).and_return("broken")
		subject.dock(broken_bike, "broken")
		expect{subject.release_bike}.to raise_error "Error: No working bikes available"
	end

	describe '#docking' do
		it "docks a bike to be returned when dock is empty and no condition is given" do
			# Arrange
			bikes = subject.instance_variable_get("@array_of_bikes")
			#Act
			subject.dock(bike)
			#Assert
			expect(bikes).to eq [bike]
		end

		it "errors when docking a bike ot a full dock" do
			subject.DEFAULT_CAPACITY.times {subject.dock(bike)}
			expect{subject.dock(bike)}.to raise_error "Docking station at maximum capacity"
		end

		it "stores the condition of the bike when broken" do
			allow(broken_bike).to receive(:bike_condition=)
			allow(broken_bike).to receive(:bike_condition).and_return("broken")
			subject.dock(broken_bike, "broken")
			expect(broken_bike.bike_condition).to eq "broken"
		end
	end

	describe '#show_bikes' do
		it "returns non-empty array of bikes" do

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
