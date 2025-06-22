class CreateMortgages < ActiveRecord::Migration[7.1]
  def change
    create_table :mortgages do |t|
      t.references :sales, null: false, foreign_key: true
      t.text :description
      t.decimal :outstanding_amount
      t.date :next_due_date
      t.decimal :paid_amount

      t.timestamps
    end
  end
end
