require 'spec_helper'

describe Bike do
  it { is_expected.to respond_to :working?}

  describe "initialization" do
    it 'defaults to working' do
      expect(described_class.new.working?).to eq true
    end
  end

  it 'can be marked as broken' do
    subject.mark_as_broken
    expect(subject.working?).to eq false
  end
end
