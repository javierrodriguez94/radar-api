class Radar::CreationService
  attr_reader :params

  class << self
    def call(params)
      new(params).create_radar
    end
  end

  def initialize(params)
    @params = params
  end

  def create_radar
    radar_elems = build_radar_elems
    radar_elems.delete(nil)
    mode = params.fetch("attack-mode")
    Radar.new(mode, radar_elems)
  end

  private

  def build_radar_elems
    params.fetch("radar").map do |radar_elem_params|
      begin
        position = create_radar_position(radar_elem_params)
        targets = create_targets(radar_elem_params)
        RadarElem.new(position, targets)
      rescue
        next
      end
    end
  end

  def create_radar_position(radar_elem_params)
    position_params = radar_elem_params.fetch("position")
    Position.new(position_params.fetch("x"), position_params.fetch("y"))
  end

  def create_targets(radar_elem_params)
    targets_params = radar_elem_params.fetch("targets")
    targets_params.map do |target_params|
      type = target_params.fetch("type")
      damage = target_params.fetch("damage", nil)
      Target.new(type, damage)
    end
  end
end
