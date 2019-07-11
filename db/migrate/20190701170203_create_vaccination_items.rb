class CreateVaccinationItems < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccination_items do |t|
      t.string :turn
      t.belongs_to :family_member, foreign_key: true, index: true
      t.belongs_to :local_service, foreign_key: {to_table: :generic_models}, index: true
      t.boolean :traveller
      t.boolean :leprosy_communicant
      t.boolean :pregnant
      t.boolean :puerperal
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
