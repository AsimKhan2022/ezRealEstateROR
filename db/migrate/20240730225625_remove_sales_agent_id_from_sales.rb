class RemoveSalesAgentIdFromSales < ActiveRecord::Migration[7.1]
  def change
    remove_column :sales, :sales_agent_id, :integer
  end
end
