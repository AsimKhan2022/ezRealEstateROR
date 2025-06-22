class CreateSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :home_address
      t.string :business_address
      t.string :email
      t.string :mobile
      t.string :telephone
      t.string :fax
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
