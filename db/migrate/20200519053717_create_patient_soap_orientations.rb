# frozen_string_literal: true
class CreatePatientSoapOrientations < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_orientations do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.text(:orientation)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
