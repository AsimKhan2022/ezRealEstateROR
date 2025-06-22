class AddInvestigatorIdToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :investigator_id, :integer
  end
end
