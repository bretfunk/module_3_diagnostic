require 'rails_helper'

feature "Fuel Stations by Zip" do
  scenario "User sees fuel stations by zip" do
#As a user
#When I visit "/"
visit "/"
#And I fill in the search form with 80203
fill_in('q', :with => '80203')
#And I click "Locate"
click_on('Locate')
VCR.use_cassette("spec/fuel_station_by_zip")
#Then I should be on page "/search" with parameters visible in the url
expect(current_path).to eq(search_path)
#Then I should see a list of the 10 closest stations within 6 miles sorted by distance
expect(page).to have_content('station', count: 10)
#And the stations should be limited to Electric and Propane
#FIGURE OUT
#And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
expect(page).to have_css('Name')
expect(page).to have_css('Address')
expect(page).to have_css('Fuel Types')
expect(page).to have_css('Distance')
expect(page).to have_css('Access Times')

  end
end
