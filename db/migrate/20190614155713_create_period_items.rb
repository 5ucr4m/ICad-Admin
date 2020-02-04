# frozen_string_literal: true

class CreatePeriodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :period_items do |t|
      t.string(:serialized_uuid)
      t.belongs_to(:serialized_type, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:serialized_cnes)
      t.string(:ibge_code)
      t.string(:serialized_ine)
      t.string(:lot_number)
      t.string(:sender_counter_key)
      t.string(:sender_installation_uuid)
      t.string(:sender_federal_registry)
      t.string(:sender_legal_name)
      t.string(:sender_phone)
      t.string(:sender_email)
      t.string(:sender_software_version)
      t.string(:sender_database_name)
      t.string(:origin_counter_key)
      t.string(:origin_installation_uuid)
      t.string(:origin_federal_registry)
      t.string(:origin_legal_name)
      t.string(:origin_phone)
      t.string(:origin_email)
      t.string(:origin_software_version)
      t.string(:origin_database_name)
      t.string(:app_version)
      t.belongs_to(:period, foreign_key: true, index: true)
      t.references(:registrable, polymorphic: true)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
