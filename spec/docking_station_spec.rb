require 'docking_station'
describe DockingStation do
it { is_expected.to respond_to :release_bike }
it { is_expected.to respond_to(:dock).with(1).argument }
it "produces working bikes" do
  red = subject.release_bike
  expect(red).to be_working
  end
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
end
