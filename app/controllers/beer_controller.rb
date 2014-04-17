require 'json'
require 'typhoeus'

class BeerController < ApplicationController

    def index
    end

    def show
        @beer = Beer.find(params[:id])
        respond_to do |format|
            format.html
            # Using ARS gem for JSON API; add 'root:false' to following line
            # to get rid of article root from JSON output
            format.json {render json: @beer}
        end
    end
end
