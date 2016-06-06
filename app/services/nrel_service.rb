class NRELService
  def self.find_stations(zip_code)
    json = JSON.parse(Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_key']}&format=JSON&location=80203&radius=6&fuel_type=ELEC,LPG&limit=10").body)['fuel_stations']
  end
end
