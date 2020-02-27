# frozen_string_literal: true
class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.belongs_to(:company, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.belongs_to(:role, foreign_key: true, index: true)
      t.boolean(:current_company, default: true)
      t.integer(:current_module)
      t.string(:slug)

      t.timestamps
    end
  end
end
