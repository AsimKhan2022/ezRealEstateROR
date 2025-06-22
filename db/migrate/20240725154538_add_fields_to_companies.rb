class AddFieldsToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :secondary_email, :string
    add_column :companies, :mobile, :string
    add_column :companies, :fax, :string
    add_column :companies, :whatsapp, :string
    add_column :companies, :state, :string
    add_column :companies, :city, :string
    add_column :companies, :country, :string
    add_column :companies, :street_number, :string
    add_column :companies, :society, :string
    add_column :companies, :sector, :string
    add_column :companies, :phase, :string
    add_column :companies, :license_certificates, :json
    add_column :companies, :tax_certificates, :json
  end
end
