class AddDefaultValuesToProperties < ActiveRecord::Migration[7.1]
  def change
    change_column_default :properties, :footage_unit, from: nil, to: ""
    change_column_default :properties, :currency, from: nil, to: ""
  end
end
