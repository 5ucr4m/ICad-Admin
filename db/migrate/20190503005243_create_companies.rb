# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :legal_full_name
      t.string :fancy_name
      t.string :federal_registry
      t.string :state_registry
      t.string :patio
      t.string :number
      t.string :zip
      t.string :reference
      t.string :district
      t.belongs_to :city, foreign_key: true, index: true
      t.string :complement
      t.string :slug

      t.timestamps
    end
  end
end
