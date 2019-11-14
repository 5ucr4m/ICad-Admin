# frozen_string_literal: true

class CreateVaccinationVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccination_vaccines do |t|
      t.belongs_to :vaccination, foreign_key: true, index: true
      t.belongs_to :vaccine, foreign_key: true, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
