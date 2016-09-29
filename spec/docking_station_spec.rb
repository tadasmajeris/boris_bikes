require 'spec_helper'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

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

    let(:bike) { double(:bike) }

    it 'releases working bikes' do
      subject.dock double(:bike)
      bike = subject.release_bike
      # bike = subject.dock(bike)
      expect(bike).to be_working
    end

    it 'docks something' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'returns a broken bike' do
      bike.mark_as_broken
      bike = subject.dock(bike)
      expect(bike).to_not be_working
    end
  end

  describe '#release_bike' do
    describe 'raises an error when no bikes are available' do
      it 'raises error when the station is new' do
        expect {subject.release_bike}.to raise_error "No bikes available"
      end
      it 'raises error when the station has released all bikes' do
        20.times {subject.dock( double(:bike)  )}
        expect {21.times {subject.release_bike}}.to raise_error "No bikes available"
      end
    end

    context "has 3 broken bikes" do
      let(:bike) { double(:bike) }
      before do
        3.times do
          bike.mark_as_broken
          subject.dock(bike)
        end
      end
      it 'doesnt release a bike and raises an error if all broken' do
        expect {subject.release_bike}.to raise_error "No working bikes available"
      end
      it "releases a bike and that isn't broken" do
        bike1 = double(:bike)
        subject.dock(bike1)
        expect(subject.release_bike).to eq bike1
      end
    end
  end
end
