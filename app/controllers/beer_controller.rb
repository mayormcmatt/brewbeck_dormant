require 'json'
require 'typhoeus'

class BeerController < ApplicationController

    def index
        @beer = Beer.all
        respond_to do |format|
            format.html
            # Using ARS gem for JSON API; added 'root: false'...
            # to get rid of article root from JSON output
            format.json {render json: @beer, root: false}
        end
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
