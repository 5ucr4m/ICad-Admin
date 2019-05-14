class CreateIndividualRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :individual_registrations do |t|
      t.belongs_to :health_condition, foreign_key: true, index: true
      t.belongs_to :in_street_situation, foreign_key: true, index: true
      t.belongs_to :family_member, foreign_key: true, index: true
      t.belongs_to :sociodemographic_info, foreign_key: true, index: true
      t.belongs_to :cancel_registration, foreign_key: true, index: true
      t.boolean :refuse_registration
      t.boolean :form_updated
      t.string :uuid
      t.string :uuid_form_origin
      t.string :uuid_citizen
      t.integer :tp_cds_origin
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
