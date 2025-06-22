class AddFieldsToViolations < ActiveRecord::Migration[7.1]
  def change
    add_column :violations, :title, :string
    add_column :violations, :fine, :decimal
    add_column :violations, :due_date, :date
    add_column :violations, :paid_date, :date
  end
end
