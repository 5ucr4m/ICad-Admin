class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :description
      t.belongs_to :immunobiological, null: false, foreign_key: true
      t.belongs_to :vaccination_strategy, null: false, foreign_key: true
      t.belongs_to :dose, null: false, foreign_key: true
      t.string :lot_number
      t.string :manufacturer
      t.belongs_to :company, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
