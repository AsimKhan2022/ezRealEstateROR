class AddFieldsToWitnesses < ActiveRecord::Migration[7.1]
  def change
    add_column :witnesses, :address, :string
    add_column :witnesses, :whatsapp, :string
    add_column :witnesses, :email, :string
  end
end
