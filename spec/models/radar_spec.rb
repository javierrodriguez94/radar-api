require 'rails_helper'

RSpec.describe Radar, type: :model do
  let(:mode) { 'closest-first' }
  let(:radar_elems) { double(:radar_elems) }
  let(:target_response) { :mock_response }

  subject { described_class.new(mode, radar_elems) }
  
  describe '#initialize' do
    it 'initializes a radar with a mode and radar elements' do
      expect(subject).to be_an_instance_of described_class
      expect(subject.mode).to eq 'closest-first'
      expect(subject.radar_elems).to eq radar_elems
    end
  end

  describe '#target' do
    it 'calls a service to get a target' do
      allow(Radar::SelectTargetService).to receive(:call)
        .with(subject)
        .and_return(target_response)
      expect(Radar::SelectTargetService).to receive(:call).with(subject)
      expect(subject.target).to eq :mock_response
    end
  end
end
