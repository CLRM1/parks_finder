class WelcomeController < ApplicationController
  def index
    connection = Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['national_parks_api_key']
    end

    response = connection.get("/api/v1/parks")
    JSON.parse(response.body, symbolize_names: true)
  end
end
