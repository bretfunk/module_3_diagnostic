class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    @conn = Faraday.new(url: "https://api.data.gov") do |faraday|
      faraday.headers["X-Api-Key"] = ENV['nrel_key']
      faraday.adapter Faraday.default_adapter
    end
    @response = @conn.get("/nrel/alt-fuel-stations/v1.json?limit=10")
    @parsed = JSON.parse(@response.body, symbolize_names: true)

    @stations = @parsed.map do |raw_station|
      Station.new(raw_station)
    end
  end
end
