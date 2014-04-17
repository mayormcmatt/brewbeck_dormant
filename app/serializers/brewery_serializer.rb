class BrewerySerializer < ActiveModel::Serializer

    attributes :id, :name, :breweryID, :address, :city, :state, :zipcode,
    :phone, :website, :latitude, :longitude, :logo

    has_many :beers
end
