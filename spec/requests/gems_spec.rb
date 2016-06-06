require 'rails_helper'

RSpec.describe "Sending a request to the NREL API" do
  it "returns data" do
    VCR.use_cassette("gem_test") do
      response =  Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=2&api_key=#{ENV['nrel_key']}&format=JSON")

      body = JSON.parse(response.body)

      expect(body.count).to eq(4)
    end
  end
end
