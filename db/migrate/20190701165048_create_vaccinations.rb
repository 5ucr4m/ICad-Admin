# frozen_string_literal: true

class CreateVaccinations < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccinations do |t|
      t.string :uuid
      t.integer :tp_cds_origin
      t.belongs_to :vaccination_campaign, foreign_key: true, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
