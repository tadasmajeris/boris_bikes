require 'van'
require 'garage'

describe Van do
  it { is_expected.to respond_to(:load).with(1).argument }
  it { is_expected.to respond_to(:unload_all) }

  let(:bike) { double :bike }

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    end
  end

  describe '#load' do
    it "should not accept more bikes than its capacity" do
      Van::DEFAULT_CAPACITY.times { subject.load bike }
      expect{subject.load double bike}.to raise_error ("Van full")
    end
  end

  describe '#unload_all' do
    it "should unload bikes" do
      subject.load(bike)
      subject.unload_all
      expect(subject.empty?).to eq true
    end
  end

  describe '#fill_van' do
    it "should load bikes up to the van's capacity" do
      van = Van.new(15)
      bikes = []
      18.times {bikes << bike}
      expect(van.fill_van(bikes).count).to eq 15
    end
  end


end
