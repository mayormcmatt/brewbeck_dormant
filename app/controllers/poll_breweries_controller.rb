class PollBreweriesController < ApplicationController
    def show
        page_number = 1
        # key = ENV['api_key']
        until page_number == 5 # Set page 5 as temp. cut-off; real cut-off is 114
        # Get rid of that key when it's time to push to production
            response = Typhoeus.get("http://api.brewerydb.com/v2/locations?locality*&key=5a0a2875bbd1e7931736df7a5672f65f&p=#{page_number}")
            parsed = JSON.parse(response.response_body)

            parsed["data"].each do |info|
            brewery_stats = Brewery.find_or_create_by(breweryID: info["id"],
                name: info["name"],
                address: info["streetAddress"],
                city: info["locality"],
                state: info["region"],
                zipcode: info["postalCode"],
                phone: info["phone"],
                website: info["website"],
                latitude: info["latitude"],
                longitude: info["longitude"])
            end
            page_number += 1
        end
    end
end
