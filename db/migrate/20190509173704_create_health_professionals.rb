# frozen_string_literal: true

class CreateHealthProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :health_professionals do |t|
      t.string(:cns_code)
      t.belongs_to(:cbo_code, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:full_name)
      t.string(:federal_registry)
      t.string(:state_registry)
      t.string(:phone)
      t.belongs_to(:professional_team, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
