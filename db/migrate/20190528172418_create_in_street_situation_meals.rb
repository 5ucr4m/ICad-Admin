# frozen_string_literal: true

class CreateInStreetSituationMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :in_street_situation_meals do |t|
      t.belongs_to :in_street_situation, foreign_key: true, index: true
      t.belongs_to :meal_origin_type, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
