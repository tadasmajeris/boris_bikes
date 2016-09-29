require 'spec_helper'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'initalization' do
    let(:bike) { Bike.new }
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
      new_capacity.times { station.dock Bike.new }
      expect { station.dock Bike.new }.to raise_error "Docking station is full"
    end
  end

  describe '#dock' do
    it 'raises an error if station is full' do
      described_class::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking station is full"
    end

    bike = Bike.new

    it 'releases working bikes' do
      bike = subject.dock(bike)
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
      bike = subject.dock(bike, false)
      expect(bike).to_not be_working
    end
  end

  describe '#release_bike' do
    it 'raises an error when no bikes are available' do
      # Reminds you that subject is = to DockingStation.new
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end
end
