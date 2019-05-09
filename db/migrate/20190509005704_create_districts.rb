class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.belongs_to :zone, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :city, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
