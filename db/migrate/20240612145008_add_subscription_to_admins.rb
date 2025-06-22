class AddSubscriptionToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :subscription_type, :string
    add_column :admins, :subscription_start_date, :date
    add_column :admins, :subscription_end_date, :date
    add_column :admins, :trial_start_date, :date
  end
end
