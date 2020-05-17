# frozen_string_literal: true
class CreatePatientSoapCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_certificates do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.boolean(:blank_certificate)
      t.boolean(:default_certificate)
      t.boolean(:maternity_license)
      t.text(:description)
      t.datetime(:issue_date)
      t.belongs_to(:cid_code, foreign_key: { to_table: :generic_models }, index: true)
      t.boolean(:print_cid_code)
      t.integer(:days)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
