class SearchController < ApplicationController
  def index
    page = params[:page]
    if params[:distance] == ""
      stations = NRELService.find_stations(params[:q], params[:distance])
    else
      stations = NRELService.find_stations(params[:q], params[:distance], "all")
    end
    # would like to put this into a hash/presenter
    @stations = stations[(page.to_i-1)*10..(page.to_i*10)-1]
    @pages = stations.count / 10
    @zip = params[:q]
    @distance = params[:distance]
  end
end
