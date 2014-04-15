require 'json'
require 'typhoeus'

class BreweryController < ApplicationController
    def poll_brewery
        response = Typhoeus.get("http://api.brewerydb.com/v2/locations?locality*")
        parsed = JSON.parse(response.response_body)

        parsed["data"].each do |info|
            brewery_stats = Brewery.find_or_create_by(name: info["name"])
            brewery_stats.breweryID = info["id"]
            brewery_stats.address = info["streetAddress"]
            brewery_stats.city = info["locality"]
            brewery_stats.state = info["region"]
            brewery_stats.zipcode = info["postalCode"]
            brewery_stats.phone = info["phone"]
            brewery_stats.website = info["website"]
            brewery_stats.latitude = info["latitude"]
            brewery_stats.longitude = info["longitude"]
            brewery_stats.logo = info[""]
        end
    end
end
