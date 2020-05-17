# frozen_string_literal: true
class CreatePatientSoapProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_problems do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.belongs_to(:ciap_code, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:cid_code, foreign_key: { to_table: :generic_models }, index: true)
      t.text(:notes)
      t.boolean(:active_problem)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
