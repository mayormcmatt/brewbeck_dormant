require 'json'
require 'typhoeus'

class BreweryController < ApplicationController

    def index
    end

    def show
        @brewery = Brewery.find(params[:id])
        respond_to do |format|
            format.html
            # Using ARS gem for JSON API; add 'root:false' to following line
            # to get rid of article root from JSON output
            format.json {render json: @brewery}
        end
    end
end
