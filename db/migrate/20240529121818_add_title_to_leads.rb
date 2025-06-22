class AddTitleToLeads < ActiveRecord::Migration[7.1]
  def change
    add_column :leads, :title, :string
  end
end
