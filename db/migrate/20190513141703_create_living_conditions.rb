# frozen_string_literal: true

class CreateLivingConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :living_conditions do |t|
      t.belongs_to(:water_supply, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:rural_production_area, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:garbage_disposal, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:bathroom_drainage, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:home_location, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:home_wall_material, foreign_key: { to_table: :generic_models }, index: true)
      t.integer(:rooms)
      t.integer(:residents)
      t.belongs_to(:home_situation, foreign_key: { to_table: :generic_models }, index: true)
      t.boolean(:electric_power)
      t.belongs_to(:home_access, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:home_type, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:water_treatment, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
