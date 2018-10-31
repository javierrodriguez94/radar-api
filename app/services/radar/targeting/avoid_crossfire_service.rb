class Radar::Targeting::AvoidCrossfireService

  class << self
    def select_target_with_strategy(radar_elems)
      radar_elems.reject { |t| t.targets.map(&:type).include?("Human") }
    end

    def order_specific_target(radar_elem)
      # Default order by damage
      radar_elem.is_a?(Array) ? multiple_targets_order(radar_elem) : single_target_order(radar_elem)
    end

  private

    def multiple_targets_order(radar_elems)
      # We choose the radar_elem wich targets sums the bigger damage
      radar_elem = radar_elems.sort{ |a,b| a.targets.map(&:damage).sum <=> b.targets.map(&:damage).sum }.last
      single_target_order(radar_elem)
    end

    def single_target_order(radar_elem)
      radar_elem.targets.sort_by!(&:damage)
      radar_elem.targets.reverse!
      radar_elem
    end
  end
end
