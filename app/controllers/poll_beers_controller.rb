class PollBeersController < ApplicationController

    def show
        page_number = 1
        until page_number == 6
            response = Typhoeus.get("http://api.brewerydb.com/v2/beers?*&withBreweries=Y&key=5a0a2875bbd1e7931736df7a5672f65f&p=#{page_number}")
            parsed = JSON.parse(response.response_body)

            parsed["data"].each do |info|
                beer_stats = Beer.find_or_create_by(name: info["name"])
                beer_stats.style_id = info["styleId"]
                beer_stats.abv = info["abv"]
                beer_stats.ibu = info["ibu"]
                # Can't figure out how to get the brewery_id from API call into model
                # For now leave it; when implemented don't forget to
                # move the comma and parenthesis
                if beer_stats.brewery_id == 0 || nil
                    begin
                        beer_stats.brewery_id = info["breweries"][0]["id"]
                    rescue
                        beer_stats.brewery_id = "No brewery information"
                    end
                end
                beer_stats.save
            end
            page_number += 1
        end
    end
end
