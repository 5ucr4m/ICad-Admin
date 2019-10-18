# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.integer :role_type
      t.boolean :admin
      t.string :slug

      t.timestamps
    end
  end
end
