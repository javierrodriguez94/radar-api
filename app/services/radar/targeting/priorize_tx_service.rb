class Radar::Targeting::PriorizeTxService

  class << self
    def select_target_with_strategy(radar_elems)
      radar_elems.select { |rader_elem| rader_elem.targets.map(&:type).include?("T-X") }.first
    end

    def order_specific_target(radar_elem)
      # Ordered by damage with T-X element in the first position
      radar_elem.targets.sort_by!(&:damage)
      radar_elem.targets.reverse!
      prefered_target = radar_elem.targets.select{ |t| t.type == "T-X"}.first
      radar_elem.targets.delete(prefered_target)
      radar_elem.targets.insert(0, prefered_target)
      radar_elem
    end
  end

end
