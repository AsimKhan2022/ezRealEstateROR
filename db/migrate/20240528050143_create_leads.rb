class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
