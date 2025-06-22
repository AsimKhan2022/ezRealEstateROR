class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :location
      t.string :property_type
      t.string :listing_status
      t.integer :square_footage
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :year_built
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
