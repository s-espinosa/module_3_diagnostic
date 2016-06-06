require 'rails_helper'

RSpec.describe "When a user searches by zip" do
  it "a list of stations is presented" do
    VCR.use_cassette("search_by_zip") do
      # As a user
      # When I visit "/"
      visit '/'
      # And I fill in the search form with 80203
      fill_in "q", with: "80203"
      # And I click "Locate"
      click_on("Locate")

      save_and_open_page
      # Then I should be on page "/search?zip=80203"
      # expect(current_path).to eq("/search?zip=80203")
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end
  end
end
