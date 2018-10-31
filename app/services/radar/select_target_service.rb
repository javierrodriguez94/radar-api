class Radar::SelectTargetService

  class << self
    def call(radar)
      new(radar).select_target
    end
  end

  def initialize(radar)
    @radar = radar
  end

  def select_target
    mode = @radar.mode
    raise ArgumentError unless mode

    if mode.is_a?(Array) && mode.size > 1
      sorted_target = select_and_order_multi_mode_target
    else
      mode = mode.first if mode.is_a?(Array)
      selected_target = select_target_single_mode(mode)
      sorted_target = order_target_by_mode(mode, selected_target)
    end
    format_target(sorted_target)
  end

private

  def select_and_order_multi_mode_target
    selected_targets = @radar.mode.map do |mode|
      Array(select_target_single_mode(mode))
    end
    selected_target = selected_targets.reduce(:&).first
    @radar.mode.each do |mode|
      selected_target = order_target_by_mode(mode, selected_target)
    end
    selected_target
  end

  def select_target_single_mode(mode)
    service = mode_service(mode)
    service.select_target_with_strategy(@radar.radar_elems)
  end

  def order_target_by_mode(mode, target)
    service = mode_service(mode)
    service.order_specific_target(target)
  end

  def mode_service(mode)
    case mode
    when "closest-first"
      Radar::Targeting::ClosestFirstService
    when "furthest-first"
      Radar::Targeting::FurthestFirstService
    when "priorize-t-x"
      Radar::Targeting::PriorizeTxService
    when "avoid-crossfire"
      Radar::Targeting::AvoidCrossfireService
    else
      raise ArgumentError "Unknown attack-mode"
    end
  end

  def format_target(target)
    {
      "position": target.position,
      "targets": target.targets.select{ |t| t.damage }.map(&:type)
    }
  end

end
