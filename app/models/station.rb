class Station
  attr_reader :name, :address, :fuel_types, :access_times #:distance

  def initialize(attrs)
    byebug
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @fuel_types = attrs[:fuel_type_code]
    #@distance = [:distance]
    @access_times = attrs[:access_days]

  end
end

