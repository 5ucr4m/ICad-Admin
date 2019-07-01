class CreateVaccinations < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccinations do |t|
      t.string :uuid
      t.integer :tp_cds_origin
      t.belongs_to :company, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
