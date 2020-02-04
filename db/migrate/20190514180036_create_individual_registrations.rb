# frozen_string_literal: true

class CreateIndividualRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :individual_registrations do |t|
      t.belongs_to(:health_condition, foreign_key: true, index: true)
      t.belongs_to(:in_street_situation, foreign_key: true, index: true)
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.belongs_to(:sociodemographic_info, foreign_key: true, index: true)
      t.belongs_to(:cancel_registration, foreign_key: true, index: true)
      t.boolean(:refuse_registration)
      t.boolean(:form_updated)
      t.string(:uuid)
      t.string(:uuid_form_origin)
      t.string(:uuid_citizen)
      t.string :uuid_form_update
      t.integer(:tp_cds_origin)
      t.datetime(:initial_date_hour)
      t.datetime(:final_date_hour)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.datetime(:service_at)
      t.string(:slug)

      t.timestamps
    end
  end
end
