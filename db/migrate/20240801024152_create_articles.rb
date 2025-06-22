class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :story
      t.json :images
      t.text :headlines
      t.string :sub_title
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
