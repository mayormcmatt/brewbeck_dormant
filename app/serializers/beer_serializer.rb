class BeerSerializer < ActiveModel::Serializer

    attributes :id, :name, :style_id, :abv, :ibu, :brewery_id

    # The following results in 'stack level too deep'
    # has_one :brewery
end
