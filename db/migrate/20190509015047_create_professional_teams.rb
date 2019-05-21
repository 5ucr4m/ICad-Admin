# frozen_string_literal: true

class CreateProfessionalTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_teams do |t|
      t.string :name
      t.string :code
      t.boolean :active
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
