class SearchController < ApplicationController
  def index
    @zipcode = params[:q]
    @stations = Station.for_user(@zipcode)
  end
end
