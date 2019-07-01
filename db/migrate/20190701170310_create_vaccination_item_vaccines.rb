class CreateVaccinationItemVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccination_item_vaccines do |t|
      t.belongs_to :vaccination_item, foreign_key: true, index: true
      t.belongs_to :vaccine, foreign_key: true, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
