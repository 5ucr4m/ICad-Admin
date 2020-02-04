# frozen_string_literal: true

class CreateHealthEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :health_establishments do |t|
      t.string(:cnes_code)
      t.string(:unit_code)
      t.string(:legal_full_name)
      t.string(:fancy_name)
      t.string(:federal_registry)
      t.string(:state_registry)
      t.string(:manager_full_name)
      t.string(:manager_federal_registry)
      t.date(:registry_at)
      t.belongs_to(:unit_type, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
