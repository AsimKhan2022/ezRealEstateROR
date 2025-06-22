class AddFootageUnitAndCurrencyToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :footage_unit, :string
    add_column :properties, :currency, :string
  end
end
