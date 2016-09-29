require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  let(:bike) { double :bike }
  it "produces working bikes" do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    red = subject.release_bike
    expect(red).to be_working
  end

  it "docks something" do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end

 describe 'initialization' do
   subject {DockingStation.new}
   let(:bike) {double(:bike)}
   it 'default capacity' do
    described_class::DEFAULT_CAPACITY.times do
     subject.dock(bike)
   end
   expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
 end


  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:release_bike).and_return(bike)
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
   end

    it "should not release infinite bikes" do
      expect {subject.release_bike}.to raise_error ("Oh no! No bikes available!")
    end


    it "should not release broken bikes" do
    allow(bike).to receive(:report_broken).and_return(:working?)
    allow(bike).to receive(:working?).and_return(false)
    bike.report_broken
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error ("Oh no! This bike is broken")
  end

end

  describe '#dock' do
    it "should not accept more than 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike }
      expect { subject.dock double :bike }.to raise_error ("Docking station full")
    end
  end
end

=begin
  it 'should accept a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


 describe 'initialization' do
  it "is expected to allow us to set the capacity" do
    station = DockingStation.new(30)
    30.times { station.dock(Bike.new) }
    expect {station.dock(Bike.new)}.to raise_error "Docking station full"
    end
  end
=end
