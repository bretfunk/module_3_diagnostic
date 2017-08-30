class Station
  attr_reader :name, :address, :fuel_types, :access_times #:distance

  def initialize(attrs)
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @fuel_types = attrs[:fuel_type_code]
    #@distance = [:distance]
    @access_times = attrs[:access_days]
  end

  def self.for_user(zipcode)
    NrelService.stations(state).map do |raw_station|
      Station.new(raw_station)
    end
  end
end

