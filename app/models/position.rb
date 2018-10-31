class Position

  include Comparable

  def <=>(anOther)
    self.distance <=> anOther.distance
  rescue
    nil
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance
    (@x**2 + @y**2)**0.5
  end
end
