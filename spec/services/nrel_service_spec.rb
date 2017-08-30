require 'rails_helper'

describe "NREL Service API" do
  it "API should return correct data" do
    VCR.use_cassette("spec/nrel_service")
    stations = NrelService.stations(80230)
    station = station.first

    expect(stations.class).to eq(Array)
    expect(stations.count).to eq(10)
    expect(station.name).to eq("Alagasco Montgomery Operations Center")
    expect(station.address).to eq("2951 Chestnut St")
    expect(station.fuel_types).to eq("CNG")
    #expect(station.access_times).to eq(nil)
  end
end
