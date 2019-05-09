class CreateHealthEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :health_establishments do |t|
      t.string :cnes_code
      t.string :unit_code
      t.belongs_to :registry, foreign_key: true, index: true
      t.date :registry_at
      t.belongs_to :manager, foreign_key: {to_table: :registries}, index: true
      t.belongs_to :unit_type, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
