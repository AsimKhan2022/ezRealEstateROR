class AddIsVerifiedToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :is_verified, :boolean
  end
end
