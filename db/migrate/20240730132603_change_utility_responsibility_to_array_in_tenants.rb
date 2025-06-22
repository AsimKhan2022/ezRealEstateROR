class ChangeUtilityResponsibilityToArrayInTenants < ActiveRecord::Migration[7.1]
  def change
	remove_column :tenants, :utility_responsibility, :text
	add_column :tenants, :utility_responsibility, :string, array: true, default: [], using: "(string_to_array(utility_responsibility, ','))"
  end
end
