class AddFieldsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :street_number, :integer
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :country, :string
    add_column :properties, :society, :string
    add_column :properties, :sector, :string
    add_column :properties, :phase, :string
  end
end
