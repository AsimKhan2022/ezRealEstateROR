class CreateConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :conditions do |t|
      t.references :tenant, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
