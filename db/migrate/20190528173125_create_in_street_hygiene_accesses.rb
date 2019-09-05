# frozen_string_literal: true

class CreateInStreetHygieneAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :in_street_hygiene_accesses do |t|
      t.belongs_to :in_street_situation, foreign_key: true, index: true
      t.belongs_to :hygiene_access, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
