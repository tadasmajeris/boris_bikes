require 'spec_helper'

describe 'DockingStation' do
  before :each do
    @DockingStation = DockingStation.new
  end

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
