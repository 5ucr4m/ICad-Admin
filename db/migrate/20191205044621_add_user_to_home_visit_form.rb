class AddUserToHomeVisitForm < ActiveRecord::Migration[6.0]
  def change
    add_reference :home_visit_forms, :user, foreign_key: true, index: true
  end
end
