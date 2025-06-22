class ChangeTermsToArrayInTenants < ActiveRecord::Migration[7.1]
  def change
	remove_column :tenants, :terms, :text
    add_column :tenants, :terms, :text, array: true, default: []
  end
end
