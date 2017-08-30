class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    @conn = Faraday.new(url: "https://api.data.gov") do |faraday|
      faraday.headers["API-X-KEY"] = ENV['nrel_key']
      faraday.adapter Faraday.default_adapter
    end
   byebug
  end
end
