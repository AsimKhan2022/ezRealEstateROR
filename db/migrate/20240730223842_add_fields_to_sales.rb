class AddFieldsToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :agent_commission, :decimal, precision: 10, scale: 2
    add_column :sales, :sales_agent_commission, :decimal, precision: 10, scale: 2
    add_column :sales, :sales_agent_id, :integer
  end
end
