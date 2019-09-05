# frozen_string_literal: true

class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|
      t.date :competence
      t.date :start_date
      t.date :end_date
      t.date :deadline
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
