# frozen_string_literal: true
class CreatePatientSoapExams < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_exams do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.belongs_to(:exam, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:cid_code, foreign_key: { to_table: :generic_models }, index: true)
      t.date(:request_date)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.date(:accomplishment_date)
      t.date(:result_date)
      t.text(:description)
      t.string(:glycated_hemoglobin)
      t.text(:procedure_justification)
      t.text(:observation)
      t.boolean(:high_cost)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.date(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
