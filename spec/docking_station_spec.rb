require 'docking_station'

describe DockingStation do
it { is_expected.to respond_to :release_bike }

it "produces working bikes" do
  red = subject.release_bike
  expect(red).to be_working
  end
end

