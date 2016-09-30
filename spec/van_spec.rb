require 'van'
require 'garage'

describe Van do
  it { is_expected.to respond_to(:load).with(1).argument }
  it { is_expected.to respond_to(:unload) }

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    end
  end

  describe '#load' do
    it "should not accept bikes tan its capacity" do
      Van::DEFAULT_CAPACITY.times { subject.load double :bike }
      expect (subject.load double :bike).to raise_error ("Van full")
    end
  end

end
