# frozen_string_literal: true

class CreateGenericModels < ActiveRecord::Migration[6.0]
  def change
    create_table :generic_models do |t|
      t.string :name
      t.string :description
      t.string :reference
      t.string :generic_field
      t.string :generic_class
      t.belongs_to :generic_model, null: true, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
