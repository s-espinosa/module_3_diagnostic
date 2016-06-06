class SearchController < ApplicationController
  def index
    byebug
    @stations = NRELService.find_stations(params[:q])
  end
end
