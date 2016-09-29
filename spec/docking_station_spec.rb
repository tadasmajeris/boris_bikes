require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  #it "produces working bikes" do
  #  red = subject.release_bike
  #  expect(red).to be_working
  #end
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it "should not release infinite bikes" do
      expect {subject.release_bike}.to raise_error ("Oh no! No bikes available!")
    end
    it "should not accept more than 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new}.to raise_error ("Docking station full")
    end
  end

  describe '#dock' do
    it "should not accept more than 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new}.to raise_error ("Docking station full")
    end
  end
end
