# frozen_string_literal: true

class CreateHealthConditionKidneys < ActiveRecord::Migration[6.0]
  def change
    create_table :health_condition_kidneys do |t|
      t.belongs_to :health_condition, foreign_key: true, index: true
      t.belongs_to :kidney_problem, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
