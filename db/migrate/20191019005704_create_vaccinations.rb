# frozen_string_literal: true

class CreateVaccinations < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccinations do |t|
      t.string(:uuid)
      t.string(:tp_cds_origin)
      t.integer(:patient_type)
      t.belongs_to(:header_transport, foreign_key: true, index: true)
      t.belongs_to(:vaccination_campaign, foreign_key: true, index: true)
      t.belongs_to(:turn, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.belongs_to(:local_service, foreign_key: { to_table: :generic_models }, index: true)
      t.boolean(:traveller)
      t.boolean(:leprosy_communicant)
      t.boolean(:pregnant)
      t.boolean(:puerperal)
      t.datetime(:initial_date_hour)
      t.datetime(:final_date_hour)
      t.date(:deferral_date)
      t.boolean(:previous_dosage)
      t.belongs_to(:way_administration, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:local_application, foreign_key: { to_table: :generic_models }, index: true)
      t.text(:observation)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.datetime(:service_at)
      t.string(:slug)

      t.timestamps
    end
  end
end
