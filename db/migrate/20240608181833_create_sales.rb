class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.boolean :property_verified
      t.boolean :mortgage_cleared
      t.date :sale_date
      t.time :sale_time

      t.timestamps
    end
  end
end
