class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :name
      t.integer :style_id
      t.integer :abv
      t.integer :ibu

      t.timestamps
    end
  end
end
