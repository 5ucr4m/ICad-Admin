# frozen_string_literal: true
class CreatePatientConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_conditions do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.belongs_to(:ciap_code, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:cid_code, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:other_condition)
      t.integer(:year_initial)
      t.integer(:month_initial)
      t.integer(:day_initial)
      t.integer(:years_initial)
      t.integer(:months_initial)
      t.string(:observations)
      t.integer(:situation)
      t.date(:last_update)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
