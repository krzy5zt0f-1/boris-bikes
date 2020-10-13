require 'docking_station'

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
end
