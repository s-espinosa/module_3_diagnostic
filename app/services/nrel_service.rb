class NRELService
  def self.find_stations(zip_code)
    json = JSON.parse(Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&format=JSON&location=80203&radius=6&fuel_type=ELEC,LPG").body)['fuel_stations']
    byebug
  end
end
