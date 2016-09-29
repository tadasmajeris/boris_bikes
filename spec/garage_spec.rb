require 'garage'
require 'van'

describe Garage do
  it { is_expected.to respond_to :collection_bay }

 describe '#collection_bay' do
  it 'repairs the bike' do
    station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    station.select_broken_bikes
    subject.collection_bay
    bike.working?
    expect(bike.working?).to be true
    end
  end
end
