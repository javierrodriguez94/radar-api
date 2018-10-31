class RadarElem
  attr_reader :position, :targets

  def initialize(position, targets)
    @position = position
    @targets = targets
  end
end
