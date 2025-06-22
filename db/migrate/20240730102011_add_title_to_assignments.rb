class AddTitleToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :title, :string
  end
end
