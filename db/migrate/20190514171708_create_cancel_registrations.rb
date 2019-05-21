# frozen_string_literal: true

class CreateCancelRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :cancel_registrations do |t|
      t.belongs_to :left_reason, foreign_key: { to_table: :generic_models }, index: true
      t.date :decease_date
      t.date :decease_number
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
