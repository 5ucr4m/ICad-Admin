class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :description
      t.belongs_to :immunobiological, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :vaccination_strategy, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :dose, foreign_key: {to_table: :generic_models}, index: true
      t.string :lot_number
      t.string :manufacturer
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
