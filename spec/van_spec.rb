require 'van'

describe Van do

  it { is_expected.to respond_to(:load).with(1).argument }
  it { is_expected.to respond_to :unload }

  describe "initialization" do
    it 'should have default capacity of 10' do
      expect(subject.capacity).to eq 10
    end
    it 'should be empty' do
      expect(subject.empty?).to eq true
    end
  end

  let(:bike) { double(:bike) }
  describe "#load" do
    it 'raises error if van is full' do
      Van::DEFAULT_CAPACITY.times {subject.load(bike)}
      expect{subject.load(bike)}.to raise_error "Van is full"
    end
    it 'should load the bike' do
      expect(subject.load(bike)).to eq bike
    end
  end
  describe "#unload" do
    it 'should unload bikes at garage' do
      4.times { subject.load(bike) }
      subject.unload       #unload all bikes
      expect(subject.empty?).to eq true
    end
  end


end
