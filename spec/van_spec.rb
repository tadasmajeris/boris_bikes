require 'van'
require 'garage'

describe Van do

describe "#pick_up_bikes" do
  it "picks up broken bikes" do
    bike = Bike.new
    station = DockingStation.new
    bike.report_broken
    station.dock(bike)
    station.select_broken_bikes
    expect(subject.pick_up_bikes).to eq station.select_broken_bikes
  end
end

  describe '#deliver_broken_bikes' do
   it 'delivers broken bikes to the garage' do
   bike = Bike.new
   station = DockingStation.new
   garage = Garage.new
   bike.report_broken
   station.dock(bike)
   station.select_broken_bikes
   expect(subject.deliver_broken_bikes).to eq garage.collection_bay
  end
 end

end
