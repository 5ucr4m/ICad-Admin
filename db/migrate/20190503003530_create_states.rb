# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string(:name)
      t.string(:abbreviation)
      t.string(:code)
      t.string(:reference)
      t.belongs_to(:country, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
