class CreateRolePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :role_permissions do |t|
      t.belongs_to :role, foreign_key: true, index: true
      t.belongs_to :permission, foreign_key: true, index: true
      t.string :slug
      t.belongs_to :company, foreign_key: true, index: true

      t.timestamps
    end
  end
end
