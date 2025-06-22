class AddTitleAndValidityToConditions < ActiveRecord::Migration[7.1]
  def change
    add_column :conditions, :title, :string
    add_column :conditions, :validity, :date
  end
end
