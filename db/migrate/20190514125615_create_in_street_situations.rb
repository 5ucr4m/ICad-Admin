# frozen_string_literal: true

class CreateInStreetSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :in_street_situations do |t|
      t.string :kinship_degree
      t.string :other_accompanied
      t.belongs_to :meals_per_day, foreign_key: { to_table: :generic_models }, index: true
      t.boolean :has_other_accompanied
      t.boolean :familiar_reference
      t.boolean :receive_benefits
      t.boolean :in_street_situation
      t.boolean :has_personal_hygiene
      t.boolean :family_visit
      t.belongs_to :street_situation_time, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
