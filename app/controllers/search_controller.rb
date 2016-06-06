class SearchController < ApplicationController
  def index
    @stations = NRELService.find_stations(params[:q])
  end
end
