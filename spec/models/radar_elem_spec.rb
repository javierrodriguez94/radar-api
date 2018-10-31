require 'rails_helper'

RSpec.describe RadarElem, type: :model do
  let(:position) { double(:position) }
  let(:targets) { [target, target] }
  let(:target) { double(:target) }

  subject { described_class.new(position, targets) }

  describe '#initialize' do
    it 'initializes a radar_elem with a position and an array of targets' do
      expect(subject).to be_an_instance_of described_class
      expect(subject.position).to eq position
      expect(subject.targets).to eq targets
    end
  end
end
