require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }

  it "produces working bikes" do
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it "docks something" do
    expect(subject.dock(bike)).to eq bike
  end

 describe 'initialization' do
   it 'default capacity' do
     described_class::DEFAULT_CAPACITY.times do
       subject.dock(bike)
     end
     expect{ subject.dock(bike) }.to raise_error 'Docking station full'
   end

   it "is expected to allow us to set the capacity" do
     station = DockingStation.new(30)
     30.times { station.dock(bike) }
     expect {station.dock(bike)}.to raise_error "Docking station full"
   end
 end


  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
   end

    it "should not release infinite bikes" do
      expect {subject.release_bike}.to raise_error ("Oh no! No bikes available!")
    end

    context "has 3 broken bikes" do
      before do
        3.times { subject.dock(broken_bike) }
      end
      it "should not release broken bikes" do
        expect {subject.release_bike}.to raise_error ("Oh no! No working bikes available")
      end
      it "releases a working bike" do
        working_bike = subject.dock(bike)
        subject.dock(broken_bike)
        expect(sub).to eq working_bike
      end
    end
end

  describe '#dock' do
    it "should not accept more than 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike }
      expect { subject.dock double :bike }.to raise_error ("Docking station full")
    end
  end

  # describe '#deliver_broken_bikes' do
  #   it "should send all broken bikes to a van" do
  #     subject.dock(broken_bike)
  #     expect(subject.deliver_broken_bikes).to eq [bike]
  #   end
  # end
end
