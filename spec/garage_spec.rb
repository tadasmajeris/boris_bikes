require 'garage'

describe Garage do

  let(:bike) { double(:bike, working?: false) }

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
    end
  end

  describe "#repair" do
    it { is_expected.to respond_to(:repair).with(1).argument }

    it "should load and repair broken bikes" do
      bikes = []
      allow(bike).to receive(:fix)
      10.times { bikes << bike }
      subject.repair(bikes)
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.find_all_working_bikes.count).to eq 10
    end
  end

end
