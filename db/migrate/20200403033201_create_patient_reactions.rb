# frozen_string_literal: true
class CreatePatientReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_reactions do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.belongs_to(:reaction, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:agent_substance)
      t.text(:manifestations)
      t.integer(:criticity)
      t.date(:installation_date)
      t.text(:evolution)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
