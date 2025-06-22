class AddFieldsToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :username, :string
    add_column :admins, :avatar, :string
    add_column :admins, :telephone, :string
    add_column :admins, :mobile_phone, :string
  end
end
