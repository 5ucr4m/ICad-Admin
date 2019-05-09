class CreateHealthProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :health_professionals do |t|
      t.string :cns_code
      t.belongs_to :registry, foreign_key: true, index: true
      t.belongs_to :health_establishment, foreign_key: true, index: true
      t.belongs_to :professional_team, foreign_key: true, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
