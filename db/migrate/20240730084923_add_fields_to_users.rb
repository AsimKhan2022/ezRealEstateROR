class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :whatsapp, :string
    add_column :users, :secondary_email, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phase, :string
    add_column :users, :sector, :string
    add_column :users, :street_number, :integer
  end
end
