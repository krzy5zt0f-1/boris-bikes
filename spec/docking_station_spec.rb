require 'docking_station'

RSpec.describe DockingStation do
	it "responds to #release bike" do
		expect(subject).to respond_to(:release_bike)
	end
end
