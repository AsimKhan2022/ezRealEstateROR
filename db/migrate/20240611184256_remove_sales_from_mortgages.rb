class RemoveSalesFromMortgages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :mortgages, :sales, null: false, foreign_key: true
  end
end
