describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }

  describe 'initalization' do
    it 'defaults capacity' do
      expect(described_class.new.capacity).to eq described_class::DEFAULT_CAPACITY
    end
  end

  describe 'has a variable capacity' do
    new_capacity = 30
    station = described_class.new(new_capacity)
    it 'user can set a variable capacity' do
      expect(station.capacity).to eq new_capacity
    end
    it 'raises an error when different capacity is full' do
      new_capacity.times { station.dock double(:bike)  }
      expect { station.dock double(:bike)  }.to raise_error "Docking station is full"
    end
  end

  describe '#dock' do
    it 'raises an error if station is full' do
      described_class::DEFAULT_CAPACITY.times { subject.dock double(:bike)  }
      expect { subject.dock double(:bike)  }.to raise_error "Docking station is full"
    end

    it 'releases working bikes' do
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'docks something' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'returns a broken bike' do
      bike2 = subject.dock(broken_bike)
      expect(bike2).to_not be_working
    end
  end

  describe '#release_bike' do

    describe 'raises an error when no bikes are available' do
      it 'raises error when the station is new' do
        expect {subject.release_bike}.to raise_error "No bikes available"
      end
      it 'raises error when the station has released all bikes' do
        20.times {subject.dock( bike )}
        expect {21.times {subject.release_bike}}.to raise_error "No bikes available"
      end
    end

    context "has 3 broken bikes" do
      before do
        3.times do
          subject.dock(broken_bike)
        end
      end
      it 'doesnt release a bike and raises an error if all broken' do
        expect {subject.release_bike}.to raise_error "No working bikes available"
      end
      it "releases a bike that isn't broken" do
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end
  end
end
