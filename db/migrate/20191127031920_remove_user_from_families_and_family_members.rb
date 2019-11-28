class RemoveUserFromFamiliesAndFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :families, :user_id
    remove_column :family_members, :user_id
  end
end
