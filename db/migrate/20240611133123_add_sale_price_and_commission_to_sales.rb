class AddSalePriceAndCommissionToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :sale_price, :decimal
    add_column :sales, :commission, :decimal
  end
end
