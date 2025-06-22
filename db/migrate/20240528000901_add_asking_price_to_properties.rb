class AddAskingPriceToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :asking_price, :decimal
  end
end
