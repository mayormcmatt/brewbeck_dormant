class BeerSerializer < ActiveModel::Serializer

  attributes :id, :name, :style_id, :abv, :ibu, :brewery_id

  belongs_to :brewery
end
