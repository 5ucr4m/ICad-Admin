# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string(:name)
      t.string(:abbreviation)
      t.string(:code)
      t.belongs_to(:state, foreign_key: true, index: true)
      t.string(:reference)
      t.string(:slug)

      t.timestamps
    end
  end
end
