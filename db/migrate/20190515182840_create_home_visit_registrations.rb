# frozen_string_literal: true

class CreateHomeVisitRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :home_visit_registrations do |t|
      t.belongs_to :family_member, foreign_key: true, index: true
      t.string :uuid
      t.string :tp_cds_origin
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
