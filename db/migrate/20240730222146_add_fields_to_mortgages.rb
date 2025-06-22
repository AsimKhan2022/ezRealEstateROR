class AddFieldsToMortgages < ActiveRecord::Migration[7.1]
  def change
    add_column :mortgages, :interest_rate, :decimal
    add_column :mortgages, :actual_cost, :decimal
    add_column :mortgages, :balance, :decimal
  end
end
