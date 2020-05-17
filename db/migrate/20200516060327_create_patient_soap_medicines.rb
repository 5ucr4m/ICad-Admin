# frozen_string_literal: true
class CreatePatientSoapMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_medicines do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.belongs_to(:medicine, foreign_key: true, index: true)
      t.string(:concentration)
      t.belongs_to(:pharmaceutical_form, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:administration_way, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:recipe_type, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:dose)
      t.string(:unique_dose)
      t.string(:continuous_dose)
      t.belongs_to(:dose_frequency_type, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:dose_frequency)
      t.string(:dose_quantity)
      t.date(:treatment_date)
      t.belongs_to(:duration_type, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:duration)
      t.text(:recommendations)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
