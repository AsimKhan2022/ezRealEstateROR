class CreateAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :amenities do |t|
      t.string :amenity_type
      t.string :name
      t.string :capacity
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
