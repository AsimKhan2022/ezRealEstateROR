class RemoveLocationFromProperties < ActiveRecord::Migration[7.1]
  def change
    remove_column :properties, :location, :string
  end
end
