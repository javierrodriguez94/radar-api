class Target
  attr_reader :type, :damage

  TYPES = ['Human','T1','T7-T','T-X','HK-Airstrike','HK-Bomber','HK-Tank']

  def initialize(type, damage)
    raise ArgumentError unless TYPES.include?(type)
    @type = type
    @damage = damage
  end
end
