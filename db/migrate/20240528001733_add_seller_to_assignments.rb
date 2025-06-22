class AddSellerToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_reference :assignments, :seller, null: false, foreign_key: true
  end
end
