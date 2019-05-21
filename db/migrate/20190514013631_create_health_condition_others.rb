# frozen_string_literal: true

class CreateHealthConditionOthers < ActiveRecord::Migration[6.0]
  def change
    create_table :health_condition_others do |t|
      t.belongs_to :health_condition, foreign_key: true, index: true
      t.text :description
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
