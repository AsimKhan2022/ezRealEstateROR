class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.string :email
      t.string :avatar
      t.json :documents
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
