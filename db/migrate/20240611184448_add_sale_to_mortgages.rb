class AddSaleToMortgages < ActiveRecord::Migration[7.1]
  def change
    add_reference :mortgages, :sale, null: false, foreign_key: true
  end
end
