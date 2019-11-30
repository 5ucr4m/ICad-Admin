class AddUserToFamilyAndFamilyMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :families, :user, foreign_key: true, index: true
    add_reference :family_members, :user, foreign_key: true, index: true
  end
end
