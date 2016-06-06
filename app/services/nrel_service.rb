class NRELService
  def self.find_stations(zip_code, distance = "6.0", fuel_type = "ELEC,LPG")
    json = JSON.parse(Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&format=JSON&location=#{zip_code}&radius=#{distance}&fuel_type=#{fuel_type}").body)['fuel_stations']
  end
end
