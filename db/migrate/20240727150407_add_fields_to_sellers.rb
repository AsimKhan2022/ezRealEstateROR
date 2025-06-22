class AddFieldsToSellers < ActiveRecord::Migration[7.1]
  def change
    add_column :sellers, :home_address_street_number, :integer
    add_column :sellers, :business_address_street_number, :integer
    add_column :sellers, :home_address_city, :string
    add_column :sellers, :business_address_city, :string
    add_column :sellers, :home_address_state, :string
    add_column :sellers, :business_address_state, :string
    add_column :sellers, :home_address_country, :string
    add_column :sellers, :business_address_country, :string
    add_column :sellers, :home_address_society, :string
    add_column :sellers, :business_address_society, :string
    add_column :sellers, :home_address_sector, :integer
    add_column :sellers, :business_address_sector, :integer
    add_column :sellers, :home_address_phase, :string
    add_column :sellers, :business_address_phase, :string
    add_column :sellers, :whatsapp, :string
  end
end
