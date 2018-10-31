require 'rails_helper'

RSpec.describe Target, type: :model do
  let(:type) { 'T1' }
  let(:bad_type) { 'Foo' }
  let(:damage) { 50 }

  subject { described_class.new(type, damage) }

  describe '#initialize' do
    it 'initializes a target with an admited type and a damage' do
      expect(subject).to be_an_instance_of described_class
      expect(subject.type).to eq type
      expect(subject.damage).to eq damage
    end

    it 'raises an error if type is not admited' do
      expect{ described_class.new(bad_type, damage) }.to raise_error(ArgumentError)
    end
  end
end
