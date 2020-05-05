# frozen_string_literal: true
class CreatePatientMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_medicines do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.date(:prescription)
      t.date(:conclusion)
      t.string(:concentration)
      t.string(:dose)
      t.boolean(:unique_dose)
      t.boolean(:continuous_use)
      t.string(:dose_frequency)
      t.date(:treatment_date)
      t.integer(:treatment)
      t.integer(:treatment_type)
      t.text(:recommendations)
      t.integer(:supply) # Fornecimento
      t.string(:slug)
      t.belongs_to(:medicine, foreign_key: true, index: true)
      t.belongs_to(:pharmaceutical_form, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:way_administration, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:recipe_type, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
