require 'rails_helper'

RSpec.describe "When a user searches by zip" do
  it "a list of stations is presented" do
    VCR.use_cassette("search_by_zip") do
      visit '/'
      fill_in "q", with: "80203"
      click_on("Locate")

      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end
  end
end
