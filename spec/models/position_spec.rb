require 'rails_helper'

describe Position, type: :model do

  describe '#initialize' do
    subject { described_class.new(1,2) }

    it 'initializes a position given X and Y values' do
      expect(subject).to be_an_instance_of described_class
    end
  end

  describe '#<=>' do
    it "returns 0 when the distance is equal" do
      expect(described_class.new(0,2) <=> described_class.new(0,2)).to eq(0)
      expect(described_class.new(0,0) <=> described_class.new(0,0)).to eq(0)
      expect(described_class.new(1,0) <=> described_class.new(0,1)).to eq(0)
      expect(described_class.new(4,2) <=> described_class.new(2,4)).to eq(0)
    end

    it "returns -1 when first position is closer than second" do
      expect(described_class.new(0,2) <=> described_class.new(1,2)).to eq(-1)
    end

    it "returns 1 when first position is further than second" do
      expect(described_class.new(1,2) <=> described_class.new(0,2)).to eq(1)
    end

    it "returns nil when positions can't be compared" do
      expect(described_class.new(0,2) <=> described_class.new("foo", nil)).to be(nil)
    end
  end
end
