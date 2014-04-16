class PollController < ApplicationController
  def show
    page_number = 1
        # key = ENV['api_key']
        until page_number == 5 # Set page 5 as temp. cut-off
            # Get rid of that key when it's time to push to production
            response = Typhoeus.get("http://api.brewerydb.com/v2/locations?locality*&key=5a0a2875bbd1e7931736df7a5672f65f&p=#{page_number}")
            parsed = JSON.parse(response.response_body)

            parsed["data"].each do |info|
                brewery_stats = Brewery.find_or_create_by(breweryID: info["id"])
                brewery_stats.name = info["name"]
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
            page_number += 1
        end
  end
end
