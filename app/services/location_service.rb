# app/services/location_service.rb
class LocationService
  include HTTParty
  base_uri 'https://www.universal-tutorial.com/api'

  # Initialize with headers that will be required for every request
  def initialize
    @headers = {
      'Authorization' => "Bearer #{Rails.application.credentials.universal_tutorial_api_key}",
      'Accept' => 'application/json'
    }
  end

  # Fetch countries
  def countries
    self.class.get('/countries', headers: @headers)
  end

  # Fetch states for a given country
  def states(country_code)
    self.class.get("/states/#{country_code}", headers: @headers)
  end

  # Fetch cities for a given state and country
  def cities(country_code, state_code)
    self.class.get("/cities/#{country_code}/#{state_code}", headers: @headers)
  end
end
