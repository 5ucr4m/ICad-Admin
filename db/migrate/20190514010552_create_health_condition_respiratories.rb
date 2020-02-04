# frozen_string_literal: true

class CreateHealthConditionRespiratories < ActiveRecord::Migration[6.0]
  def change
    create_table :health_condition_respiratories do |t|
      t.belongs_to(:health_condition, foreign_key: true, index: true)
      t.belongs_to(:disease_type, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:company, foreign_key: true)
      t.datetime(:discarded_at)
      t.string(:slug)

      t.timestamps
    end
  end
end
