# frozen_string_literal: true
class CreatePatientSoapExams < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_exams do |t|
      t.belongs_to(:patient_soap_objective, foreign_key: true, index: true)
      t.belongs_to(:exam, foreign_key: { to_table: :generic_models }, index: true)
      t.date(:request_date)
      t.string(:hemoglobin_glycated)
      t.date(:realization_date)
      t.date(:result_date)
      t.text(:description)
      t.text(:justification)
      t.text(:observation)
      t.boolean(:high_cost)
      t.belongs_to(:cid_code, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
