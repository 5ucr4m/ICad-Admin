# frozen_string_literal: true

class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.belongs_to :home_registration, foreign_key: true, index: true
      t.date :responsible_birth_date
      t.string :responsible_cns_number
      t.integer :members_quantity
      t.string :handbook_number
      t.integer :family_income_cents
      t.date :reside_since
      t.boolean :moving
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
