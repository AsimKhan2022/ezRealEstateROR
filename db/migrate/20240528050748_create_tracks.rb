class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.references :lead, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.integer :status
      t.text :description
      t.date :visit_date
      t.time :visit_time

      t.timestamps
    end
  end
end
