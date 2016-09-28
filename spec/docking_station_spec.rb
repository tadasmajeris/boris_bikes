require 'spec_helper'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end

  it { is_expected.to respond_to(:dock).with(1).argument }

  # it 'docks something' do
  #
  #   bike = Bike.new
  #
  #   expect(subject.dock(bike)).to eq bike
  # end
  #
  # it 'returns docked bikes' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #
  #   expect(subject.bike).to eq bike
  # end

  describe '#dock' do
    it 'raises an error when a bike is already in the dock' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking station is full"
    end
  end

  describe '#release_bike' do
    it 'raises an error when no bikes are available' do
      # Reminds you that subject is = to DockingStation.new
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end
end
