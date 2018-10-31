class RadarController < ApplicationController

  def create
    radar = Radar::CreationService.call(params)
    render json: radar.target
  end
end
