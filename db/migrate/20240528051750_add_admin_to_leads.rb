class AddAdminToLeads < ActiveRecord::Migration[7.1]
  def change
    add_reference :leads, :admin, null: false, foreign_key: true
  end
end
