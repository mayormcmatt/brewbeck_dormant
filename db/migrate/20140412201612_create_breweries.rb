class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.text :name
      t.text :breweryID
      t.text :address
      t.text :city
      t.text :state
      t.integer :zipcode
      t.text :phone
      t.text :website
      t.float :latitude
      t.float :longitude
      t.text :logo

      t.timestamps
    end
  end
end
