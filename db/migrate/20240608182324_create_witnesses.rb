class CreateWitnesses < ActiveRecord::Migration[7.1]
  def change
    create_table :witnesses do |t|
      t.string :cnic
      t.string :phone
      t.string :name
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
