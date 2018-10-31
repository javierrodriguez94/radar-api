class Radar::Targeting::FurthestFirstService

  class << self
    def select_target_with_strategy(radar_elems)
      positions = radar_elems.map(&:position)
      radar_elems[positions.index(positions.max)]
    end

    def order_specific_target(radar_elem)
      # Default order by damage
      radar_elem.targets.select{ |t| t.damage }.sort_by!(&:damage)
      radar_elem.targets.reverse!
      radar_elem
    end
  end
end
