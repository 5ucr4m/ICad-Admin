# frozen_string_literal: true

class CreateHomeVisitForms < ActiveRecord::Migration[6.0]
  def change
    create_table :home_visit_forms do |t|
      t.belongs_to :home_visit_registration, foreign_key: true, index: true
      t.belongs_to :turn, foreign_key: { to_table: :generic_models }, index: true
      t.string :handbook_number
      t.string :cns_number
      t.date :birth_date
      t.belongs_to :gender, foreign_key: { to_table: :generic_models }, index: true
      t.boolean :other_visit
      t.belongs_to :outcome, foreign_key: { to_table: :generic_models }, index: true
      t.string :micro_area
      t.boolean :out_area
      t.belongs_to :home_type, foreign_key: { to_table: :generic_models }, index: true
      t.string :weight_monitoring
      t.string :height_monitoring
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
