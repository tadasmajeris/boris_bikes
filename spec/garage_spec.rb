require 'garage'

describe Garage do
  it { is_expected.to respond_to :repair }

 describe '#repair' do
  it 'repairs the bike' do
    station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    station.deliver_broken_bikes
    subject.repair(bike)
    bike.working?
    expect(bike.working?).to be true
    end
  end
end
