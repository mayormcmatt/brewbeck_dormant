class PollBeersController < ApplicationController

    def show
        page_number = 1
        until page_number = 5
            response = Typhoeus.get("http://http://api.brewerydb.com/v2/beers?*&withBreweries=Y&key=5a0a2875bbd1e7931736df7a5672f65f&p=#{page_number}")
            parsed = JSON.parse(response.response_body)

            parsed["data"].each do |info|
                beer_stats = Beer.find_or_create_by(name: info["name"],
                    style_id: info["styleId"],
                    abv: info["abv"],
                    ibu: info["ibu"],
                    brewery_id: info["breweries"][0]["id"])
            end
            page_number += 1
        end
    end
end
