require 'rails_helper'

RSpec.describe "When a user searches by zip with a distance" do
  it "a list of stations is presented" do
    VCR.use_cassette("search_with_limited_distance") do
      visit '/'
      fill_in "q", with: "80203"
      fill_in "distance", with: "5"
      click_on("Locate")

      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
      within(pagination) do
        expect(page).to have_content("7")
      end
    end
  end
end
