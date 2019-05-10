class CreateOtherHealthConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :other_health_conditions do |t|
      t.belongs_to :health_condition, foreign_key: true, index: true
      t.belongs_to :health_condition_type, foreign_key: {to_table: :generic_models}, index: true
      t.text :description
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
