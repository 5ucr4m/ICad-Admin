# frozen_string_literal: true

class CreateHomeRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :home_registrations do |t|
      t.string :location_x
      t.string :location_y
      t.belongs_to :health_professional, foreign_key: true, index: true
      t.belongs_to :living_condition, foreign_key: true, index: true
      t.belongs_to :address, foreign_key: true, index: true
      t.boolean :form_updated
      t.integer :pet_quantity
      t.boolean :refuse_registration
      t.integer :tp_cds_origin
      t.string :uuid
      t.string :uuid_form_origin
      t.belongs_to :home_type, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :permanence_institution, foreign_key: true, index: true
      t.boolean :finished
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug
      t.belongs_to :user

      t.timestamps
    end
  end
end
