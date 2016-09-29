=begin
require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it "selects broken bikes" do

    bike = Bike.new
    station = DockingStation.new
    bike.report_broken
    station.dock(bike)
    collection = subject.pickup(station)
    expect collection.to eq bike
  end
end

=end
