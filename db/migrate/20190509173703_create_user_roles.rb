class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.belongs_to :user_company, foreign_key: true, index: true
      t.belongs_to :role, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
