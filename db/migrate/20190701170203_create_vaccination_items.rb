class CreateVaccinationItems < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccination_items do |t|
      t.string :turn
      t.belongs_to :family_member, null: false, foreign_key: true
      t.belongs_to :local_service, null: false, foreign_key: true
      t.boolean :traveller
      t.boolean :leprosy_communicant
      t.boolean :pregnant
      t.boolean :puerperal
      t.belongs_to :company, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
