class NrelService
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new(url: "https://api.data.gov") do |faraday|
      faraday.headers["X-Api-Key"] = ENV['nrel_key']
      faraday.adapter Faraday.default_adapter
    end
  end
    #@response = @conn.get("/nrel/alt-fuel-stations/v1.json?limit=10")
    #@parsed = JSON.parse(@response.body, symbolize_names: true)[:fuel_stations]

    def self.stations(zipcode)
      NrelService.new(zipcode).stations
    end

    def stations
      get_url("/nrel/alt-fuel-stations/v1.json?location=#{zipcode}limit=10")
    end

    def get_url(url)
      @conn.get(url)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
