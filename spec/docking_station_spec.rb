require 'spec_helper'

describe 'DockingStation' do
  before :each do
    @DockingStation = DockingStation.new
  end

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
end
