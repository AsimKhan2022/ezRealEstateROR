class CreateTenants < ActiveRecord::Migration[7.1]
  def change
    create_table :tenants do |t|
      t.references :lead, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.string :title
      t.time :move_in_time
      t.date :move_in_date
      t.time :move_out_time
      t.date :move_out_date
      t.decimal :rent_price
      t.decimal :commission
      t.decimal :down_payment
      t.decimal :security_deposit
      t.text :terms
      t.text :property_condition
      t.text :utility_responsibility

      t.timestamps
    end
  end
end
