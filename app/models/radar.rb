class Radar
  attr_reader :mode, :radar_elems

  def initialize(mode, radar_elems)
    @mode = mode
    @radar_elems = radar_elems
  end

  def target
    @selected_target ||= find_target
  end

private

  def find_target
    Radar::SelectTargetService.call(self)
  end
end
