class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(attrs)
    byebug
    @name = attrs[:name]
    @address = attrs[:address]
    @fuel_types = attrs[:fuel_types]
    @distance = [:distance]
    @access_times = attrs[:access_times]

  end
end

